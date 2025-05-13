

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `id` int(9) NOT NULL,
  `id_order` int(9) NOT NULL,
  `id_pro` int(9) NOT NULL,
  `quantity` int(9) NOT NULL DEFAULT 0,
  `prices` double(10,2) NOT NULL DEFAULT 0.00,
  `name_pro` varchar(50) DEFAULT NULL,
  `img_pro` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`id`, `id_order`, `id_pro`, `quantity`, `prices`, `name_pro`, `img_pro`) VALUES
(201, 141, 90, 2, 27000000.00, 'Grey Vest', 'suit (6).png'),
(202, 142, 90, 1, 27000000.00, 'Grey Vest', 'suit (6).png'),
(203, 142, 91, 1, 27500000.00, 'Black Vest', 'suit (2).png'),
(204, 143, 95, 1, 20000000.00, 'Ken Vest', 'product-39.png'),
(206, 145, 90, 1, 27000000.00, 'Grey Vest', 'suit (6).png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_catalog`,(Danh mục sản phẩm)
--

CREATE TABLE `tbl_catalog` (
  `id_catalog_k` int(4) NOT NULL,
  `catalog_name` varchar(50) NOT NULL,
  `prioritize` int(4) NOT NULL DEFAULT 0,
  `display_ctl` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_catalog`
--

INSERT INTO `tbl_catalog` (`id_catalog_k`, `catalog_name`, `prioritize`, `display_ctl`) VALUES
(94, 'Tiểu thuyết', 1, 1),
(95, 'Ngôn tình', 1, 1),
(96, 'Truyện ngắn-tản văn', 1, 1);


-- --------------------------------------------------------

--
-- Table structure for table `tbl_client`(Khách hàng)
--

CREATE TABLE `tbl_client` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ban` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_client`
--

INSERT INTO `tbl_client` (`id`, `fname`, `lname`, `sex`, `address`, `email`, `phone`, `user`, `password`, `ban`) VALUES
(32, 'Phuong', 'Tran Quang', 2, 'KTX KHU A', '2052000@gm.uit.edu.vn', '0342888525', 'quangphuong', '123', 0),
(39, 'Thuong', 'Tran Thi Hong', 1, 'Thai Binh', '2002@gmail.com', '0342888525', 'thuongtran', '123123', 1),
(40, 'Anh', 'Nguyen Minh', 2, 'Thanh Hoa', '2002@gmail.com', '+84342888525', 'minhanhnguyen', '123123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`(đơn hàng)
--

CREATE TABLE `tbl_order` (
  `id` int(9) NOT NULL,
  `invoice_id` varchar(20) NOT NULL,
  `total_prices` double(10,0) NOT NULL DEFAULT 0,
  `payment` tinyint(1) NOT NULL DEFAULT 1,
  `id_user` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `notes` varchar(255) NOT NULL DEFAULT 'Not note',
  `due_date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  `employee_pr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `invoice_id`, `total_prices`, `payment`, `id_user`, `fname`, `lname`, `phone`, `email`, `address`, `notes`, `due_date`, `status`, `employee_pr`) VALUES
(141, 'THEYENNI876833', 59400000, 2, 39, 'Thuong', 'Nguyen', '0342888525', '2002@gmail.com', '1', '', '2023-06-08', 'Cancel', 1),
(142, 'THEYENNI80948', 59950000, 2, 39, 'Thuong', 'Nguyen', '0342888525', '2002@gmail.com', '1', 'hhi', '2023-06-08', 'Ordered', 9),
(143, 'THEYENNI728281', 22000000, 2, 39, 'Thuong', 'Nguyen', '0342888525', '2002@gmail.com', '1', '', '2023-06-08', 'Pending', NULL),
(144, 'THEYENNI7506', 29700000, 2, 39, 'Thuong', 'Nguyen', '0342888525', '2002@gmail.com', '1', '', '2023-06-09', 'Pending', NULL),
(145, 'THEYENNI216815', 29700000, 2, 40, 'Thuong', 'Nguyen', '0342888525', '2002@gmail.com', '1', '', '2023-06-09', 'Pending', NULL);

-- --------------------------------------------------------
--

--
--

-- Table structure for table `tbl_product`(Sản phẩm)
--
CREATE TABLE `tbl_product` (
  `id_product` int(6) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `product_img` varchar(50) NOT NULL,
  `product_prices` int(10) NOT NULL DEFAULT 0, -- Giá sau khi giảm
  `old_prices` int(11) NOT NULL DEFAULT 0, -- Giá gốc (trước giảm)
  `flash_sale` TINYINT(1) NOT NULL DEFAULT 0, -- Sản phẩm có trong Flash Sale không?
  `catalog_id` int(4) NOT NULL,
  `employee_entry` int(11) NOT NULL,
  `entry_date` date NOT NULL DEFAULT current_timestamp(),
  `sup_id` int(11) NOT NULL,
  `view` tinyint(4) NOT NULL DEFAULT 0,
  `special` tinyint(4) NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id_product`, `product_name`, `quantity`, `product_img`, `product_prices`, `catalog_id`, `employee_entry`, `entry_date`, `sup_id`, `view`, `special`, `old_prices`, `description`, `flash_sale`) VALUES
(90, 'Nhà giả kim', 148, 'tt1.jpg', 63200, 94, 1, '2023-06-08', 16, 1, 1, 95000, 'Nhà giả kim(Tác giả: Paulo Coelho) - hành trình đi tìm kho báu hay cuộc hành trình tìm kiếm chính mình', 0),
(91, 'Trường Ca Achilles', 149, 'tt2.jpg', 124800, 94, 1, '2023-06-08', 16, 1, 1, 150000, 'Trường Ca Achilles(Tác giả: Madeline Miller ) - một bản tình ca bi tráng dưới ánh hoàng hôn hy lạp', 1),
(92, 'Cây cam ngọt của tôi', 273, 'tt3.jpg', 86400, 94, 1, '2023-06-08', 16, 1, 1, 100000, 'Cây cam ngọt của tôi(Tác giả: Jose Mảuo de Vasconcelos) - một tuổi thơ bị lãng quên', 0),
(93, 'Người đàn ông mang tên OVE', 10, 'tt4.jpg', 136000, 94, 1, '2023-06-08', 14, 1, 1, 200000, 'Người đàn ông mang tên OVE (Tác giả: Fredrik Backman) - cuốn sách khiến triệu đọc giả cười rồi khóc', 1),
(94, 'Sưởi ấm mặt trời', 150, 'tt13.jpg', 42500, 94, 1, '2023-06-08', 14, 1, 1, 60000, 'Sưởi ấm mặt trời - hành trình đi tìm ánh sáng giữa tổn thương', 1),
(95, 'Người bà tài giỏi vùng saga', 122, 'tt6.jpg', 102500, 94, 1, '2023-06-08', 14, 1, 1, 150000, 'Người bà tài giỏi vùng saga - hạnh phúc không phải là thứ được định đoặt bằng tiền. Hạnh phúc phải đạt được bằng tâm chúng ta', 0),
(96, 'Một thoáng ta rực rỡ ở nhân gian', 123, 'tt7.jpg', 108000, 94, 1, '2023-06-08', 14, 1, 1, 200000, 'Một thoáng rực rỡ ở nhân gian (Tác giả: Ocean Vuong) - lá thư chưa từng gửi, ký ức chưa từng yên', 0),
(97, 'Tottochan bên cửa sổ', 123, 'tt8.jpg', 96000, 94, 1, '2023-06-08', 16, 1, 1, 150000, 'Tottochan bên cửa sổ (Tác giả: Kuroyanagi Tetsuko) - một tuổi thơ khác biệt, một ngôi trường không giống ai', 0),
(98, 'Người đua điều', 100, 'tt9.jpg', 103200, 94, 1, '2023-06-08', 16, 1, 1, 129000, 'Người đua điều(Tác giả: Khaled Hosseini Khaled Khaled) - bí mật, phản bội vfa hnahf trình chuộc lỗi không lối thoát', 1),
(99, 'Chiến binh cầu vồng', 123, 'tt10.jpg', 87200, 94, 1, '2023-06-08', 16, 1, 1, 109000, 'Chiến binh cầu vồng (Tác giả: Andrea Hirata) - câu chuyện về những giấc mơ không bao giờ gục ngã', 1),
(100,'Nhật kí Đặng Thuỳ Trâm', 50, 'tt11.jpg', 72000, 94, 1, '2023-06-08', 16, 1, 1, 90000, 'Nhật kí Đặng Thuỳ Trâm là những ghi chép hàng ngày của một người nữ bác sĩ về cuộc sống nơi tiền tuyến', 0),
(101,'Chưa kịp lớn đã phải trưởng thành', 55, 'tt12.jpg', 59250, 94, 1, '2023-06-08', 16, 1, 1, 79000, 'Chưa kịp lớn đã phải trưởng thành - quá trình trưởng thành nào cũng đều có kì vọng và nuối tiếc nhưng con người luôn phải học cách vượt qua mơ hồ, gạt đi mộng tưởng mà lớn lên', 0),
(102,'Bến xe (Tái bản 2020)', 50, 'nt1.jpg', 54720, 95, 1, '2023-06-08', 16, 1, 1, 76000, 'Bến xe - thứ tôi có thể cho em trong cuộc đời này chỉ là danh dự trong sạch và một tương lai tươi đẹp mà thôi. Thế nhưng, nếu chúng ta có kiếp sau, nếu kiếp sau tôi có đôi mắt sáng, tôi sẽ ở bến xe này...đợi em', 0),
(103,'Thất tịch không mưa', 50, 'nt2.jpg', 68800, 95, 1, '2023-06-08', 16, 1, 1, 86000, 'Thất tịch không mưa - trong quả khế chát xanh xanh, nụ cười ngốc ngếch, ngọt ngào của anh, tình đầu ngây thơ, trong sáng của em lặng lẽ nảy mầm', 1),
(104,'Siêu cấp cưng chiều -Tập 1', 50, 'nt3.jpg', 141750, 95, 1, '2023-06-08', 16, 1, 1, 189000, 'Siêu cấp cưng chiều - Sự dung túng và cách đối xử đặc biệt của Thương Úc dành cho Lê Tiếu khiến cô càng ngày một tò mò và lún sâu. Cứ thế, vận mệnh kì diệu đã trói buộc hai con người, hai sự tồn tại đặc biệt ở Nam Dương lại với nhau', 1),
(105,'Từng có người yêu tôi như sinh mệnh', 50, 'nt4.jpg', 103200, 95, 1, '2023-06-08', 16, 1, 1, 129000, 'Từng có người yêu tôi như sinh mệnh(Tác giả: Thư Nghi) - Cô bé của tôi, chúc em một đời bình an vui vẻ', 1),
(106,'Yêu em từ cái nhìn đầu tiên', 50, 'nt5.jpg', 116350, 95, 1, '2023-06-08', 16, 1, 1, 179000, 'Yêu em từ cái nhìn đầu tiên - một chuyện tình ngọt ngào giữa nữ sinh IT tài giỏi và nam thần lập trình - bắt đầu từ thế giới ảo và kết thúc bằng trái tim rung động thật', 1),
(107,'Mãi mãi là bao xa', 50, 'nt6.jpg', 108000, 95, 1, '2023-06-08', 16, 1, 1, 135000, 'Em là cây hoa loa kèn hoang dã mãi mãi chỉ vì chính mình mà nở hoa, rời khỏi đất mẹ là cái giá phải trả khi yêu anh', 0),
(108,'Gió tây bao nhiêu', 50, 'nt7.jpg', 142400, 95, 1, '2023-06-08', 16, 1, 1, 178000, 'Viết về Nạp Lan Tính Đức - tài hoa xuất chúng, được Khang Hy đế yêu quý hết mực', 0),
(109,'Sự dịu dàng khó cưỡng', 50, 'nt8.jpg', 55300, 95, 1, '2023-06-08', 16, 1, 1, 79000, 'Sự dịu dàng khó cưỡng - tiểu thuyết ngôn tình hiện đại nhẹ nhàng nhưng đầy rung động của tác giả Trì Hạ, kể về mối tình giữa một cô gái đơn thuần vfa chàng trai tưởng như lạnh lùng nhưng ẩn chứa bên trong là sự dịu dàng đến không ngờ', 1),
(110,'Nếu biết trăm năm là hữu hạn', 50, 'tv1.jpg', 135150, 96, 1, '2023-06-08', 16, 1, 1, 159000, 'Nếu biết trăm năm là hữu hạn (Tác giả: Phạm Lữ Ân) - lá thư gửi những người trẻ đnag lạc lối', 1),
(111,'Tôi thích dáng vẻ nỗ lực của chính mình', 50, 'tv2.jpg', 74250, 96, 1, '2023-06-08', 16, 1, 1, 99000, 'Tôi thích dáng vẻ nỗ lực của chính mình (Tác giả: LILY TRƯƠNG) - Nếu ông trời không ban cho bạn sự may mắn, vậy hãy tự biến bản thân mình thành kì tích', 1),
(112,'Tiếng gọi trân trời', 50, 'tv3.jpg', 68000, 96, 1, '2023-06-08', 16, 1, 1, 95000, 'Tiếng gọi của chân trời - những con người văng mình vào những cuộc đi/về, vào cuộc mất/còn của những chuẩn mực sống, những mối quan hệ ấm lạnh của cuộc đời khi mà giá trị vật chất lên ngôi',0),
(113,'Đám trẻ ở đại dương', 50, 'tv4.jpg', 74250, 96, 1, '2023-06-08', 16, 1, 1, 99000, 'Đám trẻ ở đại dương - lời độc thoại và đối thoại của những đứa trẻ ở đại dương đen, nơi từng lớp sóng của nỗi buồn và tuyệt vọng', 1),
(114,'Mẹ làm gì có ước mơ', 50, 'tv5.jpg', 66750, 96, 1, '2023-06-08', 16, 1, 1, 89000, 'Bạn có bao giờ hỏi ước mơ của bố mẹ là gì? Tại sao mẹ lại chằng có nổi một ước mơ cho riêng mình? Phải chăng gánh vai mẹ đã quá mệt mỏi với cơm áo gạo tiền, với những bữa cơm và học phí của con', 0),
(115,'Khi hai ta về một nhà', 50, 'tv6.jpg', 73500, 96, 1, '2023-06-08', 16, 1, 1, 98000, 'Khi hai ta về chung một nhà - hy vọng những ai đã có đôi sẽ thêm trân quý tình yêu của mình, còn những ai vẫn còn đơn lẻ, có lẽ cũng sẽ đủ dũng cảm để mở lòng cho ngừoi xứng đáng. Vì yêu và được yêu, chính alf điều đẹp đẽ nhất trên thế gian này', 1),
(116,'Có một ngày, bố mẹ sẽ già đi ', 50, 'tv7.jpg', 73600, 96, 1, '2023-06-08', 16, 1, 1, 92000, 'Có một ngày, bố mẹ sẽ già đi là những câu chuyện cảm động về tình thân, gia đình và ngừơi nhà.', 0);


-- --------------------------------------------------------


CREATE TABLE `tbl_supplier` (
  `sup_id` int(11) NOT NULL,
  `sup_name` varchar(255) NOT NULL,
  `sup_address` varchar(255) NOT NULL,
  `sup_bank` int(11) NOT NULL,
  `sup_tax_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`sup_id`, `sup_name`, `sup_address`, `sup_bank`, `sup_tax_code`) VALUES
(14, 'Viettienn', 'VN', 1231231, 123123),
(16, 'Homes', 'US', 1231231, 123123);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `name_us` varchar(50) DEFAULT NULL,
  `address_us` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `user` varchar(20) NOT NULL,
  `password_us` varchar(20) NOT NULL,
  `role_us` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `name_us`, `address_us`, `email`, `user`, `password_us`, `role_us`) VALUES
(1, 'Vy', 'KTXkhuA', '20522000@gm.uit.edu.vn', 'adminvy', '123123', 1),
(2, 'Nhung', 'Bắc Giang', '20521381@gm.uit.edu.vn', 'adminnhung', '123123', 1),
(9, 'Nga', 'ktxkhuA', '20521331@gmail.com', 'adminnga', '123123', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_order` (`id_order`),
  ADD KEY `FK_product` (`id_pro`);

--
-- Indexes for table `tbl_catalog`
--
ALTER TABLE `tbl_catalog`
  ADD PRIMARY KEY (`id_catalog_k`);

--
ALTER TABLE `tbl_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_employee` (`employee_pr`),
  ADD KEY `FK_client_check` (`id_user`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `fk_product_catalog` (`catalog_id`),
  ADD KEY `fk_employee_entry` (`employee_entry`),
  ADD KEY `fk_supplier` (`sup_id`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `tbl_catalog`
--
ALTER TABLE `tbl_catalog`
  MODIFY `id_catalog_k` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `tbl_client`
--
ALTER TABLE `tbl_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id_product` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD CONSTRAINT `FK_order` FOREIGN KEY (`id_order`) REFERENCES `tbl_order` (`id`),
  ADD CONSTRAINT `FK_product` FOREIGN KEY (`id_pro`) REFERENCES `tbl_product` (`id_product`);

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `FK_client_check` FOREIGN KEY (`id_user`) REFERENCES `tbl_client` (`ID`),
  ADD CONSTRAINT `FK_employee` FOREIGN KEY (`employee_pr`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `fk_employee_entry` FOREIGN KEY (`employee_entry`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_product_catalog` FOREIGN KEY (`catalog_id`) REFERENCES `tbl_catalog` (`id_catalog_k`),
  ADD CONSTRAINT `fk_supplier` FOREIGN KEY (`sup_id`) REFERENCES `tbl_supplier` (`sup_id`);
COMMIT;
-- 



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
