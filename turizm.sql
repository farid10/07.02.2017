-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Фев 07 2017 г., 21:34
-- Версия сервера: 10.1.13-MariaDB
-- Версия PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `turizm`
--

-- --------------------------------------------------------

--
-- Структура таблицы `iwciler`
--

CREATE TABLE `iwciler` (
  `id` int(11) NOT NULL,
  `adi` varchar(50) DEFAULT NULL,
  `soyadi` varchar(50) DEFAULT NULL,
  `elaqe_nomresi` int(11) DEFAULT NULL,
  `vezifesi` varchar(50) DEFAULT NULL,
  `xidmetEtdiyiMusteriler` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `iwciler_musteriler`
--

CREATE TABLE `iwciler_musteriler` (
  `iwciler_id` int(11) NOT NULL,
  `musteri_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `musteriler`
--

CREATE TABLE `musteriler` (
  `id` int(11) NOT NULL,
  `adi` varchar(50) DEFAULT NULL,
  `soyadi` varchar(50) DEFAULT NULL,
  `elaqe_nomresi` int(11) DEFAULT NULL,
  `xidmetEdenIwci` varchar(50) DEFAULT NULL,
  `tur_paketi` varchar(50) DEFAULT NULL,
  `odeniwi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `turlar`
--

CREATE TABLE `turlar` (
  `id` int(11) NOT NULL,
  `adi` varchar(50) DEFAULT NULL,
  `sifariw_sayi` int(11) DEFAULT NULL,
  `sifariwEden_musteriler` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `iwciler`
--
ALTER TABLE `iwciler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `iwciler_musteriler`
--
ALTER TABLE `iwciler_musteriler`
  ADD KEY `iwciler_id` (`iwciler_id`),
  ADD KEY `iwciler_id_2` (`iwciler_id`,`musteri_id`),
  ADD KEY `musteri_id` (`musteri_id`);

--
-- Индексы таблицы `musteriler`
--
ALTER TABLE `musteriler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `tur_paketi` (`tur_paketi`);

--
-- Индексы таблицы `turlar`
--
ALTER TABLE `turlar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `adi` (`adi`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `iwciler`
--
ALTER TABLE `iwciler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `musteriler`
--
ALTER TABLE `musteriler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `turlar`
--
ALTER TABLE `turlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `iwciler_musteriler`
--
ALTER TABLE `iwciler_musteriler`
  ADD CONSTRAINT `iwciler_musteriler_ibfk_1` FOREIGN KEY (`iwciler_id`) REFERENCES `iwciler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `iwciler_musteriler_ibfk_2` FOREIGN KEY (`musteri_id`) REFERENCES `musteriler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `musteriler`
--
ALTER TABLE `musteriler`
  ADD CONSTRAINT `musteriler_ibfk_1` FOREIGN KEY (`tur_paketi`) REFERENCES `turlar` (`adi`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
