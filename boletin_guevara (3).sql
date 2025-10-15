-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2025 a las 20:49:15
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `boletin_guevara`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumnos` int(11) NOT NULL,
  `Año` varchar(100) NOT NULL,
  `Division` varchar(100) NOT NULL,
  `id_usuarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumnos`, `Año`, `Division`, `id_usuarios`) VALUES
(2, '7', '1', 5),
(5, '1', '2', 29),
(6, '2', '3', 34);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id_consultas` int(11) NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  `mensaje` varchar(100) NOT NULL,
  `respuesta` varchar(100) NOT NULL,
  `estado` enum('Pendiente','Respondida') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id_consultas`, `id_usuarios`, `mensaje`, `respuesta`, `estado`) VALUES
(1, 29, 'hola', '', 'Pendiente'),
(2, 31, 'buenas', 'w', 'Respondida'),
(3, 29, 'ge', 'qw', 'Respondida'),
(4, 29, 's', '?', 'Respondida'),
(5, 31, 'h', 'n', 'Respondida'),
(6, 31, 'h', 'q', 'Respondida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materias` int(11) NOT NULL,
  `AñoMateria` varchar(100) NOT NULL,
  `NombreMateria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_materias`, `AñoMateria`, `NombreMateria`) VALUES
(1, '7', 'Hardware'),
(2, '2025', 'Matemáticas IV'),
(3, '2025', 'Marco Juridico'),
(4, '2025', 'Taller de Orientacion'),
(5, '2025', 'Programacion IV'),
(6, '2025', 'Hardware'),
(7, '2025', 'Ingles Tecnico'),
(8, '2025', 'Autogestion'),
(9, '2025', 'Asistencia'),
(10, '2025', 'Redes'),
(11, '2025', 'Matemáticas IV'),
(12, '2025', 'Marco Juridico'),
(13, '2025', 'Taller de Orientacion'),
(14, '2025', 'Programacion IV'),
(15, '2025', 'Ingles Tecnico'),
(16, '2025', 'Autogestion'),
(17, '2025', 'Asistencia'),
(18, '2025', 'Practicas Profecionalizantes'),
(19, '2025', 'Ciudad Inteligente'),
(20, '2025', 'Redes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_notas` int(11) NOT NULL,
  `nota` tinyint(2) NOT NULL,
  `tipodenota` enum('1NP_1cuatri','2NP_1cuatri','Nota_1cuatri','1NP_2cuatri','2NP_2cuatri','Nota_2cuatri','notaAnual','Rec_Dic','Rec_Feb','NotaFinal') NOT NULL,
  `id_alumnos` int(11) NOT NULL,
  `id_materias` int(11) NOT NULL,
  `curso_division` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id_notas`, `nota`, `tipodenota`, `id_alumnos`, `id_materias`, `curso_division`) VALUES
(1, 3, '1NP_1cuatri', 2, 1, NULL),
(2, 1, '2NP_1cuatri', 6, 10, NULL),
(3, 2, '1NP_1cuatri', 6, 10, '2 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Contraseña` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `gmail` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `rol` enum('alumno','alumnado','admin') DEFAULT NULL,
  `estado` enum('pendiente','aceptado') NOT NULL DEFAULT 'pendiente',
  `aceptado` tinyint(1) DEFAULT 0,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_expires` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `Nombre`, `Apellido`, `Contraseña`, `dni`, `gmail`, `ciudad`, `rol`, `estado`, `aceptado`, `reset_token`, `reset_expires`) VALUES
(5, 'Julieta', 'Viccini', '123', '12342441', 'julietaviccini5@gmail.com', 'rio grabnde', 'alumno', 'aceptado', 1, '718e774e5352c9722ad1a0f9e5957e5ad7a3c221e78fca68cb7bff4fafe7dc4b', 1760553621747),
(6, 'gabi', 'villa', '123', '12332', 'gabi@gmail.com', 'rio grande', 'alumno', 'aceptado', 1, NULL, NULL),
(29, 'are', 'are', '123', '214', 'are@gmail.com', 'rg', 'alumno', 'aceptado', 1, 'd76ee69244b422b793eaa2f21ca566b1726e04be19178acb5aacb3aae52e859f', 1760553567731),
(31, 'juli', 'juli', '123', '124421', 'juli@gmail.com', 'rg', 'alumnado', 'aceptado', 1, 'cb726722e837939c848ef3dfe7882ef05c0e694b', 1760501651845),
(33, 'Admin', 'General', 'admin123', '00000000', 'admin@colegio.com', 'Ciudad', 'admin', 'aceptado', 1, NULL, NULL),
(34, 'tami', 'viccini', '123', '2134', 'tami@gmail.com', 'rg', 'alumno', 'aceptado', 1, NULL, NULL),
(35, 'anahi', 'viccini', '123', '12452', 'manepo1887@lorkex.com', 'rg', 'alumnado', 'pendiente', 1, 'ad40443744aa6ec4eb85b3ab6c6221dd0202be565af99032aa89ff924fc268eb', 1760555116165);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumnos`),
  ADD KEY `id_usuarios` (`id_usuarios`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id_consultas`),
  ADD KEY `id_usuarios` (`id_usuarios`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materias`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id_notas`),
  ADD KEY `id_alumnos` (`id_alumnos`),
  ADD KEY `id_materias` (`id_materias`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`),
  ADD UNIQUE KEY `gmail` (`gmail`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumnos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consultas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_notas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`id_alumnos`) REFERENCES `alumnos` (`id_alumnos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`id_materias`) REFERENCES `materias` (`id_materias`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
