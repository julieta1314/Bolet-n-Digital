-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-09-2025 a las 23:46:11
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id_consultas` int(11) NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  `mensaje` varchar(100) NOT NULL,
  `respuesta` varchar(100) NOT NULL,
  `estado` enum('Pendiente','Respondido','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materias` int(11) NOT NULL,
  `AñoMateria` varchar(100) NOT NULL,
  `NombreMateria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_notas` int(11) DEFAULT NULL,
  `nota` tinyint(2) NOT NULL,
  `tipodenota` enum('1NP_1cuatri','2NP_1cuatri','Nota_1cuatri','1NP_2cuatri','2NP_2cuatri','Nota_2cuatri','notaAnual','Rec_Dic','Rec_Feb','NotaFinal') NOT NULL,
  `id_alumnos` int(11) NOT NULL,
  `id_materias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `NombreApellido` varchar(100) NOT NULL,
  `Contraseña` varchar(100) NOT NULL,
  `dni` text NOT NULL,
  `gmail` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `rol` enum('administrador','alumnado','estudiante','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD KEY `id_alumnos` (`id_alumnos`),
  ADD KEY `id_materias` (`id_materias`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`),
  ADD UNIQUE KEY `gmail` (`gmail`),
  ADD UNIQUE KEY `dni` (`dni`) USING HASH;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumnos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consultas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT;

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
