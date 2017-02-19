-- phpMyAdmin SQL Dump
-- version 4.6.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-02-2017 a las 14:36:38
-- Versión del servidor: 5.7.12-log
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `veterinaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `codigo_his` int(11) NOT NULL,
  `causas_hist` varchar(255) DEFAULT NULL,
  `fecha_sali` date DEFAULT NULL,
  `peso` double(4,2) DEFAULT NULL,
  `diagnostico` varchar(255) DEFAULT NULL,
  `costo_atencion` double(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `codigo_masc` int(11) NOT NULL,
  `nombre_masc` varchar(25) DEFAULT NULL,
  `fecha_nacim` date DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `especie` varchar(20) DEFAULT NULL,
  `raza` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`codigo_masc`, `nombre_masc`, `fecha_nacim`, `genero`, `especie`, `raza`) VALUES
(1, 'samy', '2013-12-10', 'p', 'canino', 'poodle'),
(2, 'nieve', '2008-12-10', 'g', 'felino', 'persa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `cedula_prop` varchar(10) NOT NULL,
  `nombre_prop` varchar(20) DEFAULT NULL,
  `apellido_prop` varchar(20) DEFAULT NULL,
  `telefono_prop` varchar(12) DEFAULT NULL,
  `email_prop` varchar(60) DEFAULT NULL,
  `celular_prop` varchar(12) DEFAULT NULL,
  `direccion_prop` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `propietarios`
--

INSERT INTO `propietarios` (`cedula_prop`, `nombre_prop`, `apellido_prop`, `telefono_prop`, `email_prop`, `celular_prop`, `direccion_prop`) VALUES
('10106333', 'lenix', 'guerrero', '0274', 'lenix@gmail.com', '0424', 'merida'),
('15620262', 'rafa', 'guerrero', '0274', 'rafa@gmail.com', '0424', 'merida'),
('4701242', 'maria', 'guerrero', '0274', 'maria@gmail.com', '0424', 'merida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios_mascotas`
--

CREATE TABLE `propietarios_mascotas` (
  `cedula_prop` varchar(10) NOT NULL,
  `codigo_masc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`codigo_his`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`codigo_masc`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`cedula_prop`);

--
-- Indices de la tabla `propietarios_mascotas`
--
ALTER TABLE `propietarios_mascotas`
  ADD PRIMARY KEY (`cedula_prop`,`codigo_masc`),
  ADD KEY `codigo_masc` (`codigo_masc`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `codigo_his` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `codigo_masc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `propietarios_mascotas`
--
ALTER TABLE `propietarios_mascotas`
  ADD CONSTRAINT `propietarios_mascotas_ibfk_1` FOREIGN KEY (`cedula_prop`) REFERENCES `propietarios` (`cedula_prop`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `propietarios_mascotas_ibfk_2` FOREIGN KEY (`codigo_masc`) REFERENCES `mascotas` (`codigo_masc`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
