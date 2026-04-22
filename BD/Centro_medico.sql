-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-04-2026 a las 00:50:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Centro_medico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `fecha_cita` date NOT NULL,
  `hora_cita` time NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_consultorio` int(11) NOT NULL,
  `estado_cita` enum('Asignado','Atendido') NOT NULL,
  `observaciones_cita` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Consultorio`
--

CREATE TABLE `Consultorio` (
  `id_consultorio` int(11) NOT NULL,
  `nombre_consultorio` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Medicos`
--

CREATE TABLE `Medicos` (
  `id_medico` int(11) NOT NULL,
  `identificacion_medico` char(15) NOT NULL,
  `nombre_medico` varchar(50) NOT NULL,
  `apellidos_medico` varchar(50) NOT NULL,
  `especialidad_medico` varchar(50) NOT NULL,
  `telefono_medico` char(15) NOT NULL,
  `correo_medico` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pacientes`
--

CREATE TABLE `Pacientes` (
  `id_paciente` int(11) NOT NULL,
  `identificacion_paciente` char(15) NOT NULL,
  `nombre_paciente` varchar(50) NOT NULL,
  `apellidos_paciente` varchar(50) NOT NULL,
  `fecha_nac_paciente` date NOT NULL,
  `sexo_paciente` enum('Femenino','Masculino','Otro') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `id_usuario` int(11) NOT NULL,
  `login_usuario` char(15) NOT NULL,
  `password_usuario` varchar(60) NOT NULL,
  `estado_usuario` enum('Activo','Inactivo') NOT NULL,
  `tipo_usuario` enum('Administrador','Asistente','Medico','Paciente') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `idMedico` (`id_medico`),
  ADD KEY `idPaciente` (`id_paciente`),
  ADD KEY `idConsultorio` (`id_consultorio`);

--
-- Indices de la tabla `Consultorio`
--
ALTER TABLE `Consultorio`
  ADD PRIMARY KEY (`id_consultorio`);

--
-- Indices de la tabla `Medicos`
--
ALTER TABLE `Medicos`
  ADD PRIMARY KEY (`id_medico`),
  ADD UNIQUE KEY `medIdentificacion` (`identificacion_medico`);

--
-- Indices de la tabla `Pacientes`
--
ALTER TABLE `Pacientes`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `pacIdentificacion` (`identificacion_paciente`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `login_usuario` (`login_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `Medicos` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `Pacientes` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`id_consultorio`) REFERENCES `Consultorio` (`id_consultorio`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
