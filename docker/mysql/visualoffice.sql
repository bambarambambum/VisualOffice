-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Июл 01 2020 г., 11:49
-- Версия сервера: 8.0.20
-- Версия PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `visualoffice`
--

-- --------------------------------------------------------

--
-- Структура таблицы `RPs`
--

CREATE TABLE `RPs` (
  `Id` int NOT NULL,
  `Fio` text,
  `Email` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `RPs`
--

INSERT INTO `RPs` (`Id`, `Fio`, `Email`) VALUES
(1, 'Ответственнов Иван Антидедлайнович', 'IOtvetstvennov@example.com'),
(2, 'Хорошов Петр Всесделович', 'PHoroshov@example.com'),
(3, 'Среднечков Аркадий Самокакнибудевич', 'ASrednechkov@example.com'),
(4, 'Опоздаев Евгений Пробкадорогович', 'EOpozdaevv@example.com');

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `Id` int NOT NULL,
  `RpId` int NOT NULL,
  `Fio` text,
  `Email` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`Id`, `RpId`, `Fio`, `Email`) VALUES
(1, 1, 'Трудягаев Олег Всесделавич', 'OTrudyagaev@example.com'),
(2, 1, 'Жизнь Валентин Занерзулович', 'VZhiznv@example.com'),
(3, 3, 'Секретарева Ольга Ожидайтеналинииевна', 'OSecretareva@example.com'),
(4, 3, 'Карантинов Владислав Безперчатникович', 'VKarantinov@example.com'),
(5, 2, 'Незнайкина Елена Самотакполучилосьвна', 'ENeznaikina@example.com'),
(6, 2, 'Возможнов Александр Нужнопроверковнич', 'AVozmozhnov@example.com'),
(7, 4, 'Админов Илья Красноглазович', 'IAdminov@example.com'),
(8, 4, 'Эникеев Антон Перезагрузович', 'AEnikeev@example.com');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `RPs`
--
ALTER TABLE `RPs`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Users_RpId` (`RpId`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `RPs`
--
ALTER TABLE `RPs`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `FK_Users_RPs_RpId` FOREIGN KEY (`RpId`) REFERENCES `RPs` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
