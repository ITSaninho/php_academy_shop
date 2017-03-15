-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Бер 15 2017 р., 11:34
-- Версія сервера: 5.7.16
-- Версія PHP: 5.6.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблиці `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`, `keywords`, `description`) VALUES
(1, 0, 'Одежда для женщин', NULL, NULL),
(2, 0, 'Одежда для мужчин', NULL, NULL),
(3, 0, 'Всё для детей', NULL, NULL),
(4, 1, 'Платья', NULL, NULL),
(8, 1, 'Футболки', NULL, NULL),
(9, 2, 'Рубашки', NULL, NULL),
(10, 2, 'Футболки', NULL, NULL),
(11, 2, 'Костюмы и пиджаки', NULL, NULL),
(12, 2, 'Куртки и пальто', NULL, NULL),
(21, 3, 'Детские комбинезоны', NULL, NULL),
(22, 3, 'Футболки', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `comment`
--

INSERT INTO `comment` (`id`, `text`, `user_id`, `product_id`, `status`, `date`) VALUES
(1, 'dfgdf', 3, 1, 0, 1489448661),
(2, 'gdfgfd', 3, 1, 0, 1489469372),
(3, 'рлролролр', 3, 5, 0, 1489502413);

-- --------------------------------------------------------

--
-- Структура таблиці `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `filePath` varchar(400) NOT NULL,
  `itemId` int(11) DEFAULT NULL,
  `isMain` tinyint(1) DEFAULT NULL,
  `modelName` varchar(150) NOT NULL,
  `urlAlias` varchar(400) NOT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1488844264),
('m140622_111540_create_image_table', 1488844267),
('m140622_111545_add_name_to_image_table', 1488844267);

-- --------------------------------------------------------

--
-- Структура таблиці `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `qty` int(10) NOT NULL,
  `sum` float NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `order`
--

INSERT INTO `order` (`id`, `created_at`, `updated_at`, `qty`, `sum`, `status`, `name`, `email`, `phone`, `address`) VALUES
(2, '2017-03-06 23:53:01', '2017-03-06 23:53:01', 1, 70, '0', 'itsaninho', 'itsaninho@gmail.com', '5345345345', 'adresssssss rivvne'),
(3, '2017-03-06 23:55:53', '2017-03-06 23:55:53', 1, 70, '0', 'itsaninho', 'itsaninho@gmail.com', '5345345345', 'adresssssss rivvne'),
(4, '2017-03-06 23:57:55', '2017-03-06 23:57:55', 2, 126, '0', 'itsaninho', 'itsaninho@gmail.com', '5345345345', 'adresssssss rivvne'),
(5, '2017-03-07 00:41:20', '2017-03-07 00:41:20', 2, 126, '0', 'itsaninho', 'itsaninho@gmail.com', '5345345345', 'adresssssss rivvne'),
(6, '2017-03-14 16:36:48', '2017-03-14 16:36:48', 1, 234, '0', 'рлорол', 'апавп@ghf.mai.com', '5345', 'dsfdsfs');

-- --------------------------------------------------------

--
-- Структура таблиці `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `qty_item` int(11) NOT NULL,
  `sum_item` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `name`, `price`, `qty_item`, `sum_item`) VALUES
(1, 1, 4, 'Блуза Tom Tailor TT 20312490071 7610 M Зелёная', 70, 1, 70),
(2, 2, 4, 'Блуза Tom Tailor TT 20312490071 7610 M Зелёная', 70, 1, 70),
(3, 3, 4, 'Блуза Tom Tailor TT 20312490071 7610 M Зелёная', 70, 1, 70),
(4, 4, 4, 'Блуза Tom Tailor TT 20312490071 7610 M Зелёная', 70, 1, 70),
(5, 4, 2, 'Джинсы MR520 MR 227 20002 0115 29-34 р Синие', 56, 1, 56),
(6, 5, 4, 'Блуза Tom Tailor TT 20312490071 7610 M Зелёная', 70, 1, 70),
(7, 5, 2, 'Джинсы MR520 MR 227 20002 0115 29-34 р Синие', 56, 1, 56),
(8, 6, 3, ' Новая Осенняя Коллекция MIEGOFCE 2016 Женское Длинное Платье на Осень с Длинным Рукавом в Европейском Стиле Модная ', 234, 1, 234);

-- --------------------------------------------------------

--
-- Структура таблиці `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text,
  `price` float NOT NULL DEFAULT '0',
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT 'no-image.png',
  `hit` enum('0','1') NOT NULL DEFAULT '0',
  `new` enum('0','1') NOT NULL DEFAULT '0',
  `sale` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `content`, `price`, `keywords`, `description`, `img`, `hit`, `new`, `sale`) VALUES
(3, 4, ' Новая Осенняя Коллекция MIEGOFCE 2016 Женское Длинное Платье на Осень с Длинным Рукавом в Европейском Стиле Модная ', '<ul>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Производитель:</span><span style=\"font-family:inherit; font-size:inherit\">MIEGOFCE</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Пол:</span><span style=\"font-family:inherit; font-size:inherit\">Женщины</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина платья:</span><span style=\"font-family:inherit; font-size:inherit\">До колен</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Силуэт:</span><span style=\"font-family:inherit; font-size:inherit\">Трапециевидный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Стиль:</span><span style=\"font-family:inherit; font-size:inherit\">Повседневный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Линия талии:</span><span style=\"font-family:inherit; font-size:inherit\">Завышенная</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Материал:</span><span style=\"font-family:inherit; font-size:inherit\">Полиэстер,Спандекс</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Классические</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Полный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Размер модели:</span><span style=\"font-family:inherit; font-size:inherit\">16741</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Рисунок:</span><span style=\"font-family:inherit; font-size:inherit\">Полоска</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Сезон:</span><span style=\"font-family:inherit; font-size:inherit\">Осень</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Украшение:</span><span style=\"font-family:inherit; font-size:inherit\">Нет</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Вырез:</span><span style=\"font-family:inherit; font-size:inherit\">С О-образным вырезом</span></li>\r\n</ul>\r\n', 234, 'Плаття Класне плаття', 'Дуже чудове паття', 'no-image.png', '1', '1', '0'),
(4, 4, 'Sisjuly vintage dress черный белый цветочный принт dress цветок 2017 мода осень платья vestido де festa женщины черные платья', '<ul>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Производитель:</span><span style=\"font-family:inherit; font-size:inherit\">Sisjuly</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Пол:</span><span style=\"font-family:inherit; font-size:inherit\">Женщины</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина платья:</span><span style=\"font-family:inherit; font-size:inherit\">До колен</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Силуэт:</span><span style=\"font-family:inherit; font-size:inherit\">Трапециевидный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Размер модели:</span><span style=\"font-family:inherit; font-size:inherit\">12341073</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Стиль:</span><span style=\"font-family:inherit; font-size:inherit\">Винтажный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Классические</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Половина</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Сезон:</span><span style=\"font-family:inherit; font-size:inherit\">Осень</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Материал:</span><span style=\"font-family:inherit; font-size:inherit\">Хлопок</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Вырез:</span><span style=\"font-family:inherit; font-size:inherit\">С О-образным вырезом</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Рисунок:</span><span style=\"font-family:inherit; font-size:inherit\">Рисунок</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Линия талии:</span><span style=\"font-family:inherit; font-size:inherit\">Естественный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Украшение:</span><span style=\"font-family:inherit; font-size:inherit\">Молнии</span></li>\r\n</ul>\r\n', 343, 'Круте плаття', ' Дуже класне плаття', 'no-image.png', '1', '0', '1'),
(5, 1, 'Sisjuly Vintage dress 1950 s весна лето Конькобежец V Поворот Шеи Воротник линии wommen Партии Платья 2017 женщина Старинные Dress', '<ul>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Производитель:</span><span style=\"font-family:inherit; font-size:inherit\">Sisjuly</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Пол:</span><span style=\"font-family:inherit; font-size:inherit\">Женщины</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Размер модели:</span><span style=\"font-family:inherit; font-size:inherit\">11568851</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Сезон:</span><span style=\"font-family:inherit; font-size:inherit\">Весна</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Вырез:</span><span style=\"font-family:inherit; font-size:inherit\">С V-образным вырезом</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Три четверти</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Силуэт:</span><span style=\"font-family:inherit; font-size:inherit\">Трапециевидный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Стиль:</span><span style=\"font-family:inherit; font-size:inherit\">Милый</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Материал:</span><span style=\"font-family:inherit; font-size:inherit\">Полиэстер</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Классические</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Рисунок:</span><span style=\"font-family:inherit; font-size:inherit\">Сплошной</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина платья:</span><span style=\"font-family:inherit; font-size:inherit\">До середины икры</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Линия талии:</span><span style=\"font-family:inherit; font-size:inherit\">Естественный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Украшение:</span><span style=\"font-family:inherit; font-size:inherit\">Завязки</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Material:</span><span style=\"font-family:inherit; font-size:inherit\">Knitting Cotton,Wool</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Silhouette:</span><span style=\"font-family:inherit; font-size:inherit\">Ball Gown</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Dress Length:</span><span style=\"font-family:inherit; font-size:inherit\">Mid-Calf</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Sleeve Length:</span><span style=\"font-family:inherit; font-size:inherit\">Three-Quarter Sleeve</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Closure:</span><span style=\"font-family:inherit; font-size:inherit\">Cardigan</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Pattern:</span><span style=\"font-family:inherit; font-size:inherit\">Plain</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Season:</span><span style=\"font-family:inherit; font-size:inherit\">Fall</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Color:</span><span style=\"font-family:inherit; font-size:inherit\">Green,Purple,Red,Royal Blue</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Style:</span><span style=\"font-family:inherit; font-size:inherit\">Sweet</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Fabric Type:</span><span style=\"font-family:inherit; font-size:inherit\">Knitting</span></li>\r\n</ul>\r\n', 243, 'Плаття', 'Супер плаття', 'no-image.png', '1', '1', '0'),
(6, 4, 'Sisjuly женщины повседневная 2017 весна dress бургундии офис с длинными рукавами линии красные платья женщины осень роскошные пояса casual dress', '<ul>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Производитель:</span><span style=\"font-family:inherit; font-size:inherit\">Sisjuly</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Пол:</span><span style=\"font-family:inherit; font-size:inherit\">Женщины</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина платья:</span><span style=\"font-family:inherit; font-size:inherit\">До колен</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Размер модели:</span><span style=\"font-family:inherit; font-size:inherit\">12214367</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Силуэт:</span><span style=\"font-family:inherit; font-size:inherit\">Трапециевидный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Стиль:</span><span style=\"font-family:inherit; font-size:inherit\">Повседневный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Рукав-фонарь</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Рисунок:</span><span style=\"font-family:inherit; font-size:inherit\">Сплошной</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Полный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Сезон:</span><span style=\"font-family:inherit; font-size:inherit\">Осень</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Материал:</span><span style=\"font-family:inherit; font-size:inherit\">Хлопок</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Вырез:</span><span style=\"font-family:inherit; font-size:inherit\">С О-образным вырезом</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Линия талии:</span><span style=\"font-family:inherit; font-size:inherit\">Естественный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Украшение:</span><span style=\"font-family:inherit; font-size:inherit\">Завязки</span></li>\r\n</ul>\r\n', 324, 'Зелене плаття', 'Плаття мега', 'no-image.png', '1', '0', '1'),
(7, 4, 'Sisjuly Vintage dress 1950 s весна лето Конькобежец V Поворот Шеи Воротник линии wommen Партии Платья 2017 женщина Старинные Dress', '<ul>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Производитель:</span><span style=\"font-family:inherit; font-size:inherit\">Sisjuly</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Пол:</span><span style=\"font-family:inherit; font-size:inherit\">Женщины</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Размер модели:</span><span style=\"font-family:inherit; font-size:inherit\">11568851</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Сезон:</span><span style=\"font-family:inherit; font-size:inherit\">Весна</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Вырез:</span><span style=\"font-family:inherit; font-size:inherit\">С V-образным вырезом</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Три четверти</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Силуэт:</span><span style=\"font-family:inherit; font-size:inherit\">Трапециевидный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Стиль:</span><span style=\"font-family:inherit; font-size:inherit\">Милый</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Материал:</span><span style=\"font-family:inherit; font-size:inherit\">Полиэстер</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Классические</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Рисунок:</span><span style=\"font-family:inherit; font-size:inherit\">Сплошной</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина платья:</span><span style=\"font-family:inherit; font-size:inherit\">До середины икры</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Линия талии:</span><span style=\"font-family:inherit; font-size:inherit\">Естественный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Украшение:</span><span style=\"font-family:inherit; font-size:inherit\">Завязки</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Material:</span><span style=\"font-family:inherit; font-size:inherit\">Knitting Cotton,Wool</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Silhouette:</span><span style=\"font-family:inherit; font-size:inherit\">Ball Gown</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Dress Length:</span><span style=\"font-family:inherit; font-size:inherit\">Mid-Calf</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Sleeve Length:</span><span style=\"font-family:inherit; font-size:inherit\">Three-Quarter Sleeve</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Closure:</span><span style=\"font-family:inherit; font-size:inherit\">Cardigan</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Pattern:</span><span style=\"font-family:inherit; font-size:inherit\">Plain</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Season:</span><span style=\"font-family:inherit; font-size:inherit\">Fall</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Color:</span><span style=\"font-family:inherit; font-size:inherit\">Green,Purple,Red,Royal Blue</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Style:</span><span style=\"font-family:inherit; font-size:inherit\">Sweet</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Fabric Type:</span><span style=\"font-family:inherit; font-size:inherit\">Knitting</span></li>\r\n</ul>\r\n', 564, 'Плаття шикарне', 'Гикарне плаття', 'no-image.png', '0', '1', '0'),
(8, 4, 'Simplee Осень зима замши овечьей шерсти пальто женщин 2016 Элегантный теплый молния кашемировые пальто Turn down воротник широкий талией пальто', '<ul>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Производитель:</span><span style=\"font-family:inherit; font-size:inherit\">SIMPLEE</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Материал:</span><span style=\"font-family:inherit; font-size:inherit\">Полиэстер</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Полный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина одежды:</span><span style=\"font-family:inherit; font-size:inherit\">Длинная</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Рисунок:</span><span style=\"font-family:inherit; font-size:inherit\">Сплошной</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Украшение:</span><span style=\"font-family:inherit; font-size:inherit\">Карманы,Молнии</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Воротник:</span><span style=\"font-family:inherit; font-size:inherit\">Отложной воротник</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип застёжки:</span><span style=\"font-family:inherit; font-size:inherit\">Молния</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип:</span><span style=\"font-family:inherit; font-size:inherit\">Широкая талия</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Классические</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Состав Материала:</span><span style=\"font-family:inherit; font-size:inherit\">Polyester</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Размер модели:</span><span style=\"font-family:inherit; font-size:inherit\">OW240</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Пол:</span><span style=\"font-family:inherit; font-size:inherit\">Женщины</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип Уличной Одежды:</span><span style=\"font-family:inherit; font-size:inherit\">Шерсть и смеси</span></li>\r\n</ul>\r\n', 2423, 'Дороге паття', 'Платттяяяяяяяяяяяяяяяя', 'no-image.png', '1', '0', '0'),
(9, 4, 'Simplee Осень зима замши овечьей шерсти пальто женщин 2016 Элегантный теплый молния кашемировые пальто Turn down воротник широкий талией пальто', '<ul>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Производитель:</span><span style=\"font-family:inherit; font-size:inherit\">SIMPLEE</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Материал:</span><span style=\"font-family:inherit; font-size:inherit\">Полиэстер</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Полный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина одежды:</span><span style=\"font-family:inherit; font-size:inherit\">Длинная</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Рисунок:</span><span style=\"font-family:inherit; font-size:inherit\">Сплошной</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Украшение:</span><span style=\"font-family:inherit; font-size:inherit\">Карманы,Молнии</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Воротник:</span><span style=\"font-family:inherit; font-size:inherit\">Отложной воротник</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип застёжки:</span><span style=\"font-family:inherit; font-size:inherit\">Молния</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип:</span><span style=\"font-family:inherit; font-size:inherit\">Широкая талия</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Классические</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Состав Материала:</span><span style=\"font-family:inherit; font-size:inherit\">Polyester</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Размер модели:</span><span style=\"font-family:inherit; font-size:inherit\">OW240</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Пол:</span><span style=\"font-family:inherit; font-size:inherit\">Женщины</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип Уличной Одежды:</span><span style=\"font-family:inherit; font-size:inherit\">Шерсть и смеси</span></li>\r\n</ul>\r\n', 2423, 'Дороге паття', 'Платттяяяяяяяяяяяяяяяя', 'no-image.png', '1', '0', '0'),
(10, 4, 'Bella Philosophy 2016 зима длинный участок искусственной Замши ягненка меха Барашек пальто куртки женщин Хаки голубой ночной халат пижамы стиль', '<ul>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Производитель:</span><span style=\"font-family:inherit; font-size:inherit\">Bella Philosophy</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Пол:</span><span style=\"font-family:inherit; font-size:inherit\">Женщины</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип Уличной Одежды:</span><span style=\"font-family:inherit; font-size:inherit\">Шерсть и смеси</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Состав Материала:</span><span style=\"font-family:inherit; font-size:inherit\">100%Polyester</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Рисунок:</span><span style=\"font-family:inherit; font-size:inherit\">Сплошной</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип:</span><span style=\"font-family:inherit; font-size:inherit\">Широкая талия</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина одежды:</span><span style=\"font-family:inherit; font-size:inherit\">Длинная</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Полный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Украшение:</span><span style=\"font-family:inherit; font-size:inherit\">Карманы</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Воротник:</span><span style=\"font-family:inherit; font-size:inherit\">Отложной воротник</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип застёжки:</span><span style=\"font-family:inherit; font-size:inherit\">Двубортная</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Размер модели:</span><span style=\"font-family:inherit; font-size:inherit\">BP</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Классические</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Материал:</span><span style=\"font-family:inherit; font-size:inherit\">Полиэстер</span></li>\r\n</ul>\r\n', 3431, 'Плаття', 'Вечірнє плаття', 'no-image.png', '1', '1', '1'),
(11, 4, '2017 весна Синий И Белый Фарфор цветочные жаккардовые длинный жакет пальто женщин', '<ul>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Производитель:</span><span style=\"font-family:inherit; font-size:inherit\">Bella Philosophy</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип изделия:</span><span style=\"font-family:inherit; font-size:inherit\">Верхняя одежда и пальто</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип Уличной Одежды:</span><span style=\"font-family:inherit; font-size:inherit\">Куртки</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Пол:</span><span style=\"font-family:inherit; font-size:inherit\">Женщины</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Стиль:</span><span style=\"font-family:inherit; font-size:inherit\">Модный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип:</span><span style=\"font-family:inherit; font-size:inherit\">Широкая талия</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Воротник:</span><span style=\"font-family:inherit; font-size:inherit\">С О-образным вырезом</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Полный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип застёжки:</span><span style=\"font-family:inherit; font-size:inherit\">Однобортная</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Украшение:</span><span style=\"font-family:inherit; font-size:inherit\">Нет</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Рисунок:</span><span style=\"font-family:inherit; font-size:inherit\">Рисунок</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Капюшон:</span><span style=\"font-family:inherit; font-size:inherit\">Нет</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина одежды:</span><span style=\"font-family:inherit; font-size:inherit\">Стандартный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Размер модели:</span><span style=\"font-family:inherit; font-size:inherit\">JAC101</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Классические</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Материал:</span><span style=\"font-family:inherit; font-size:inherit\">Полиэстер</span></li>\r\n</ul>\r\n', 4223, 'Платтті', 'Кррасиве плаття', 'no-image.png', '1', '1', '1'),
(12, 1, '2017 весна осень новых женских карман кисти бахромой розовый черный хаки голубой faux suede dress длинным рукавом реальные фото', '<ul>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Производитель:</span><span style=\"font-family:inherit; font-size:inherit\">Bella Philosophy</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Пол:</span><span style=\"font-family:inherit; font-size:inherit\">Женщины</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина платья:</span><span style=\"font-family:inherit; font-size:inherit\">До колен</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Силуэт:</span><span style=\"font-family:inherit; font-size:inherit\">Прямые</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Размер модели:</span><span style=\"font-family:inherit; font-size:inherit\">autumn winter new suede dress</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Стиль:</span><span style=\"font-family:inherit; font-size:inherit\">Повседневный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Украшение:</span><span style=\"font-family:inherit; font-size:inherit\">Кисточка</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Классические</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Рисунок:</span><span style=\"font-family:inherit; font-size:inherit\">Сплошной</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Полный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Сезон:</span><span style=\"font-family:inherit; font-size:inherit\">Осень</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Вырез:</span><span style=\"font-family:inherit; font-size:inherit\">С О-образным вырезом</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Линия талии:</span><span style=\"font-family:inherit; font-size:inherit\">Естественный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Материал:</span><span style=\"font-family:inherit; font-size:inherit\">Синтетическая кожа</span></li>\r\n</ul>\r\n', 234, 'Плаття Класне плаття', 'Дуже чудове паття', 'no-image.png', '1', '1', '1'),
(13, 4, 'ZAFUL Sexy Моды Осень Женщин Рубашка Dress Зеленый Пояс V Шеи Длинным Рукавом Винтаж Короткие Мини Женщины Платья Женские Vestidos', '<ul>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Производитель:</span><span style=\"font-family:inherit; font-size:inherit\">ZAFUL</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Пол:</span><span style=\"font-family:inherit; font-size:inherit\">Женщины</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Силуэт:</span><span style=\"font-family:inherit; font-size:inherit\">Прямые</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Вырез:</span><span style=\"font-family:inherit; font-size:inherit\">С V-образным вырезом</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Стиль:</span><span style=\"font-family:inherit; font-size:inherit\">Повседневный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Материал:</span><span style=\"font-family:inherit; font-size:inherit\">Полиэстер</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Тип рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Классические</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Рисунок:</span><span style=\"font-family:inherit; font-size:inherit\">Сплошной</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина платья:</span><span style=\"font-family:inherit; font-size:inherit\">Выше колена, мини</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Длина рукава:</span><span style=\"font-family:inherit; font-size:inherit\">Полный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Сезон:</span><span style=\"font-family:inherit; font-size:inherit\">Осень</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Размер модели:</span><span style=\"font-family:inherit; font-size:inherit\">SHIRT DRESS</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Линия талии:</span><span style=\"font-family:inherit; font-size:inherit\">Естественный</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Украшение:</span><span style=\"font-family:inherit; font-size:inherit\">Завязки</span></li>\r\n	<li><span style=\"color:rgb(153, 153, 153); font-family:inherit; font-size:inherit\">Fabric Type:</span><span style=\"font-family:inherit; font-size:inherit\">Broadcloth</span></li>\r\n</ul>\r\n', 3523, 'Дороге паття', 'Супер класне плаття', 'no-image.png', '1', '1', '0');

-- --------------------------------------------------------

--
-- Структура таблиці `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `second_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `rols` int(2) NOT NULL DEFAULT '1',
  `status` smallint(6) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `secret_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `first_name`, `second_name`, `middle_name`, `address`, `rols`, `status`, `auth_key`, `created_at`, `updated_at`, `secret_key`) VALUES
(1, 'sani', 'sani@gmail.com', '$2y$13$xK.arOG8znJaEiiHh8cHwO1NQ7jqtKrGE4WUQOECvCWwzaXFEhkyq', 'Sani', 'Fgffd', 'Mykodasdasd', 'Rivne fdsfsd', 1, 10, 'MPu3rEfQl-t0GDVUv9MCHNH_wHujH3FY', 1488583577, 1488583679, 'XV_YoH_z30AXjQIZeoyH58wAc2NRecX6_1488583679'),
(2, 'Sasha1', 'Sasha1@gmail.com', '$2y$13$bysBscIxzfjhWQnl7mFLxuiEaMymVZfSFKl3HBgSoRq1p25Ek/Ll2', 'Oleksandr', 'GDgdfgds', 'DGgdsg', 'Rivne fdsfsdапвап', 1, 10, 'NgomaLFq7T9n8X-oEAH2mT4B1ow0EG_y', 1488828186, 1488828186, NULL),
(3, 'Saniki', 'Saniki@gmail.com', '$2y$13$eVWQRNMkY6ZCwGaClG2.vec.AmGBnvgcwZTJYTrMEMrTACqXwUl22', 'Aggggggaенекнке', 'DFsdf', 'Dgfdgdfgjsds', 'Rivne fdsfsdпавііііііііііііі', 2, 10, 'YR5ANDO5NsaPNpBtbiYYQAp2BxpJYESH', 1488830484, 1489493406, '0WyH-2a_rct10WnlW4vESqTw1RGUQKDK_1489493406'),
(4, 'itsaninho', 'itsaninho@gmail.com.com', '$2y$13$kZ/lo8lfFQXZDG5R/tQW3OpV54EVaSJYoWROPYBCcgNA5yuCNeOo6', 'Sasha', 'Fedorchuk', 'Mykolaiovich', 'Rivne asdasd', 3, 10, 'YKJq4MAq4O_3tYGxD-7E9CkwCs498OJO', 1488836931, 1488836931, NULL),
(5, 'itsanikooo', 'fghfgh@gmail.com', '$2y$13$WX7Qsxg03SbsdcOEp2K.ouC9jtDpqJrAxHGgzrrWOAJQhvlNQAIhG', 'hfghjjjjjjjj', 'yrty', 'yrtyr', 'hhjgjg', 1, 10, '8YdypP7T9KM_lA16QEo-reZDiJNzUHZS', 1488854525, 1488867564, NULL),
(6, 'admin123', 'admin123@gmail.com', '$2y$13$uDIpNtM0pIrZAjTPVl8F7.xjctSJ7na21A670rtgAPmEWlzEBWIci', 'admin123', 'admin123', 'admin123', 'admin123', 1, 10, 'LThRMioyjbrCV3ERHpzqnMaVM2qebg4D', 1489495163, 1489495163, NULL);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-post-user_id` (`user_id`),
  ADD KEY `idx-article_id` (`product_id`);

--
-- Індекси таблиці `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Індекси таблиці `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT для таблиці `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблиці `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблиці `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблиці `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблиці `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT для таблиці `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
