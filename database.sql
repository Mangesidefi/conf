-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th7 22, 2024 lúc 06:22 AM
-- Phiên bản máy phục vụ: 8.0.37-0ubuntu0.20.04.3
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `Aries`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `agencies`
--

CREATE TABLE `agencies` (
  `id` int NOT NULL,
  `uid` int NOT NULL DEFAULT '0',
  `code` varchar(255) NOT NULL,
  `status` enum('active','pending','blocked') DEFAULT 'active',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `agencies`
--

INSERT INTO `agencies` (`id`, `uid`, `code`, `status`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(19, 22, 'tongbong88', 'active', '2024-07-17 10:41:41', '2024-07-17 10:41:41', NULL),
(20, 23, 'superadmin1', 'active', '2024-07-17 11:00:01', '2024-07-17 11:00:01', NULL),
(21, 24, 'demouser', 'active', '2024-07-19 09:55:12', '2024-07-19 09:55:12', NULL),
(22, 25, 'demouser11', 'active', '2024-07-19 10:19:48', '2024-07-19 10:19:48', NULL),
(23, 26, 'aapanel', 'active', '2024-07-19 21:57:36', '2024-07-19 21:57:36', NULL),
(24, 27, 'meomeo1', 'active', '2024-07-20 01:36:18', '2024-07-20 01:36:18', NULL),
(25, 28, 'alisababivip', 'active', '2024-07-20 04:20:21', '2024-07-20 04:20:21', NULL),
(26, 29, 'dukimi1403', 'active', '2024-07-20 07:08:04', '2024-07-20 07:08:04', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `agency_referer`
--

CREATE TABLE `agency_referer` (
  `id` int NOT NULL,
  `uid` int NOT NULL DEFAULT '0',
  `agency` int NOT NULL DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bank_histories`
--

CREATE TABLE `bank_histories` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `bankProvide` varchar(255) NOT NULL,
  `bankNumber` varchar(255) NOT NULL,
  `bankName` varchar(255) NOT NULL,
  `transId` varchar(255) DEFAULT NULL,
  `type` enum('recharge','cashout') NOT NULL,
  `amount` int DEFAULT '0',
  `info` varchar(255) DEFAULT '',
  `status` enum('success','pending','processing','error','timeout') DEFAULT 'pending',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `bank_histories`
--

INSERT INTO `bank_histories` (`id`, `uid`, `bankProvide`, `bankNumber`, `bankName`, `transId`, `type`, `amount`, `info`, `status`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 29, 'VIETCOMBANK', '9999999', 'nothingmb', '', 'recharge', 1000000, 'Bank transfer nothingmb', 'pending', '2024-07-20 07:08:45', '2024-07-20 07:08:45', NULL),
(2, 29, 'VIETCOMBANK', '9999999', 'nothingmb', '', 'recharge', 5000000, 'Bank transfer nothingmb', 'pending', '2024-07-20 07:09:20', '2024-07-20 07:09:20', NULL),
(3, 29, 'VIETCOMBANK', '9999999', 'nothingmb', '', 'recharge', 1000000, 'Bank transfer nothingmb', 'pending', '2024-07-20 07:09:24', '2024-07-20 07:09:24', NULL),
(4, 29, 'VIETCOMBANK', '9999999', 'nothingmb', '', 'recharge', 1000000, 'Bank transfer nothingmb', 'pending', '2024-07-20 07:09:29', '2024-07-20 07:09:29', NULL),
(5, 29, 'VIETCOMBANK', '9999999', 'nothingmb', '', 'recharge', 5000000, 'Bank transfer nothingmb', 'pending', '2024-07-20 07:09:33', '2024-07-20 07:09:33', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bank_list`
--

CREATE TABLE `bank_list` (
  `id` int NOT NULL,
  `bankProvide` varchar(255) NOT NULL,
  `bankNumber` varchar(255) NOT NULL,
  `bankName` varchar(255) NOT NULL,
  `status` enum('active','inactive','pending') DEFAULT 'active',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `bank_list`
--

INSERT INTO `bank_list` (`id`, `bankProvide`, `bankNumber`, `bankName`, `status`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(2, 'VIETCOMBANK', '0361001580532', 'TRAN THANH SANG', 'active', '2024-06-21 21:57:35', '2024-06-21 21:57:35', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bank_user`
--

CREATE TABLE `bank_user` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `bankProvide` varchar(255) NOT NULL,
  `bankNumber` varchar(255) NOT NULL,
  `bankName` varchar(255) NOT NULL,
  `bankBranch` varchar(255) NOT NULL,
  `status` enum('active','inactive','pending') DEFAULT 'active',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bet_histories`
--

CREATE TABLE `bet_histories` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `betAmount` int DEFAULT NULL,
  `validBetAmount` int DEFAULT NULL,
  `winAmount` int DEFAULT NULL,
  `netPnl` int DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `transactionTime` varchar(255) DEFAULT NULL,
  `gameCode` varchar(255) DEFAULT NULL,
  `gameName` varchar(255) DEFAULT NULL,
  `betOrderNo` varchar(255) DEFAULT NULL,
  `betTime` varchar(255) DEFAULT NULL,
  `productType` int DEFAULT NULL,
  `gameCategory` varchar(255) DEFAULT NULL,
  `sessionId` varchar(255) DEFAULT NULL,
  `status` enum('success','pending','error','win','lose','hit_cancel','player_cancel','draw_cancel','system_drawback','tie','bo_drawback') NOT NULL DEFAULT 'success',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `card_histories`
--

CREATE TABLE `card_histories` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `transId` varchar(255) NOT NULL,
  `type` enum('recharge','cashout') NOT NULL,
  `amount` int DEFAULT '0',
  `network` varchar(255) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `seri` varchar(255) NOT NULL,
  `info` varchar(255) DEFAULT '',
  `status` enum('success','pending','error') DEFAULT 'pending',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `configs`
--

CREATE TABLE `configs` (
  `id` int NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `configs`
--

INSERT INTO `configs` (`id`, `key`, `value`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'telegram_bot', '{\"status\":true,\"token\":\"8031414973:AAGhsDmtx6QK-s7UuCA73sJasjm8J0alVEQ\"}', '2023-10-31 20:33:21', '2024-06-21 06:48:33', NULL),
(2, 'telegram_chat_group', '{\"paymentCard\":\"-1002588429145\",\"paymentBank\":\"-1002588429145\",\"paymentWithdraw\":\"-1002588429145\"}', '2023-10-31 20:33:21', '2024-06-21 06:48:33', NULL),
(3, 'telegram_message', '{\"paymentCard\":\"Nạp thẻ cào:\\n- Thời gian: {{time}}\\n- Người nạp: {{username}}/{{name}}\\n- Số điện thoại: {{phone}}\\t\\n- Mã giao dịch: {{transId}}\\n- Nhà mạng : {{network}}\\t\\n- Số tiền: {{amount}}\\n- Số seri: {{seri}}\\t\\n- Số thẻ: {{pin}}\\t\",\"paymentBank\":\"Nạp Tiền:\\n- Thời gian: {{time}}\\n- Username: {{username}}\\n- Bank nhận tiền: {{bankReceivesMoney}}\\n- STK bank nhận: {{bankReceivesNumber}}\\n- Tên người nhận: {{UserReceivesMoney}}\\n- Nội dung chuyển khoản: {{transId}}\\n- Số tiền: {{amount}}\",\"paymentWithdraw\":\"Rút Tiền:\\n- Thời gian: {{time}}\\n- Username: {{username}}\\n- Số điện thoại: {{phone}}\\t\\n- Mã giao dịch: {{transId}}\\n- Ngân hàng : {{chargeTypeCode}}\\t\\n- Tên người nhận: {{name}}\\n- STK: {{bankNumber}}\\n- Số tiền: {{amount}}\"}', '2023-10-31 20:33:21', '2024-06-21 06:48:33', NULL),
(4, 'site_infomation', '{\"site_name\":\"TRANG CHỦ LITE-COIN Link Truy Cập Mới Nhất lite-coin.bio\",\"site_logo\":\"https://i.ibb.co/Zf7tFCy/logo-789bet-01.png\",\"site_banner\":[{\"image_url\":\"https://i.ibb.co/2cGKZ31/banner-6.jpg\",\"permalink\":\"\"},{\"image_url\":\"https://i.ibb.co/fvpTFYG/banner-4.jpg\",\"permalink\":\"\"},{\"image_url\":\"https://i.ibb.co/BL4FFSK/banner-2.jpg\",\"permalink\":\"\"},{\"image_url\":\"https://i.ibb.co/jwBXBD6/banner-789-1.jpg\",\"permalink\":\"\"},{\"image_url\":\"https://i.ibb.co/qn0tX29/banner-5.jpg\",\"permalink\":\"\"},{\"image_url\":\"https://i.ibb.co/7rwHyd6/banner-3.jpg\",\"permalink\":\"\"}],\"site_brand_marquee\":\" Gần đây, tình trạng nhà mạng thường xuyên chặn link làm quý Hội viên gặp khó khăn khi truy cập vào 789BET. Một số thành phần đã lợi dụng gửi những link giả mạo để quý Hội viên truy cập và lấy cắp thông tin đăng nhập, sau đó liên hệ quý Khách hàng để lôi kéo qua một trang giải trí khác. Nhân viên chính thức của 789BET sẽ không yêu cầu thành viên đăng ký lại tài khoản ở bất kỳ trang wed lạ nào và với bất kỳ lý do nào. Để đảm bảo an toàn khi tham gia tại 789BET, vui lòng vào mục nạp tiền lấy thông tin ngân hàng trên hệ thống, tuyệt đối không lấy thông tin, nội dung từ người thứ 3 hoặc đại lý  tránh bị lừa đảo 789BET luôn nghiêm cấm hành vi lôi kéo ăn chia % lợi nhuận, nếu thành viên nào nhận được thông tin lôi kéo ăn chia từ các đại lý, hãy liên hệ ngay với chúng tôi qua kênh khiếu nại 789BET để được hỗ trợ xử lý. 789BET xin chân thành cảm ơn toàn thể thành viên  luôn tin tưởng và ủng hộ, 789BET sẽ nỗ lực nâng cao chất lượng phục vụ, luôn xem khách hàng là thượng đế.Tặng 18,789 Phong Bì Đỏ mỗi ngàyĐăng Ký - Tải App nhận Free 50KNạp Đầu Nhận 28,789 Điểm Nạp 2 - 4 - 6 nhận 3 - 5 - 7 %Nạp 188+ Thưởng 188 Nạp Chủ Nhật Thưởng 5% Siêu Hoàn Trả Lập Tức Lên Đến 2 % Hoàn Trả 20 - 21 - 22 Lên Đến 30% Lì Xì Nghìn Tỷ 06 - 16 - 26 Cho Đi Chữ Tín - Nhận Lại Chữ Tin  CASINO, TÔI CHỈ CHỌN 789BET \\n\",\"announcement\":{\"isShow\":\"true\",\"title\":\"Thông báo sự kiện\",\"description\":\"Giúp cải thiện Google Dịch cho ngôn ngữ bạn sử dụng.\",\"content\":\"Dịch vụ của Google, được cung cấp miễn phí, dịch nhanh các từ, cụm từ và trang web giữa tiếng Anh và hơn 100 ngôn ngữ khác.\"},\"copyright\":\"789clubs.world\",\"contact\":{\"telegram\":\"https://t.me/+qcJPP6TepPA4MTk9\",\"fanpage\":\"https://www.facebook.com/789bet.home/\",\"hotline\":\"0335.351.569\",\"email\":\"cskh.789clubs@gmail.com\"},\"site_description\":\"789BET - Nhà cái hàng đầu uy tín, chất lượng. Đầy đủ các trò chơi như nổ hũ, bóng đá, cá cược, thể thao điện tử\",\"site_keyword\":\"789bet, nổ hũ, bóng đá, cá cược, thể thao điện tử, nhà cái uy tín, nạp rút siêu tốc\",\"site_url\":\"33OK.NET\"}', NULL, '2024-06-21 06:47:24', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `type` enum('all','user') NOT NULL,
  `uid` int NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `content` text,
  `seen` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_securitys`
--

CREATE TABLE `password_securitys` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotions`
--

CREATE TABLE `promotions` (
  `id` int NOT NULL,
  `title` varchar(255) DEFAULT '',
  `thumbnail` varchar(255) DEFAULT '',
  `content` text,
  `isRegister` tinyint(1) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `promotions`
--

INSERT INTO `promotions` (`id`, `title`, `thumbnail`, `content`, `isRegister`, `status`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Cuồng Nhiệt Euro , Săn Qùa Triệu Đô', 'https://gwfd.qatgwawm.net/system-assets/Web.Portal/Image/Upload/Promotion/8f34c9057422432e936470c8837c4ced.png', '<p class=\"ng-scope\"><img src=\"https://gwfd.qatgwawm.net/system-assets/Web.Portal/Image/Upload/Promotion/15476f28c4114692a5cc0305af69c82e.jpg\" width=\"1162\" height=\"270\" /></p>\n<p class=\"ng-scope\"><strong>CASINO - T&Ocirc;I CHỈ CHỌN 789BET</strong></p>\n<p class=\"ng-scope\">H&atilde;y li&ecirc;n hệ với ch&uacute;ng t&ocirc;i qua Email khi bạn qu&ecirc;n link hoặc kh&ocirc;ng thể truy cập : admin@789bet.com</p>\n<div class=\"ng-scope\">\n<p>※ M&atilde; khuyến m&atilde;i:&nbsp;<span style=\"color: #ff0000; font-family: Times New Roman;\">EURO</span></p>\n<p>※ Đối tượng: Tất cả th&agrave;nh vi&ecirc;n 789BET</p>\n<p>※ Thời gian bắt đầu: 14/06/2024&nbsp;&nbsp;~&nbsp;14/07/2024</p>\n<p>※ Ch&uacute; &yacute; :&nbsp;1 điểm = 1,000 VND</p>\n</div>\n<p class=\"p ng-scope\" align=\"center\"><img src=\"https://gwfd.qatgwawm.net/system-assets/Web.Portal/Image/Upload/Promotion/a8cafa61ab83425bb7b5e6ccc9a11c54.png\" width=\"416\" height=\"92\" /></p>\n<p class=\"p ng-scope\">H&ograve;a c&ugrave;ng kh&ocirc;ng kh&iacute; cuồng nhiệt m&ugrave;a EURO 2024 diễn ra tại Đức&nbsp;với th&ocirc;ng điệp về sự&nbsp;&ldquo;đo&agrave;n kết, gắn b&oacute; v&agrave; h&ograve;a nhập&rdquo;,&nbsp;789BET tổ chức&nbsp;<span style=\"color: #ff0000;\">3</span>&nbsp;sự kiện khuyến m&atilde;i v&ocirc; c&ugrave;ng hấp dẫn chia sẻ đến&nbsp;to&agrave;n thể qu&yacute; Hội vi&ecirc;n c&ugrave;ng bạn b&egrave;.</p>\n<p class=\"p ng-scope\">-&nbsp;Sự kiện 1 (ER1):&nbsp;Mưa L&igrave; X&igrave; Mỗi Ng&agrave;y</p>\n<p class=\"p ng-scope\">Trong thời gian diễn ra EURO 2024,&nbsp;mỗi ng&agrave;y 789BET ph&aacute;t thưởng ngẫu nhi&ecirc;n&nbsp;mưa l&igrave; x&igrave;&nbsp;100&nbsp;tỷ đồng tới hội vi&ecirc;n tham gia sản phẩm&nbsp;Thể Thao.</p>\n<p class=\"p ng-scope\">-&nbsp;Sự kiện 2 (ER2):&nbsp;Si&ecirc;u Ho&agrave;n Trả 100%</p>\n<p class=\"p ng-scope\">Khi tham gia cược tại 789BET trong thời gian diễn ra EURO 2024, ngoại trừ nhận được những khuyến m&atilde;i ho&agrave;n trả như:&nbsp;&ldquo;Ng&agrave;y V&agrave;ng 20 - 21 - 22 l&ecirc;n đến 30%&rdquo;, &ldquo;Si&ecirc;u Ho&agrave;n Trả mỗi ng&agrave;y&rdquo;, &ldquo;Ho&agrave;n Trả Lập Tức l&ecirc;n đến 2%&rdquo;, th&igrave; qu&yacute; Hội vi&ecirc;n sẽ được nhận ho&agrave;n trả th&ecirc;m v&agrave;o ng&agrave;y h&ocirc;m sau l&ecirc;n đến&nbsp;100%&nbsp;của ho&agrave;n trả lập tức&nbsp;<em>(bắt đầu từ 14/06/2024 ~ 14/07/2024).</em></p>\n<table class=\"ng-scope\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td>Tiền gửi</td>\n<td>Sản phẩm</td>\n<td>Cược hợp lệ</td>\n<td>Tỷ lệ ho&agrave;n trả cao nhất&nbsp;</td>\n</tr>\n<tr>\n<td>1+</td>\n<td>Thể thao</td>\n<td>1+</td>\n<td>100%</td>\n</tr>\n</tbody>\n</table>\n<p class=\"p ng-scope\" align=\"justify\">-&nbsp;Sự kiện 3&nbsp;(ER3):&nbsp;Dự Đo&aacute;n Kết Quả - Nhận Thưởng Thả Ga</p>\n<p class=\"p ng-scope\" align=\"justify\">Hội vi&ecirc;n đạt VIP1 trở l&ecirc;n, trong ng&agrave;y nạp tối thiểu&nbsp;789&nbsp;điểm, sẽ đủ điều kiện&nbsp;tham gia dự đo&aacute;n tỷ&nbsp;số nhận thưởng l&ecirc;n đến&nbsp;68&nbsp;điểm.</p>\n<table class=\"ng-scope\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td><span style=\"color: #ffffff; font-family: Times New Roman, Times, serif;\">Điều kiện tham gia</span></td>\n<td><span style=\"color: #ffffff; font-family: Times New Roman, Times, serif;\">Điều kiện nạp trước trận</span></td>\n<td>Số lần dự đo&aacute;n</td>\n<td><span style=\"color: #ffffff; font-family: Times New Roman, Times, serif;\">Điểm thưởng</span></td>\n</tr>\n<tr>\n<td>VIP 1+</td>\n<td>789+</td>\n<td>1</td>\n<td>68</td>\n</tr>\n</tbody>\n</table>\n<p class=\"p ng-scope\">V&iacute; dụ: Ng&agrave;y 15/06/2024 trước khi trận đấu giữa Đức vs Scotland, t&agrave;i khoản Hội vi&ecirc;n VIP 1+ trong ng&agrave;y c&oacute; tiền nạp từ&nbsp;789&nbsp;điểm trở l&ecirc;n sẽ được tham gia dự đo&aacute;n&nbsp;1&nbsp;lần tỷ số cho trận đấu đ&oacute;. Trận tiếp theo trong ng&agrave;y nếu Hội vi&ecirc;n muốn tham gia dự đo&aacute;n cần c&oacute; th&ecirc;m&nbsp;1&nbsp;lần nạp tr&ecirc;n&nbsp;789&nbsp;điểm.</p>\n<p class=\"p ng-scope\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\n<p class=\"p ng-scope\" align=\"center\"><a href=\"https://3mien789.com/\"><img src=\"https://gwfd.qatgwawm.net/system-assets/Web.Portal/Image/Upload/Promotion/08ee9db501bb4ff9a825d5a854420c56.gif\" /></a></p>\n<p class=\"p ng-scope\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>\n<p class=\"p ng-scope\">※ Phương thức nhận thưởng:&nbsp;&nbsp;</p>\n<p class=\"p ng-scope\">-&nbsp;Hệ thống tự động kết to&aacute;n v&agrave; sẽ được chuyển đến t&agrave;i khoản của từng th&agrave;nh vi&ecirc;n trước&nbsp;15h00</p>\n<p class=\"p ng-scope\" align=\"justify\">- Th&agrave;nh vi&ecirc;n vui l&ograve;ng đăng nhập t&agrave;i khoản bấm v&agrave;o&nbsp;Bao L&igrave; X&igrave;<strong>&nbsp;</strong>bấm chọn&nbsp;Nhận lấy&nbsp;để nhận thưởng. Phần thưởng c&oacute; hiệu lực trong v&ograve;ng&nbsp;7&nbsp;ng&agrave;y, nếu kh&ocirc;ng nhận sẽ hết hạn.</p>\n<p class=\"p ng-scope\">※ Chi tiết hoạt động:</p>\n<p class=\"p ng-scope\">- Số liệu thống k&ecirc; dựa v&agrave;o hệ thống 789BET l&agrave;m chuẩn.</p>\n<p class=\"p ng-scope\">- Tiền thưởng nhận được chỉ cần 1 v&ograve;ng cược th&igrave; c&oacute; thể r&uacute;t tiền.</p>\n<p class=\"p ng-scope\">- Khuyến m&atilde;i t&iacute;nh theo thời gian thanh to&aacute;n v&eacute; cược&nbsp;&nbsp;theo m&uacute;i giờ GMT-4 (giờ Vi&ecirc;̣t Nam từ 11:00:00 h&ocirc;m nay đ&ecirc;́n 10:59:59 h&ocirc;m sau).</p>\n<p class=\"p ng-scope\">- 789BET bảo lưu quyền thay đổi, dừng hoặc hủy bỏ chương tr&igrave;nh khuyến m&atilde;i n&agrave;y bất cứ l&uacute;c n&agrave;o.</p>\n<p class=\"ng-scope\">-&nbsp;Tham gia nghĩa l&agrave; bạn đ&atilde; đồng &yacute; với&nbsp;<a href=\"https://cskh3.com/quytackhuyenmai.html\"><u><span class=\"15\">\"Quy Tắc V&agrave; Điều Khoản Khuyến M&atilde;i\"</span></u></a>.</p>', 1, 1, '2024-06-21 21:58:49', '2024-06-21 21:58:49', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotion_registers`
--

CREATE TABLE `promotion_registers` (
  `id` int NOT NULL,
  `uid` int NOT NULL DEFAULT '0',
  `promotion` int NOT NULL DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT 'user',
  `status` enum('active','pending','blocked') DEFAULT 'active',
  `coin` int DEFAULT '0',
  `verify` tinyint(1) DEFAULT '0',
  `code` varchar(255) DEFAULT NULL,
  `isPlay` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone`, `password`, `role`, `status`, `coin`, `verify`, `code`, `isPlay`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(2, 'ADMIN SUPER', 'admin', 'admin@789bet.com', '+84000000009', '0c8abdb962f042d1857c66dd26b0c87b', 'admin', 'active', 0, 0, '0jhlci2', 0, NULL, '2024-06-21 14:59:02', NULL),
(3, 'NGUYEN THI THU HUONG', 'alisababivip', 'guest000cp8ydcbd@gmail.com', '+84698005764', '40230fe953fce822fc99ee84d5ffb9b8', 'user', 'agent', 0, 0, 'kfqykv', 1, '2024-07-20 04:20:21', '2024-07-20 04:22:14', NULL),
(4, 'Kim Duc minh', 'dukimi1403', 'guest000szdl0qhs@gmail.com', '+84904967087', 'ed2b1f468c5f915f3f1cf75d7068baae', 'user', 'active', 16650000, 0, 'mmnyoz', 1, '2024-07-20 07:08:04', '2024-07-20 08:26:49', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vips`
--

CREATE TABLE `vips` (
  `id` int NOT NULL,
  `uid` int NOT NULL DEFAULT '0',
  `vip_current` int NOT NULL DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `vips`
--

INSERT INTO `vips` (`id`, `uid`, `vip_current`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(2, 22, 0, '2024-07-17 10:41:41', '2024-07-17 10:41:41', NULL),
(3, 23, 0, '2024-07-17 11:00:01', '2024-07-17 11:00:01', NULL),
(4, 24, 0, '2024-07-19 09:55:12', '2024-07-19 09:55:12', NULL),
(5, 25, 0, '2024-07-19 10:19:48', '2024-07-19 10:19:48', NULL),
(6, 26, 0, '2024-07-19 21:57:36', '2024-07-19 21:57:36', NULL),
(7, 27, 0, '2024-07-20 01:36:18', '2024-07-20 01:36:18', NULL),
(8, 28, 0, '2024-07-20 04:20:21', '2024-07-20 04:20:21', NULL),
(9, 29, 0, '2024-07-20 07:08:04', '2024-07-20 07:08:04', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vip_upgrade`
--

CREATE TABLE `vip_upgrade` (
  `id` int NOT NULL,
  `uid` int NOT NULL DEFAULT '0',
  `from` int NOT NULL DEFAULT '0',
  `to` int NOT NULL DEFAULT '0',
  `coin_reward` int NOT NULL DEFAULT '0',
  `coin_monthly` int NOT NULL DEFAULT '0',
  `percent_relief` int NOT NULL DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `withdraw_conditions`
--

CREATE TABLE `withdraw_conditions` (
  `id` int NOT NULL,
  `uid` int NOT NULL DEFAULT '0',
  `minimumNumbOfBet` int NOT NULL DEFAULT '0' COMMENT 'Minimum number of bets',
  `totalMinimumBetAmount` int NOT NULL DEFAULT '0' COMMENT 'Total Minimum Bet Amount',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `withdraw_conditions`
--

INSERT INTO `withdraw_conditions` (`id`, `uid`, `minimumNumbOfBet`, `totalMinimumBetAmount`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(2, 22, 3, 66000, '2024-07-17 10:41:41', '2024-07-17 10:41:41', NULL),
(3, 23, 3, 66000, '2024-07-17 11:00:01', '2024-07-17 11:00:01', NULL),
(4, 24, 3, 66000, '2024-07-19 09:55:12', '2024-07-19 09:55:12', NULL),
(5, 25, 3, 66000, '2024-07-19 10:19:48', '2024-07-19 10:19:48', NULL),
(6, 26, 3, 66000, '2024-07-19 21:57:36', '2024-07-19 21:57:36', NULL),
(7, 27, 3, 66000, '2024-07-20 01:36:18', '2024-07-20 01:36:18', NULL),
(8, 28, 3, 66000, '2024-07-20 04:20:21', '2024-07-20 04:20:21', NULL),
(9, 29, 3, 66000, '2024-07-20 07:08:04', '2024-07-20 07:08:04', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `agencies_uid_code` (`uid`,`code`);

--
-- Chỉ mục cho bảng `agency_referer`
--
ALTER TABLE `agency_referer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `agency_referer_uid` (`uid`),
  ADD KEY `agency` (`agency`);

--
-- Chỉ mục cho bảng `bank_histories`
--
ALTER TABLE `bank_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Chỉ mục cho bảng `bank_list`
--
ALTER TABLE `bank_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bank_user`
--
ALTER TABLE `bank_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Chỉ mục cho bảng `bet_histories`
--
ALTER TABLE `bet_histories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bet_histories_bet_order_no` (`betOrderNo`),
  ADD KEY `uid` (`uid`);

--
-- Chỉ mục cho bảng `card_histories`
--
ALTER TABLE `card_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Chỉ mục cho bảng `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Chỉ mục cho bảng `password_securitys`
--
ALTER TABLE `password_securitys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Chỉ mục cho bảng `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `promotion_registers`
--
ALTER TABLE `promotion_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `promotion` (`promotion`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username` (`username`);

--
-- Chỉ mục cho bảng `vips`
--
ALTER TABLE `vips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vips_uid` (`uid`);

--
-- Chỉ mục cho bảng `vip_upgrade`
--
ALTER TABLE `vip_upgrade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Chỉ mục cho bảng `withdraw_conditions`
--
ALTER TABLE `withdraw_conditions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `withdraw_conditions_uid` (`uid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `agencies`
--
ALTER TABLE `agencies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `agency_referer`
--
ALTER TABLE `agency_referer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `bank_histories`
--
ALTER TABLE `bank_histories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `bank_list`
--
ALTER TABLE `bank_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `bank_user`
--
ALTER TABLE `bank_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `bet_histories`
--
ALTER TABLE `bet_histories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `card_histories`
--
ALTER TABLE `card_histories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `password_securitys`
--
ALTER TABLE `password_securitys`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `promotion_registers`
--
ALTER TABLE `promotion_registers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `vips`
--
ALTER TABLE `vips`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `vip_upgrade`
--
ALTER TABLE `vip_upgrade`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `withdraw_conditions`
--
ALTER TABLE `withdraw_conditions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `agencies`
--
ALTER TABLE `agencies`
  ADD CONSTRAINT `agencies_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `agency_referer`
--
ALTER TABLE `agency_referer`
  ADD CONSTRAINT `agency_referer_ibfk_50` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `agency_referer_ibfk_51` FOREIGN KEY (`agency`) REFERENCES `agencies` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `bank_histories`
--
ALTER TABLE `bank_histories`
  ADD CONSTRAINT `bank_histories_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `bank_user`
--
ALTER TABLE `bank_user`
  ADD CONSTRAINT `bank_user_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `bet_histories`
--
ALTER TABLE `bet_histories`
  ADD CONSTRAINT `bet_histories_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `card_histories`
--
ALTER TABLE `card_histories`
  ADD CONSTRAINT `card_histories_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `password_securitys`
--
ALTER TABLE `password_securitys`
  ADD CONSTRAINT `password_securitys_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `promotion_registers`
--
ALTER TABLE `promotion_registers`
  ADD CONSTRAINT `promotion_registers_ibfk_47` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `promotion_registers_ibfk_48` FOREIGN KEY (`promotion`) REFERENCES `promotions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `vips`
--
ALTER TABLE `vips`
  ADD CONSTRAINT `vips_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `vip_upgrade`
--
ALTER TABLE `vip_upgrade`
  ADD CONSTRAINT `vip_upgrade_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `withdraw_conditions`
--
ALTER TABLE `withdraw_conditions`
  ADD CONSTRAINT `withdraw_conditions_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
