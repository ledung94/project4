-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 10, 2022 at 05:21 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `tong_tien` varchar(255) DEFAULT NULL,
  `ma_nguoi_dung` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `tong_tien`, `ma_nguoi_dung`) VALUES
(1, NULL, 2),
(2, NULL, 1),
(3, NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `id` bigint(20) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `ma_gio_hang` bigint(20) DEFAULT NULL,
  `ma_san_pham` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `ten_danh_muc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `ten_danh_muc`) VALUES
(10, 'ĐIỆN THOẠI CAO CẤP'),
(11, 'ĐIỆN THOẠI TẦM TRUNG'),
(12, 'ĐIỆN THOẠI PHỔ THÔNG'),
(13, 'PHỤ KIỆN ĐIỆN THOẠI'),
(14, 'THIẾT BỊ NGHE NHÌN');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` bigint(20) NOT NULL,
  `email_lien_he` varchar(255) DEFAULT NULL,
  `ngay_lien_he` datetime DEFAULT NULL,
  `ngay_tra_loi` datetime DEFAULT NULL,
  `noi_dung_lien_he` varchar(255) DEFAULT NULL,
  `noi_dung_tra_loi` varchar(255) DEFAULT NULL,
  `trang_thai` varchar(255) DEFAULT NULL,
  `ma_nguoi_tra_loi` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` bigint(20) NOT NULL,
  `ten_hang_san_xuat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `ten_hang_san_xuat`) VALUES
(2, 'Apple'),
(3, 'Samsung'),
(4, 'Huewei'),
(5, 'Xiaomi'),
(6, 'Oppo'),
(7, 'Vivo'),
(8, 'Masstel'),
(9, 'Nokia'),
(10, 'Readmi'),
(11, 'Phụ kiện foxcom'),
(12, 'Media mart');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `dia_chi_nhan` varchar(255) DEFAULT NULL,
  `ghi_chu` varchar(255) DEFAULT NULL,
  `ho_ten_nguoi_nhan` varchar(255) DEFAULT NULL,
  `ngay_dat_hang` datetime DEFAULT NULL,
  `ngay_giao_hang` datetime DEFAULT NULL,
  `ngay_nhan_hang` datetime DEFAULT NULL,
  `sdt_nhan_hang` varchar(255) DEFAULT NULL,
  `trang_thai_don_hang` varchar(255) DEFAULT NULL,
  `ma_nguoi_dat` bigint(20) DEFAULT NULL,
  `ma_shipper` bigint(20) DEFAULT NULL,
  `tong_gia_tri` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `dia_chi_nhan`, `ghi_chu`, `ho_ten_nguoi_nhan`, `ngay_dat_hang`, `ngay_giao_hang`, `ngay_nhan_hang`, `sdt_nhan_hang`, `trang_thai_don_hang`, `ma_nguoi_dat`, `ma_shipper`, `tong_gia_tri`) VALUES
(38, 'Hanoi', NULL, 'le van dung', '2022-10-18 23:42:59', '2022-10-19 23:43:19', '2022-10-19 23:43:51', '0123456', 'Hoàn thành', 1, 6, 28980000),
(39, 'Hanoi', NULL, 'le van dung', '2022-11-22 23:53:27', '2022-11-22 23:54:21', '2022-11-22 23:55:29', '0123456', 'Hoàn thành', 7, 6, 64940000),
(40, 'Hanoi', NULL, 'le van dung', '2022-11-22 23:54:00', '2022-11-22 23:54:26', '2022-11-22 23:55:34', '0123456', 'Hoàn thành', NULL, 6, 94889000),
(41, 'Hanoi', NULL, 'le van dung', '2022-11-22 23:58:30', '2022-11-22 23:58:54', '2022-11-22 23:59:23', '0123456', 'Hoàn thành', 7, 6, 100090000),
(42, 'hanoi', NULL, 'test 3011', '2022-11-30 23:11:08', '2022-11-30 23:12:59', '2022-11-30 23:32:00', '3011', 'Hoàn thành', NULL, 6, 61420000);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) NOT NULL,
  `don_gia` bigint(20) NOT NULL,
  `ma_don_hang` bigint(20) DEFAULT NULL,
  `ma_san_pham` bigint(20) DEFAULT NULL,
  `so_luong_dat` int(11) NOT NULL,
  `so_luong_nhan_hang` int(11) NOT NULL,
  `gia_von` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `don_gia`, `ma_don_hang`, `ma_san_pham`, `so_luong_dat`, `so_luong_nhan_hang`, `gia_von`) VALUES
(9, 13990000, 38, 163, 1, 1, 8394000),
(10, 14990000, 38, 162, 1, 1, 8994000),
(11, 16450000, 39, 161, 1, 1, 9870000),
(12, 12000000, 39, 160, 1, 1, 7200000),
(13, 17500000, 39, 157, 1, 1, 10500000),
(14, 18990000, 39, 158, 1, 1, 11394000),
(15, 27500000, 40, 152, 1, 1, 16500000),
(16, 25999000, 40, 153, 1, 1, 15599400),
(17, 19390000, 40, 154, 1, 1, 11634000),
(18, 22000000, 40, 155, 1, 1, 13200000),
(19, 14990000, 41, 162, 1, 1, 8994000),
(20, 12000000, 41, 160, 1, 1, 7200000),
(21, 30100000, 41, 146, 1, 1, 18060000),
(22, 43000000, 41, 147, 1, 1, 25800000),
(23, 16450000, 42, 161, 1, 1, 9870000),
(24, 44970000, 42, 162, 3, 3, 25500000);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `cpu` varchar(255) DEFAULT NULL,
  `don_gia` bigint(20) NOT NULL,
  `don_vi_ban` int(11) NOT NULL,
  `don_vi_kho` int(11) NOT NULL,
  `dung_luong_pin` varchar(255) DEFAULT NULL,
  `he_dieu_hanh` varchar(255) DEFAULT NULL,
  `man_hinh` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `ten_san_pham` varchar(255) DEFAULT NULL,
  `thiet_ke` varchar(255) DEFAULT NULL,
  `thong_tin_bao_hanh` varchar(255) DEFAULT NULL,
  `thong_tin_chung` text DEFAULT NULL,
  `ma_danh_muc` bigint(20) DEFAULT NULL,
  `ma_hang_sx` bigint(20) DEFAULT NULL,
  `gia_von` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `cpu`, `don_gia`, `don_vi_ban`, `don_vi_kho`, `dung_luong_pin`, `he_dieu_hanh`, `man_hinh`, `ram`, `ten_san_pham`, `thiet_ke`, `thong_tin_bao_hanh`, `thong_tin_chung`, `ma_danh_muc`, `ma_hang_sx`, `gia_von`) VALUES
(144, NULL, 20990000, 0, 50, NULL, NULL, NULL, NULL, 'Điện thoại Samsung Galaxy Z Flip4 ', NULL, '12 tháng', 'Samsung Galaxy Z Flip4  đã chính thức ra mắt thị trường công nghệ, đánh dấu sự trở lại của Samsung trên con đường định hướng người dùng về sự tiện lợi trên những chiếc điện thoại gập. Với độ bền được gia tăng cùng kiểu thiết kế đẹp mắt giúp Flip4 trở thành một trong những tâm điểm sáng giá cho nửa cuối năm 2022.', 10, 3, 12594000),
(145, NULL, 26000000, 0, 100, NULL, NULL, NULL, NULL, 'Điện thoại Samsung Galaxy S22 Ultra 5G ', NULL, '12 tháng', 'Galaxy S22 Ultra 5G chiếc smartphone cao cấp nhất trong bộ 3 Galaxy S22 series mà Samsung đã cho ra mắt. Tích hợp bút S Pen hoàn hảo trong thân máy, trang bị vi xử lý mạnh mẽ cho các tác vụ sử dụng vô cùng mượt mà và nổi bật hơn với cụm camera không viền độc đáo mang đậm dấu ấn riêng.', 10, 3, 15600000),
(146, NULL, 30100000, 1, 99, NULL, NULL, NULL, NULL, 'Điện thoại iPhone 13 Pro Max 256GB', NULL, '12 tháng', 'iPhone 13 Pro Max 256GB - siêu phẩm mang trên mình bộ vi xử lý Apple A15 Bionic hàng đầu, màn hình Super Retina XDR 120 Hz, cụm camera khẩu độ f/1.5 cực lớn, tất cả sẽ mang lại cho bạn những trải nghiệm tuyệt vời chưa từng có', 10, 2, 18060000),
(147, NULL, 43000000, 1, 39, NULL, NULL, NULL, NULL, 'Điện thoại iPhone 14 Pro Max 512GB ', NULL, '12 tháng', 'Sau bao nhiêu ngày chờ đợi thì Apple đã chính thức tung ra mẫu điện thoại iPhone 14 Pro Max 512GB khi sở hữu một con chip với hiệu năng mạnh mẽ, màn hình đẹp mắt và cụm camera vô cùng chất lượng.', 10, 2, 25800000),
(148, NULL, 37990000, 0, 40, NULL, NULL, NULL, NULL, 'Điện thoại Samsung Galaxy Z Fold4 ', NULL, '12 tháng', 'Tại sự kiện Samsung Unpacked thường niên, Samsung Galaxy Z Fold4 256GB chính thức được trình làng thị trường công nghệ, mang trên mình nhiều cải tiến đáng giá giúp Galaxy Z Fold trở thành dòng điện thoại gập đã tốt nay càng tốt hơn.', 10, 3, 22794000),
(149, NULL, 27990000, 0, 50, NULL, NULL, NULL, NULL, 'Điện thoại OPPO Find X5 Pro 5G', NULL, '12 tháng', 'OPPO Find X5 Pro 5G có lẽ là cái tên sáng giá được xướng tên trong danh sách điện thoại có thiết kế ấn tượng trong năm 2022. Máy được hãng cho ra mắt với một diện mạo độc lạ chưa từng có, cùng với đó là những nâng cấp về chất lượng ở camera nhờ sự hợp tác với nhà sản xuất máy ảnh Hasselblad. ', 10, 6, 16794000),
(150, NULL, 27500000, 0, 40, NULL, NULL, NULL, NULL, 'Điện thoại iPhone 13 Pro ', NULL, '12 tháng', 'Một trong những tuyệt tác của Apple đáng nhớ nhất năm 2021 chắc chắn không thể thiếu cái tên iPhone 13 Pro 256GB. Sang chảnh về thiết kế, vượt trội về hiệu năng, quay phim chuyên nghiệp, pin \"trâu\", iPhone 13 Pro hứa hẹn sẽ mang đến những khoảnh khắc đầy thú vị cho bạn mỗi ngày.', 10, 2, 16500000),
(151, NULL, 29495000, 0, 30, NULL, NULL, NULL, NULL, 'Điện thoại iPhone 14', NULL, '12 tháng', 'Tại sự kiện giới thiệu sản phẩm mới hàng năm đến từ nhà Apple thì chiếc iPhone 14 512GB cũng đã chính thức được cho ra mắt, đây được xem là thời điểm kết thúc mọi lời đồn đoán bấy lâu nay khi toàn bộ thông số đã đều lộ diện. Hứa hẹn sẽ trở thành một trong những sản phẩm thu hút nhiều sự quan tâm nhất trong năm 2022.', 10, 2, 17697000),
(152, NULL, 27500000, 1, 19, NULL, NULL, NULL, NULL, 'Điện thoại iPhone 14 Plus ', NULL, '12 tháng', 'iPhone 14 Plus 256GB vừa được Apple cho ra mắt với một diện mạo sang chảnh về thiết kế, vượt trội về hiệu năng và quay phim chụp ảnh chuyên nghiệp. Đây hứa hẹn sẽ là dòng sản phẩm mới nổi và sẽ thu hút được nhiều khách hàng săn đón trong thời gian tới.', 10, 2, 16500000),
(153, NULL, 25999000, 1, 14, NULL, NULL, NULL, NULL, 'Điện thoại Xiaomi 12 Pro ', NULL, '12 tháng', 'Xiaomi 12 Pro - chiếc điện thoại đến từ nhà Xiaomi sở hữu một thiết kế thanh lịch và vô cùng đẳng cấp, mang trong mình một hiệu năng \"khủng long\" cùng cụm 3 camera 50 MP mang lại khả năng chụp ảnh, quay phim chất lượng hàng đầu phân khúc.', 10, 5, 15599400),
(154, NULL, 19390000, 1, 44, NULL, NULL, NULL, NULL, 'Điện thoại iPhone 12', NULL, '12 tháng', 'Smartphone iPhone 12 256 GB được Apple cho ra mắt đã đem đến làn sóng mạnh mẽ đối với những ai yêu công nghệ nói chung và “fan hâm mộ” trung thành của điện thoại iPhone nói riêng, với con chip mạnh, dung lượng lưu trữ lớn cùng thiết kế toàn diện và khả năng hiển thị hình ảnh xuất sắc.', 10, 2, 11634000),
(155, NULL, 22000000, 1, 34, NULL, NULL, NULL, NULL, 'Điện thoại iPhone 13 mini ', NULL, '12 tháng', 'iPhone 13 mini 512 GB là chiếc điện thoại có thiết kế nhỏ gọn, ngoại hình khá là dễ thương khi nằm gọn trong bàn tay nhưng lại gây bất ngờ hơn nữa với sức mạnh hiệu năng đáng kinh ngạc, màn hình OLED siêu nét cùng camera nhiếp ảnh chuyên nghiệp.', 10, 2, 13200000),
(156, NULL, 20450000, 0, 55, NULL, NULL, NULL, NULL, 'Điện thoại Samsung Galaxy S22+ 5G ', NULL, '12 tháng', 'Samsung Galaxy S22+ 5G 256GB đã được Samsung cho ra mắt vào ngày 09/02/2022. Máy nổi bật với cụm camera được cải tiến giúp bạn sáng tạo khoảnh khắc ấn tượng mỗi ngày, một vi xử lý mạnh mẽ cho mọi tác vụ sử dụng đều trở nên mượt mà hơn.', 10, 3, 12270000),
(157, NULL, 17500000, 1, 59, NULL, NULL, NULL, NULL, 'Điện thoại OPPO Reno7 Pro 5G ', NULL, '12 tháng', 'OPPO Reno7 Pro 5G trình làng với một thiết kế mới lạ đầy bắt mắt, hiệu năng ổn định cùng khả năng chụp ảnh - quay video cực kỳ chất lượng nhờ những nâng cấp đáng giá về thuật toán xử lý trên cảm biến chính IMX766 đến từ Sony.', 10, 6, 10500000),
(158, NULL, 18990000, 1, 49, NULL, NULL, NULL, NULL, 'Điện thoại Vivo X80 ', NULL, '12 tháng', 'Vivo X80 được xem là thiết bị hướng đến đối tượng người dùng chuyên nhiếp ảnh trên điện thoại, bằng việc hợp tác cùng nhà sản xuất ống kính nổi tiếng mang thương hiệu ZEISS. Với những tính năng mới mẻ hay chế độ quay - chụp độc đáo, X80 hứa hẹn mang đến cho bạn những trải nghiệm đầy mới lạ và chất lượng.', 10, 7, 11394000),
(159, NULL, 18490000, 0, 35, NULL, NULL, NULL, NULL, 'Điện thoại OPPO Reno8 Pro 5G', NULL, '12 tháng', 'OPPO Reno8 Pro 5G ra mắt với sự đột phá về phần camera khi đây là thiết bị đầu tiên thuộc dòng Reno được tích hợp NPU MariSilicon X, được xem là NPU cao cấp nhất đến từ OPPO (2022) có khả năng xử lý hình ảnh đỉnh cao. Kèm với đó là một con chip mạnh mẽ đến từ nhà MediaTek giúp bạn có thể cân được mọi tựa game đang hiện hành.', 10, 6, 11094000),
(160, NULL, 12000000, 0, 78, NULL, NULL, NULL, NULL, 'Điện thoại iPhone 11', NULL, '12 tháng', 'Được xem là một trong những phiên bản iPhone \"giá rẻ\" của bộ 3 iPhone 11 series nhưng iPhone 11 128GB vẫn sở hữu cho mình rất nhiều ưu điểm mà hiếm có một chiếc smartphone nào khác sở hữu.', 10, 2, 7300000),
(161, NULL, 16450000, 2, 43, NULL, NULL, NULL, NULL, 'Điện thoại Xiaomi 12T Pro ', NULL, '12 tháng', 'Cuối cùng Xiaomi 12T Pro cũng đã chính thức lộ diện trên thị trường sau hàng loạt thông tin rò rỉ về thông số, đúng như dự đoán thì độ phân giải trên camera của phiên bản này được nhà sản xuất nâng cấp lên đến 200 MP, giúp máy trở thành thiết bị có khả năng ghi hình sắc nét thuộc top đầu giới smartphone, đi kèm với đó là màn hình chất lượng cùng bộ vi xử lý mạnh mẽ xứng tầm flagship.', 10, 5, 9870000),
(162, NULL, 14990000, 3, 30, NULL, NULL, NULL, NULL, 'Điện thoại OPPO Reno6 Pro 5G', NULL, '12 tháng', 'OPPO Reno6 Pro 5G - một sản phẩm thuộc dòng Reno6 của OPPO, thỏa mãn những gì người tiêu dùng đã trông đợi với cấu hình khủng cùng hệ thống camera cực ấn tượng và ngoại hình bắt mắt, thật hào hứng mong chờ để được trải nghiệm.', 10, 6, 8500000),
(163, NULL, 14000000, 0, 89, NULL, NULL, NULL, NULL, 'Điện thoại Samsung Galaxy S21 FE 5G', NULL, '12 tháng', 'Samsung Galaxy S21 FE 5G (8GB/256GB) - siêu phẩm hội tụ những đột phá mà mọi fan hằng mơ ước, hứa hẹn mang đến trải nghiệm đỉnh cao trong mọi khoảnh khắc với vẻ ngoài đầy năng động, hiệu năng mạnh mẽ với CPU cây nhà lá vườn Exynos 2100 cùng cụm camera 12 MP mang chất lượng chuẩn studio.', 10, 3, 8400000),
(164, NULL, 49900000, 0, 60, NULL, NULL, NULL, NULL, 'Điện thoại Xiaomi Redmi Note 11 ', NULL, '12 tháng', 'Redmi Note 11 (6GB/128GB) vừa được Xiaomi cho ra mắt, được xem là chiếc smartphone có giá tầm trung ấn tượng, với 1 cấu hình mạnh, cụm camera xịn sò, pin khỏe, sạc nhanh mà giá lại rất phải chăng.', 11, 5, 29940000),
(165, NULL, 5590000, 0, 35, NULL, NULL, NULL, NULL, 'Điện thoại Samsung Galaxy A23 6GB', NULL, '12 tháng', 'Được Samsung cho ra mắt vào 03/2022 - Samsung Galaxy A23 6GB có một thiết kế trẻ trung cùng bộ thông số kỹ thuật khá ấn tượng trong tầm giá, đáp ứng nhu cầu sử dụng cả ngày một cách ổn định nhờ trang bị chipset đến từ nhà Qualcomm và một viên pin dung lượng khủng.', 11, 3, 3354000),
(166, NULL, 4190000, 0, 35, NULL, NULL, NULL, NULL, 'Điện thoại OPPO A55 ', NULL, '12 tháng', 'OPPO cho ra mắt OPPO A55 4G chiếc smartphone giá rẻ tầm trung có thiết kế đẹp mắt, cấu hình khá ổn, cụm camera chất lượng và dung lượng pin ấn tượng, mang đến một lựa chọn trải nghiệm thú vị vừa túi tiền cho người tiêu dùng.', 11, 6, 2514000),
(167, NULL, 699000, 0, 50, NULL, NULL, NULL, NULL, 'Điện thoại Vivo Y53s ', NULL, '12 tháng', 'Vivo mang đến niềm vui cho mọi người tin dùng khi hãng chính thức tung ra chiếc điện thoại Vivo Y53s với những tính năng tiên tiến đi cùng hiệu năng mạnh mẽ. Đặc biệt, smartphone lại còn sở hữu mức giá hấp dẫn trong phân khúc tầm trung đầy hứa hẹn.', 11, 7, 419400),
(168, NULL, 6799000, 0, 65, NULL, NULL, NULL, NULL, 'Điện thoại Samsung Galaxy A33 5G', NULL, '12 tháng', 'Samsung Galaxy A33 5G 6GB ra mắt vào ngày 17/03, được xem là bản cập nhật khá lớn so với thế hệ tiền nhiệm Galaxy A32 về thiết kế đến thông số kỹ thuật bên trong, nhằm mang đến vẻ ngoài đẹp mắt cũng như cạnh tranh trực tiếp ở phần hiệu năng đối với các đối thủ cùng phân khúc giá.', 11, 3, 4079400),
(170, NULL, 6890000, 0, 15, NULL, NULL, NULL, NULL, 'Điện thoại Realme 9 Pro 5G', NULL, '12 tháng', 'Realme 9 Pro - chiếc điện thoại tầm trung được Realme giới thiệu với thiết kế phản quang hoàn toàn mới, máy có một vẻ ngoài năng động, hiệu năng mạnh mẽ, cụm camera AI 64 MP và một tốc độ sạc ổn định.', 11, 10, 4134000),
(171, NULL, 6790000, 0, 33, NULL, NULL, NULL, NULL, 'Điện thoại Xiaomi Redmi Note 11 Pro', NULL, '12 tháng', 'Xiaomi Redmi Note 11 Pro 4G mang trong mình khá nhiều những nâng cấp cực kì sáng giá. Là chiếc điện thoại có màn hình lớn, tần số quét 120 Hz, hiệu năng ổn định cùng một viên pin siêu trâu.', 11, 5, 4074000),
(172, NULL, 599000, 0, 15, NULL, NULL, NULL, NULL, 'Điện thoại Vivo Y33s ', NULL, '12 tháng', 'Thiết kế bóng bẩy, các chi tiết được hoàn thiện tốt', 11, 7, 359400),
(173, NULL, 6500000, 0, 18, NULL, NULL, NULL, NULL, 'Điện thoại Vivo Y35 ', NULL, '12 tháng', 'Tiếp nối sự thành công của các mẫu smartphone tầm trung tại thị trường Việt Nam thì mới đây Vivo đã chính thức cho ra mắt điện thoại Vivo Y35. Máy sở hữu cho mình khả năng sạc siêu nhanh 44 W, cụm camera đem đến những bức ảnh sắc nét và một hiệu năng ổn định trong phân khúc.', 11, 7, 3900000),
(174, NULL, 6590000, 0, 56, NULL, NULL, NULL, NULL, 'Điện thoại Samsung Galaxy M33 5G', NULL, '12 tháng', 'Không chỉ gây ấn tượng với cộng đồng người dùng smartphone bởi mức giá bán, Samsung Galaxy M33 5G còn mang đến cho người dùng một bộ thông số kỹ thuật ấn tượng, camera độ phân giải cao cùng một thiết kế vô cùng bắt mắt, hứa hẹn mang đến những trải nghiệm sử dụng tốt nhất dành cho bạn.', 11, 3, 3954000),
(175, NULL, 6490000, 0, 15, NULL, NULL, NULL, NULL, 'Điện thoại OPPO A96 ', NULL, '12 tháng', 'OPPO A96 là cái tên được nhắc đến khá nhiều trên các diễn đàn công nghệ hiện nay, nhờ sở hữu một ngoại hình hết sức bắt mắt cùng hàng loạt các thông số ấn tượng trong phân khúc giá như hiệu năng cao, camera chụp ảnh sắc nét.', 11, 6, 3894000),
(176, NULL, 6390000, 0, 59, NULL, NULL, NULL, NULL, 'Điện thoại Samsung Galaxy A32 ', NULL, '12 tháng', 'Samsung Galaxy A32 là chiếc điện thoại thuộc phân khúc tầm trung nhưng sở hữu nhiều ưu điểm vượt trội về màn hình lớn sắc nét, bộ bốn camera 64 MP cùng vi xử lý hiệu năng cao và được bán ra với mức giá vô cùng tốt.', 11, 3, 3834000),
(177, NULL, 6200000, 0, 34, NULL, NULL, NULL, NULL, 'Điện thoại Realme 8 ', NULL, '12 tháng', 'Điện thoại Realme 8 được ra mắt trong phân khúc tầm trung và mang thiết kế đặc trưng của Realme, smartphone trang bị hiệu năng bên trong đầy mạnh mẽ và có dung lượng pin tương đối lớn.', 11, 10, 3720000),
(178, NULL, 6150000, 0, 33, NULL, NULL, NULL, NULL, 'Điện thoại OPPO A77s', NULL, '12 tháng', 'OPPO vừa cho ra mắt mẫu điện thoại tầm trung mới với tên gọi OPPO A77s, máy sở hữu màn hình lớn, thiết kế đẹp mắt, hiệu năng ổn định cùng khả năng mở rộng RAM lên đến 8 GB vô cùng nổi bật trong phân khúc.', 11, 6, 3690000),
(179, NULL, 3490000, 0, 35, NULL, NULL, NULL, NULL, 'Điện thoại Vivo Y15a ', NULL, '12 tháng', 'Vivo Y15a - là sản phẩm thuộc phân khúc giá rẻ có hiệu suất ổn định trên con chip 8 nhân, sở hữu một thiết kế hiện đại giúp cho máy thực sự là một sự lựa chọn đáng quan tâm trước khi chọn mua cho mình một thiết bị sở hữu đầy đủ chức năng có giá thành hợp lý.', 12, 7, 2094000),
(180, NULL, 3290000, 0, 15, NULL, NULL, NULL, NULL, 'Điện thoại Realme C25Y', NULL, '12 tháng', 'Realme C25Y là chiếc smartphone giá rẻ đáng mua với thiết kế cao cấp, cụm 3 camera Al phía sau cho khung hình quay chụp siêu nét, hiệu năng ổn định, thời lượng pin lớn và đính kèm nhiều tiện ích thú vị cho bạn tha hồ khám phá.', 12, 10, 1974000),
(181, NULL, 3990000, 0, 23, NULL, NULL, NULL, NULL, 'Điện thoại Realme C35 64GB   ', NULL, '12 tháng', 'Điện thoại Realme C35 thuộc phân khúc giá rẻ được nhà Realme cho ra mắt với thiết kế trẻ trung, dung lượng pin lớn cùng camera hỗ trợ nhiều tính năng. Đây sẽ là thiết bị liên lạc, giải trí và làm việc ổn định,… cho các nhu cầu sử dụng của bạn.', 12, 10, 2394000),
(182, NULL, 3990000, 0, 21, NULL, NULL, NULL, NULL, 'Điện thoại Vivo Y16 ', NULL, '12 tháng', 'Vivo Y16 64GB tiếp tục sẽ là cái tên được hãng bổ sung cho bộ sưu tập điện thoại Vivo dòng Y trong thời điểm cuối năm 2022, với mục tiêu mang đến nhiều trải nghiệm tốt hơn đối với dòng sản phẩm giá rẻ, Vivo hứa hẹn sẽ mang đến cho người dùng những trải nghiệm vượt xa mong đợi nhờ việc trang bị nhiều công nghệ xịn sò.', 12, 7, 2394000),
(183, NULL, 2350000, 0, 16, NULL, NULL, NULL, NULL, 'Điện thoại Vivo Y21', NULL, '12 tháng', 'Vivo Y21 chiếc smartphone mang trong mình nhiều ưu điểm nổi bật như màn hình viền mỏng đẹp mắt, hiệu năng ổn định cùng dung lượng pin tận 5000 mAh chắc chắn sẽ đáp ứng nhu cầu sử dụng của bạn cả ngày dài.', 12, 7, 1410000),
(184, NULL, 3190000, 0, 30, NULL, NULL, NULL, NULL, 'Điện thoại Nokia G11 ', NULL, '12 tháng', 'Nokia G11 được hãng cho ra mắt với hiệu năng ổn định, màn hình kích thước lớn mang đến những trải nghiệm giải trí tuyệt vời cùng thời gian sử dụng lâu dài với viên pin cực khủng.', 12, 9, 1914000),
(185, NULL, 3890000, 0, 34, NULL, NULL, NULL, NULL, 'Điện thoại Nokia G21', NULL, '12 tháng', 'Nokia G21 là thế hệ tiếp theo thuộc G series do Nokia sản xuất với những cải tiến nổi bật như màn hình kích thước lớn, hiệu năng ổn định mang đến trải nghiệm mượt mà trên các tác vụ hằng ngày cùng thời gian sử dụng lâu dài nhờ viên pin khủng được tích hợp trên điện thoại.', 12, 9, 2334000),
(186, NULL, 3690000, 0, 29, NULL, NULL, NULL, NULL, 'Điện thoại Realme C33 ', NULL, '12 tháng', 'Realme đã chính thức giới thiệu chiếc smartphone thuộc phân khúc giá rẻ mang tên Realme C33 (4GB/64GB), là chiếc điện thoại được hãng tập trung chủ yếu vào phần thiết kế và camera, mang lại cho người dùng những trải nghiệm chụp ảnh chất lượng cũng như một diện mạo đẹp mắt.', 12, 10, 2214000),
(187, NULL, 3090000, 0, 29, NULL, NULL, NULL, NULL, 'Điện thoại Nokia C31', NULL, '12 tháng', 'Điện thoại Nokia C31 (4GB/128GB) được giới thiệu để đem lại cho người dùng những trải nghiệm sử dụng tốt hơn hơn nhờ màn hình kích thước lớn, camera chụp ảnh chất lượng và hiệu năng ổn định, cùng với đó là những cải tiến mới nhất về tính năng đến từ Google nhờ hệ điều hành Android 12.', 12, 9, 1854000),
(188, NULL, 3690000, 0, 15, NULL, NULL, NULL, NULL, 'Điện thoại Realme C25Y 64GB ', NULL, '12 tháng', 'Realme C25Y 64GB - là chiếc smartphone được Realme cho ra mắt với một mức giá khá tốt, sở hữu thiết kế hiện đại với 3 camera AI lên đến 50 MP, hiệu suất ổn định cùng thời gian sử dụng lâu dài nhờ viên pin khủng 5000 mAh, được xem là một trong những sản phẩm lý tưởng mà bạn nên sở hữu.', 12, 10, 2214000),
(189, NULL, 3490000, 0, 25, NULL, NULL, NULL, NULL, 'Điện thoại Vivo Y02s', NULL, '12 tháng', 'Vivo Y02s - một cái tên thuộc dòng Y vừa được Vivo ra mắt với một diện mạo trẻ trung. Sở hữu bộ thông số được xem là nổi bật trong phân khúc điện thoại giá rẻ hiện nay (08/2022). Đây hứa hẹn sẽ là sản phẩm “vừa ngon vừa rẻ” mà người dùng không nên bỏ qua.', 12, 7, 2094000),
(190, NULL, 0, 0, 12, NULL, NULL, NULL, NULL, 'Điện thoại Nokia C30 ', NULL, '12 tháng', 'Điện thoại Nokia C30 là dòng smartphone giá rẻ được hãng Nokia chăm chút và đầu tư kỹ lưỡng với những nâng cấp đáng kể về hiệu năng camera cùng viên pin cực khủng so với Nokia C20 đem lại trải nghiệm tuyệt vời hơn thế hệ tiền nhiệm của mình.', 12, 9, 0),
(191, NULL, 2250000, 0, 25, NULL, NULL, NULL, NULL, 'Điện thoại Nokia C21 Plus', NULL, '12 tháng', 'Tiếp nối sự thành công của những sản phẩm gần đây tại thị trường Việt Nam, lần này hãng Nokia đã mang đến mẫu điện thoại Nokia C21 Plus - sở hữu trong mình viên pin mang lại thời gian trải nghiệm lâu dài và sử dụng an tâm hơn với 2 năm cập nhật bảo mật.', 12, 9, 1350000),
(192, NULL, 3100000, 0, 25, NULL, NULL, NULL, NULL, 'Điện thoại Nokia G10 ', NULL, '12 tháng', 'Điện thoại Nokia G10 cùng với Nokia G20 là bộ đôi smartphone đầu tiên thuộc dòng G-series của hãng Nokia, người dùng sẽ trải nghiệm lâu dài với dung lượng pin lớn, thiết kế thời trang và hoạt động trên hệ điều hành Android 11 nguyên bản, tối ưu sự mượt mà và hỗ trợ cập nhật đến 3 năm.', 12, 9, 1860000),
(193, NULL, 2990000, 0, 29, NULL, NULL, NULL, NULL, 'Điện thoại Nokia G11 Plus ', NULL, '12 tháng', 'Nokia G11 Plus 64GB có lẽ là một sự lựa chọn lý tưởng dành cho những ai đang mong muốn tìm mua cho mình một chiếc smartphone giá rẻ đáp ứng tốt các nhu cầu nghe gọi hay xem phim. Máy được trang bị bên trong một cấu hình ổn định, màn hình chất lượng có kích thước lớn giúp nâng cao trải nghiệm hàng ngày của bạn.', 12, 9, 1794000),
(194, NULL, 800000, 0, 66, NULL, NULL, NULL, NULL, 'Điện thoại Masstel FAMI 60 4G', NULL, '12 tháng', 'Masstel Fami 60 là chiếc điện thoại phổ thông dành tặng riêng cho người cao tuổi với thiết kế gọn gàng, màn hình rõ nét và cụm loa ngoài cực lớn cùng pin “siêu trâu”, hỗ trợ công nghệ đàm thoại LTE 4G, hứa hẹn sẽ đáp ứng hoàn hảo nhu cầu giải trí cơ bản, liên lạc của bạn.', 12, 8, 480000),
(195, NULL, 950000, 0, 25, NULL, NULL, NULL, NULL, 'Điện thoại Nokia 215 4G ', NULL, '12 tháng', 'Nokia 215 4G chiếc điện thoại phổ thông ngoài các chức năng cơ bản thì máy đã được nâng cấp với sự hỗ trợ kết nối mạng 4G mang đến nhiều trải nghiệm hơn cho người dùng.', 12, 9, 570000),
(196, NULL, 850000, 0, 50, NULL, NULL, NULL, NULL, 'Điện thoại Masstel Lux 20 ', NULL, '12 tháng', 'Masstel Lux 20 là chiếc điện thoại phổ thông dành cho khách khách hàng đang cần một chiếc điện thoại cơ bản cũng như phù hợp với những người lớn tuổi.\r\n\r\nĐiện thoại Masstel sở hữu màn hình 2.4 inch có độ phân giải 240 x 320 Pixels, được thiết lập 16.7 triệu màu sắc.', 12, 8, 510000),
(197, NULL, 1790000, 0, 25, NULL, NULL, NULL, NULL, 'Điện thoại Nokia 5710 ', NULL, '12 tháng', 'Bên cạnh sự phát triển của điện thoại thông minh thì điện thoại phổ thông cũng không hề kém cạnh khi xuất hiện ngày càng nhiều kiểu thiết kế độc đáo. Cụ thể như chiếc Nokia 5710 - máy được trang bị tai nghe không dây ngay tại mặt lưng, điều này giúp máy không chỉ dành cho nghe gọi mà còn có thể hoạt động như một thiết bị nghe nhạc.', 12, 9, 1074000),
(198, NULL, 1590000, 0, 25, NULL, NULL, NULL, NULL, 'Điện thoại Nokia 2660 Flip ', NULL, '12 tháng', 'Nokia 2660 Flip là chiếc điện thoại phổ thông khá thú vị nhờ tạo hình với cơ chế gập độc đáo, kèm theo đó là một màn hình phụ phía sau giúp bạn có thể theo dõi ngày giờ nhanh chóng.', 12, 9, 954000),
(199, NULL, 1490000, 0, 50, NULL, NULL, NULL, NULL, 'Điện thoại Nokia 8210 4G ', NULL, '12 tháng', 'Nokia 8210 4G có lẽ là một lựa chọn phù hợp với những ai cần cho mình một chiếc điện thoại phổ thông phục vụ cho nhu cầu nghe gọi. Máy có giá thành rẻ và vừa có độ bền cao, giúp cho người dùng có thể tiết kiệm được kha khá số tiền bỏ ra ban đầu cũng như không cần quá lo lắng đến vấn đề hỏng hóc trong lúc sử dụng.', 12, 9, 894000),
(200, NULL, 700000, 0, 25, NULL, NULL, NULL, NULL, 'Điện thoại Masstel FAMI 12 4G ', NULL, '12 tháng', '• Masstel Fami 12 4G có giao diện hiển thị to, rõ ràng, phông chữ lớn tiện lợi dễ dàng sử dụng, phù hợp với các bậc phụ huynh, người lớn tuổi.\r\n\r\n• Sở hữu thiết kế chắc chắn với khung viền kim loại, mặt lưng nhựa. Máy có phím mở khóa nhanh màn hình bên cạnh viền của máy cho thao tác sử dụng tiện lợi hơn.', 12, 8, 420000),
(201, NULL, 700000, 0, 25, NULL, NULL, NULL, NULL, 'Điện thoại Masstel IZI 55 4G', NULL, '12 tháng', 'Masstel trình làng Masstel IZI 55 mẫu điện thoại phổ thông hỗ trợ 4G VoLTE thuộc series IZI, sở hữu thiết kế thân thiện, chip xử lý Unisoc, thời lượng pin ấn tượng và nhiều tính năng tiện ích.', 12, 8, 420000),
(202, NULL, 730000, 0, 20, NULL, NULL, NULL, NULL, 'Điện thoại Mobell M539 ', NULL, '12 tháng', 'Mobell M539 - chiếc điện thoại phổ thông vừa được ra mắt phù hợp cho ai đang tìm kiếm cho mình một thiết bị nhỏ gọn phục vụ tốt trong việc liên lạc bởi máy có hỗ trợ mạng di động 4G VoLTE cùng khả năng trang bị 2 nano SIM.', 12, 8, 438000),
(203, NULL, 580000, 0, 30, NULL, NULL, NULL, NULL, 'Điện thoại Masstel IZI 20 4G', NULL, '12 tháng', 'Masstel IZI 20 4G, một chiếc điện thoại phổ thông sở hữu thiết kế cơ bản, bền bỉ cùng thời lượng pin dài lâu. Sự lựa chọn tối ưu cho những ai đang cần một thiết bị di động nhỏ gọn chuyên để liên lạc làm việc.', 12, 8, 348000),
(204, NULL, 520000, 0, 20, NULL, NULL, NULL, NULL, 'Điện thoại Masstel IZI 10 4G', NULL, '12 tháng', 'Masstel IZI 10 4G là 1 phiên bản \"cục gạch\" khác của nhà Masstel có tích hợp 4G mang lại trải nghiệm nghe gọi cực tốt, cùng thiết kế thân thiện dễ dùng, có hỗ trợ khe cắm thẻ nhớ và dung lượng pin tốt, rất đáng lựa chọn.', 12, 8, 312000),
(205, NULL, 530000, 0, 100, NULL, NULL, NULL, NULL, 'Cáp Type C - Lightning 1m Apple MM0A3 Trắng ', NULL, '12 tháng', 'Cáp Type C - Lightning 1m Apple MM0A3 Trắng sở hữu thiết kế đơn giản, độ dài 1 m cùng khả năng sạc nhanh lên đến 87 W chính là sự lựa chọn tuyệt vời cho các iFans chân chính.', 13, 11, 318000),
(206, NULL, 70000, 0, 100, NULL, NULL, NULL, NULL, 'Adapter sạc USB 5W AVA+ DS016-BG', NULL, '12 tháng', 'Đặc điểm nổi bật\r\n\r\nThiết kế nhỏ gọn, có 2 màu trắng - đen để lựa chọn.\r\nDòng điện 1A phù hợp với điện thoại cấp thấp như dòng nghe gọi, sạc dự phòng, tai nghe Bluetooth,...\r\nKết hợp với nhiều loại dây cáp để sạc cho nhiều thiết bị khác nhau.', 13, 11, 42000),
(207, NULL, 350000, 0, 120, NULL, NULL, NULL, NULL, 'Adapter sạc Type C PD 20W GaN Belkin WCH009 Trắng', NULL, '12 tháng', 'Đặc điểm nổi bật\r\n\r\nThiết kế sang trọng, gọn gàng, jack 2 chấu thông dụng.\r\nKích thước nhỏ hơn, sạc hiệu quả hơn với công nghệ GaN.\r\nCó 1 cổng sạc Type C cho công suất tối đa 20W (9V - 2.22A).\r\nĐiều chỉnh dòng sạc phù hợp với nhiều thiết bị qua công nghệ sạc nhanh Power Delivery.\r\nĐến từ thương hiệu danh tiếng Belkin của Mỹ, yên tâm về chất lượng.', 13, 11, 210000),
(208, NULL, 230000, 0, 200, NULL, NULL, NULL, NULL, 'Cáp Type C 2m Belkin CAB001 ', NULL, '12 tháng', 'Cáp Type C 2m Belkin CAB001 có độ dài dây đến 2 m, cho bạn thoải mái kết nối các thiết bị mà không cần băn khoăn đến vấn đề thiếu hụt dây trong khi thao tác. Chất liệu nhựa phủ bên ngoài dây giúp bảo vệ linh kiện bên trong, độ bền cao, chống rối dây hiệu quả. 2 gam màu cơ bản là trắng và đen, hòa hợp với mọi món đồ công nghệ mà bạn đang sở hữu. ', 13, 11, 138000),
(209, NULL, 180000, 0, 200, NULL, NULL, NULL, NULL, 'Cáp Lightning MFI 0.9m Anker Select+ A8012 ', NULL, '12 tháng', 'Cáp Lightning MFI 0.9m Anker A8012 thiết kế nhỏ gọn với độ dài 0.9 m dễ dàng kết nối với các thiết bị ở gần mà không bị vướng víu bởi độ dài của dây. Đặc biệt, cáp sạc sử dụng vỏ nylon kép giúp gia tăng độ bền và thời gian sử dụng lâu.', 13, 11, 108000),
(210, NULL, 300000, 0, 150, NULL, NULL, NULL, NULL, 'Cáp Type C - Type C 0.9m Anker PowerLine III Flow A8552 ', NULL, '12 tháng', 'Cáp Type C - Type C 0.9m Anker PowerLine III Flow A8552 sở hữu thiết kế đơn giản, chất liệu bền bỉ, trang bị công nghệ sạc nhanh hiện đại,... hứa hẹn sẽ là món phụ kiện đáng đầu tư để nâng cao trải nghiệm sạc pin của bạn.', 13, 11, 180000),
(211, NULL, 400000, 0, 60, NULL, NULL, NULL, NULL, 'Adapter Sạc Type C PD 20W Anker PowerPort III Nano A2633 Trắng ', NULL, '12 tháng', 'Adapter Sạc Type C PD 20W Anker PowerPort III Nano A2633 trắng với kích thước nhỏ nhắn và trọng lượng nhẹ tương đương 1 cục pin AAA, thật nhẹ nhàng để mang kèm cục sạc trong hành trang của bạn mọi nơi, mọi lúc.', 13, 11, 240000),
(212, NULL, 30000, 0, 300, NULL, NULL, NULL, NULL, 'Cáp chuyển đổi Lightning sang 3.5mm Apple MMX62 ', NULL, '12 tháng', 'Cáp chuyển đổi Lightning sang 3.5mm Apple MMX62 thiết kế nhỏ gọn, dễ dàng cất giữ hay mang theo', 13, 11, 18000),
(213, NULL, 620000, 0, 250, NULL, NULL, NULL, NULL, 'Cáp Type C - Type C 2 m Apple MLL82 Trắng', NULL, '12 tháng', 'Cáp Type-C - Type-C 2 m Apple MLL82 Trắng thiết kế với màu trắng sang trọng, tinh tế', 13, 11, 372000),
(214, NULL, 1300000, 0, 120, NULL, NULL, NULL, NULL, 'Cáp sạc không dây MagSafe Charger Apple MHXH3 ', NULL, '12 tháng', 'Cáp sạc không dây MagSafe Charger Apple MHXH3 có thiết kế mỏng nhẹ, đơn giản, dạng hình tròn với bề mặt sạc nhám giúp hạn chế bị trầy xước.', 13, 11, 780000),
(215, NULL, 3990000, 0, 200, NULL, NULL, NULL, NULL, 'Sạc không dây MagSafe Duo Charger Apple MHXF3 Trắng ', NULL, '12 tháng', 'Sạc không dây MagSafe Duo Charger Apple MHXF3 Trắng với thiết kế mỏng nhẹ, có thể gập lại dễ dàng, tiện bỏ vào túi xách, balo mang theo bên mình.', 13, 11, 2394000),
(216, NULL, 480000, 0, 50, NULL, NULL, NULL, NULL, 'Adapter chuyển đổi Type C 4 in 1 Xmobile DS122F', NULL, '12 tháng', 'Adapter chuyển đổi Type C 4 in 1 Xmobile DS122F Xám có kiểu dáng thon dài với các góc được bo tròn mềm mại, cho cảm giác cầm tốt và không chiếm nhiều diện tích khi sử dụng để kết nối với các thiết bị khác.', 13, 11, 288000),
(217, NULL, 1720000, 0, 250, NULL, NULL, NULL, NULL, 'Adapter chuyển đổi Type C 6 in 1 HyperDrive HD233B  ', NULL, '12 tháng', 'HyperDrive HD233B nhỏ gọn, màu bạc bóng đẹp\r\nCó hình chữ nhật với các góc bo cong mềm mại, kích thước nhỏ nhắn cho phép bạn mang theo adapter dễ dàng khi đi làm, đi chơi, công tác xa nhà. Chất liệu vỏ ngoài adapter bằng vật liệu Aluminum CNC cao cấp hạn chế rỉ sét, tản nhiệt tốt, tăng hiệu suất sử dụng và độ bền thiết bị. ', 13, 11, 1032000),
(218, NULL, 1090000, 0, 110, NULL, NULL, NULL, NULL, 'Bộ chuyển đổi chân sạc Adapter Kit Apple MD837 ', NULL, '12 tháng', 'Bộ chuyển đổi chân sạc Adapter Kit Apple MD837 bao gồm nhiều loại phích cắm tiện lợi khi sử dụng.', 13, 11, 654000),
(219, NULL, 830000, 0, 150, NULL, NULL, NULL, NULL, 'Adapter Sạc 3 cổng USB Type C PD QC3.0 GaN 65W HyperJuice HJ265 Trắng ', NULL, '12 tháng', 'Adapter kích cỡ siêu nhỏ cùng thiết kế đơn giản, tinh tế, tính di động cao\r\nThiết kế với kích thước chỉ bằng 50% so với các bộ sạc truyền thống, phần vỏ bằng nhựa cao cấp chống cháy hoàn thiện tốt với logo hãng nổi bật và họa tiết hàng loạt dấu + tăng nét thẩm mỹ cùng độ bám chắc tay khi cầm nắm, chống trầy hiệu quả cho adapter sạc', 13, 11, 498000),
(220, NULL, 1500000, 0, 90, NULL, NULL, NULL, NULL, 'Adapter sạc 4 cổng USB Type C PD 100W HyperJuice HJ-GAN100 Trắng ', NULL, '12 tháng', 'Là bộ sạc 100W nhỏ nhất thế giới, chỉ tương đương với 1 chiếc thẻ ngân hàng\r\nAdapter có kích cỡ nhỏ hơn 50% so với các bộ sạc truyền thống, vỏ ngoài phủ màu trắng sáng sạch đẹp, chấu cắm 2 chân có thể gập lại dễ dàng, thuận tiện cho việc cất giữ, đem theo trong hành trang thường ngày. ', 13, 11, 900000),
(221, NULL, 4390000, 0, 300, NULL, NULL, NULL, NULL, 'Tai nghe Bluetooth AirPods 2 Lightning Charge Apple MV7N2 Trắng', NULL, '12 tháng', 'Tai nghe Bluetooth AirPods 2 Apple MV7N2 - được mệnh danh là một chiếc AirPods huyền thoại quốc dân rất được lòng của các fan nhà táo. Sau thành công vang dội của AirPods đời đầu thì phiên bản đời thứ 2 này của nhà Apple có gì cải tiến để có thể vượt qua người tiền nhiệm và cho tới thời điểm hiện tại vẫn còn nhận được nhiều sự ưa chuộng với các bạn trẻ đến vậy?', 14, 2, 2634000),
(222, NULL, 6490000, 0, 250, NULL, NULL, NULL, NULL, 'Tai nghe Bluetooth AirPods Pro (2nd Gen) MagSafe Charge Apple MQD83 Trắng ', NULL, '12 tháng', 'Thiết kế tai nghe AirPods Pro 2 gọn nhẹ, kiểu dáng hiện đại\r\nVề phần thiết kế, nhà Apple vẫn giữ nguyên kiểu dáng quen thuộc của những phiên bản tiền nhiệm trước đó như: Thiết kế gọn nhẹ, đường bo góc tinh tế, gam màu trắng trang nhã bao bọc trọn vẹn tai nghe và hộp sạc.', 14, 2, 3894000),
(223, NULL, 890000, 0, 100, NULL, NULL, NULL, NULL, 'Tai nghe Bluetooth True Wireless Mozard AT15 ', NULL, '12 tháng', 'Tai nghe Mozard màu trắng thanh lịch, hộp đựng gọn đẹp, dễ mang theo khi đi làm, đi học, đi du lịch,...', 14, 12, 534000),
(224, NULL, 6490000, 0, 350, NULL, NULL, NULL, NULL, 'Tai nghe Bluetooth AirPods Pro MagSafe Charge Apple MLWK3 Trắng', NULL, '12 tháng', 'Thiết kế cao cấp, đeo vừa vặn với nút tai silicone\r\nTai nghe Bluetooth AirPods Pro MagSafe Charge Apple MLWK3 trắng được chế tác với vẻ ngoài tinh giản, gam màu trắng trẻ trung, sáng đẹp, phối hợp tuyệt vời với mọi trang phục từ đời thường đến công sở, dự tiệc của bạn. ', 14, 2, 3894000),
(225, NULL, 690000, 0, 500, NULL, NULL, NULL, NULL, 'Tai nghe nhét trong EarPods Lightning Apple MMTN2 ', NULL, '12 tháng', 'Tai nghe EarPods cổng Lightning Apple MMTN2 thiết kế trẻ trung với màu trắng sang trọng, tinh tế', 14, 2, 414000),
(226, NULL, 690000, 0, 120, NULL, NULL, NULL, NULL, 'Tai nghe nhét tai Earpods Apple MNHF2 ', NULL, '12 tháng', 'Tai nghe Earpods Apple MNHF2 với thiết kế đẹp mắt, kiểu dáng quen thuộc trẻ trung', 14, 2, 414000),
(227, NULL, 275000, 0, 250, NULL, NULL, NULL, NULL, 'Tai nghe Bluetooth Mozard K8 ', NULL, '12 tháng', 'Thiết kế đầy cá tính, 2 phiên bản màu xanh - hồng cực kỳ bắt mắt\r\nTai nghe được làm tinh xảo, bộ khung cứng cáp, có hệ thống treo tiện dụng và chụp tai phủ bên ngoài bởi lớp chất liệu mềm mại, đeo vào đầu nhẹ nhàng, không làm mỏi, đau vùng đầu - cổ - tai.', 14, 12, 165000),
(228, NULL, 420000, 0, 90, NULL, NULL, NULL, NULL, 'Tai nghe Bluetooth Xmobile Z706A Đen Xám', NULL, '12 tháng', 'Tai nghe Bluetooth Xmobile Z706A Đen Xám với thiết kế đeo vòng cổ mềm mại giúp thoải mái sử dụng suốt ngày dài. Viên pin lớn và chất lượng âm thanh cũng là một điểm cộng lớn trên chiếc tai nghe này.', 14, 11, 252000);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `ten_vai_tro` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `ten_vai_tro`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_MEMBER'),
(3, 'ROLE_SHIPPER');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ho_ten` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `dia_chi`, `email`, `ho_ten`, `password`, `so_dien_thoai`) VALUES
(1, 'Hanoi', 'admin@gmail.com', 'Le Van Dung', '$2a$10$/VFMNUPBKNVRMjxPFCYKZ.lKahoLQda0EaAxdqoun1w3DqwNLa2me', '0123456789'),
(2, NULL, 'member@gmail.com', NULL, '$2a$10$/VFMNUPBKNVRMjxPFCYKZ.lKahoLQda0EaAxdqoun1w3DqwNLa2me', NULL),
(3, 'hanoi', 'shipper@gmail.com', 'le van dung', '$2a$10$/VFMNUPBKNVRMjxPFCYKZ.lKahoLQda0EaAxdqoun1w3DqwNLa2me', '0123456789'),
(4, 'Ha Noi', 'jvgiveup@gmail.com', 'Pham Tuan', '$2a$10$/VFMNUPBKNVRMjxPFCYKZ.lKahoLQda0EaAxdqoun1w3DqwNLa2me', '123456'),
(5, 'Hanoi', 'dung.lv.742@aptechlearning.edu.vn', 'Le Van Dung', '$2a$10$/VFMNUPBKNVRMjxPFCYKZ.lKahoLQda0EaAxdqoun1w3DqwNLa2me', '0123456789'),
(6, 'Hanoi', 'demo@gmail.com', 'Giao hang nhanh', '$2a$10$/VFMNUPBKNVRMjxPFCYKZ.lKahoLQda0EaAxdqoun1w3DqwNLa2me', '0123456789'),
(7, 'Hanoi', 'test@gmail.com', 'Test', '$2a$10$/VFMNUPBKNVRMjxPFCYKZ.lKahoLQda0EaAxdqoun1w3DqwNLa2me', '0123456789');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `ma_nguoi_dung` bigint(20) NOT NULL,
  `ma_vai_tro` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`ma_nguoi_dung`, `ma_vai_tro`) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 2),
(5, 1),
(6, 3),
(7, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKitverect56puwr47y7tyvy6er` (`ma_nguoi_dung`);

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK49lmmclnjgb7eck20lwhv0cks` (`ma_gio_hang`),
  ADD KEY `FKkd69a7wiulr4xgohxl0rlhth4` (`ma_san_pham`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6jm47uh7f94pc3wix0duvedde` (`ma_nguoi_tra_loi`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnwjiboxao1uvw1siemkvs1jb9` (`ma_nguoi_dat`),
  ADD KEY `FKgndcrlvetoudr3jaif9b7ay37` (`ma_shipper`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9wl3houbukbxpixsut6uvojhy` (`ma_don_hang`),
  ADD KEY `FK3ry84nmdxgoarx53qjxd671tk` (`ma_san_pham`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqss6n6gtx6lhb7flcka9un18t` (`ma_danh_muc`),
  ADD KEY `FKchvjvgjnq8lbt9mjtyfn5pksq` (`ma_hang_sx`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`ma_nguoi_dung`,`ma_vai_tro`),
  ADD KEY `FKig6jxd861mqv02a8pn68r43fr` (`ma_vai_tro`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_details`
--
ALTER TABLE `cart_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FKitverect56puwr47y7tyvy6er` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `user` (`id`);

--
-- Constraints for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD CONSTRAINT `FK49lmmclnjgb7eck20lwhv0cks` FOREIGN KEY (`ma_gio_hang`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `FKkd69a7wiulr4xgohxl0rlhth4` FOREIGN KEY (`ma_san_pham`) REFERENCES `product` (`id`);

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK6jm47uh7f94pc3wix0duvedde` FOREIGN KEY (`ma_nguoi_tra_loi`) REFERENCES `user` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKgndcrlvetoudr3jaif9b7ay37` FOREIGN KEY (`ma_shipper`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKnwjiboxao1uvw1siemkvs1jb9` FOREIGN KEY (`ma_nguoi_dat`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK3ry84nmdxgoarx53qjxd671tk` FOREIGN KEY (`ma_san_pham`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK9wl3houbukbxpixsut6uvojhy` FOREIGN KEY (`ma_don_hang`) REFERENCES `orders` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FKchvjvgjnq8lbt9mjtyfn5pksq` FOREIGN KEY (`ma_hang_sx`) REFERENCES `manufacturer` (`id`),
  ADD CONSTRAINT `FKqss6n6gtx6lhb7flcka9un18t` FOREIGN KEY (`ma_danh_muc`) REFERENCES `category` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FKig6jxd861mqv02a8pn68r43fr` FOREIGN KEY (`ma_vai_tro`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FKocavcnspu1wcvp2w0s4usfgbf` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
