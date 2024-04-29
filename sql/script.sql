-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2024 a las 05:29:57
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
-- Base de datos: `db_finanzas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fin_egreso`
--

CREATE TABLE `fin_egreso` (
  `egr_codigo` int(11) NOT NULL,
  `egr_nombre` varchar(50) NOT NULL,
  `egr_descripcion` varchar(150) NOT NULL,
  `egr_precio_unitario` float NOT NULL,
  `egr_fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `egr_usuario_crea` int(11) NOT NULL,
  `egr_metodo_pago` int(11) NOT NULL,
  `egr_moneda` int(11) NOT NULL,
  `egr_situacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fin_ingreso`
--

CREATE TABLE `fin_ingreso` (
  `ing_codigo` int(11) NOT NULL,
  `ing_nombre` varchar(50) NOT NULL,
  `ing_descripcion` varchar(150) NOT NULL,
  `ing_precio_unitario` float NOT NULL,
  `ing_fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `ing_usuario_crea` int(11) NOT NULL,
  `ing_metodo_pago` int(11) NOT NULL,
  `ing_moneda` int(11) NOT NULL,
  `ing_situacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fin_metodo_pago`
--

CREATE TABLE `fin_metodo_pago` (
  `met_codigo` int(11) NOT NULL,
  `met_descripcion` varchar(70) NOT NULL,
  `met_abreviatura` varchar(4) NOT NULL,
  `met_situacion` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fin_metodo_pago`
--

INSERT INTO `fin_metodo_pago` (`met_codigo`, `met_descripcion`, `met_abreviatura`, `met_situacion`) VALUES
(1, 'Efectivo', 'EFE', 1),
(2, 'Tarjeta de Débito', 'TDD', 1),
(3, 'Tarjeta de Crédito', 'TDC', 1),
(4, 'Transferencia Bancaria', 'TRF', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fin_moneda`
--

CREATE TABLE `fin_moneda` (
  `mon_codigo` int(11) NOT NULL,
  `mon_nombre` varchar(20) NOT NULL,
  `mon_simbolo` varchar(5) NOT NULL,
  `mon_tipo_cambio` float NOT NULL,
  `mon_situacion` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fin_moneda`
--

INSERT INTO `fin_moneda` (`mon_codigo`, `mon_nombre`, `mon_simbolo`, `mon_tipo_cambio`, `mon_situacion`) VALUES
(1, 'Quetzales', 'Q', 1, 1),
(2, 'Dólar Estadounidense', '$', 7.8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fin_presupuesto`
--

CREATE TABLE `fin_presupuesto` (
  `pre_codigo` int(11) NOT NULL,
  `pre_nombre` varchar(50) NOT NULL,
  `pre_descripcion` varchar(150) NOT NULL,
  `pre_fecha_inicio` datetime NOT NULL,
  `pre_fecha_fin` datetime NOT NULL,
  `pre_usuario` int(11) NOT NULL,
  `pre_moneda` int(11) NOT NULL,
  `pre_situacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_rol`
--

CREATE TABLE `seg_rol` (
  `rol_codigo` int(11) NOT NULL,
  `rol_descripcion` varchar(20) NOT NULL,
  `rol_comentario` varchar(150) NOT NULL,
  `rol_situacion` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seg_rol`
--

INSERT INTO `seg_rol` (`rol_codigo`, `rol_descripcion`, `rol_comentario`, `rol_situacion`) VALUES
(1, 'ADMIN', 'Rol de administrador. Tiene acceso completo a todo el software incluida la configuracion.', 1),
(2, 'USER', 'Rol de usuario. Tiene acceso solo a las funcionalidades principales del software.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_usuarios`
--

CREATE TABLE `seg_usuarios` (
  `usu_codigo` int(11) NOT NULL,
  `usu_nombre` varchar(70) NOT NULL,
  `usu_usuario` varchar(20) NOT NULL,
  `usu_rol` int(11) NOT NULL,
  `usu_password` varchar(100) NOT NULL,
  `usu_email` varchar(75) NOT NULL,
  `usu_telefono` varchar(20) NOT NULL,
  `usu_fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `usu_fecha_baja` datetime DEFAULT NULL,
  `usu_situacion` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seg_usuarios`
--

INSERT INTO `seg_usuarios` (`usu_codigo`, `usu_nombre`, `usu_usuario`, `usu_rol`, `usu_password`, `usu_email`, `usu_telefono`, `usu_fecha_creacion`, `usu_fecha_baja`, `usu_situacion`) VALUES
(1, 'Bryan Gerardo Ascuc de Paz', 'bryger', 1, 'admin123', 'bryanascuc7@gmail.com', '+502 3155-1702', '2024-04-28 20:46:05', NULL, 1),
(2, 'Gerardo prueba', 'gerardo', 2, 'user123', 'bryanpaz999@gmail.com', '+502 3155-1702', '2024-04-28 20:46:05', NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `fin_egreso`
--
ALTER TABLE `fin_egreso`
  ADD PRIMARY KEY (`egr_codigo`),
  ADD KEY `fk_egr_metodo_pago` (`egr_metodo_pago`),
  ADD KEY `fk_egr_moneda` (`egr_moneda`),
  ADD KEY `fk_egr_usuario_crea` (`egr_usuario_crea`);

--
-- Indices de la tabla `fin_ingreso`
--
ALTER TABLE `fin_ingreso`
  ADD PRIMARY KEY (`ing_codigo`),
  ADD KEY `fk_ing_metodo_pago` (`ing_metodo_pago`),
  ADD KEY `fk_ing_moneda` (`ing_moneda`),
  ADD KEY `fk_ing_usuario_crea` (`ing_usuario_crea`);

--
-- Indices de la tabla `fin_metodo_pago`
--
ALTER TABLE `fin_metodo_pago`
  ADD PRIMARY KEY (`met_codigo`);

--
-- Indices de la tabla `fin_moneda`
--
ALTER TABLE `fin_moneda`
  ADD PRIMARY KEY (`mon_codigo`);

--
-- Indices de la tabla `fin_presupuesto`
--
ALTER TABLE `fin_presupuesto`
  ADD PRIMARY KEY (`pre_codigo`),
  ADD KEY `fk_pre_usuario` (`pre_usuario`),
  ADD KEY `fk_pre_moneda` (`pre_moneda`);

--
-- Indices de la tabla `seg_rol`
--
ALTER TABLE `seg_rol`
  ADD PRIMARY KEY (`rol_codigo`);

--
-- Indices de la tabla `seg_usuarios`
--
ALTER TABLE `seg_usuarios`
  ADD PRIMARY KEY (`usu_codigo`),
  ADD KEY `fk_usuarios_rol` (`usu_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `fin_egreso`
--
ALTER TABLE `fin_egreso`
  MODIFY `egr_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fin_ingreso`
--
ALTER TABLE `fin_ingreso`
  MODIFY `ing_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fin_metodo_pago`
--
ALTER TABLE `fin_metodo_pago`
  MODIFY `met_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `fin_moneda`
--
ALTER TABLE `fin_moneda`
  MODIFY `mon_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fin_presupuesto`
--
ALTER TABLE `fin_presupuesto`
  MODIFY `pre_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seg_rol`
--
ALTER TABLE `seg_rol`
  MODIFY `rol_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `seg_usuarios`
--
ALTER TABLE `seg_usuarios`
  MODIFY `usu_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `fin_egreso`
--
ALTER TABLE `fin_egreso`
  ADD CONSTRAINT `fk_egr_metodo_pago` FOREIGN KEY (`egr_metodo_pago`) REFERENCES `fin_metodo_pago` (`met_codigo`),
  ADD CONSTRAINT `fk_egr_moneda` FOREIGN KEY (`egr_moneda`) REFERENCES `fin_moneda` (`mon_codigo`),
  ADD CONSTRAINT `fk_egr_usuario_crea` FOREIGN KEY (`egr_usuario_crea`) REFERENCES `seg_usuarios` (`usu_codigo`);

--
-- Filtros para la tabla `fin_ingreso`
--
ALTER TABLE `fin_ingreso`
  ADD CONSTRAINT `fk_ing_metodo_pago` FOREIGN KEY (`ing_metodo_pago`) REFERENCES `fin_metodo_pago` (`met_codigo`),
  ADD CONSTRAINT `fk_ing_moneda` FOREIGN KEY (`ing_moneda`) REFERENCES `fin_moneda` (`mon_codigo`),
  ADD CONSTRAINT `fk_ing_usuario_crea` FOREIGN KEY (`ing_usuario_crea`) REFERENCES `seg_usuarios` (`usu_codigo`);

--
-- Filtros para la tabla `fin_presupuesto`
--
ALTER TABLE `fin_presupuesto`
  ADD CONSTRAINT `fk_pre_moneda` FOREIGN KEY (`pre_moneda`) REFERENCES `fin_moneda` (`mon_codigo`),
  ADD CONSTRAINT `fk_pre_usuario` FOREIGN KEY (`pre_usuario`) REFERENCES `seg_usuarios` (`usu_codigo`);

--
-- Filtros para la tabla `seg_usuarios`
--
ALTER TABLE `seg_usuarios`
  ADD CONSTRAINT `fk_usuarios_rol` FOREIGN KEY (`usu_rol`) REFERENCES `seg_rol` (`rol_codigo`) ON UPDATE CASCADE;
COMMIT;

-- TABLA DE INGRESOS DEL PRESUPUESTO

CREATE TABLE `db_finanzas`.`fin_presupuesto_ingreso` (
  `ping_codigo` INT NOT NULL AUTO_INCREMENT,
  `ping_presupuesto` INT NOT NULL,  -- Código del presupuesto asociado
  `ping_ingreso` INT NOT NULL,  -- Código del ingreso
  `ping_cantidad` INT NOT NULL,
  `ping_precio_unitario` FLOAT NOT NULL,
  `ping_fecha_registro` DATETIME NOT NULL,
  `ping_usuario` INT NOT NULL,
  PRIMARY KEY (`ping_codigo`, `ping_presupuesto`),  -- Clave primaria compuesta
  INDEX `idx_ping_presupuesto` (`ping_presupuesto`),  -- Índice para mejorar las búsquedas sobre ping_presupuesto
  CONSTRAINT `fk_ping_presupuesto`
    FOREIGN KEY (`ping_presupuesto`) REFERENCES `fin_presupuesto` (`pre_codigo`),
  CONSTRAINT `fk_ping_ingreso`
    FOREIGN KEY (`ping_ingreso`) REFERENCES `fin_ingreso` (`ing_codigo`),
  CONSTRAINT `fk_ping_usuario`
    FOREIGN KEY (`ping_usuario`) REFERENCES `seg_usuarios` (`usu_codigo`)
) ENGINE = InnoDB;

-- TABLA DE EGRESOS DEL PRESUPUESTO

CREATE TABLE `db_finanzas`.`fin_presupuesto_egreso` (
  `pegr_codigo` INT NOT NULL AUTO_INCREMENT,
  `pegr_presupuesto` INT NOT NULL,  -- Código del presupuesto asociado
  `pegr_egreso` INT NOT NULL,  -- Código del egreso
  `pegr_cantidad` INT NOT NULL,
  `pegr_precio_unitario` FLOAT NOT NULL,
  `pegr_fecha_registro` DATETIME NOT NULL,
  `pegr_usuario` INT NOT NULL,
  PRIMARY KEY (`pegr_codigo`, `pegr_presupuesto`),  -- Clave primaria compuesta
  INDEX `idx_pegr_presupuesto` (`pegr_presupuesto`),  -- Índice para mejorar las búsquedas sobre pegr_presupuesto
  CONSTRAINT `fk_pegr_presupuesto`
    FOREIGN KEY (`pegr_presupuesto`) REFERENCES `fin_presupuesto` (`pre_codigo`),
  CONSTRAINT `fk_pegr_egreso`
    FOREIGN KEY (`pegr_egreso`) REFERENCES `fin_egreso` (`egr_codigo`),
  CONSTRAINT `fk_pegr_usuario`
    FOREIGN KEY (`pegr_usuario`) REFERENCES `seg_usuarios` (`usu_codigo`)
) ENGINE = InnoDB;