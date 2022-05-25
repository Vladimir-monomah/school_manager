-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 25 2022 г., 21:44
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `schoolnew`
--

-- --------------------------------------------------------

--
-- Структура таблицы `attendance`
--

CREATE TABLE `attendance` (
  `sid` int(10) NOT NULL,
  `date` date NOT NULL,
  `aid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `attendance`
--

INSERT INTO `attendance` (`sid`, `date`, `aid`) VALUES
(2, '2022-05-25', 3),
(1, '2022-05-30', 4),
(2, '2022-05-02', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `attendancereport`
--

CREATE TABLE `attendancereport` (
  `aid` int(20) NOT NULL,
  `sid` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `attendancereport`
--

INSERT INTO `attendancereport` (`aid`, `sid`, `status`) VALUES
(3, 'ST1000010001', 'Отсутствует'),
(3, 'ST1000010002', 'Присутствует'),
(4, 'ST1000010001', 'Присутствует'),
(4, 'ST1000010002', 'Присутствует');

-- --------------------------------------------------------

--
-- Структура таблицы `classroom`
--

CREATE TABLE `classroom` (
  `hno` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `capacity` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `classroom`
--

INSERT INTO `classroom` (`hno`, `title`, `location`, `capacity`) VALUES
('4-B', 'Nilwala', 'Block-D', 50);

-- --------------------------------------------------------

--
-- Структура таблицы `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `teacher` varchar(50) NOT NULL,
  `classroom` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `stime` time NOT NULL,
  `etime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `exam`
--

INSERT INTO `exam` (`id`, `subject`, `teacher`, `classroom`, `date`, `stime`, `etime`) VALUES
(1, 'SCM4251', 'TC1000020000', '4-B', '2022-05-26', '11:45:00', '12:45:00');

-- --------------------------------------------------------

--
-- Структура таблицы `examresult`
--

CREATE TABLE `examresult` (
  `exam` int(11) NOT NULL,
  `student` varchar(50) NOT NULL,
  `marks` int(10) NOT NULL,
  `grade` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `examresult`
--

INSERT INTO `examresult` (`exam`, `student`, `marks`, `grade`) VALUES
(1, 'ST1000010001', 55, '3'),
(1, 'ST1000010002', 77, '5');

-- --------------------------------------------------------

--
-- Структура таблицы `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `notice` varchar(1500) NOT NULL,
  `odience` varchar(100) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `notice`
--

INSERT INTO `notice` (`id`, `notice`, `odience`, `date`) VALUES
(2, 'Meeting', 'Parent', '2022-05-28 02:53:02'),
(3, 'aaasas', 'All', '2022-05-28 02:57:28');

-- --------------------------------------------------------

--
-- Структура таблицы `parent`
--

CREATE TABLE `parent` (
  `pid` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `job` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `nic` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `parent`
--

INSERT INTO `parent` (`pid`, `fname`, `lname`, `contact`, `job`, `address`, `gender`, `nic`, `email`) VALUES
(1, 'Тимохин', 'Валерий', '89217523698', 'Инженер', 'Москва, Родины 5', 'Male', '7855485552V', 'par@par.par');

-- --------------------------------------------------------

--
-- Структура таблицы `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `teacher` varchar(50) NOT NULL,
  `day` varchar(50) NOT NULL,
  `stime` time NOT NULL,
  `class` varchar(50) NOT NULL,
  `etime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `schedule`
--

INSERT INTO `schedule` (`id`, `subject`, `teacher`, `day`, `stime`, `class`, `etime`) VALUES
(1, 'SCM4251', 'TC1000020000', 'Среда', '04:15:00', '4-B', '04:15:00'),
(2, 'SCM4251', 'TC1000020000', 'Четверг', '05:30:00', '4-B', '07:45:00');

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `sid` varchar(25) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `bday` date NOT NULL,
  `address` varchar(250) NOT NULL,
  `parent` int(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `classroom` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`sid`, `fname`, `lname`, `bday`, `address`, `parent`, `gender`, `classroom`, `email`) VALUES
('ST1000010001', 'Иванов', 'Иван', '2001-06-26', 'Москва, Гвардейская 56-7', 1, 'Male', '4-B', 'stu@stu.stu'),
('ST1000010002', 'Герасимов', 'Антон', '2002-06-11', 'Ухана', 1, 'Male', '4-B', 'stu1@stu1.stu1'),
('STU1000040000', 'Радмиров', 'Ильгиз', '2020-05-27', 'asasas', 0, 'Male', '4-B', 'dil@dil.dil'),
('STU100004005', 'Хащини', 'Асири', '2009-06-23', 'asassas', 1, 'Female', 'Выберите класс', 'h@h.h');

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

CREATE TABLE `subject` (
  `sid` varchar(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `subject`
--

INSERT INTO `subject` (`sid`, `title`, `description`) VALUES
('SCM4251', 'Наука и технология', 'Основы химии\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

CREATE TABLE `teacher` (
  `tid` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `bday` date NOT NULL,
  `skill` varchar(500) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `teacher`
--

INSERT INTO `teacher` (`tid`, `fname`, `lname`, `address`, `contact`, `bday`, `skill`, `gender`, `email`) VALUES
('TC1000020000', 'Садыков', 'Марат', 'Бугульма, Ленина 45А', '89124563697', '1990-06-19', 'Наука\r\nМатематика\r\nИстория', 'Male', 'tea@tea.tea');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `role` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`role`, `email`, `password`) VALUES
('Parent', 'par@par.par', 'par'),
('Student', 'stu@stu.stu', 'stu'),
('Teacher', 'tea@tea.tea', 'tea');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`aid`);

--
-- Индексы таблицы `attendancereport`
--
ALTER TABLE `attendancereport`
  ADD PRIMARY KEY (`aid`,`sid`);

--
-- Индексы таблицы `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`hno`);

--
-- Индексы таблицы `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `examresult`
--
ALTER TABLE `examresult`
  ADD PRIMARY KEY (`exam`,`student`);

--
-- Индексы таблицы `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Индексы таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Индексы таблицы `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`sid`);

--
-- Индексы таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`tid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `attendance`
--
ALTER TABLE `attendance`
  MODIFY `aid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `parent`
--
ALTER TABLE `parent`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
