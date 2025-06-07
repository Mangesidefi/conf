### **Triển khai HLS cho Livestream Scale Lớn**

---

#### **1. Kiến trúc tổng thể**
```
[Admin OBS] → RTMP → [Transcoding Server] → HLS Segments → [CDN] → [Viewers]
                     ↑
                (FFmpeg/Nginx)
```

---

#### **2. Các bước triển khai**

##### **Bước 1: Thiết lập RTMP Ingestion (Admin Side)**
- **Cấu hình OBS**:
  ```
  Server: rtmp://your-server-ip/live
  Stream Key: unique_admin_key_123
  ```
  ```bash
  # Kiểm tra stream đang chạy (trên server)
  ffprobe rtmp://localhost/live/unique_admin_key_123
  ```

##### **Bước 2: Transcoding Server (FFmpeg + Nginx)**
```bash
# Cài đặt FFmpeg
sudo apt install ffmpeg

# Transcode RTMP → HLS (multi-bitrate)
ffmpeg -i rtmp://localhost/live/unique_admin_key_123 \
  -map 0:v:0 -map 0:a:0 \
  -c:v libx264 -crf 22 -preset veryfast -g 60 -sc_threshold 0 \
  -b:v:0 2500k -maxrate:0 2500k -bufsize:0 5000k \
  -filter:v:0 "scale=1280:720" \
  -c:a aac -b:a 128k \
  -f hls -hls_time 4 -hls_list_size 10 -hls_flags delete_segments \
  -hls_segment_filename /var/www/html/live/720p_%03d.ts \
  /var/www/html/live/720p.m3u8 \
  
  -map 0:v:0 -map 0:a:0 \
  -c:v libx264 -crf 23 -preset veryfast -g 60 -sc_threshold 0 \
  -b:v:1 1000k -maxrate:1 1000k -bufsize:1 2000k \
  -filter:v:1 "scale=854:480" \
  -c:a aac -b:a 128k \
  -f hls -hls_time 4 -hls_list_size 10 -hls_flags delete_segments \
  -hls_segment_filename /var/www/html/live/480p_%03d.ts \
  /var/www/html/live/480p.m3u8
```

##### **Bước 3: Cấu hình Nginx làm HLS Origin Server**
```nginx
server {
    listen 80;
    server_name yourdomain.com;

    location /live {
        types {
            application/vnd.apple.mpegurl m3u8;
            video/mp2t ts;
        }
        root /var/www/html;
        add_header Cache-Control no-cache;
        add_header Access-Control-Allow-Origin *;
    }

    # Bảo vệ bằng token (tuỳ chọn)
    location /secure-live {
        secure_link $arg_token;
        secure_link_md5 "secret$uri$remote_addr";
        
        if ($secure_link = "") { return 403; }
        
        alias /var/www/html/live;
        types { ... };
    }
}
```

##### **Bước 4: Tích hợp CDN (CloudFront/Akamai)**
```bash
# Ví dụ với AWS CloudFront
Origin Domain: yourdomain.com
Origin Path: /live
Cache Policy: CachingOptimized
```

##### **Bước 5: Client-Side Player (HLS.js)**
```html
<div id="video-container"></div>
<script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
<script>
  const video = document.createElement('video');
  const hls = new Hls({
    maxBufferLength: 30,  // Giảm độ trễ tối đa
    maxMaxBufferLength: 60,
    enableWorker: true
  });
  
  hls.loadSource('https://your-cdn.com/live/720p.m3u8');
  hls.attachMedia(video);
  video.controls = true;
  document.getElementById('video-container').appendChild(video);
  
  // Tự động chọn bitrate dựa trên mạng
  hls.on(Hls.Events.MANIFEST_PARSED, () => {
    const levels = hls.levels;
    hls.currentLevel = levels.length - 1; // Mặc định chất lượng cao nhất
  });
</script>
```

---

#### **3. Tối ưu hoá HLS**

##### **Giảm độ trễ (Low-Latency HLS)**
```nginx
# Thêm vào Nginx config
hls_fragment 2s;  # Thay vì 4s
hls_playlist_type event;
hls_sync 100ms;
```

```javascript
// Client-side config
const hls = new Hls({
  lowLatencyMode: true,
  maxLatencyReductionFactor: 0.5
});
```

##### **Adaptive Bitrate (ABR) Logic**
```javascript
// Tự động điều chỉnh chất lượng
let lastNetworkSpeed = 0;
setInterval(() => {
  const bandwidth = hls.bandwidthEstimate;
  if (bandwidth < 1500000 && lastNetworkSpeed >= 1500000) {
    hls.currentLevel = 1; // Chuyển xuống 480p
  }
  lastNetworkSpeed = bandwidth;
}, 5000);
```

---

#### **4. Giám sát và Scale**

##### **Health Check**
```bash
# Cron job kiểm tra stream
*/2 * * * * if ! ffprobe -v error rtmp://localhost/live/stream_key; then systemctl restart nginx; fi
```

##### **Auto-Scaling với AWS**
```terraform
resource "aws_autoscaling_group" "hls_workers" {
  desired_capacity = 2
  max_size         = 10
  min_size         = 1

  scaling_policy {
    target_tracking_configuration {
      predefined_metric_specification {
        predefined_metric_type = "ASGAverageCPUUtilization"
      }
      target_value = 60.0
    }
  }
}
```

---

#### **5. Xử lý lỗi thường gặp**

##### **Mất kết nối đột ngột**
```javascript
hls.on(Hls.Events.ERROR, (event, data) => {
  if (data.fatal) {
    switch(data.type) {
      case Hls.ErrorTypes.NETWORK_ERROR:
        hls.startLoad(); // Tự động reconnect
        break;
      case Hls.ErrorTypes.MEDIA_ERROR:
        hls.recoverMediaError();
        break;
    }
  }
});
```

##### **Khởi tạo lại FFmpeg nếu crash**
```bash
#!/bin/bash
while true; do
  ffmpeg -i rtmp://localhost/live/stream_key [params...]
  sleep 1
done
```

---

### **Khi nào cần nâng cấp?**
- **> 50,000 viewers**: Cần cluster FFmpeg + Load Balancer
- **Global audience**: Dùng multi-CDN (AWS + Akamai)
- **Ultra-low latency**: Chuyển sang CMAF hoặc WebRTC edge

(CDN tuning, DRM bảo mật, analytics tracking...)
