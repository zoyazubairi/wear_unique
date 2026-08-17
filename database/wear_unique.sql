-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2026 at 07:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wear_unique`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`) VALUES
(1, 'Women', 'images/cat-women.jpg'),
(2, 'Men', 'images/cat-men.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `full_name`, `email`, `message`) VALUES
(1, 'Fiza', 'samarvin3@gmail.com', 'whta is this');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `full_name`, `email`, `password`) VALUES
(1, 'Fiza aaa', 'shiam@echologyx.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `total_price` decimal(10,2) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `payment` varchar(50) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `bestseller` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `description`, `category_id`, `bestseller`) VALUES
(1, 'Striped T-Shirt', 5148.00, 'Streifenpower für deinen Alltag ❤️🩷 Das stripy T-Shirt in pink/rot ist nicht nur ein Eye-Catcher, sondern auch das perfekte Basic: In Sekunden angezogen und dank der Bio-Baumwolle super angenehm auf der Haut. We like! Relaxed Fit (ideal ...', 1, 1),
(2, 'Tight T-Shirt', 5988.00, 'Everybody needs their tighty 🩷 Unglaublich weich, maximal elastisch und die perfekte Stoffdicke - das eng anliegende T-Shirt in Pink mit hohem Supima Bio-Baumwollanteil ist die perfekte Baselayer. Volle Bestie-Energy für dein Outfit 🤝 Ti...', 1, 0),
(3, 'Striped Longsleeve', 5388.00, 'Streifenpower für deinen Alltag 🩷 Das stripy Langarmshirt ist das perfekte Basic für jeden Tag: In Sekunden angezogen und dank der Bio-Baumwolle super angenehm auf der Haut. Trendy und zeitlos zugleich! Relaxed Fit (ideal zum Reinstecken...', 1, 0),
(4, 'Organic T-Shirt', 5148.00, 'Das perfekte weiße T-Shirt in Off-White. Das T-Shirt hat einen lässigen und entspannten Schnitt und ist superweich. Das atmungsaktive Material ist nicht zu dick und nicht zu dünn und fühlt sich super auf der Haut an. Egal ob mit Blazer, ...', 1, 1),
(5, 'Tight Longsleeve', 6588.00, 'Everybody needs their tighty 🩷 Unglaublich weich, maximal elastisch und die perfekte Stoffdicke - das eng anliegende Langarmshirt in Pink mit hohem Supima Bio-Baumwollanteil ist die perfekte Baselayer. Volle Bestie-Energy für dein Outfit...', 1, 0),
(6, 'Organic Hoodie', 10680.00, 'Ob für deinen nächsten Netflix-Marathon oder als perfekter Travel-Buddy - dieser Hoodie in Pink macht auf jeden Fall alles mit 💪🏼 Super cozy, lässig geschnitten und immer ready, egal was dein Tag bringt. Einmal angezogen, willst du ihn n...', 1, 0),
(7, 'Striped Blouse', 11640.00, 'Dein Power Piece für deinen Alltag 💛 Ob mit Bikini am Strand oder mit Wollpullover, die gestreifte Hemdbluse ist ein richtiger Allrounder fürs ganze Jahr. Der Stick im Kragen erinnert dich zudem an deine Superpower - denn die ist immer m...', 1, 0),
(8, 'Crop Top', 4428.00, 'Ultra hochwertig &amp; ein absolutes Sommer Must-Have: Unser 24/7 Crop Top. Dieses Basic Top hat so einige Features, die du lieben wirst 😍 Top! Aus festem Material aus Bio-Baumwolle Garantiert blickdicht (auch ohne BH) Enganliegender &am...', 1, 0),
(9, 'Organic Longsleeve', 5388.00, 'Lila und cool 💜 Das Langarmshirt ist das perfekte Basic für jeden Tag: In Sekunden angezogen und dank der Bio-Baumwolle super angenehm auf der Haut. Relaxed Fit (ideal zum Reinstecken oder über der Hose) Hochwertige Verarbeitung Made in ...', 1, 0),
(10, 'Kindness Sweater', 9480.00, 'Den besten Sweater, den du jemals hattest 💛 Dieser Sweater aus 100% Bio-Baumwolle ist nicht nur ultra bequem, sondern auch richtig hochwertig. Und ganz cool: Der kleine Reminder am Arm. Because it\'s cool to be kind. 100% Bio-Baumwolle Lä...', 1, 0),
(11, 'Classic Polo', 19200.00, 'Crafted in Brescia, Northern Italy, with premium ', 2, 0),
(12, 'Linen Jersey T-Shirt', 19800.00, 'Our summer T-shirt is crafted in Brescia, Northern Italy, from one of the world’s finest linen jerseys for everyday comfort, essential for the hottest months. This lightweight T-shirt features an exceptional Aloe treatment for unmatched ...', 2, 0),
(13, 'Brera Polo Shirt', 29400.00, 'Our classic Brera polo shirt is crafted in Brescia with resistant, soft and breathable Italian cotton piqué and finished with mother of pearl buttons.  Designed with sartorial details from our classic shirts such as our signature “Paramo...', 2, 0),
(14, 'Silk Cotton Polo', 33000.00, 'Crafted in Brescia by our skilled artisans using an exquisite blend of 60% silk and 40% cotton, sourced from the Piedmont region, this versatile short-sleeved polo defines sophistication and comfort. The smooth and soft gauge 28 fabric o...', 2, 0),
(15, 'Elba Polo', 27000.00, 'Crafted in Brescia, in Northern Italy, from one of the finest linen jerseys in the world, the Elba polo is incredibly ultra-light and breathable, providing a refreshing feel.   This pure Italian linen textile is treated with superior Alo...', 2, 1),
(16, 'Cashmere Cotton T-Shirt', 19800.00, 'Our most sophisticated T-Shirt is meticulously crafted from an exclusive cashmere-cotton blend sourced from a prestigious mill in Lombardia, Italy. The combination of 85% extra-long cotton and 15% cashmere embodies the finest qualities o...', 2, 0),
(17, 'Silk Cotton T-Shirt', 22200.00, 'This lustrous piece is crafted in Brescia, Northern Italy, from an opulent blend of 60% silk and 40% cotton sourced from Piedmont. This exceptionally soft and smooth gauge 28 fabric is both breathable and highly absorbent, making it the ...', 2, 0),
(18, 'Long-Sleeved T-Shirt', 27600.00, 'This versatile long sleeved T-shirt is crafted from luxurious silk-cotton for an elevated take on the classic and will form the foundation of your permanent wardrobe. Designed with a modern crew neck profile and a curved hem for a more e...', 2, 1),
(19, 'Positano Polo Shirt', 33000.00, 'The Positano polo shirt is crafted from lightweight linen jersey in Brescia, Northern Italy.', 2, 0),
(20, 'Polo Sweater', 51000.00, 'Knitted in Bergamo, Northern Italy, from the finest two-ply cashmere, our most luxurious polo offers the perfect balance of elegance and versatility. Weighing approximately 300 grams, this polo provides high-quality insulation, making it...', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `color` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `stock` int(11) DEFAULT 10,
  `size` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `product_id`, `color`, `image`, `stock`, `size`) VALUES
(318, 11, 'White', 'images/men/p1-white.jpg', 10, 'S'),
(319, 11, 'Navy Blue', 'images/men/p1-navy-blue.jpg', 10, 'S'),
(320, 11, 'Oatmeal', 'images/men/p1-oatmeal.jpg', 10, 'S'),
(321, 11, 'Charcoal Grey', 'images/men/p1-charcoal-grey.jpg', 10, 'S'),
(322, 12, 'Electric Blue', 'images/men/p2-electric-blue.jpg', 10, 'S'),
(323, 12, 'Chocolate Brown', 'images/men/p2-chocolate-brown.jpg', 10, 'S'),
(324, 12, 'Navy Blue', 'images/men/p2-navy-blue.jpg', 10, 'S'),
(325, 12, 'Red', 'images/men/p2-red.jpg', 10, 'S'),
(326, 13, 'Chocolate Brown', 'images/men/p3-chocolate-brown.jpg', 10, 'S'),
(327, 13, 'Oatmeal', 'images/men/p3-oatmeal.jpg', 10, 'S'),
(328, 13, 'Light Blue', 'images/men/p3-light-blue.jpg', 10, 'S'),
(329, 13, 'Navy Blue', 'images/men/p3-navy-blue.jpg', 10, 'S'),
(330, 14, 'Marine Green', 'images/men/p4-marine-green.jpg', 10, 'S'),
(331, 14, 'Black', 'images/men/p4-black.jpg', 10, 'S'),
(332, 14, 'Nocciola Brown', 'images/men/p4-nocciola-brown.jpg', 10, 'S'),
(333, 14, 'Ocean Blue', 'images/men/p4-ocean-blue.jpg', 10, 'S'),
(334, 15, 'Cream', 'images/men/p5-cream.jpg', 10, 'S'),
(335, 15, 'Khaki Green', 'images/men/p5-khaki-green.jpg', 10, 'S'),
(336, 15, 'Chocolate Brown', 'images/men/p5-chocolate-brown.jpg', 10, 'S'),
(337, 15, 'Rust', 'images/men/p5-rust.jpg', 10, 'S'),
(338, 16, 'Midnight Blue', 'images/men/p6-midnight-blue.jpg', 10, 'S'),
(339, 16, 'Atlantic Blue', 'images/men/p6-atlantic-blue.jpg', 10, 'S'),
(340, 16, 'Light Blue', 'images/men/p6-light-blue.jpg', 10, 'S'),
(341, 16, 'Charcoal Grey', 'images/men/p6-charcoal-grey.jpg', 10, 'S'),
(342, 17, 'Marine Green', 'images/men/p7-marine-green.jpg', 10, 'S'),
(343, 17, 'Nocciola Brown', 'images/men/p7-nocciola-brown.jpg', 10, 'S'),
(344, 17, 'Midnight Blue', 'images/men/p7-midnight-blue.jpg', 10, 'S'),
(345, 17, 'White', 'images/men/p7-white.jpg', 10, 'S'),
(346, 18, 'Ocean Blue', 'images/men/p8-ocean-blue.jpg', 10, 'S'),
(347, 18, 'Black', 'images/men/p8-black.jpg', 10, 'S'),
(348, 18, 'Light Grey', 'images/men/p8-light-grey.jpg', 10, 'S'),
(349, 18, 'Midnight Blue', 'images/men/p8-midnight-blue.jpg', 10, 'S'),
(353, 20, 'Camel Beige', 'images/men/p10-camel-beige.jpg', 10, 'S'),
(354, 20, 'Midnight Blue', 'images/men/p10-midnight-blue.jpg', 10, 'S'),
(355, 20, 'Dolomiti Grey', 'images/men/p10-dolomiti-grey.jpg', 10, 'S'),
(356, 20, 'French Blue', 'images/men/p10-french-blue.jpg', 10, 'S'),
(357, 19, 'Khaki Green', 'images/men/p9-khaki-green.jpg', 10, 'S'),
(358, 19, 'Light Blue', 'images/men/p9-light-blue.jpg', 10, 'S'),
(359, 19, 'Cream', 'images/men/p9-cream.jpg', 10, 'S'),
(360, 19, 'Navy Blue', 'images/men/p9-navy-blue.jpg', 10, 'S'),
(361, 1, 'Pink/Red', 'images/women/p1-pink-red.jpg', 10, 'S'),
(362, 1, 'Yellow/Blue', 'images/women/p1-yellow-blue.jpg', 10, 'S'),
(363, 1, 'Pink/Green', 'images/women/p1-pink-green.jpg', 10, 'S'),
(364, 1, 'Aubergine/Pink', 'images/women/p1-aubergine-pink.jpg', 10, 'S'),
(365, 2, 'Pink', 'images/women/p2-pink.jpg', 10, 'S'),
(366, 2, 'Black', 'images/women/p2-black.jpg', 10, 'S'),
(367, 2, 'Royal Blue', 'images/women/p2-royal-blue.jpg', 10, 'S'),
(368, 2, 'Grey', 'images/women/p2-grey.jpg', 10, 'S'),
(369, 3, 'Pink/Red', 'images/women/p3-pink-red.jpg', 10, 'S'),
(370, 3, 'Pink/Green', 'images/women/p3-pink-green.jpg', 10, 'S'),
(371, 3, 'Purple/Red/White', 'images/women/p3-purple-red-white.jpg', 10, 'S'),
(372, 3, 'Yellow/Blue', 'images/women/p3-yellow-blue.jpg', 10, 'S'),
(373, 4, 'Off-White', 'images/women/p4-off-white.jpg', 10, 'S'),
(374, 4, 'Royal Blue', 'images/women/p4-royal-blue.jpg', 10, 'S'),
(375, 4, 'Black', 'images/women/p4-black.jpg', 10, 'S'),
(376, 4, 'Grey', 'images/women/p4-grey.jpg', 10, 'S'),
(377, 5, 'Pink', 'images/women/p5-pink.jpg', 10, 'S'),
(378, 5, 'Popeia Red', 'images/women/p5-popeia-red.jpg', 10, 'S'),
(379, 5, 'Dark Brown', 'images/women/p5-dark-brown.jpg', 10, 'S'),
(380, 5, 'Black', 'images/women/p5-black.jpg', 10, 'S'),
(381, 6, 'Pink', 'images/women/p6-pink.jpg', 10, 'S'),
(382, 6, 'Royal Blue', 'images/women/p6-royal-blue.jpg', 10, 'S'),
(383, 6, 'College Green', 'images/women/p6-college-green.jpg', 10, 'S'),
(384, 6, 'Popeia Red', 'images/women/p6-popeia-red.jpg', 10, 'S'),
(385, 7, 'Yellow/Blue', 'images/women/p7-yellow-blue.jpg', 10, 'S'),
(386, 7, 'Blue/White', 'images/women/p7-blue-white.jpg', 10, 'S'),
(387, 7, 'Pink/Red', 'images/women/p7-pink-red.jpg', 10, 'S'),
(388, 7, 'Green/White', 'images/women/p7-green-white.jpg', 10, 'S'),
(389, 8, 'White', 'images/women/p8-white.jpg', 10, 'S'),
(390, 8, 'Black', 'images/women/p8-black.jpg', 10, 'S'),
(391, 8, 'Royal Blue', 'images/women/p8-royal-blue.jpg', 10, 'S'),
(392, 8, 'Purple', 'images/women/p8-purple.jpg', 10, 'S'),
(393, 9, 'Purple', 'images/women/p9-purple.jpg', 10, 'S'),
(394, 9, 'Off-White', 'images/women/p9-off-white.jpg', 10, 'S'),
(395, 9, 'Black', 'images/women/p9-black.jpg', 10, 'S'),
(396, 9, 'Royal Blue', 'images/women/p9-royal-blue.jpg', 10, 'S'),
(397, 10, 'Butter Yellow', 'images/women/p10-butter-yellow.jpg', 10, 'S'),
(398, 10, 'Ice Blue', 'images/women/p10-ice-blue.jpg', 10, 'S'),
(399, 10, 'Purple', 'images/women/p10-purple.jpg', 10, 'S'),
(400, 10, 'Popeia Red', 'images/women/p10-popeia-red.jpg', 10, 'S'),
(401, 11, 'White', 'images/men/p1-white.jpg', 10, 'M'),
(402, 11, 'White', 'images/men/p1-white.jpg', 10, 'L'),
(403, 11, 'White', 'images/men/p1-white.jpg', 10, 'XL'),
(404, 11, 'Navy Blue', 'images/men/p1-navy-blue.jpg', 10, 'M'),
(405, 11, 'Navy Blue', 'images/men/p1-navy-blue.jpg', 10, 'L'),
(406, 11, 'Navy Blue', 'images/men/p1-navy-blue.jpg', 10, 'XL'),
(407, 11, 'Oatmeal', 'images/men/p1-oatmeal.jpg', 10, 'M'),
(408, 11, 'Oatmeal', 'images/men/p1-oatmeal.jpg', 10, 'L'),
(409, 11, 'Oatmeal', 'images/men/p1-oatmeal.jpg', 10, 'XL'),
(410, 11, 'Charcoal Grey', 'images/men/p1-charcoal-grey.jpg', 10, 'M'),
(411, 11, 'Charcoal Grey', 'images/men/p1-charcoal-grey.jpg', 10, 'L'),
(412, 11, 'Charcoal Grey', 'images/men/p1-charcoal-grey.jpg', 10, 'XL'),
(413, 12, 'Electric Blue', 'images/men/p2-electric-blue.jpg', 10, 'M'),
(414, 12, 'Electric Blue', 'images/men/p2-electric-blue.jpg', 10, 'L'),
(415, 12, 'Electric Blue', 'images/men/p2-electric-blue.jpg', 10, 'XL'),
(416, 12, 'Chocolate Brown', 'images/men/p2-chocolate-brown.jpg', 10, 'M'),
(417, 12, 'Chocolate Brown', 'images/men/p2-chocolate-brown.jpg', 10, 'L'),
(418, 12, 'Chocolate Brown', 'images/men/p2-chocolate-brown.jpg', 10, 'XL'),
(419, 12, 'Navy Blue', 'images/men/p2-navy-blue.jpg', 10, 'M'),
(420, 12, 'Navy Blue', 'images/men/p2-navy-blue.jpg', 10, 'L'),
(421, 12, 'Navy Blue', 'images/men/p2-navy-blue.jpg', 10, 'XL'),
(422, 12, 'Red', 'images/men/p2-red.jpg', 10, 'M'),
(423, 12, 'Red', 'images/men/p2-red.jpg', 10, 'L'),
(424, 12, 'Red', 'images/men/p2-red.jpg', 10, 'XL'),
(425, 13, 'Chocolate Brown', 'images/men/p3-chocolate-brown.jpg', 10, 'M'),
(426, 13, 'Chocolate Brown', 'images/men/p3-chocolate-brown.jpg', 10, 'L'),
(427, 13, 'Chocolate Brown', 'images/men/p3-chocolate-brown.jpg', 10, 'XL'),
(428, 13, 'Oatmeal', 'images/men/p3-oatmeal.jpg', 10, 'M'),
(429, 13, 'Oatmeal', 'images/men/p3-oatmeal.jpg', 10, 'L'),
(430, 13, 'Oatmeal', 'images/men/p3-oatmeal.jpg', 10, 'XL'),
(431, 13, 'Light Blue', 'images/men/p3-light-blue.jpg', 10, 'M'),
(432, 13, 'Light Blue', 'images/men/p3-light-blue.jpg', 10, 'L'),
(433, 13, 'Light Blue', 'images/men/p3-light-blue.jpg', 10, 'XL'),
(434, 13, 'Navy Blue', 'images/men/p3-navy-blue.jpg', 10, 'M'),
(435, 13, 'Navy Blue', 'images/men/p3-navy-blue.jpg', 10, 'L'),
(436, 13, 'Navy Blue', 'images/men/p3-navy-blue.jpg', 10, 'XL'),
(437, 14, 'Marine Green', 'images/men/p4-marine-green.jpg', 10, 'M'),
(438, 14, 'Marine Green', 'images/men/p4-marine-green.jpg', 10, 'L'),
(439, 14, 'Marine Green', 'images/men/p4-marine-green.jpg', 10, 'XL'),
(440, 14, 'Black', 'images/men/p4-black.jpg', 10, 'M'),
(441, 14, 'Black', 'images/men/p4-black.jpg', 10, 'L'),
(442, 14, 'Black', 'images/men/p4-black.jpg', 10, 'XL'),
(443, 14, 'Nocciola Brown', 'images/men/p4-nocciola-brown.jpg', 10, 'M'),
(444, 14, 'Nocciola Brown', 'images/men/p4-nocciola-brown.jpg', 10, 'L'),
(445, 14, 'Nocciola Brown', 'images/men/p4-nocciola-brown.jpg', 10, 'XL'),
(446, 14, 'Ocean Blue', 'images/men/p4-ocean-blue.jpg', 10, 'M'),
(447, 14, 'Ocean Blue', 'images/men/p4-ocean-blue.jpg', 10, 'L'),
(448, 14, 'Ocean Blue', 'images/men/p4-ocean-blue.jpg', 10, 'XL'),
(449, 15, 'Cream', 'images/men/p5-cream.jpg', 10, 'M'),
(450, 15, 'Cream', 'images/men/p5-cream.jpg', 10, 'L'),
(451, 15, 'Cream', 'images/men/p5-cream.jpg', 10, 'XL'),
(452, 15, 'Khaki Green', 'images/men/p5-khaki-green.jpg', 10, 'M'),
(453, 15, 'Khaki Green', 'images/men/p5-khaki-green.jpg', 10, 'L'),
(454, 15, 'Khaki Green', 'images/men/p5-khaki-green.jpg', 10, 'XL'),
(455, 15, 'Chocolate Brown', 'images/men/p5-chocolate-brown.jpg', 10, 'M'),
(456, 15, 'Chocolate Brown', 'images/men/p5-chocolate-brown.jpg', 10, 'L'),
(457, 15, 'Chocolate Brown', 'images/men/p5-chocolate-brown.jpg', 10, 'XL'),
(458, 15, 'Rust', 'images/men/p5-rust.jpg', 10, 'M'),
(459, 15, 'Rust', 'images/men/p5-rust.jpg', 10, 'L'),
(460, 15, 'Rust', 'images/men/p5-rust.jpg', 10, 'XL'),
(461, 16, 'Midnight Blue', 'images/men/p6-midnight-blue.jpg', 10, 'M'),
(462, 16, 'Midnight Blue', 'images/men/p6-midnight-blue.jpg', 10, 'L'),
(463, 16, 'Midnight Blue', 'images/men/p6-midnight-blue.jpg', 10, 'XL'),
(464, 16, 'Atlantic Blue', 'images/men/p6-atlantic-blue.jpg', 10, 'M'),
(465, 16, 'Atlantic Blue', 'images/men/p6-atlantic-blue.jpg', 10, 'L'),
(466, 16, 'Atlantic Blue', 'images/men/p6-atlantic-blue.jpg', 10, 'XL'),
(467, 16, 'Light Blue', 'images/men/p6-light-blue.jpg', 10, 'M'),
(468, 16, 'Light Blue', 'images/men/p6-light-blue.jpg', 10, 'L'),
(469, 16, 'Light Blue', 'images/men/p6-light-blue.jpg', 10, 'XL'),
(470, 16, 'Charcoal Grey', 'images/men/p6-charcoal-grey.jpg', 10, 'M'),
(471, 16, 'Charcoal Grey', 'images/men/p6-charcoal-grey.jpg', 10, 'L'),
(472, 16, 'Charcoal Grey', 'images/men/p6-charcoal-grey.jpg', 10, 'XL'),
(473, 17, 'Marine Green', 'images/men/p7-marine-green.jpg', 10, 'M'),
(474, 17, 'Marine Green', 'images/men/p7-marine-green.jpg', 10, 'L'),
(475, 17, 'Marine Green', 'images/men/p7-marine-green.jpg', 10, 'XL'),
(476, 17, 'Nocciola Brown', 'images/men/p7-nocciola-brown.jpg', 10, 'M'),
(477, 17, 'Nocciola Brown', 'images/men/p7-nocciola-brown.jpg', 10, 'L'),
(478, 17, 'Nocciola Brown', 'images/men/p7-nocciola-brown.jpg', 10, 'XL'),
(479, 17, 'Midnight Blue', 'images/men/p7-midnight-blue.jpg', 10, 'M'),
(480, 17, 'Midnight Blue', 'images/men/p7-midnight-blue.jpg', 10, 'L'),
(481, 17, 'Midnight Blue', 'images/men/p7-midnight-blue.jpg', 10, 'XL'),
(482, 17, 'White', 'images/men/p7-white.jpg', 10, 'M'),
(483, 17, 'White', 'images/men/p7-white.jpg', 10, 'L'),
(484, 17, 'White', 'images/men/p7-white.jpg', 10, 'XL'),
(485, 18, 'Ocean Blue', 'images/men/p8-ocean-blue.jpg', 10, 'M'),
(486, 18, 'Ocean Blue', 'images/men/p8-ocean-blue.jpg', 10, 'L'),
(487, 18, 'Ocean Blue', 'images/men/p8-ocean-blue.jpg', 10, 'XL'),
(488, 18, 'Black', 'images/men/p8-black.jpg', 10, 'M'),
(489, 18, 'Black', 'images/men/p8-black.jpg', 10, 'L'),
(490, 18, 'Black', 'images/men/p8-black.jpg', 10, 'XL'),
(491, 18, 'Light Grey', 'images/men/p8-light-grey.jpg', 10, 'M'),
(492, 18, 'Light Grey', 'images/men/p8-light-grey.jpg', 10, 'L'),
(493, 18, 'Light Grey', 'images/men/p8-light-grey.jpg', 10, 'XL'),
(494, 18, 'Midnight Blue', 'images/men/p8-midnight-blue.jpg', 10, 'M'),
(495, 18, 'Midnight Blue', 'images/men/p8-midnight-blue.jpg', 10, 'L'),
(496, 18, 'Midnight Blue', 'images/men/p8-midnight-blue.jpg', 10, 'XL'),
(497, 20, 'Camel Beige', 'images/men/p10-camel-beige.jpg', 10, 'M'),
(498, 20, 'Camel Beige', 'images/men/p10-camel-beige.jpg', 10, 'L'),
(499, 20, 'Camel Beige', 'images/men/p10-camel-beige.jpg', 10, 'XL'),
(500, 20, 'Midnight Blue', 'images/men/p10-midnight-blue.jpg', 10, 'M'),
(501, 20, 'Midnight Blue', 'images/men/p10-midnight-blue.jpg', 10, 'L'),
(502, 20, 'Midnight Blue', 'images/men/p10-midnight-blue.jpg', 10, 'XL'),
(503, 20, 'Dolomiti Grey', 'images/men/p10-dolomiti-grey.jpg', 10, 'M'),
(504, 20, 'Dolomiti Grey', 'images/men/p10-dolomiti-grey.jpg', 10, 'L'),
(505, 20, 'Dolomiti Grey', 'images/men/p10-dolomiti-grey.jpg', 10, 'XL'),
(506, 20, 'French Blue', 'images/men/p10-french-blue.jpg', 10, 'M'),
(507, 20, 'French Blue', 'images/men/p10-french-blue.jpg', 10, 'L'),
(508, 20, 'French Blue', 'images/men/p10-french-blue.jpg', 10, 'XL'),
(509, 19, 'Khaki Green', 'images/men/p9-khaki-green.jpg', 10, 'M'),
(510, 19, 'Khaki Green', 'images/men/p9-khaki-green.jpg', 10, 'L'),
(511, 19, 'Khaki Green', 'images/men/p9-khaki-green.jpg', 10, 'XL'),
(512, 19, 'Light Blue', 'images/men/p9-light-blue.jpg', 10, 'M'),
(513, 19, 'Light Blue', 'images/men/p9-light-blue.jpg', 10, 'L'),
(514, 19, 'Light Blue', 'images/men/p9-light-blue.jpg', 10, 'XL'),
(515, 19, 'Cream', 'images/men/p9-cream.jpg', 10, 'M'),
(516, 19, 'Cream', 'images/men/p9-cream.jpg', 10, 'L'),
(517, 19, 'Cream', 'images/men/p9-cream.jpg', 10, 'XL'),
(518, 19, 'Navy Blue', 'images/men/p9-navy-blue.jpg', 10, 'M'),
(519, 19, 'Navy Blue', 'images/men/p9-navy-blue.jpg', 10, 'L'),
(520, 19, 'Navy Blue', 'images/men/p9-navy-blue.jpg', 10, 'XL'),
(521, 1, 'Pink/Red', 'images/women/p1-pink-red.jpg', 10, 'M'),
(522, 1, 'Pink/Red', 'images/women/p1-pink-red.jpg', 10, 'L'),
(523, 1, 'Pink/Red', 'images/women/p1-pink-red.jpg', 10, 'XL'),
(524, 1, 'Yellow/Blue', 'images/women/p1-yellow-blue.jpg', 10, 'M'),
(525, 1, 'Yellow/Blue', 'images/women/p1-yellow-blue.jpg', 10, 'L'),
(526, 1, 'Yellow/Blue', 'images/women/p1-yellow-blue.jpg', 10, 'XL'),
(527, 1, 'Pink/Green', 'images/women/p1-pink-green.jpg', 10, 'M'),
(528, 1, 'Pink/Green', 'images/women/p1-pink-green.jpg', 10, 'L'),
(529, 1, 'Pink/Green', 'images/women/p1-pink-green.jpg', 10, 'XL'),
(530, 1, 'Aubergine/Pink', 'images/women/p1-aubergine-pink.jpg', 10, 'M'),
(531, 1, 'Aubergine/Pink', 'images/women/p1-aubergine-pink.jpg', 10, 'L'),
(532, 1, 'Aubergine/Pink', 'images/women/p1-aubergine-pink.jpg', 10, 'XL'),
(533, 2, 'Pink', 'images/women/p2-pink.jpg', 10, 'M'),
(534, 2, 'Pink', 'images/women/p2-pink.jpg', 10, 'L'),
(535, 2, 'Pink', 'images/women/p2-pink.jpg', 10, 'XL'),
(536, 2, 'Black', 'images/women/p2-black.jpg', 10, 'M'),
(537, 2, 'Black', 'images/women/p2-black.jpg', 10, 'L'),
(538, 2, 'Black', 'images/women/p2-black.jpg', 10, 'XL'),
(539, 2, 'Royal Blue', 'images/women/p2-royal-blue.jpg', 10, 'M'),
(540, 2, 'Royal Blue', 'images/women/p2-royal-blue.jpg', 10, 'L'),
(541, 2, 'Royal Blue', 'images/women/p2-royal-blue.jpg', 10, 'XL'),
(542, 2, 'Grey', 'images/women/p2-grey.jpg', 10, 'M'),
(543, 2, 'Grey', 'images/women/p2-grey.jpg', 10, 'L'),
(544, 2, 'Grey', 'images/women/p2-grey.jpg', 10, 'XL'),
(545, 3, 'Pink/Red', 'images/women/p3-pink-red.jpg', 10, 'M'),
(546, 3, 'Pink/Red', 'images/women/p3-pink-red.jpg', 10, 'L'),
(547, 3, 'Pink/Red', 'images/women/p3-pink-red.jpg', 10, 'XL'),
(548, 3, 'Pink/Green', 'images/women/p3-pink-green.jpg', 10, 'M'),
(549, 3, 'Pink/Green', 'images/women/p3-pink-green.jpg', 10, 'L'),
(550, 3, 'Pink/Green', 'images/women/p3-pink-green.jpg', 10, 'XL'),
(551, 3, 'Purple/Red/White', 'images/women/p3-purple-red-white.jpg', 10, 'M'),
(552, 3, 'Purple/Red/White', 'images/women/p3-purple-red-white.jpg', 10, 'L'),
(553, 3, 'Purple/Red/White', 'images/women/p3-purple-red-white.jpg', 10, 'XL'),
(554, 3, 'Yellow/Blue', 'images/women/p3-yellow-blue.jpg', 10, 'M'),
(555, 3, 'Yellow/Blue', 'images/women/p3-yellow-blue.jpg', 10, 'L'),
(556, 3, 'Yellow/Blue', 'images/women/p3-yellow-blue.jpg', 10, 'XL'),
(557, 4, 'Off-White', 'images/women/p4-off-white.jpg', 10, 'M'),
(558, 4, 'Off-White', 'images/women/p4-off-white.jpg', 10, 'L'),
(559, 4, 'Off-White', 'images/women/p4-off-white.jpg', 10, 'XL'),
(560, 4, 'Royal Blue', 'images/women/p4-royal-blue.jpg', 10, 'M'),
(561, 4, 'Royal Blue', 'images/women/p4-royal-blue.jpg', 10, 'L'),
(562, 4, 'Royal Blue', 'images/women/p4-royal-blue.jpg', 10, 'XL'),
(563, 4, 'Black', 'images/women/p4-black.jpg', 10, 'M'),
(564, 4, 'Black', 'images/women/p4-black.jpg', 10, 'L'),
(565, 4, 'Black', 'images/women/p4-black.jpg', 10, 'XL'),
(566, 4, 'Grey', 'images/women/p4-grey.jpg', 10, 'M'),
(567, 4, 'Grey', 'images/women/p4-grey.jpg', 10, 'L'),
(568, 4, 'Grey', 'images/women/p4-grey.jpg', 10, 'XL'),
(569, 5, 'Pink', 'images/women/p5-pink.jpg', 10, 'M'),
(570, 5, 'Pink', 'images/women/p5-pink.jpg', 10, 'L'),
(571, 5, 'Pink', 'images/women/p5-pink.jpg', 10, 'XL'),
(572, 5, 'Popeia Red', 'images/women/p5-popeia-red.jpg', 10, 'M'),
(573, 5, 'Popeia Red', 'images/women/p5-popeia-red.jpg', 10, 'L'),
(574, 5, 'Popeia Red', 'images/women/p5-popeia-red.jpg', 10, 'XL'),
(575, 5, 'Dark Brown', 'images/women/p5-dark-brown.jpg', 10, 'M'),
(576, 5, 'Dark Brown', 'images/women/p5-dark-brown.jpg', 10, 'L'),
(577, 5, 'Dark Brown', 'images/women/p5-dark-brown.jpg', 10, 'XL'),
(578, 5, 'Black', 'images/women/p5-black.jpg', 10, 'M'),
(579, 5, 'Black', 'images/women/p5-black.jpg', 10, 'L'),
(580, 5, 'Black', 'images/women/p5-black.jpg', 10, 'XL'),
(581, 6, 'Pink', 'images/women/p6-pink.jpg', 10, 'M'),
(582, 6, 'Pink', 'images/women/p6-pink.jpg', 10, 'L'),
(583, 6, 'Pink', 'images/women/p6-pink.jpg', 10, 'XL'),
(584, 6, 'Royal Blue', 'images/women/p6-royal-blue.jpg', 10, 'M'),
(585, 6, 'Royal Blue', 'images/women/p6-royal-blue.jpg', 10, 'L'),
(586, 6, 'Royal Blue', 'images/women/p6-royal-blue.jpg', 10, 'XL'),
(587, 6, 'College Green', 'images/women/p6-college-green.jpg', 10, 'M'),
(588, 6, 'College Green', 'images/women/p6-college-green.jpg', 10, 'L'),
(589, 6, 'College Green', 'images/women/p6-college-green.jpg', 10, 'XL'),
(590, 6, 'Popeia Red', 'images/women/p6-popeia-red.jpg', 10, 'M'),
(591, 6, 'Popeia Red', 'images/women/p6-popeia-red.jpg', 10, 'L'),
(592, 6, 'Popeia Red', 'images/women/p6-popeia-red.jpg', 10, 'XL'),
(593, 7, 'Yellow/Blue', 'images/women/p7-yellow-blue.jpg', 10, 'M'),
(594, 7, 'Yellow/Blue', 'images/women/p7-yellow-blue.jpg', 10, 'L'),
(595, 7, 'Yellow/Blue', 'images/women/p7-yellow-blue.jpg', 10, 'XL'),
(596, 7, 'Blue/White', 'images/women/p7-blue-white.jpg', 10, 'M'),
(597, 7, 'Blue/White', 'images/women/p7-blue-white.jpg', 10, 'L'),
(598, 7, 'Blue/White', 'images/women/p7-blue-white.jpg', 10, 'XL'),
(599, 7, 'Pink/Red', 'images/women/p7-pink-red.jpg', 10, 'M'),
(600, 7, 'Pink/Red', 'images/women/p7-pink-red.jpg', 10, 'L'),
(601, 7, 'Pink/Red', 'images/women/p7-pink-red.jpg', 10, 'XL'),
(602, 7, 'Green/White', 'images/women/p7-green-white.jpg', 10, 'M'),
(603, 7, 'Green/White', 'images/women/p7-green-white.jpg', 10, 'L'),
(604, 7, 'Green/White', 'images/women/p7-green-white.jpg', 10, 'XL'),
(605, 8, 'White', 'images/women/p8-white.jpg', 10, 'M'),
(606, 8, 'White', 'images/women/p8-white.jpg', 10, 'L'),
(607, 8, 'White', 'images/women/p8-white.jpg', 10, 'XL'),
(608, 8, 'Black', 'images/women/p8-black.jpg', 10, 'M'),
(609, 8, 'Black', 'images/women/p8-black.jpg', 10, 'L'),
(610, 8, 'Black', 'images/women/p8-black.jpg', 10, 'XL'),
(611, 8, 'Royal Blue', 'images/women/p8-royal-blue.jpg', 10, 'M'),
(612, 8, 'Royal Blue', 'images/women/p8-royal-blue.jpg', 10, 'L'),
(613, 8, 'Royal Blue', 'images/women/p8-royal-blue.jpg', 10, 'XL'),
(614, 8, 'Purple', 'images/women/p8-purple.jpg', 10, 'M'),
(615, 8, 'Purple', 'images/women/p8-purple.jpg', 10, 'L'),
(616, 8, 'Purple', 'images/women/p8-purple.jpg', 10, 'XL'),
(617, 9, 'Purple', 'images/women/p9-purple.jpg', 10, 'M'),
(618, 9, 'Purple', 'images/women/p9-purple.jpg', 10, 'L'),
(619, 9, 'Purple', 'images/women/p9-purple.jpg', 10, 'XL'),
(620, 9, 'Off-White', 'images/women/p9-off-white.jpg', 10, 'M'),
(621, 9, 'Off-White', 'images/women/p9-off-white.jpg', 10, 'L'),
(622, 9, 'Off-White', 'images/women/p9-off-white.jpg', 10, 'XL'),
(623, 9, 'Black', 'images/women/p9-black.jpg', 10, 'M'),
(624, 9, 'Black', 'images/women/p9-black.jpg', 10, 'L'),
(625, 9, 'Black', 'images/women/p9-black.jpg', 10, 'XL'),
(626, 9, 'Royal Blue', 'images/women/p9-royal-blue.jpg', 10, 'M'),
(627, 9, 'Royal Blue', 'images/women/p9-royal-blue.jpg', 10, 'L'),
(628, 9, 'Royal Blue', 'images/women/p9-royal-blue.jpg', 10, 'XL'),
(629, 10, 'Butter Yellow', 'images/women/p10-butter-yellow.jpg', 10, 'M'),
(630, 10, 'Butter Yellow', 'images/women/p10-butter-yellow.jpg', 10, 'L'),
(631, 10, 'Butter Yellow', 'images/women/p10-butter-yellow.jpg', 10, 'XL'),
(632, 10, 'Ice Blue', 'images/women/p10-ice-blue.jpg', 10, 'M'),
(633, 10, 'Ice Blue', 'images/women/p10-ice-blue.jpg', 10, 'L'),
(634, 10, 'Ice Blue', 'images/women/p10-ice-blue.jpg', 10, 'XL'),
(635, 10, 'Purple', 'images/women/p10-purple.jpg', 10, 'M'),
(636, 10, 'Purple', 'images/women/p10-purple.jpg', 10, 'L'),
(637, 10, 'Purple', 'images/women/p10-purple.jpg', 10, 'XL'),
(638, 10, 'Popeia Red', 'images/women/p10-popeia-red.jpg', 10, 'M'),
(639, 10, 'Popeia Red', 'images/women/p10-popeia-red.jpg', 10, 'L'),
(640, 10, 'Popeia Red', 'images/women/p10-popeia-red.jpg', 10, 'XL');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=641;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
