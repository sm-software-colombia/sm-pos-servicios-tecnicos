-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2024 a las 22:21:20
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
-- Base de datos: `datos_servicios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos`
--

CREATE TABLE `abonos` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `numero_factura` text NOT NULL,
  `recibido_de` varchar(255) NOT NULL,
  `concepto` text NOT NULL,
  `base64` blob NOT NULL,
  `valor` bigint(255) NOT NULL,
  `forma_pago` varchar(255) NOT NULL,
  `numero_transferencia` varchar(255) NOT NULL,
  `numero_cheque` varchar(255) NOT NULL,
  `banco` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `observaciones` varchar(5000) NOT NULL,
  `cuenta_banco` varchar(255) NOT NULL,
  `anulada` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes_contables`
--

CREATE TABLE `ajustes_contables` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `valor` bigint(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `tipo_ajuste` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `beneficiario` varchar(255) NOT NULL,
  `cuenta_banco` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `pagar_dia` bigint(255) NOT NULL,
  `pagar_cada` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `tipo_cuenta` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `numero_cuenta` varchar(255) NOT NULL,
  `saldo` bigint(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `nombre_banco` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `anular` bigint(5) NOT NULL,
  `activado` bigint(5) NOT NULL,
  `tipo` text NOT NULL,
  `banco` varchar(100) NOT NULL,
  `publickey` text NOT NULL,
  `publickeytest` text NOT NULL,
  `public_key2` text NOT NULL,
  `acces_token` text NOT NULL,
  `listar` bigint(20) NOT NULL,
  `listar2` bigint(5) NOT NULL,
  `pendiente` bigint(20) NOT NULL,
  `listar_bancos` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`id`, `numero`, `tipo_cuenta`, `nombre`, `numero_cuenta`, `saldo`, `descripcion`, `nombre_banco`, `fecha`, `anular`, `activado`, `tipo`, `banco`, `publickey`, `publickeytest`, `public_key2`, `acces_token`, `listar`, `listar2`, `pendiente`, `listar_bancos`) VALUES
(6, 0, 'Cuenta Bancaria', '', '', 0, '', '', '2021-11-23 16:08:55', 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3, 0, 'Pasarela virtual', 'Wompi Bancolombia', '', 0, '', '', '2018-01-31 19:51:15', 0, 0, 'wompi', '', '', '', '', '', 0, 0, 0, 0),
(9, 0, 'Pasarela virtual', 'Mercado Pago', '', 0, '', '', '0000-00-00 00:00:00', 0, 0, 'mercadopago', '', '', '', '', '', 0, 0, 1, 0),
(5, 0, 'Efectivo', 'Efectivo', '', 0, '', '', '2018-01-31 19:51:15', 0, 1, 'mercadopago', '', '', '', '', '', 0, 0, 0, 1),
(4, 0, 'Pasarela virtual', 'ePayco', '', 0, '', '', '0000-00-00 00:00:00', 0, 0, 'mercadopago', '', '', '', '', '', 0, 0, 0, 0),
(190, 0, 'Pasarela virtual', 'PayPal', '', 0, '', '', '0000-00-00 00:00:00', 0, 0, 'mercadopago', '', '', '', '', '', 0, 0, 1, 0),
(1, 0, 'Ahorros', 'Transferencia bancaria', '', 0, '', '', '2018-01-30 15:01:44', 0, 1, 'transferencia', '', '', '', '', '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancoscontraentrega`
--

CREATE TABLE `bancoscontraentrega` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `tipo_cuenta` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `numero_cuenta` varchar(255) NOT NULL,
  `contraentrega_activado` bigint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `bancoscontraentrega`
--

INSERT INTO `bancoscontraentrega` (`id`, `numero`, `tipo_cuenta`, `nombre`, `numero_cuenta`, `contraentrega_activado`) VALUES
(1, 0, 'Ahorros', 'Efectivo', '', 1),
(3, 0, '', 'Wompi', '', 1),
(100, 0, 'Cuenta Bancaria', 'Mercado Pago', '', 0),
(190, 0, 'Cuenta Bancaria', 'ePayco', '', 0),
(191, 0, 'Cuenta Bancaria', 'PayU', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos_detalles`
--

CREATE TABLE `bancos_detalles` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `tipo_transaccion` varchar(255) NOT NULL,
  `credito` varchar(255) NOT NULL,
  `numero_documento` varchar(255) NOT NULL,
  `nombre_cuenta` varchar(255) NOT NULL,
  `valor` bigint(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `nombre_banco` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` bigint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos_empleados`
--

CREATE TABLE `cargos_empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `funciones` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `visitas` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `empresa` varchar(255) NOT NULL,
  `direccion` text NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `telefono` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `ciudad` text NOT NULL,
  `web` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `visitas` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `empresa`, `direccion`, `identificacion`, `telefono`, `email`, `ciudad`, `web`, `fecha`, `usuario`, `visible`, `visitas`) VALUES
(1, '', '', '', '', '', '', '', '2022-02-08 10:46:26', '', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_tienda`
--

CREATE TABLE `categorias_tienda` (
  `id` int(11) NOT NULL,
  `CodigoCat` varchar(255) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `telefono` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `ciudad` text NOT NULL,
  `web` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `visitas` int(11) NOT NULL,
  `subid` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `place` varchar(200) NOT NULL,
  `descrp` varchar(400) NOT NULL,
  `date_added` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chart_data`
--

CREATE TABLE `chart_data` (
  `id` int(11) NOT NULL,
  `year` varchar(255) NOT NULL,
  `month` varchar(100) NOT NULL,
  `profit` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clavestmp`
--

CREATE TABLE `clavestmp` (
  `id` int(11) NOT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `direccion` text NOT NULL,
  `fecha` date NOT NULL,
  `activado` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes2`
--

CREATE TABLE `clientes2` (
  `id` int(11) NOT NULL,
  `empresa` varchar(255) NOT NULL,
  `direccion` text NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `tipo_identificacion` varchar(100) NOT NULL,
  `telefono` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `ciudad` text NOT NULL,
  `pais` varchar(100) NOT NULL,
  `departamento` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `visitas` int(11) NOT NULL,
  `password` varchar(200) NOT NULL,
  `key_reset` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `clientes2`
--

INSERT INTO `clientes2` (`id`, `empresa`, `direccion`, `identificacion`, `tipo_identificacion`, `telefono`, `email`, `ciudad`, `pais`, `departamento`, `fecha`, `usuario`, `visible`, `visitas`, `password`, `key_reset`) VALUES
(1, 'Andres Perez', 'adas', '00000', '', 'telwwww', 'email', '', '', '', '2024-07-29 18:05:41', '', 0, 0, '', ''),
(6, '3333333333333333', 'asd', 'dasasd', '', 'd', 'asdasd', '', '', '', '2024-08-06 13:15:45', '', 0, 0, '', ''),
(14, 'sss', 'as', 'as', '', 'sa', 'asdsa', '', '', '', '2024-08-06 18:27:34', '', 0, 0, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clienteselectronica`
--

CREATE TABLE `clienteselectronica` (
  `id` int(11) NOT NULL,
  `id_cliente` varchar(255) NOT NULL,
  `tipocliente` text NOT NULL,
  `tipopersona` varchar(255) NOT NULL,
  `tipo_identificacion` varchar(100) NOT NULL,
  `identificacion` text NOT NULL,
  `codigoverificador` varchar(100) NOT NULL,
  `regimen` text NOT NULL,
  `nombrerut` varchar(100) NOT NULL,
  `nombrecomercial` text NOT NULL,
  `detallestributarios` text NOT NULL,
  `casilla54` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `visitas` int(11) NOT NULL,
  `password` varchar(200) NOT NULL,
  `key_reset` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo_descuento`
--

CREATE TABLE `codigo_descuento` (
  `id` int(11) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `valor` varchar(100) NOT NULL,
  `detalles` varchar(255) NOT NULL,
  `activado` bigint(5) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `cod_item` varchar(100) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `usado` text NOT NULL,
  `cliente` text NOT NULL,
  `email` text NOT NULL,
  `no_remision` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo_pago`
--

CREATE TABLE `codigo_pago` (
  `id` int(11) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `valor` varchar(100) NOT NULL,
  `detalles` varchar(255) NOT NULL,
  `activado` bigint(5) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `no_guia` varchar(100) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `usado` text NOT NULL,
  `cliente` text NOT NULL,
  `email` text NOT NULL,
  `no_remision` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaboradores`
--

CREATE TABLE `colaboradores` (
  `id` int(11) NOT NULL,
  `empresa` varchar(255) NOT NULL,
  `direccion` text NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `telefono` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `ciudad` text NOT NULL,
  `web` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `visitas` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `comment_subject` varchar(250) NOT NULL,
  `comment_text` text NOT NULL,
  `comment_status` int(1) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantespago`
--

CREATE TABLE `comprobantespago` (
  `id` int(11) NOT NULL,
  `db` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `codigo` bigint(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `comprobantespagon_principal` bigint(5) NOT NULL,
  `tamano` varchar(100) NOT NULL,
  `color_talla` bigint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(1000) NOT NULL,
  `nit` varchar(1000) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(1000) NOT NULL,
  `telefono` varchar(1000) NOT NULL,
  `resolucion` varchar(100) NOT NULL,
  `autorizacion` varchar(100) NOT NULL,
  `prefijo` varchar(100) NOT NULL,
  `numero_inicio` varchar(100) NOT NULL,
  `responsable_iva` varchar(100) NOT NULL,
  `codigo_actividad` varchar(100) NOT NULL,
  `logo` varchar(1000) NOT NULL,
  `numeracion` bigint(100) NOT NULL,
  `numero_fin` bigint(100) NOT NULL,
  `vigencia` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `nit`, `email`, `direccion`, `telefono`, `resolucion`, `autorizacion`, `prefijo`, `numero_inicio`, `responsable_iva`, `codigo_actividad`, `logo`, `numeracion`, `numero_fin`, `vigencia`) VALUES
(1, 'Raparaciones Cell POWER', '23432', 'direcc DSFS', 'dsfsd', 'telefeeee', '7773', '2024-07-09', 'POS', '10', 'No', '23243', 'images.png', 246, 10, ''),
(35, '', '', '', '', '', '', '', '', '', '', '', 'images.png', 0, 0, ''),
(34, '', '', '', '', '', '', '', '', '', '', '', 'D_NQ_NP_766258-MLC43991062530_112020-O.webp', 0, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `id` int(11) NOT NULL,
  `NUMERO` bigint(255) NOT NULL,
  `RETENSION` varchar(255) NOT NULL,
  `TIPO_RETENSION` varchar(5000) NOT NULL,
  `DESCUENTO` varchar(100) NOT NULL,
  `FORMA_PAGO` varchar(255) NOT NULL,
  `VENCIMIENTO` varchar(255) NOT NULL,
  `FECHA` timestamp NOT NULL DEFAULT current_timestamp(),
  `iva` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `identi` varchar(100) NOT NULL,
  `anular` bigint(5) NOT NULL,
  `anular_motivo` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `valor_sub` bigint(255) NOT NULL,
  `valor_descuento` bigint(255) NOT NULL,
  `valor_iva` bigint(255) NOT NULL,
  `valor_retencion` bigint(255) NOT NULL,
  `valor_total` bigint(255) NOT NULL,
  `observaciones` varchar(500) NOT NULL,
  `pagar_en` bigint(10) NOT NULL,
  `texto` varchar(5000) NOT NULL,
  `facturado` bigint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_servicios`
--

CREATE TABLE `datos_servicios` (
  `id` int(30) NOT NULL,
  `mensaje` varchar(300) NOT NULL,
  `estado` int(1) NOT NULL DEFAULT 0,
  `autor` varchar(300) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_cotizacion`
--

CREATE TABLE `detalles_cotizacion` (
  `id` int(11) NOT NULL,
  `FACTURA` bigint(255) NOT NULL,
  `CODIGO` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CANTIDAD` bigint(255) NOT NULL,
  `COSTO` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL,
  `anular` timestamp NOT NULL DEFAULT current_timestamp(),
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `valor_sub` bigint(255) NOT NULL,
  `valor_descuento` bigint(255) NOT NULL,
  `valor_iva` bigint(255) NOT NULL,
  `valor_retencion` bigint(255) NOT NULL,
  `valor_total` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_empleados`
--

CREATE TABLE `detalles_empleados` (
  `id` int(11) NOT NULL,
  `numero_nomina` bigint(255) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `identificacion` text NOT NULL,
  `dias` bigint(255) NOT NULL,
  `salario` bigint(255) NOT NULL,
  `transporte` bigint(255) NOT NULL,
  `comisiones` bigint(255) NOT NULL,
  `bono` bigint(255) NOT NULL,
  `prima` bigint(255) NOT NULL,
  `extra_ordinaria` bigint(255) NOT NULL,
  `extra_festivos` bigint(255) NOT NULL,
  `total_devengado` bigint(255) NOT NULL,
  `salud` bigint(255) NOT NULL,
  `pension` bigint(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `poliza` bigint(255) NOT NULL,
  `abonos` bigint(255) NOT NULL,
  `total_deducciones` bigint(255) NOT NULL,
  `neto_pagado` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_facturas`
--

CREATE TABLE `detalles_facturas` (
  `id` int(11) NOT NULL,
  `FACTURA` varchar(255) NOT NULL,
  `CODIGO` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CANTIDAD` bigint(255) NOT NULL,
  `COSTO` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `fecha_creacion` varchar(100) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL,
  `anular` bigint(5) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `valor_sub` bigint(255) NOT NULL,
  `valor_descuento` bigint(255) NOT NULL,
  `valor_iva` bigint(255) NOT NULL,
  `valor_retencion` bigint(255) NOT NULL,
  `valor_total` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_facturas_electronicas`
--

CREATE TABLE `detalles_facturas_electronicas` (
  `id` int(11) NOT NULL,
  `FACTURA` varchar(255) NOT NULL,
  `CODIGO` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CANTIDAD` bigint(255) NOT NULL,
  `COSTO` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL,
  `anular` bigint(5) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `valor_sub` bigint(255) NOT NULL,
  `valor_descuento` bigint(255) NOT NULL,
  `valor_iva` bigint(255) NOT NULL,
  `valor_retencion` bigint(255) NOT NULL,
  `valor_total` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_ingresos`
--

CREATE TABLE `detalles_ingresos` (
  `id` int(11) NOT NULL,
  `NUMERO` bigint(255) NOT NULL,
  `CODIGO` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CANTIDAD` bigint(255) NOT NULL,
  `COSTO` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_notadebito`
--

CREATE TABLE `detalles_notadebito` (
  `id` int(11) NOT NULL,
  `NUMERO` bigint(255) NOT NULL,
  `CODIGO` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CANTIDAD` bigint(255) NOT NULL,
  `COSTO` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL,
  `anular` timestamp NOT NULL DEFAULT current_timestamp(),
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `valor_sub` bigint(255) NOT NULL,
  `valor_descuento` bigint(255) NOT NULL,
  `valor_iva` bigint(255) NOT NULL,
  `valor_retencion` bigint(255) NOT NULL,
  `valor_total` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedidos`
--

CREATE TABLE `detalles_pedidos` (
  `id` int(11) NOT NULL,
  `NUMERO` bigint(255) NOT NULL,
  `CODIGO` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CANTIDAD` bigint(255) NOT NULL,
  `COSTO` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_produccion`
--

CREATE TABLE `detalles_produccion` (
  `id` int(11) NOT NULL,
  `NUMERO` bigint(255) NOT NULL,
  `CODIGO` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CANTIDAD` bigint(255) NOT NULL,
  `COSTO` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_remisiones`
--

CREATE TABLE `detalles_remisiones` (
  `id` int(11) NOT NULL,
  `FACTURA` bigint(255) NOT NULL,
  `CODIGO` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CANTIDAD` bigint(255) NOT NULL,
  `COSTO` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL,
  `anular` bigint(5) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `valor_sub` bigint(255) NOT NULL,
  `valor_descuento` bigint(255) NOT NULL,
  `valor_iva` bigint(255) NOT NULL,
  `valor_retencion` bigint(255) NOT NULL,
  `valor_total` bigint(255) NOT NULL,
  `talla` text NOT NULL,
  `color` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_salidas`
--

CREATE TABLE `detalles_salidas` (
  `id` int(11) NOT NULL,
  `FACTURA` bigint(255) NOT NULL,
  `CODIGO` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CANTIDAD` bigint(255) NOT NULL,
  `COSTO` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_tienda`
--

CREATE TABLE `detalles_tienda` (
  `id` int(11) NOT NULL,
  `FACTURA` varchar(255) NOT NULL,
  `CODIGO` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CANTIDAD` bigint(255) NOT NULL,
  `COSTO` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL,
  `anular` bigint(5) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `valor_sub` bigint(255) NOT NULL,
  `valor_descuento` bigint(255) NOT NULL,
  `valor_iva` bigint(255) NOT NULL,
  `valor_retencion` bigint(255) NOT NULL,
  `valor_total` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE `egresos` (
  `id` int(11) NOT NULL,
  `numero_egreso` bigint(255) NOT NULL,
  `beneficiario` varchar(255) NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `numero_entrada` varchar(255) NOT NULL,
  `numero_factura` bigint(255) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `observaciones` varchar(255) NOT NULL,
  `valor` bigint(255) NOT NULL,
  `forma_pago` varchar(255) NOT NULL,
  `numero_transferencia` varchar(255) NOT NULL,
  `numero_cheque` varchar(255) NOT NULL,
  `banco` varchar(255) NOT NULL,
  `retencion` varchar(255) NOT NULL,
  `valor_retencion` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `anular` bigint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `direccion` text NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `telefono` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `ciudad` text NOT NULL,
  `eps` varchar(255) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `salario` bigint(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo_contrato` varchar(255) NOT NULL,
  `transporte` varchar(255) NOT NULL,
  `prestaciones` varchar(100) NOT NULL,
  `vacaciones` varchar(100) NOT NULL,
  `seguridad` varchar(100) NOT NULL,
  `parafiscales` varchar(100) NOT NULL,
  `comisiones` varchar(100) NOT NULL,
  `valor_abono` bigint(255) NOT NULL,
  `pension` varchar(100) NOT NULL,
  `sena` varchar(100) NOT NULL,
  `salud` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE `entradas` (
  `id` int(11) NOT NULL,
  `NUMERO` bigint(255) NOT NULL,
  `tipo_documento` varchar(255) NOT NULL,
  `numero_documento` varchar(5000) NOT NULL,
  `proveedor` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `forma_pago` varchar(255) NOT NULL,
  `valor_documento` bigint(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `recibe` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `saldo` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id` int(11) NOT NULL,
  `local` varchar(255) NOT NULL,
  `regional` varchar(100) NOT NULL,
  `nacional` varchar(255) NOT NULL,
  `entregalocal` varchar(255) NOT NULL,
  `entregaregional` varchar(255) NOT NULL,
  `entreganacional` varchar(100) NOT NULL,
  `enviosgratis` varchar(100) NOT NULL,
  `departamento` varchar(150) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `banco` varchar(100) NOT NULL,
  `banco_numero` varchar(100) NOT NULL,
  `plazos` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id`, `local`, `regional`, `nacional`, `entregalocal`, `entregaregional`, `entreganacional`, `enviosgratis`, `departamento`, `municipio`, `direccion`, `categoria`, `banco`, `banco_numero`, `plazos`) VALUES
(1, '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id` int(11) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `subtotal` bigint(255) NOT NULL,
  `impuestos` bigint(200) NOT NULL,
  `total` bigint(100) NOT NULL,
  `FORMA_PAGO` varchar(255) NOT NULL,
  `VENCIMIENTO` date NOT NULL DEFAULT current_timestamp(),
  `fecha` varchar(100) NOT NULL DEFAULT current_timestamp(),
  `iva` varchar(255) NOT NULL,
  `usuario` text NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `cc` varchar(100) NOT NULL,
  `anular_motivo` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `valor_sub` bigint(255) NOT NULL,
  `valor_descuento` bigint(255) NOT NULL,
  `valor_iva` bigint(255) NOT NULL,
  `valor_retencion` bigint(255) NOT NULL,
  `valor_total` bigint(255) NOT NULL,
  `observaciones` varchar(500) NOT NULL,
  `cuenta_banco` varchar(100) NOT NULL,
  `vendedor` varchar(100) NOT NULL,
  `saldo` bigint(255) NOT NULL,
  `costo_envio` varchar(255) NOT NULL,
  `fecha_chart` varchar(100) NOT NULL,
  `num_remision` text NOT NULL,
  `numero_transaccion` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id`, `numero`, `subtotal`, `impuestos`, `total`, `FORMA_PAGO`, `VENCIMIENTO`, `fecha`, `iva`, `usuario`, `cliente`, `cc`, `anular_motivo`, `direccion`, `telefono`, `email`, `ciudad`, `departamento`, `valor_sub`, `valor_descuento`, `valor_iva`, `valor_retencion`, `valor_total`, `observaciones`, `cuenta_banco`, `vendedor`, `saldo`, `costo_envio`, `fecha_chart`, `num_remision`, `numero_transaccion`) VALUES
(34, 'POS-43', 10000, 0, 10000, '', '2024-07-18', '18/07/2024 18:50:55', '0', 'admin', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', '', '', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas_electronicas`
--

CREATE TABLE `facturas_electronicas` (
  `id` int(11) NOT NULL,
  `NUMERO` varchar(255) NOT NULL,
  `RETENSION` varchar(255) NOT NULL,
  `TIPO_RETENSION` varchar(5000) NOT NULL,
  `DESCUENTO` varchar(100) NOT NULL,
  `FORMA_PAGO` varchar(255) NOT NULL,
  `VENCIMIENTO` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA` timestamp NOT NULL DEFAULT current_timestamp(),
  `iva` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `identi` varchar(100) NOT NULL,
  `anular` bigint(5) NOT NULL,
  `anular_motivo` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `valor_sub` bigint(255) NOT NULL,
  `valor_descuento` bigint(255) NOT NULL,
  `valor_iva` bigint(255) NOT NULL,
  `valor_retencion` bigint(255) NOT NULL,
  `valor_total` bigint(255) NOT NULL,
  `observaciones` varchar(500) NOT NULL,
  `cuenta_banco` varchar(100) NOT NULL,
  `vendedor` varchar(100) NOT NULL,
  `saldo` bigint(255) NOT NULL,
  `costo_envio` varchar(255) NOT NULL,
  `fecha_chart` varchar(100) NOT NULL,
  `num_remision` text NOT NULL,
  `numero_transaccion` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos_fijos`
--

CREATE TABLE `gastos_fijos` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `valor` bigint(255) NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `beneficiario` varchar(255) NOT NULL,
  `cuenta_banco` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `pagar_dia` bigint(255) NOT NULL,
  `pagar_cada` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `db` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `codigo` bigint(255) NOT NULL,
  `fecha` varchar(100) NOT NULL DEFAULT current_timestamp(),
  `imagen_principal` bigint(5) NOT NULL,
  `tamano` varchar(100) NOT NULL,
  `color_talla` bigint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `image`
--

INSERT INTO `image` (`id`, `db`, `nombre`, `codigo`, `fecha`, `imagen_principal`, `tamano`, `color_talla`) VALUES
(1, '', 'images.png', 0, '2024-07-10 13:13:07', 0, '', 0),
(2, '924', 'images.png', 0, '2024-07-10 13:14:14', 0, '', 0),
(3, '929', 'images.png', 0, '2024-07-10 14:08:56', 0, '', 0),
(4, '924', 'phoenix-esports-logo-design-vector.jpg', 0, '2024-07-10 14:09:56', 0, '', 0),
(5, '929', '', 0, '2024-07-10 14:13:32', 0, '', 0),
(6, '929', '', 0, '2024-07-10 14:13:36', 0, '', 0),
(7, '929', '', 0, '2024-07-10 14:16:07', 0, '', 0),
(8, '929', 'images.png', 0, '2024-07-10 14:16:18', 0, '', 0),
(9, '924', 'images.png', 0, '2024-07-10 14:25:21', 0, '', 0),
(10, '929', 'phoenix-esports-logo-design-vector.jpg', 0, '2024-07-10 14:25:38', 0, '', 0),
(11, '930', 'phoenix-esports-logo-design-vector.jpg', 0, '2024-07-10 17:18:34', 0, '', 0),
(12, '931', 'images.png', 0, '2024-07-10 17:18:50', 0, '', 0),
(13, '931', 'images (1).png', 0, '2024-07-10 19:55:55', 0, '', 0),
(14, '921', 'origen-y-curiosidades-de-las-arepas-colombianas-imagen-destacadas.jpg', 0, '2024-07-12 16:56:41', 0, '', 0),
(15, '932', 'martillo-con-mango-de-madera-cabeza-conica.jpg', 0, '2024-07-23 08:44:52', 0, '', 0),
(16, '933', 'images.jpg', 0, '2024-07-23 08:48:21', 0, '', 0),
(17, '934', 'images (3).jpg', 0, '2024-07-24 14:17:18', 0, '', 0),
(18, '935', 'images (3).jpg', 0, '2024-07-24 14:18:07', 0, '', 0),
(19, '935', 'images (1).jpg', 0, '2024-07-24 14:18:28', 0, '', 0),
(20, '937', 'pica-en-hierro-de-5lbs-cabo-en-madera.jpg', 0, '2024-07-24 14:20:16', 0, '', 0),
(21, '936', 'LBA6012W_1.jpg', 0, '2024-07-24 14:20:56', 0, '', 0),
(22, '938', 'images (4).jpg', 0, '2024-07-24 14:22:03', 0, '', 0),
(23, '940', 'brochas-profesionales-mango-de-plastico-3-long-cerdas-53mm-espesor-135mm-resistente-a-solvente-brt-3-14485-truper.jpg', 0, '2024-07-24 14:23:58', 0, '', 0),
(24, '939', 'brocha-profesional-5-mango-de-plastico-truper.jpg', 0, '2024-07-24 14:24:56', 0, '', 0),
(25, '939', 'Captura_aeed0ee1-caa0-4e5f-b7ef-9307953cfec6_580x.webp', 0, '2024-07-24 14:26:04', 0, '', 0),
(26, '941', 'tubos-pvc.jpg', 0, '2024-07-24 14:28:13', 0, '', 0),
(27, '941', 'Tubo-PN-16-x-4-Mts-Verde-Agua-Fria-70.jpg', 0, '2024-07-24 14:29:09', 0, '', 0),
(28, '1', 'es_coca-cola_prod_orginal-bottle-600mL_750x750_v1.webp', 0, '2024-08-01 09:24:43', 0, '', 0),
(29, '2', 'image_content_26048298_20160519204438.jpg', 0, '2024-08-01 09:26:56', 0, '', 0),
(30, '2', 'images.jpg', 0, '2024-08-01 09:27:09', 0, '', 0),
(31, '2', 'images.jpg', 0, '2024-08-01 09:27:33', 0, '', 0),
(32, '3', 'images.jpg', 0, '2024-08-01 09:28:14', 0, '', 0),
(33, '3', 'empanadas.jpg', 0, '2024-08-01 09:28:53', 0, '', 0),
(34, '4', 'martillo-con-mango-de-madera-cabeza-conica.jpg', 0, '2024-08-01 13:42:30', 0, '', 0),
(35, '5', 'jugo-hit-frutos-tropicales-500-ml.jpg', 0, '2024-08-01 14:09:50', 0, '', 0),
(36, '6', '7702189057877.jpg', 0, '2024-08-01 14:16:53', 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image_cesta`
--

CREATE TABLE `image_cesta` (
  `id` int(11) NOT NULL,
  `db` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `codigo` bigint(255) NOT NULL,
  `fecha` varchar(100) NOT NULL DEFAULT current_timestamp(),
  `imagen_principal` bigint(5) NOT NULL,
  `tamano` varchar(100) NOT NULL,
  `color_talla` bigint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `image_cesta`
--

INSERT INTO `image_cesta` (`id`, `db`, `nombre`, `codigo`, `fecha`, `imagen_principal`, `tamano`, `color_talla`) VALUES
(78, '85359842423231235', 'carrito-bag7.png', 111, '2021-06-pm 19:25:39', 0, '', 0),
(75, '85359842423231235', 'carrito-car3.png', 111, '2021-06-pm 19:25:39', 0, '', 0),
(77, '85359842423231235', 'carrito-bag5.png', 111, '2021-06-pm 19:25:39', 1, '', 0),
(74, '85359842423231235', 'bolsafinal.png', 111, '2021-07-pm 15:40:17', 0, '', 0),
(73, '85359842423231235', 'carrito.png', 85359842423231235, '1623773079', 0, '', 0),
(70, '85359842423231235', 'carrito-car2.png', 111, '2021-06-pm 19:25:39', 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image_cestatema`
--

CREATE TABLE `image_cestatema` (
  `id` int(11) NOT NULL,
  `db` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `codigo` bigint(255) NOT NULL,
  `fecha` varchar(100) NOT NULL DEFAULT current_timestamp(),
  `imagen_principal` bigint(5) NOT NULL,
  `tamano` varchar(100) NOT NULL,
  `color_talla` bigint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `image_cestatema`
--

INSERT INTO `image_cestatema` (`id`, `db`, `nombre`, `codigo`, `fecha`, `imagen_principal`, `tamano`, `color_talla`) VALUES
(309, '', 'carrito-bag7.png', 0, '2021-08-27 15:57:14', 1, '', 0),
(308, '', 'bolsafinal.png', 0, '2021-08-27 15:57:08', 1, '', 0),
(307, '', 'carrito-bag7.png', 0, '2021-08-27 15:54:16', 1, '', 0),
(306, '', 'carrito-bag7.png', 0, '2021-08-27 15:54:11', 1, '', 0),
(305, '', 'carrito-bag7.png', 0, '2021-08-27 15:53:29', 1, '', 0),
(304, '', 'carrito-bag7.png', 0, '2021-08-27 15:53:20', 1, '', 0),
(303, '', 'carrito-bag7.png', 0, '2021-08-27 15:53:15', 1, '', 0),
(302, '', 'carrito-bag7.png', 0, '2021-08-20 19:20:45', 1, '', 0),
(301, '', 'carrito-bag7.png', 0, '2021-08-20 19:20:40', 1, '', 0),
(300, '', 'bolsafinal.png', 0, '2021-08-12 19:19:05', 1, '', 0),
(299, '', 'carrito-bag7.png', 0, '2021-08-11 06:24:59', 1, '', 0),
(298, '', 'carrito-bag7.png', 0, '2021-08-06 10:02:45', 1, '', 0),
(297, '', 'carrito-bag7.png', 0, '2021-08-06 09:03:56', 1, '', 0),
(296, '', 'carrito-bag7.png', 0, '2021-08-06 09:03:23', 1, '', 0),
(295, '', 'bolsafinal.png', 0, '2021-08-06 09:02:49', 1, '', 0),
(294, '', 'carrito-bag7.png', 0, '2021-08-06 09:02:03', 1, '', 0),
(293, '', 'carrito-bag7.png', 0, '2021-08-06 08:58:19', 1, '', 0),
(292, '', 'carrito-bag7.png', 0, '2021-08-06 08:57:53', 1, '', 0),
(291, '', 'carrito-bag7.png', 0, '2021-08-06 06:36:07', 1, '', 0),
(290, '', 'carrito-bag7.png', 0, '2021-08-06 06:35:15', 1, '', 0),
(289, '', 'bolsafinal.png', 0, '2021-08-02 20:15:58', 1, '', 0),
(288, '', 'carrito-bag7.png', 0, '2021-07-30 05:23:30', 1, '', 0),
(287, '', 'bolsafinal.png', 0, '2021-07-29 03:51:24', 1, '', 0),
(286, '', 'carrito-car2.png', 0, '2021-07-28 01:10:10', 1, '', 0),
(285, '', 'carrito-bag7.png', 0, '2021-07-28 01:09:52', 1, '', 0),
(284, '', 'carrito-car2.png', 0, '2021-07-28 00:38:51', 1, '', 0),
(283, '', 'carrito-car3.png', 0, '2021-07-28 00:36:01', 1, '', 0),
(282, '', 'carrito-bag7.png', 0, '2021-07-28 00:35:23', 1, '', 0),
(281, '', 'carrito-car2.png', 0, '2021-07-27 23:59:22', 1, '', 0),
(280, '', 'carrito-bag7.png', 0, '2021-07-27 21:45:27', 1, '', 0),
(279, '', 'carrito-bag7.png', 0, '2021-07-27 21:45:03', 1, '', 0),
(278, '', 'carrito-bag7.png', 0, '2021-07-27 21:22:51', 1, '', 0),
(277, '', 'carrito-bag7.png', 0, '2021-07-27 21:22:28', 1, '', 0),
(276, '', 'carrito-bag7.png', 0, '2021-07-27 21:22:13', 1, '', 0),
(275, '', 'carrito-bag7.png', 0, '2021-07-27 21:17:46', 1, '', 0),
(274, '', 'carrito-bag7.png', 0, '2021-07-27 21:17:28', 1, '', 0),
(273, '', 'carrito-bag7.png', 0, '2021-07-27 21:16:40', 1, '', 0),
(272, '', 'carrito-bag7.png', 0, '2021-07-27 21:16:13', 1, '', 0),
(271, '', 'carrito-bag7.png', 0, '2021-07-27 21:10:40', 1, '', 0),
(270, '', 'carrito-bag7.png', 0, '2021-07-27 21:10:07', 1, '', 0),
(269, '', 'carrito-bag7.png', 0, '2021-07-27 21:09:37', 1, '', 0),
(268, '', 'carrito-bag7.png', 0, '2021-07-27 21:08:44', 1, '', 0),
(267, '', 'bolsafinal.png', 0, '2021-07-27 21:08:20', 1, '', 0),
(266, '', 'bolsafinal.png', 0, '2021-07-27 21:07:59', 1, '', 0),
(265, '', 'bolsafinal.png', 0, '2021-07-27 21:07:25', 1, '', 0),
(264, '', 'bolsafinal.png', 0, '2021-07-27 20:50:43', 1, '', 0),
(263, '', 'bolsafinal.png', 0, '2021-07-27 20:50:25', 1, '', 0),
(262, '', 'carrito-bag7.png', 0, '2021-07-27 20:45:45', 1, '', 0),
(261, '', 'carrito-car2.png', 0, '2021-07-27 20:45:24', 1, '', 0),
(260, '', 'bolsafinal.png', 0, '2021-07-27 20:44:34', 1, '', 0),
(259, '', 'bolsafinal.png', 0, '2021-07-27 20:44:06', 1, '', 0),
(258, '', 'carrito.png', 0, '2021-07-27 20:43:12', 1, '', 0),
(257, '', 'carrito.png', 0, '2021-07-27 20:41:13', 1, '', 0),
(256, '', 'carrito-bag7.png', 0, '2021-07-27 20:34:16', 1, '', 0),
(255, '', 'carrito-bag7.png', 0, '2021-07-27 20:33:29', 1, '', 0),
(254, '', 'carrito-bag7.png', 0, '2021-07-27 20:33:03', 1, '', 0),
(253, '', 'carrito-bag7.png', 0, '2021-07-27 20:25:48', 1, '', 0),
(252, '', 'carrito-bag7.png', 0, '2021-07-27 20:24:56', 1, '', 0),
(251, '', 'carrito-bag7.png', 0, '2021-07-27 20:24:40', 1, '', 0),
(250, '', 'carrito-bag7.png', 0, '2021-07-27 20:21:49', 1, '', 0),
(249, '', 'carrito-bag7.png', 0, '2021-07-27 20:21:18', 1, '', 0),
(248, '', 'carrito-bag7.png', 0, '2021-07-27 20:18:26', 1, '', 0),
(247, '', 'carrito-bag7.png', 0, '2021-07-27 20:17:42', 1, '', 0),
(246, '', 'carrito-bag7.png', 0, '2021-07-27 20:17:42', 1, '', 0),
(245, '', 'carrito-bag7.png', 0, '2021-07-27 20:17:42', 1, '', 0),
(244, '', 'carrito-bag7.png', 0, '2021-07-27 20:16:25', 1, '', 0),
(243, '', 'carrito-bag7.png', 0, '2021-07-27 20:16:25', 1, '', 0),
(242, '', 'carrito-bag7.png', 0, '2021-07-27 20:16:25', 1, '', 0),
(241, '', 'carrito-bag7.png', 0, '2021-07-27 20:09:46', 1, '', 0),
(240, '', 'carrito-bag7.png', 0, '2021-07-27 20:05:14', 1, '', 0),
(239, '', 'carrito-bag7.png', 0, '2021-07-27 20:04:21', 1, '', 0),
(238, '', 'carrito-bag7.png', 0, '2021-07-27 20:03:58', 1, '', 0),
(237, '', 'carrito-bag7.png', 0, '2021-07-27 20:02:59', 1, '', 0),
(236, '', 'carrito-bag7.png', 0, '2021-07-27 20:00:30', 1, '', 0),
(235, '', 'carrito-bag7.png', 0, '2021-07-27 19:58:30', 1, '', 0),
(234, '', 'carrito-bag7.png', 0, '2021-07-27 19:58:15', 1, '', 0),
(233, '', 'carrito-bag7.png', 0, '2021-07-27 19:51:12', 1, '', 0),
(232, '', 'carrito-bag7.png', 0, '2021-07-27 19:41:46', 1, '', 0),
(231, '', 'carrito-bag7.png', 0, '2021-07-27 19:33:22', 1, '', 0),
(230, '', 'bolsafinal.png', 0, '2021-07-27 19:33:18', 1, '', 0),
(229, '', 'carrito-bag7.png', 0, '2021-07-27 19:33:14', 1, '', 0),
(228, '', 'carrito-bag7.png', 0, '2021-07-27 19:32:44', 1, '', 0),
(227, '', 'carrito-bag7.png', 0, '2021-07-27 19:32:37', 1, '', 0),
(226, '', 'carrito-bag7.png', 0, '2021-07-27 19:32:37', 1, '', 0),
(225, '', 'carrito-bag7.png', 0, '2021-07-27 19:30:53', 1, '', 0),
(224, '', 'carrito-bag7.png', 0, '2021-07-27 19:07:42', 1, '', 0),
(223, '', 'carrito-car2.png', 0, '2021-07-26 04:41:05', 1, '', 0),
(222, '', 'carrito-bag5.png', 0, '2021-07-23 02:02:53', 1, '', 0),
(221, '', 'carrito-car2.png', 0, '2021-07-23 01:43:53', 1, '', 0),
(220, '', 'carrito-bag7.png', 0, '2021-07-23 01:19:33', 1, '', 0),
(219, '', 'carrito-bag5.png', 0, '2021-07-23 00:39:20', 1, '', 0),
(218, '', 'carrito-bag7.png', 0, '2021-07-23 00:37:52', 1, '', 0),
(217, '', 'carrito-bag7.png', 0, '2021-07-23 00:33:56', 1, '', 0),
(216, '', 'bolsafinal.png', 0, '2021-07-23 00:32:47', 1, '', 0),
(215, '', 'carrito-bag7.png', 0, '2021-07-23 00:32:18', 1, '', 0),
(214, '', 'bolsafinal.png', 0, '2021-07-23 00:30:46', 1, '', 0),
(213, '', 'carrito-bag7.png', 0, '2021-07-23 00:30:00', 1, '', 0),
(212, '', 'bolsafinal.png', 0, '2021-07-23 00:25:19', 1, '', 0),
(211, '', 'bolsafinal.png', 0, '2021-07-23 00:21:01', 1, '', 0),
(210, '', 'bolsafinal.png', 0, '2021-07-22 04:29:20', 1, '', 0),
(209, '', 'bolsafinal.png', 0, '2021-07-22 04:01:58', 1, '', 0),
(208, '', 'carrito-bag5.png', 0, '2021-07-22 03:44:43', 1, '', 0),
(207, '', 'carrito.png', 0, '2021-07-22 03:42:52', 1, '', 0),
(206, '', 'carrito-bag7s.png', 0, '2021-07-22 03:36:20', 1, '', 0),
(205, '', 'carrito-bag7.png', 0, '2021-07-22 03:17:57', 1, '', 0),
(310, '', 'bolsafinal.png', 0, '2021-09-15 17:55:21', 1, '', 0),
(311, '', 'carrito-bag7.png', 0, '2021-09-16 08:16:36', 1, '', 0),
(312, '', 'carrito-bag5.png', 0, '2021-09-16 09:42:02', 1, '', 0),
(313, '', 'carrito-bag5.png', 0, '2021-09-16 09:42:17', 1, '', 0),
(314, '', 'bolsafinal.png', 0, '2021-09-16 09:52:44', 1, '', 0),
(315, '', 'carrito-bag5.png', 0, '2021-09-16 09:52:55', 1, '', 0),
(316, '', 'bolsafinal.png', 0, '2021-09-16 10:40:10', 1, '', 0),
(317, '', 'carrito-bag5.png', 0, '2021-09-16 10:41:07', 1, '', 0),
(318, '', 'carrito-bag5.png', 0, '2021-09-16 10:41:15', 1, '', 0),
(319, '', 'carrito-bag5.png', 0, '2021-09-16 10:41:17', 1, '', 0),
(320, '', 'bolsafinal.png', 0, '2021-09-16 10:41:21', 1, '', 0),
(321, '', 'carrito-bag5.png', 0, '2021-09-16 10:41:37', 1, '', 0),
(322, '', 'bolsafinal.png', 0, '2021-09-16 10:42:02', 1, '', 0),
(323, '', 'bolsafinal.png', 0, '2021-09-16 10:42:14', 1, '', 0),
(324, '', 'bolsafinal.png', 0, '2021-09-16 10:42:16', 1, '', 0),
(325, '', 'carrito-bag5.png', 0, '2021-09-16 10:42:28', 1, '', 0),
(326, '', 'bolsafinal.png', 0, '2021-09-16 10:42:30', 1, '', 0),
(327, '', 'carrito-bag5.png', 0, '2021-09-16 10:42:57', 1, '', 0),
(328, '', 'bolsafinal.png', 0, '2021-09-16 10:43:00', 1, '', 0),
(329, '', 'bolsafinal.png', 0, '2021-09-16 10:43:22', 1, '', 0),
(330, '', 'carrito-bag5.png', 0, '2021-09-16 10:43:52', 1, '', 0),
(331, '', 'bolsafinal.png', 0, '2021-09-16 10:43:57', 1, '', 0),
(332, '', 'carrito-bag5.png', 0, '2021-09-16 10:44:22', 1, '', 0),
(333, '', 'carrito-car2.png', 0, '2021-09-16 10:44:30', 1, '', 0),
(334, '', 'carrito-bag5.png', 0, '2021-09-16 10:44:33', 1, '', 0),
(335, '', 'bolsafinal.png', 0, '2021-09-16 10:44:55', 1, '', 0),
(336, '', 'carrito-bag5.png', 0, '2021-09-16 10:44:58', 1, '', 0),
(337, '', 'carrito-car2.png', 0, '2021-09-16 10:45:03', 1, '', 0),
(338, '', 'bolsafinal.png', 0, '2021-09-16 10:45:07', 1, '', 0),
(339, '', 'bolsafinal.png', 0, '2021-09-16 10:45:16', 1, '', 0),
(340, '', 'bolsafinal.png', 0, '2021-09-16 10:45:45', 1, '', 0),
(341, '', 'carrito-bag5.png', 0, '2021-09-16 10:45:50', 1, '', 0),
(342, '', 'bolsafinal.png', 0, '2021-09-16 10:45:53', 1, '', 0),
(343, '', 'carrito-bag5.png', 0, '2021-09-16 10:46:17', 1, '', 0),
(344, '', 'carrito-bag5.png', 0, '2021-09-16 10:46:30', 1, '', 0),
(345, '', 'carrito-bag5.png', 0, '2021-09-16 10:46:31', 1, '', 0),
(346, '', 'carrito-bag5.png', 0, '2021-09-16 10:47:17', 1, '', 0),
(347, '', 'carrito-bag5.png', 0, '2021-09-16 10:47:21', 1, '', 0),
(348, '', 'bolsafinal.png', 0, '2021-09-16 10:47:24', 1, '', 0),
(349, '', 'carrito-car2.png', 0, '2021-09-16 10:47:27', 1, '', 0),
(350, '', 'carrito-car3.png', 0, '2021-09-16 10:47:31', 1, '', 0),
(351, '', 'bolsafinal.png', 0, '2021-09-16 10:48:09', 1, '', 0),
(352, '', 'carrito-bag5.png', 0, '2021-09-16 10:48:13', 1, '', 0),
(353, '', 'carrito-bag5.png', 0, '2021-09-16 10:49:06', 1, '', 0),
(354, '', 'bolsafinal.png', 0, '2021-09-16 10:49:10', 1, '', 0),
(355, '', 'carrito-bag5.png', 0, '2021-09-16 10:49:13', 1, '', 0),
(356, '', 'bolsafinal.png', 0, '2021-09-16 10:50:19', 1, '', 0),
(357, '', 'carrito-bag5.png', 0, '2021-09-16 10:51:41', 1, '', 0),
(358, '', 'bolsafinal.png', 0, '2021-09-16 10:52:20', 1, '', 0),
(359, '', 'carrito-bag5.png', 0, '2021-09-16 10:52:23', 1, '', 0),
(360, '', 'carrito-bag5.png', 0, '2021-09-16 10:54:23', 1, '', 0),
(361, '', 'bolsafinal.png', 0, '2021-09-16 10:56:05', 1, '', 0),
(362, '', 'carrito-bag5.png', 0, '2021-09-16 10:56:08', 1, '', 0),
(363, '', 'carrito-bag5.png', 0, '2021-09-16 10:56:30', 1, '', 0),
(364, '', 'bolsafinal.png', 0, '2021-09-16 10:56:35', 1, '', 0),
(365, '', 'carrito-bag5.png', 0, '2021-09-16 10:56:38', 1, '', 0),
(366, '', 'carrito-car2.png', 0, '2021-09-16 10:56:41', 1, '', 0),
(367, '', 'carrito-bag5.png', 0, '2021-09-16 10:57:13', 1, '', 0),
(368, '', 'carrito-bag5.png', 0, '2021-09-16 10:57:49', 1, '', 0),
(369, '', 'bolsafinal.png', 0, '2021-09-16 10:57:51', 1, '', 0),
(370, '', 'carrito-bag5.png', 0, '2021-09-16 10:57:54', 1, '', 0),
(371, '', 'carrito-bag5.png', 0, '2021-09-16 10:58:56', 1, '', 0),
(372, '', 'carrito-bag5.png', 0, '2021-09-16 10:59:20', 1, '', 0),
(373, '', 'bolsafinal.png', 0, '2021-09-16 10:59:30', 1, '', 0),
(374, '', 'carrito-bag5.png', 0, '2021-09-16 10:59:32', 1, '', 0),
(375, '', 'bolsafinal.png', 0, '2021-09-16 11:01:03', 1, '', 0),
(376, '', 'carrito-bag5.png', 0, '2021-09-16 11:01:06', 1, '', 0),
(377, '', 'bolsafinal.png', 0, '2021-09-16 11:01:26', 1, '', 0),
(378, '', 'bolsafinal.png', 0, '2021-09-16 11:01:45', 1, '', 0),
(379, '', 'carrito-bag5.png', 0, '2021-09-16 11:09:02', 1, '', 0),
(380, '', 'carrito-bag5.png', 0, '2021-09-16 11:09:08', 1, '', 0),
(381, '', 'carrito-bag5.png', 0, '2021-09-16 11:10:57', 1, '', 0),
(382, '', 'carrito-bag5.png', 0, '2021-09-16 11:10:58', 1, '', 0),
(383, '', 'bolsafinal.png', 0, '2021-09-16 11:11:01', 1, '', 0),
(384, '', 'carrito-bag5.png', 0, '2021-09-16 11:11:16', 1, '', 0),
(385, '', 'bolsafinal.png', 0, '2021-09-16 11:11:20', 1, '', 0),
(386, '', 'carrito-bag5.png', 0, '2021-09-16 11:11:34', 1, '', 0),
(387, '', 'carrito-bag5.png', 0, '2021-09-16 11:12:04', 1, '', 0),
(388, '', 'carrito-bag5.png', 0, '2021-09-16 11:12:06', 1, '', 0),
(389, '', 'carrito-bag5.png', 0, '2021-09-16 11:12:10', 1, '', 0),
(390, '', 'bolsafinal.png', 0, '2021-09-16 11:12:26', 1, '', 0),
(391, '', 'bolsafinal.png', 0, '2021-09-16 11:12:36', 1, '', 0),
(392, '', 'carrito-bag5.png', 0, '2021-09-16 11:12:43', 1, '', 0),
(393, '', 'carrito-bag5.png', 0, '2021-09-16 11:13:40', 1, '', 0),
(394, '', 'bolsafinal.png', 0, '2021-09-16 11:13:45', 1, '', 0),
(395, '', 'bolsafinal.png', 0, '2021-09-16 11:13:49', 1, '', 0),
(396, '', 'bolsafinal.png', 0, '2021-09-16 11:14:18', 1, '', 0),
(397, '', 'carrito-bag5.png', 0, '2021-09-16 11:14:20', 1, '', 0),
(398, '', 'carrito-bag5.png', 0, '2021-09-16 11:14:31', 1, '', 0),
(399, '', 'bolsafinal.png', 0, '2021-09-16 11:14:33', 1, '', 0),
(400, '', 'bolsafinal.png', 0, '2021-09-16 11:14:37', 1, '', 0),
(401, '', 'carrito-car2.png', 0, '2021-09-16 11:15:44', 1, '', 0),
(402, '', 'carrito-car2.png', 0, '2021-09-16 11:35:16', 1, '', 0),
(403, '', 'carrito-bag5.png', 0, '2021-09-16 11:35:19', 1, '', 0),
(404, '', 'bolsafinal.png', 0, '2021-09-16 11:39:11', 1, '', 0),
(405, '', 'carrito-car2.png', 0, '2021-09-16 11:39:16', 1, '', 0),
(406, '', 'bolsafinal.png', 0, '2021-09-16 13:28:27', 1, '', 0),
(407, '', 'carrito-bag5.png', 0, '2021-09-16 13:28:36', 1, '', 0),
(408, '', 'bolsafinal.png', 0, '2021-09-16 13:32:30', 1, '', 0),
(409, '', 'carrito-bag5.png', 0, '2021-09-16 13:32:34', 1, '', 0),
(410, '', 'carrito-bag7.png', 0, '2021-09-16 13:34:23', 1, '', 0),
(411, '', 'carrito-bag7.png', 0, '2021-09-16 13:34:50', 1, '', 0),
(412, '', 'carrito-bag7.png', 0, '2021-09-16 13:50:48', 1, '', 0),
(413, '', 'carrito-bag7.png', 0, '2021-09-16 13:55:22', 1, '', 0),
(414, '', 'carrito-bag7.png', 0, '2021-09-16 13:55:26', 1, '', 0),
(415, '', 'carrito-bag7.png', 0, '2021-09-16 13:56:12', 1, '', 0),
(416, '', 'carrito-bag7.png', 0, '2021-09-16 13:57:08', 1, '', 0),
(417, '', 'carrito-bag7.png', 0, '2021-09-16 13:57:22', 1, '', 0),
(418, '', 'carrito-bag7.png', 0, '2021-09-16 13:57:53', 1, '', 0),
(419, '', 'carrito-bag7.png', 0, '2021-09-16 13:58:23', 1, '', 0),
(420, '', 'carrito-bag7.png', 0, '2021-09-16 13:59:06', 1, '', 0),
(421, '', 'carrito-bag7.png', 0, '2021-09-16 13:59:15', 1, '', 0),
(422, '', 'carrito-bag7.png', 0, '2021-09-16 14:05:02', 1, '', 0),
(423, '', 'bolsafinal.png', 0, '2021-09-16 14:05:33', 1, '', 0),
(424, '', 'bolsafinal.png', 0, '2021-09-16 14:16:19', 1, '', 0),
(425, '', 'bolsafinal.png', 0, '2021-09-16 14:16:22', 1, '', 0),
(426, '', 'bolsafinal.png', 0, '2021-09-16 14:16:43', 1, '', 0),
(427, '', 'bolsafinal.png', 0, '2021-09-16 14:18:07', 1, '', 0),
(428, '', 'bolsafinal.png', 0, '2021-09-16 14:19:13', 1, '', 0),
(429, '', 'carrito-bag5.png', 0, '2021-09-16 14:27:08', 1, '', 0),
(430, '', 'carrito-bag5.png', 0, '2021-09-16 14:27:15', 1, '', 0),
(431, '', 'carrito-bag5.png', 0, '2021-09-16 14:27:19', 1, '', 0),
(432, '', 'carrito-bag5.png', 0, '2021-09-16 14:27:43', 1, '', 0),
(433, '', 'carrito-bag5.png', 0, '2021-09-16 14:27:46', 1, '', 0),
(434, '', 'carrito-bag5.png', 0, '2021-09-16 14:27:48', 1, '', 0),
(435, '', 'carrito-bag5.png', 0, '2021-09-16 14:27:49', 1, '', 0),
(436, '', 'carrito-bag5.png', 0, '2021-09-16 14:27:57', 1, '', 0),
(437, '', 'carrito-bag5.png', 0, '2021-09-16 14:28:19', 1, '', 0),
(438, '', 'bolsafinal.png', 0, '2021-09-16 14:28:29', 1, '', 0),
(439, '', 'bolsafinal.png', 0, '2021-09-16 14:28:33', 1, '', 0),
(440, '', 'carrito-bag5.png', 0, '2021-09-16 14:28:37', 1, '', 0),
(441, '', 'bolsafinal.png', 0, '2021-09-16 14:28:42', 1, '', 0),
(442, '', 'bolsafinal.png', 0, '2021-09-16 14:28:45', 1, '', 0),
(443, '', 'carrito-bag5.png', 0, '2021-09-16 14:29:02', 1, '', 0),
(444, '', 'carrito-bag5.png', 0, '2021-09-16 14:43:43', 1, '', 0),
(445, '', 'bolsafinal.png', 0, '2021-09-16 14:49:33', 1, '', 0),
(446, '', 'carrito-bag5.png', 0, '2021-09-16 14:49:36', 1, '', 0),
(447, '', 'carrito-bag5.png', 0, '2021-09-16 14:51:56', 1, '', 0),
(448, '', 'carrito-bag5.png', 0, '2021-09-16 14:52:51', 1, '', 0),
(449, '', 'bolsafinal.png', 0, '2021-09-16 14:53:45', 1, '', 0),
(450, '', 'carrito-bag5.png', 0, '2021-09-16 14:53:48', 1, '', 0),
(451, '', 'carrito-bag5.png', 0, '2021-09-16 14:54:19', 1, '', 0),
(452, '', 'bolsafinal.png', 0, '2021-09-16 14:55:37', 1, '', 0),
(453, '', 'carrito-bag5.png', 0, '2021-09-16 14:56:54', 1, '', 0),
(454, '', 'carrito-bag5.png', 0, '2021-09-16 14:58:07', 1, '', 0),
(455, '', 'bolsafinal.png', 0, '2021-09-16 15:01:47', 1, '', 0),
(456, '', 'bolsafinal.png', 0, '2021-09-16 15:02:15', 1, '', 0),
(457, '', 'bolsafinal.png', 0, '2021-09-16 15:02:40', 1, '', 0),
(458, '', 'bolsafinal.png', 0, '2021-09-16 15:06:24', 1, '', 0),
(459, '', 'carrito-car3.png', 0, '2021-09-16 15:10:44', 1, '', 0),
(460, '', 'carrito-car3.png', 0, '2021-09-16 15:12:37', 1, '', 0),
(461, '', 'bolsafinal.png', 0, '2021-09-16 15:15:51', 1, '', 0),
(462, '', 'carrito-bag5.png', 0, '2021-09-16 15:15:54', 1, '', 0),
(463, '', 'bolsafinal.png', 0, '2021-09-28 09:17:35', 1, '', 0),
(464, '', 'carrito-bag7.png', 0, '2021-09-28 09:21:19', 1, '', 0),
(465, '', 'bolsafinal.png', 0, '2021-09-28 09:31:33', 1, '', 0),
(466, '', 'carrito-bag7.png', 0, '2021-09-28 10:27:15', 1, '', 0),
(467, '', 'carrito-car2.png', 0, '2021-10-25 17:00:13', 1, '', 0),
(468, '', 'bolsafinal.png', 0, '2021-10-25 17:19:42', 1, '', 0),
(469, '', 'carrito-bag7.png', 0, '2021-12-01 10:54:05', 1, '', 0),
(470, '', 'bolsafinal.png', 0, '2021-12-01 13:41:54', 1, '', 0),
(471, '', 'carrito-bag7.png', 0, '2021-12-01 13:50:39', 1, '', 0),
(472, '', 'carrito-bag5.png', 0, '2021-12-01 13:50:42', 1, '', 0),
(473, '', 'bolsafinal.png', 0, '2021-12-01 13:52:04', 1, '', 0),
(474, '', 'carrito-car2.png', 0, '2021-12-01 14:06:39', 1, '', 0),
(475, '', 'carrito-car2.png', 0, '2021-12-01 14:07:20', 1, '', 0),
(476, '', 'bolsafinal.png', 0, '2021-12-01 14:08:30', 1, '', 0),
(477, '', 'carrito-car2.png', 0, '2021-12-01 14:08:57', 1, '', 0),
(478, '', 'carrito-car2.png', 0, '2021-12-01 14:09:38', 1, '', 0),
(479, '', 'carrito-car2.png', 0, '2021-12-01 14:10:14', 1, '', 0),
(480, '', 'carrito-car2.png', 0, '2021-12-01 14:11:06', 1, '', 0),
(481, '', 'carrito-car2.png', 0, '2021-12-01 14:12:42', 1, '', 0),
(482, '', 'carrito-car2.png', 0, '2021-12-01 14:13:55', 1, '', 0),
(483, '', 'carrito-car2.png', 0, '2021-12-01 14:14:49', 1, '', 0),
(484, '', 'carrito-car2.png', 0, '2021-12-01 14:18:01', 1, '', 0),
(485, '', 'carrito-car2.png', 0, '2021-12-01 14:19:02', 1, '', 0),
(486, '', 'carrito-car2.png', 0, '2021-12-01 14:19:36', 1, '', 0),
(487, '', 'carrito-car2.png', 0, '2021-12-01 14:19:40', 1, '', 0),
(488, '', 'carrito-car2.png', 0, '2021-12-01 14:20:27', 1, '', 0),
(489, '', 'carrito-car2.png', 0, '2021-12-01 14:20:46', 1, '', 0),
(490, '', 'carrito-car2.png', 0, '2021-12-01 14:21:14', 1, '', 0),
(491, '', 'carrito-car2.png', 0, '2021-12-01 14:22:22', 1, '', 0),
(492, '', 'carrito-car2.png', 0, '2021-12-01 14:24:00', 1, '', 0),
(493, '', 'carrito-car2.png', 0, '2021-12-01 14:24:05', 1, '', 0),
(494, '', 'carrito-bag5.png', 0, '2021-12-01 14:28:14', 1, '', 0),
(495, '', 'carrito-car2.png', 0, '2021-12-01 14:28:18', 1, '', 0),
(496, '', 'carrito-car2.png', 0, '2021-12-01 14:43:22', 1, '', 0),
(497, '', 'bolsafinal.png', 0, '2021-12-01 14:50:07', 1, '', 0),
(498, '', 'carrito-bag7.png', 0, '2021-12-01 14:55:36', 1, '', 0),
(499, '', 'carrito-bag7.png', 0, '2021-12-01 15:07:28', 1, '', 0),
(500, '', 'carrito-bag7.png', 0, '2021-12-01 15:07:32', 1, '', 0),
(501, '', 'carrito-bag7.png', 0, '2021-12-01 15:07:36', 1, '', 0),
(502, '', 'bolsafinal.png', 0, '2021-12-01 17:36:17', 1, '', 0),
(503, '', 'carrito-bag5.png', 0, '2021-12-01 17:36:23', 1, '', 0),
(504, '', 'carrito-bag5.png', 0, '2021-12-01 17:38:41', 1, '', 0),
(505, '', 'bolsafinal.png', 0, '2021-12-01 17:41:17', 1, '', 0),
(506, '', 'carrito-bag5.png', 0, '2021-12-01 17:41:27', 1, '', 0),
(507, '', 'bolsafinal.png', 0, '2021-12-01 17:42:21', 1, '', 0),
(508, '', 'carrito-bag5.png', 0, '2021-12-01 17:42:25', 1, '', 0),
(509, '', 'bolsafinal.png', 0, '2021-12-01 17:56:25', 1, '', 0),
(510, '', 'bolsafinal.png', 0, '2021-12-01 17:56:32', 1, '', 0),
(511, '', 'carrito-bag5.png', 0, '2021-12-02 08:54:08', 1, '', 0),
(512, '', 'carrito-bag7.png', 0, '2021-12-23 15:23:31', 1, '', 0),
(513, '', 'bolsafinal.png', 0, '2021-12-23 15:28:00', 1, '', 0),
(514, '', 'bolsafinal.png', 0, '2021-12-23 15:28:49', 1, '', 0),
(515, '', 'bolsafinal.png', 0, '2021-12-23 15:29:09', 1, '', 0),
(516, '', 'bolsafinal.png', 0, '2021-12-23 15:29:29', 1, '', 0),
(517, '', 'carrito-bag5.png', 0, '2021-12-23 15:29:47', 1, '', 0),
(518, '', 'carrito-bag7.png', 0, '2021-12-23 16:07:57', 1, '', 0),
(519, '', 'carrito-bag7.png', 0, '2021-12-23 16:08:41', 1, '', 0),
(520, '', 'bolsafinal.png', 0, '2021-12-23 16:09:48', 1, '', 0),
(521, '', 'bolsafinal.png', 0, '2021-12-23 16:10:56', 1, '', 0),
(522, '', 'carrito-bag5.png', 0, '2021-12-23 16:15:34', 1, '', 0),
(523, '', 'carrito-bag7.png', 0, '2021-12-23 16:17:41', 1, '', 0),
(524, '', 'carrito-bag5.png', 0, '2021-12-23 16:18:50', 1, '', 0),
(525, '', 'bolsafinal.png', 0, '2021-12-24 05:16:36', 1, '', 0),
(526, '', 'carrito-bag5.png', 0, '2021-12-24 05:18:26', 1, '', 0),
(527, '', 'carrito-bag5.png', 0, '2021-12-24 05:18:29', 1, '', 0),
(528, '', 'bolsafinal.png', 0, '2021-12-24 05:18:49', 1, '', 0),
(529, '', 'carrito-bag7.png', 0, '2021-12-24 05:19:21', 1, '', 0),
(530, '', 'bolsafinal.png', 0, '2022-01-12 20:16:49', 1, '', 0),
(531, '', 'carrito-bag7.png', 0, '2022-01-12 20:17:29', 1, '', 0),
(532, '', 'carrito-bag5.png', 0, '2022-01-12 20:19:38', 1, '', 0),
(533, '', 'carrito-bag5.png', 0, '2022-01-12 20:19:42', 1, '', 0),
(534, '', 'carrito-bag5.png', 0, '2022-01-12 20:19:49', 1, '', 0),
(535, '', 'carrito-bag7.png', 0, '2022-01-24 17:21:57', 1, '', 0),
(536, '', 'carrito-bag5.png', 0, '2022-02-01 13:34:02', 1, '', 0),
(537, '', 'carrito-bag7.png', 0, '2022-02-07 08:54:41', 1, '', 0),
(538, '', 'carrito-bag7.png', 0, '2022-02-07 09:54:36', 1, '', 0),
(539, '', 'bolsafinal.png', 0, '2022-02-07 09:54:45', 1, '', 0),
(540, '', 'carrito-bag5.png', 0, '2022-02-07 09:54:58', 1, '', 0),
(541, '', 'carrito-bag7.png', 0, '2022-02-07 09:55:41', 1, '', 0),
(542, '', 'bolsafinal.png', 0, '2022-02-07 09:56:05', 1, '', 0),
(543, '', 'carrito-bag7.png', 0, '2022-02-07 09:58:37', 1, '', 0),
(544, '', 'carrito-bag5.png', 0, '2022-02-07 09:58:54', 1, '', 0),
(545, '', 'carrito-bag7.png', 0, '2022-02-07 09:59:07', 1, '', 0),
(546, '', 'bolsafinal.png', 0, '2022-02-07 09:59:18', 1, '', 0),
(547, '', 'carrito-bag7.png', 0, '2022-02-07 13:22:57', 1, '', 0),
(548, '', 'carrito-bag7.png', 0, '2022-02-07 13:24:19', 1, '', 0),
(549, '', 'carrito-bag7.png', 0, '2022-02-07 13:24:27', 1, '', 0),
(550, '', 'carrito-bag7.png', 0, '2022-02-07 13:26:51', 1, '', 0),
(551, '', 'bolsafinal.png', 0, '2022-02-07 13:27:10', 1, '', 0),
(552, '', 'carrito-bag7.png', 0, '2022-02-07 13:32:44', 1, '', 0),
(553, '', 'carrito-bag7.png', 0, '2022-02-07 13:35:57', 1, '', 0),
(554, '', 'carrito-bag7.png', 0, '2022-02-07 13:39:14', 1, '', 0),
(555, '', 'carrito-bag7.png', 0, '2022-02-07 13:42:36', 1, '', 0),
(556, '', 'carrito-bag7.png', 0, '2022-02-07 13:42:51', 1, '', 0),
(557, '', 'carrito-bag7.png', 0, '2022-02-07 13:43:36', 1, '', 0),
(558, '', 'carrito-bag5.png', 0, '2022-02-07 13:46:42', 1, '', 0),
(559, '', 'bolsafinal.png', 0, '2022-02-07 13:47:00', 1, '', 0),
(560, '', 'carrito-bag7.png', 0, '2022-02-07 13:47:24', 1, '', 0),
(561, '', 'carrito-bag5.png', 0, '2022-02-07 13:47:39', 1, '', 0),
(562, '', 'carrito-bag5.png', 0, '2022-02-07 13:52:21', 1, '', 0),
(563, '', 'carrito-bag5.png', 0, '2022-02-07 13:52:52', 1, '', 0),
(564, '', 'carrito-bag5.png', 0, '2022-02-07 13:53:36', 1, '', 0),
(565, '', 'carrito-bag5.png', 0, '2022-02-07 13:53:44', 1, '', 0),
(566, '', 'carrito-bag5.png', 0, '2022-02-07 13:53:51', 1, '', 0),
(567, '', 'carrito-bag5.png', 0, '2022-02-07 13:54:17', 1, '', 0),
(568, '', 'carrito-bag5.png', 0, '2022-02-07 13:54:50', 1, '', 0),
(569, '', 'carrito-bag5.png', 0, '2022-02-07 13:55:21', 1, '', 0),
(570, '', 'carrito-bag5.png', 0, '2022-02-07 13:55:33', 1, '', 0),
(571, '', 'carrito-bag5.png', 0, '2022-02-07 13:55:59', 1, '', 0),
(572, '', 'carrito-bag5.png', 0, '2022-02-07 13:56:12', 1, '', 0),
(573, '', 'carrito-bag5.png', 0, '2022-02-07 13:56:33', 1, '', 0),
(574, '', 'carrito-bag5.png', 0, '2022-02-07 13:57:06', 1, '', 0),
(575, '', 'carrito-bag5.png', 0, '2022-02-07 13:57:36', 1, '', 0),
(576, '', 'carrito-bag5.png', 0, '2022-02-07 14:01:05', 1, '', 0),
(577, '', 'carrito-bag5.png', 0, '2022-02-07 14:01:43', 1, '', 0),
(578, '', 'carrito-bag5.png', 0, '2022-02-07 14:02:10', 1, '', 0),
(579, '', 'carrito-bag5.png', 0, '2022-02-07 14:03:07', 1, '', 0),
(580, '', 'carrito-bag5.png', 0, '2022-02-07 14:03:20', 1, '', 0),
(581, '', 'carrito-bag5.png', 0, '2022-02-07 14:03:24', 1, '', 0),
(582, '', 'carrito-bag5.png', 0, '2022-02-07 14:08:12', 1, '', 0),
(583, '', 'carrito-bag5.png', 0, '2022-02-07 14:10:44', 1, '', 0),
(584, '', 'carrito-bag5.png', 0, '2022-02-07 14:14:19', 1, '', 0),
(585, '', 'carrito-bag5.png', 0, '2022-02-07 14:14:43', 1, '', 0),
(586, '', 'carrito-bag5.png', 0, '2022-02-07 14:15:18', 1, '', 0),
(587, '', 'carrito-bag5.png', 0, '2022-02-07 14:16:51', 1, '', 0),
(588, '', 'carrito-bag5.png', 0, '2022-02-07 14:16:59', 1, '', 0),
(589, '', 'carrito-bag5.png', 0, '2022-02-07 14:22:53', 1, '', 0),
(590, '', 'carrito-bag5.png', 0, '2022-02-07 14:23:15', 1, '', 0),
(591, '', 'carrito-bag5.png', 0, '2022-02-07 14:26:51', 1, '', 0),
(592, '', 'carrito-bag5.png', 0, '2022-02-07 14:28:32', 1, '', 0),
(593, '', 'carrito-bag5.png', 0, '2022-02-07 14:35:26', 1, '', 0),
(594, '', 'carrito-bag5.png', 0, '2022-02-07 14:35:57', 1, '', 0),
(595, '', 'carrito-bag5.png', 0, '2022-02-07 14:36:03', 1, '', 0),
(596, '', 'carrito-bag5.png', 0, '2022-02-07 14:47:10', 1, '', 0),
(597, '', 'carrito-bag5.png', 0, '2022-02-07 14:48:15', 1, '', 0),
(598, '', 'carrito-bag5.png', 0, '2022-02-07 14:48:27', 1, '', 0),
(599, '', 'carrito-bag5.png', 0, '2022-02-07 14:48:33', 1, '', 0),
(600, '', 'carrito-bag5.png', 0, '2022-02-07 14:48:42', 1, '', 0),
(601, '', 'carrito-bag5.png', 0, '2022-02-07 14:49:58', 1, '', 0),
(602, '', 'carrito-bag5.png', 0, '2022-02-07 14:50:05', 1, '', 0),
(603, '', 'carrito-bag5.png', 0, '2022-02-07 14:50:12', 1, '', 0),
(604, '', 'carrito-bag5.png', 0, '2022-02-07 14:56:48', 1, '', 0),
(605, '', 'carrito-bag5.png', 0, '2022-02-07 14:56:48', 1, '', 0),
(606, '', 'carrito-bag5.png', 0, '2022-02-07 14:59:10', 1, '', 0),
(607, '', 'carrito-bag5.png', 0, '2022-02-07 14:59:16', 1, '', 0),
(608, '', 'carrito-bag5.png', 0, '2022-02-07 14:59:27', 1, '', 0),
(609, '', 'carrito-bag5.png', 0, '2022-02-07 14:59:49', 1, '', 0),
(610, '', 'carrito-bag5.png', 0, '2022-02-07 15:01:52', 1, '', 0),
(611, '', 'carrito-bag5.png', 0, '2022-02-07 15:02:05', 1, '', 0),
(612, '', 'carrito-bag5.png', 0, '2022-02-07 15:03:21', 1, '', 0),
(613, '', 'carrito-bag5.png', 0, '2022-02-07 15:03:33', 1, '', 0),
(614, '', 'carrito-bag5.png', 0, '2022-02-07 15:03:49', 1, '', 0),
(615, '', 'carrito-bag5.png', 0, '2022-02-07 15:04:09', 1, '', 0),
(616, '', 'carrito-bag5.png', 0, '2022-02-07 15:04:15', 1, '', 0),
(617, '', 'carrito-bag5.png', 0, '2022-02-07 15:04:21', 1, '', 0),
(618, '', 'carrito-bag5.png', 0, '2022-02-07 15:04:32', 1, '', 0),
(619, '', 'carrito-bag5.png', 0, '2022-02-07 15:05:41', 1, '', 0),
(620, '', 'carrito-bag5.png', 0, '2022-02-07 15:05:42', 1, '', 0),
(621, '', 'carrito-bag5.png', 0, '2022-02-07 15:05:49', 1, '', 0),
(622, '', 'carrito-bag5.png', 0, '2022-02-07 15:06:26', 1, '', 0),
(623, '', 'carrito-bag5.png', 0, '2022-02-07 15:07:01', 1, '', 0),
(624, '', 'carrito-bag5.png', 0, '2022-02-07 15:08:13', 1, '', 0),
(625, '', 'carrito-bag5.png', 0, '2022-02-07 15:09:17', 1, '', 0),
(626, '', 'carrito-bag5.png', 0, '2022-02-07 15:13:57', 1, '', 0),
(627, '', 'carrito-bag5.png', 0, '2022-02-07 15:15:08', 1, '', 0),
(628, '', 'carrito-bag5.png', 0, '2022-02-07 15:15:08', 1, '', 0),
(629, '', 'carrito-bag5.png', 0, '2022-02-07 15:15:35', 1, '', 0),
(630, '', 'carrito-bag5.png', 0, '2022-02-07 15:16:32', 1, '', 0),
(631, '', 'carrito-bag5.png', 0, '2022-02-07 15:18:04', 1, '', 0),
(632, '', 'carrito-bag5.png', 0, '2022-02-07 15:20:45', 1, '', 0),
(633, '', 'carrito-bag5.png', 0, '2022-02-07 15:21:28', 1, '', 0),
(634, '', 'carrito-bag5.png', 0, '2022-02-07 15:22:17', 1, '', 0),
(635, '', 'carrito-bag5.png', 0, '2022-02-07 15:23:13', 1, '', 0),
(636, '', 'carrito-bag5.png', 0, '2022-02-07 15:45:23', 1, '', 0),
(637, '', 'carrito-bag5.png', 0, '2022-02-07 15:46:06', 1, '', 0),
(638, '', 'carrito-bag5.png', 0, '2022-02-07 15:47:42', 1, '', 0),
(639, '', 'carrito-bag5.png', 0, '2022-02-07 15:47:47', 1, '', 0),
(640, '', 'carrito-bag5.png', 0, '2022-02-07 15:47:53', 1, '', 0),
(641, '', 'carrito-bag5.png', 0, '2022-02-07 15:49:01', 1, '', 0),
(642, '', 'carrito-bag5.png', 0, '2022-02-07 15:49:06', 1, '', 0),
(643, '', 'carrito-bag5.png', 0, '2022-02-07 15:49:15', 1, '', 0),
(644, '', 'carrito-bag5.png', 0, '2022-02-07 15:54:04', 1, '', 0),
(645, '', 'carrito-bag5.png', 0, '2022-02-07 15:54:23', 1, '', 0),
(646, '', 'carrito-bag5.png', 0, '2022-02-07 16:01:25', 1, '', 0),
(647, '', 'carrito-bag5.png', 0, '2022-02-07 16:02:46', 1, '', 0),
(648, '', 'carrito-bag5.png', 0, '2022-02-07 16:02:53', 1, '', 0),
(649, '', 'carrito-bag5.png', 0, '2022-02-07 16:02:59', 1, '', 0),
(650, '', 'carrito-bag5.png', 0, '2022-02-07 16:03:17', 1, '', 0),
(651, '', 'carrito-bag5.png', 0, '2022-02-07 16:06:27', 1, '', 0),
(652, '', 'carrito-bag5.png', 0, '2022-02-07 16:06:31', 1, '', 0),
(653, '', 'carrito-bag5.png', 0, '2022-02-07 16:06:33', 1, '', 0),
(654, '', 'carrito-bag5.png', 0, '2022-02-07 16:06:42', 1, '', 0),
(655, '', 'carrito-bag5.png', 0, '2022-02-07 16:06:48', 1, '', 0),
(656, '', 'carrito-bag5.png', 0, '2022-02-07 16:07:49', 1, '', 0),
(657, '', 'carrito-bag5.png', 0, '2022-02-07 16:07:57', 1, '', 0),
(658, '', 'carrito-bag5.png', 0, '2022-02-07 16:08:34', 1, '', 0),
(659, '', 'carrito-bag5.png', 0, '2022-02-07 16:10:35', 1, '', 0),
(660, '', 'carrito-bag5.png', 0, '2022-02-07 16:10:59', 1, '', 0),
(661, '', 'carrito-bag5.png', 0, '2022-02-07 16:11:07', 1, '', 0),
(662, '', 'carrito-bag5.png', 0, '2022-02-07 16:11:12', 1, '', 0),
(663, '', 'carrito-bag5.png', 0, '2022-02-07 16:11:14', 1, '', 0),
(664, '', 'carrito-bag5.png', 0, '2022-02-07 16:11:18', 1, '', 0),
(665, '', 'carrito-bag5.png', 0, '2022-02-07 16:11:21', 1, '', 0),
(666, '', 'carrito-bag5.png', 0, '2022-02-07 16:26:23', 1, '', 0),
(667, '', 'carrito-bag5.png', 0, '2022-02-07 16:29:22', 1, '', 0),
(668, '', 'carrito-bag5.png', 0, '2022-02-07 16:50:57', 1, '', 0),
(669, '', 'carrito-bag5.png', 0, '2022-02-07 16:57:03', 1, '', 0),
(670, '', 'carrito-bag5.png', 0, '2022-02-07 17:17:05', 1, '', 0),
(671, '', 'carrito-bag5.png', 0, '2022-02-07 17:18:19', 1, '', 0),
(672, '', 'carrito-bag5.png', 0, '2022-02-07 17:18:31', 1, '', 0),
(673, '', 'carrito-bag5.png', 0, '2022-02-07 17:18:53', 1, '', 0),
(674, '', 'carrito-bag5.png', 0, '2022-02-07 17:19:05', 1, '', 0),
(675, '', 'carrito-bag5.png', 0, '2022-02-07 17:19:26', 1, '', 0),
(676, '', 'carrito-bag5.png', 0, '2022-02-07 17:19:37', 1, '', 0),
(677, '', 'carrito-bag5.png', 0, '2022-02-07 17:51:08', 1, '', 0),
(678, '', 'carrito-bag5.png', 0, '2022-02-07 17:57:37', 1, '', 0),
(679, '', 'carrito-bag5.png', 0, '2022-02-07 17:58:08', 1, '', 0),
(680, '', 'carrito-bag5.png', 0, '2022-02-07 17:59:56', 1, '', 0),
(681, '', 'carrito-bag5.png', 0, '2022-02-07 18:08:10', 1, '', 0),
(682, '', 'carrito-bag5.png', 0, '2022-02-07 18:08:19', 1, '', 0),
(683, '', 'carrito-bag5.png', 0, '2022-02-07 18:08:26', 1, '', 0),
(684, '', 'carrito-bag5.png', 0, '2022-02-07 18:09:21', 1, '', 0),
(685, '', 'carrito-bag5.png', 0, '2022-02-07 18:47:05', 1, '', 0),
(686, '', 'carrito-bag5.png', 0, '2022-02-07 18:47:23', 1, '', 0),
(687, '', 'carrito-bag5.png', 0, '2022-02-07 18:48:01', 1, '', 0),
(688, '', 'carrito-bag5.png', 0, '2022-02-07 18:48:07', 1, '', 0),
(689, '', 'carrito-bag5.png', 0, '2022-02-07 18:48:11', 1, '', 0),
(690, '', 'carrito-bag5.png', 0, '2022-02-07 18:48:14', 1, '', 0),
(691, '', 'carrito-bag5.png', 0, '2022-02-07 18:48:17', 1, '', 0),
(692, '', 'carrito-bag5.png', 0, '2022-02-07 18:48:41', 1, '', 0),
(693, '', 'carrito-bag5.png', 0, '2022-02-07 18:49:14', 1, '', 0),
(694, '', 'carrito-bag5.png', 0, '2022-02-07 19:32:25', 1, '', 0),
(695, '', 'carrito-bag5.png', 0, '2022-02-07 21:19:17', 1, '', 0),
(696, '', 'carrito-bag5.png', 0, '2022-02-07 21:20:03', 1, '', 0),
(697, '', 'carrito-bag5.png', 0, '2022-02-07 21:24:18', 1, '', 0),
(698, '', 'carrito-bag5.png', 0, '2022-02-07 21:24:40', 1, '', 0),
(699, '', 'carrito-bag5.png', 0, '2022-02-07 21:24:48', 1, '', 0),
(700, '', 'carrito-bag5.png', 0, '2022-02-07 21:25:14', 1, '', 0),
(701, '', 'carrito-bag5.png', 0, '2022-02-08 04:38:06', 1, '', 0),
(702, '', 'carrito-bag5.png', 0, '2022-02-08 06:33:38', 1, '', 0),
(703, '', 'carrito-bag5.png', 0, '2022-02-08 07:14:14', 1, '', 0),
(704, '', 'carrito-bag5.png', 0, '2022-02-08 07:59:23', 1, '', 0),
(705, '', 'carrito-bag5.png', 0, '2022-02-08 10:42:35', 1, '', 0),
(706, '', 'carrito-bag5.png', 0, '2022-02-08 10:42:45', 1, '', 0),
(707, '', 'carrito-bag5.png', 0, '2022-02-08 10:45:19', 1, '', 0),
(708, '', 'carrito-bag5.png', 0, '2022-02-08 10:45:32', 1, '', 0),
(709, '', 'carrito-bag5.png', 0, '2022-02-08 10:48:47', 1, '', 0),
(710, '', 'carrito-bag5.png', 0, '2022-02-08 10:53:42', 1, '', 0),
(711, '', 'carrito-bag5.png', 0, '2022-02-08 10:53:58', 1, '', 0),
(712, '', 'carrito-bag5.png', 0, '2022-02-08 10:56:09', 1, '', 0),
(713, '', 'carrito-bag5.png', 0, '2022-02-08 11:03:59', 1, '', 0),
(714, '', 'carrito-bag5.png', 0, '2022-02-08 11:09:07', 1, '', 0),
(715, '', 'carrito-bag5.png', 0, '2022-02-08 11:10:18', 1, '', 0),
(716, '', 'carrito-bag5.png', 0, '2022-02-08 11:12:54', 1, '', 0),
(717, '', 'carrito-bag5.png', 0, '2022-02-08 11:14:14', 1, '', 0),
(718, '', 'carrito-bag5.png', 0, '2022-02-08 11:14:21', 1, '', 0),
(719, '', 'carrito-bag5.png', 0, '2022-02-08 11:14:27', 1, '', 0),
(720, '', 'carrito-bag5.png', 0, '2022-02-08 13:11:08', 1, '', 0),
(721, '', 'carrito-bag5.png', 0, '2022-11-02 13:44:38', 1, '', 0),
(722, '', 'carrito-bag5.png', 0, '2022-11-02 14:57:24', 1, '', 0),
(723, '', 'carrito-bag5.png', 0, '2022-11-02 14:57:27', 1, '', 0),
(724, '', 'carrito-bag5.png', 0, '2022-11-02 14:58:29', 1, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image_comprobante`
--

CREATE TABLE `image_comprobante` (
  `id` int(11) NOT NULL,
  `db` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tamano` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image_principal`
--

CREATE TABLE `image_principal` (
  `id` int(11) NOT NULL,
  `db` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tamano` varchar(1000) NOT NULL,
  `image` bigint(20) NOT NULL,
  `activado` bigint(5) NOT NULL,
  `movil` bigint(5) NOT NULL,
  `pc` bigint(5) NOT NULL,
  `imagefinal` bigint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image_principalactivar`
--

CREATE TABLE `image_principalactivar` (
  `id` int(11) NOT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `username` bigint(255) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `codigo` bigint(255) NOT NULL,
  `meses` bigint(255) NOT NULL,
  `rtt` varchar(255) DEFAULT NULL,
  `visible` bigint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `image_principalactivar`
--

INSERT INTO `image_principalactivar` (`id`, `firstname`, `username`, `password`, `email`, `codigo`, `meses`, `rtt`, `visible`) VALUES
(53, 'Habilitar', 962885, 'a2ed754fe9c012a6569b95cdac36f7bf', 'ceo@facturoe.com', 1, 30, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image_principalactivartema`
--

CREATE TABLE `image_principalactivartema` (
  `id` int(11) NOT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `username` bigint(255) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `codigo` bigint(255) NOT NULL,
  `meses` bigint(255) NOT NULL,
  `rtt` varchar(255) DEFAULT NULL,
  `visible` bigint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image_principaltema`
--

CREATE TABLE `image_principaltema` (
  `id` int(11) NOT NULL,
  `db` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tamano` varchar(1000) NOT NULL,
  `image` bigint(20) NOT NULL,
  `activado` bigint(5) NOT NULL,
  `movil` bigint(5) NOT NULL,
  `pc` bigint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image_tallas`
--

CREATE TABLE `image_tallas` (
  `id` int(11) NOT NULL,
  `db` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `codigo` bigint(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `imagen_principal` bigint(5) NOT NULL,
  `tamano` varchar(100) NOT NULL,
  `color_talla` bigint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `image_tallas`
--

INSERT INTO `image_tallas` (`id`, `db`, `nombre`, `codigo`, `fecha`, `imagen_principal`, `tamano`, `color_talla`) VALUES
(88, '85359842423231235', '24052021_42951.jpg', 82, '2021-05-24 01:05:18', 0, '', 0),
(108, '85359842423231235', '60be37e6e1b1c.jpg', 111, '0000-00-00 00:00:00', 0, '', 0),
(99, '85359842423231235', '60be350dd90b0.jpeg', 111, '0000-00-00 00:00:00', 0, '', 0),
(86, '85359842423231235', '24052021_4548.jpg', 82, '2021-05-24 01:05:21', 0, '', 0),
(87, '85359842423231235', '24052021_52334.jpg', 82, '2021-05-24 01:05:49', 0, '', 0),
(100, '85359842423231235', '60be3543d59b9.png', 111, '0000-00-00 00:00:00', 0, '', 0),
(127, '85359842423231235', '610d85158e2c1.png', 145, '0000-00-00 00:00:00', 0, '', 0),
(67, '85359842423231235', '08042021_81669.jpg', 362, '2021-04-08 01:04:40', 0, '', 0),
(64, '85359842423231235', '08042021_45747.jpg', 362, '2021-04-08 00:04:40', 0, '', 0),
(65, '85359842423231235', '08042021_33404.jpg', 362, '2021-04-08 01:04:12', 0, '', 0),
(62, '85359842423231235', '08042021_30814.jpg', 362, '2021-04-08 00:04:01', 0, '', 0),
(66, '85359842423231235', '08042021_28858.jpg', 362, '2021-04-08 01:04:23', 0, '', 0),
(128, '85359842423231235', '610d85589765c.png', 145, '0000-00-00 00:00:00', 0, '', 0),
(113, '85359842423231235', '60be396500c76.jpeg', 111, '0000-00-00 00:00:00', 0, '', 0),
(120, '85359842423231235', '610d805b320a1.png', 145, '0000-00-00 00:00:00', 0, '', 0),
(131, '85359842423231235', '61d5a55f7d1cb.jpg', 159, '0000-00-00 00:00:00', 0, '', 0),
(132, '85359842423231235', '61d5a571a4d2e.jpg', 159, '0000-00-00 00:00:00', 0, '', 0),
(133, '85359842423231235', '61d5a9df88b8e.jpg', 158, '0000-00-00 00:00:00', 0, '', 0),
(134, '85359842423231235', '61d5a9eb505dc.gif', 158, '0000-00-00 00:00:00', 0, '', 0),
(135, '85359842423231235', '61d5bb6e20a0f.jpg', 159, '0000-00-00 00:00:00', 0, '', 0),
(136, '85359842423231235', '61d5bb7e640e7.png', 159, '0000-00-00 00:00:00', 0, '', 0),
(139, '85359842423231235', '61f0665e50d66.png', 154, '0000-00-00 00:00:00', 0, '', 0),
(138, '85359842423231235', '61f0662447c0b.png', 154, '0000-00-00 00:00:00', 0, '', 0),
(140, '85359842423231235', '61f0666b05928.png', 154, '0000-00-00 00:00:00', 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image_tienda`
--

CREATE TABLE `image_tienda` (
  `id` int(11) NOT NULL,
  `db` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tamano` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `image_tienda`
--

INSERT INTO `image_tienda` (`id`, `db`, `nombre`, `codigo`, `fecha`, `tamano`) VALUES
(1, '', '#000000', 'boton', '2022-02-08 11:12:53', ''),
(2, '', '#2E1B8D', 'pie', '2022-02-08 11:12:53', ''),
(3, '', '#7F1778', 'color', '2022-02-08 11:12:53', ''),
(4, '', '#FF322F', 'piecolor', '2022-02-08 11:12:53', ''),
(5, '', '#FF322F', 'texto', '2022-02-08 11:12:53', ''),
(6, '', 'Bolsa', 'carro', '2022-02-08 11:12:53', ''),
(7, '', '#000000', 'boton', '2022-02-08 11:14:13', ''),
(8, '', '#2E1B8D', 'pie', '2022-02-08 11:14:13', ''),
(9, '', '#7F1778', 'color', '2022-02-08 11:14:13', ''),
(10, '', '#FF322F', 'piecolor', '2022-02-08 11:14:13', ''),
(11, '', '#FF322F', 'texto', '2022-02-08 11:14:13', ''),
(12, '', 'Bolsa', 'carro', '2022-02-08 11:14:13', ''),
(13, '', '#000000', 'boton', '2022-02-08 13:11:06', ''),
(14, '', '#2E1B8D', 'pie', '2022-02-08 13:11:06', ''),
(15, '', '#7F1778', 'color', '2022-02-08 13:11:06', ''),
(16, '', '#FF322F', 'piecolor', '2022-02-08 13:11:06', ''),
(17, '', '#FF322F', 'texto', '2022-02-08 13:11:06', ''),
(18, '', 'Bolsa', 'carro', '2022-02-08 13:11:06', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image_tiendacolores`
--

CREATE TABLE `image_tiendacolores` (
  `id` int(11) NOT NULL,
  `db` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tamano` varchar(1000) NOT NULL,
  `id_tmp` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `image_tiendacolores`
--

INSERT INTO `image_tiendacolores` (`id`, `db`, `nombre`, `codigo`, `fecha`, `tamano`, `id_tmp`) VALUES
(1, '', '#3C2FFF', 'color', '2021-07-21 16:33:26', '', '21-07-2021-22:33'),
(2, '', 'Bolsa', 'carro', '2021-07-21 16:33:26', '', '21-07-2021-22:33'),
(3, '', '#FFFFFF', 'texto', '2021-07-21 16:33:26', '', '21-07-2021-22:33'),
(4, '', '#FFFFFF', 'piecolor', '2021-07-21 16:33:26', '', '21-07-2021-22:33'),
(5, '', '#000000', 'color', '2021-07-21 16:33:26', '', '21-07-2021-22:33'),
(6, '', '#000000', 'pie', '2021-07-21 16:33:26', '', '21-07-2021-22:33'),
(7, '', '#000000', 'boton', '2021-07-21 16:33:26', '', '21-07-2021-22:33'),
(8, '', 'Bolsa', 'carro', '2021-07-21 17:08:19', '', '21-07-2021-23:08'),
(9, '', '#9DEAFF', 'texto', '2021-07-21 17:08:19', '', '21-07-2021-23:08'),
(10, '', '#131313', 'piecolor', '2021-07-21 17:08:19', '', '21-07-2021-23:08'),
(11, '', '#1828FF', 'color', '2021-07-21 17:08:19', '', '21-07-2021-23:08'),
(12, '', '#FFD45F', 'pie', '2021-07-21 17:08:19', '', '21-07-2021-23:08'),
(13, '', '#000000', 'boton', '2021-07-21 17:08:19', '', '21-07-2021-23:08'),
(14, '', '#131313', 'piecolor', '2021-07-21 17:08:19', '', '21-07-2021-23:08'),
(15, '', 'Bolsa', 'carro', '2021-07-21 17:23:20', '', '21-07-2021-23:23'),
(16, '', '#9DEAFF', 'texto', '2021-07-21 17:23:20', '', '21-07-2021-23:23'),
(17, '', '#131313', 'piecolor', '2021-07-21 17:23:20', '', '21-07-2021-23:23'),
(18, '', '#1828FF', 'color', '2021-07-21 17:23:20', '', '21-07-2021-23:23'),
(19, '', '#FFD45F', 'pie', '2021-07-21 17:23:20', '', '21-07-2021-23:23'),
(20, '', '#000000', 'boton', '2021-07-21 17:23:20', '', '21-07-2021-23:23'),
(21, '', '#131313', 'piecolor', '2021-07-21 17:23:20', '', '21-07-2021-23:23'),
(22, '', 'Bolsa', 'carro', '2021-07-21 17:23:26', '', '21-07-2021-23:23'),
(23, '', '#9DEAFF', 'texto', '2021-07-21 17:23:26', '', '21-07-2021-23:23'),
(24, '', '#131313', 'piecolor', '2021-07-21 17:23:26', '', '21-07-2021-23:23'),
(25, '', '#1828FF', 'color', '2021-07-21 17:23:26', '', '21-07-2021-23:23'),
(26, '', '#FFD45F', 'pie', '2021-07-21 17:23:26', '', '21-07-2021-23:23'),
(27, '', '#000000', 'boton', '2021-07-21 17:23:26', '', '21-07-2021-23:23'),
(28, '', '#131313', 'piecolor', '2021-07-21 17:23:26', '', '21-07-2021-23:23'),
(29, '', 'Bolsa', 'carro', '2021-07-21 17:26:13', '', '21-07-2021-23:26'),
(30, '', '#9DEAFF', 'texto', '2021-07-21 17:26:13', '', '21-07-2021-23:26'),
(31, '', '#131313', 'piecolor', '2021-07-21 17:26:13', '', '21-07-2021-23:26'),
(32, '', '#1828FF', 'color', '2021-07-21 17:26:13', '', '21-07-2021-23:26'),
(33, '', '#FFD45F', 'pie', '2021-07-21 17:26:13', '', '21-07-2021-23:26'),
(34, '', '#000000', 'boton', '2021-07-21 17:26:13', '', '21-07-2021-23:26'),
(35, '', '#131313', 'piecolor', '2021-07-21 17:26:13', '', '21-07-2021-23:26'),
(36, '', 'Bolsa', 'carro', '2021-07-21 17:26:15', '', '21-07-2021-23:26'),
(37, '', '#9DEAFF', 'texto', '2021-07-21 17:26:15', '', '21-07-2021-23:26'),
(38, '', '#131313', 'piecolor', '2021-07-21 17:26:15', '', '21-07-2021-23:26'),
(39, '', '#1828FF', 'color', '2021-07-21 17:26:15', '', '21-07-2021-23:26'),
(40, '', '#FFD45F', 'pie', '2021-07-21 17:26:15', '', '21-07-2021-23:26'),
(41, '', '#000000', 'boton', '2021-07-21 17:26:15', '', '21-07-2021-23:26'),
(42, '', '#131313', 'piecolor', '2021-07-21 17:26:15', '', '21-07-2021-23:26'),
(43, '', 'Bolsa', 'carro', '2021-07-21 17:28:21', '', '21-07-2021-23:28'),
(44, '', '#9DEAFF', 'texto', '2021-07-21 17:28:21', '', '21-07-2021-23:28'),
(45, '', '#131313', 'piecolor', '2021-07-21 17:28:21', '', '21-07-2021-23:28'),
(46, '', '#1828FF', 'color', '2021-07-21 17:28:21', '', '21-07-2021-23:28'),
(47, '', '#FFD45F', 'pie', '2021-07-21 17:28:21', '', '21-07-2021-23:28'),
(48, '', '#000000', 'boton', '2021-07-21 17:28:21', '', '21-07-2021-23:28'),
(49, '', '#131313', 'piecolor', '2021-07-21 17:28:21', '', '21-07-2021-23:28'),
(50, '', 'Bolsa', 'carro', '2021-07-21 17:28:37', '', '21-07-2021-23:28'),
(51, '', '#9DEAFF', 'texto', '2021-07-21 17:28:37', '', '21-07-2021-23:28'),
(52, '', '#131313', 'piecolor', '2021-07-21 17:28:37', '', '21-07-2021-23:28'),
(53, '', '#1828FF', 'color', '2021-07-21 17:28:37', '', '21-07-2021-23:28'),
(54, '', '#FFD45F', 'pie', '2021-07-21 17:28:37', '', '21-07-2021-23:28'),
(55, '', '#000000', 'boton', '2021-07-21 17:28:37', '', '21-07-2021-23:28'),
(56, '', '#131313', 'piecolor', '2021-07-21 17:28:37', '', '21-07-2021-23:28'),
(57, '', 'Bolsa', 'carro', '2021-07-21 17:30:53', '', '21-07-2021-23:30'),
(58, '', '#9DEAFF', 'texto', '2021-07-21 17:30:53', '', '21-07-2021-23:30'),
(59, '', '#131313', 'piecolor', '2021-07-21 17:30:53', '', '21-07-2021-23:30'),
(60, '', '#1828FF', 'color', '2021-07-21 17:30:53', '', '21-07-2021-23:30'),
(61, '', '#FFD45F', 'pie', '2021-07-21 17:30:53', '', '21-07-2021-23:30'),
(62, '', '#000000', 'boton', '2021-07-21 17:30:53', '', '21-07-2021-23:30'),
(63, '', '#131313', 'piecolor', '2021-07-21 17:30:53', '', '21-07-2021-23:30'),
(64, '', 'Bolsa', 'carro', '2021-07-21 17:36:06', '', '21-07-2021-23:36'),
(65, '', '#9DEAFF', 'texto', '2021-07-21 17:36:06', '', '21-07-2021-23:36'),
(66, '', '#131313', 'piecolor', '2021-07-21 17:36:06', '', '21-07-2021-23:36'),
(67, '', '#1828FF', 'color', '2021-07-21 17:36:06', '', '21-07-2021-23:36'),
(68, '', '#FFD45F', 'pie', '2021-07-21 17:36:06', '', '21-07-2021-23:36'),
(69, '', '#000000', 'boton', '2021-07-21 17:36:06', '', '21-07-2021-23:36'),
(70, '', '#131313', 'piecolor', '2021-07-21 17:36:06', '', '21-07-2021-23:36'),
(71, '', 'Bolsa', 'carro', '2021-07-21 17:36:08', '', '21-07-2021-23:36'),
(72, '', '#9DEAFF', 'texto', '2021-07-21 17:36:08', '', '21-07-2021-23:36'),
(73, '', '#131313', 'piecolor', '2021-07-21 17:36:08', '', '21-07-2021-23:36'),
(74, '', '#1828FF', 'color', '2021-07-21 17:36:08', '', '21-07-2021-23:36'),
(75, '', '#FFD45F', 'pie', '2021-07-21 17:36:08', '', '21-07-2021-23:36'),
(76, '', '#000000', 'boton', '2021-07-21 17:36:08', '', '21-07-2021-23:36'),
(77, '', '#131313', 'piecolor', '2021-07-21 17:36:08', '', '21-07-2021-23:36'),
(78, '', 'Bolsa', 'carro', '2021-07-21 17:37:28', '', '21-07-2021-23:37'),
(79, '', '#9DEAFF', 'texto', '2021-07-21 17:37:28', '', '21-07-2021-23:37'),
(80, '', '#131313', 'piecolor', '2021-07-21 17:37:28', '', '21-07-2021-23:37'),
(81, '', '#1828FF', 'color', '2021-07-21 17:37:28', '', '21-07-2021-23:37'),
(82, '', '#FFD45F', 'pie', '2021-07-21 17:37:28', '', '21-07-2021-23:37'),
(83, '', '#000000', 'boton', '2021-07-21 17:37:28', '', '21-07-2021-23:37'),
(84, '', '#131313', 'piecolor', '2021-07-21 17:37:28', '', '21-07-2021-23:37'),
(85, '', 'Bolsa', 'carro', '2021-07-21 17:37:39', '', '21-07-2021-23:37'),
(86, '', '#9DEAFF', 'texto', '2021-07-21 17:37:39', '', '21-07-2021-23:37'),
(87, '', '#131313', 'piecolor', '2021-07-21 17:37:39', '', '21-07-2021-23:37'),
(88, '', '#1828FF', 'color', '2021-07-21 17:37:39', '', '21-07-2021-23:37'),
(89, '', '#FFD45F', 'pie', '2021-07-21 17:37:39', '', '21-07-2021-23:37'),
(90, '', '#000000', 'boton', '2021-07-21 17:37:39', '', '21-07-2021-23:37'),
(91, '', '#131313', 'piecolor', '2021-07-21 17:37:39', '', '21-07-2021-23:37'),
(92, '', 'Bolsa', 'carro', '2021-07-21 17:37:46', '', '21-07-2021-23:37'),
(93, '', '#9DEAFF', 'texto', '2021-07-21 17:37:46', '', '21-07-2021-23:37'),
(94, '', '#131313', 'piecolor', '2021-07-21 17:37:46', '', '21-07-2021-23:37'),
(95, '', '#1828FF', 'color', '2021-07-21 17:37:46', '', '21-07-2021-23:37'),
(96, '', '#FFD45F', 'pie', '2021-07-21 17:37:46', '', '21-07-2021-23:37'),
(97, '', '#000000', 'boton', '2021-07-21 17:37:46', '', '21-07-2021-23:37'),
(98, '', '#131313', 'piecolor', '2021-07-21 17:37:46', '', '21-07-2021-23:37'),
(99, '', 'Bolsa', 'carro', '2021-07-21 18:54:17', '', '22-07-2021-00:54'),
(100, '', '#FFFFFF', 'texto', '2021-07-21 18:54:17', '', '22-07-2021-00:54'),
(101, '', '#FFFFFF', 'piecolor', '2021-07-21 18:54:17', '', '22-07-2021-00:54'),
(102, '', '#000000', 'color', '2021-07-21 18:54:17', '', '22-07-2021-00:54'),
(103, '', '#000000', 'pie', '2021-07-21 18:54:17', '', '22-07-2021-00:54'),
(104, '', '#000000', 'boton', '2021-07-21 18:54:17', '', '22-07-2021-00:54'),
(105, '', 'Bolsa', 'carro', '2021-07-21 18:54:17', '', '22-07-2021-00:54'),
(106, '', '#FF4360', 'texto', '2021-07-21 19:08:35', '', '22-07-2021-01:08'),
(107, '', '#7FFF58', 'color', '2021-07-21 19:08:35', '', '22-07-2021-01:08'),
(108, '', 'Bolsa', 'carro', '2021-07-21 19:08:35', '', '22-07-2021-01:08'),
(109, '', '#FFFFFF', 'texto', '2021-07-21 19:08:35', '', '22-07-2021-01:08'),
(110, '', '#FFFFFF', 'piecolor', '2021-07-21 19:08:35', '', '22-07-2021-01:08'),
(111, '', '#000000', 'color', '2021-07-21 19:08:35', '', '22-07-2021-01:08'),
(112, '', '#000000', 'pie', '2021-07-21 19:08:35', '', '22-07-2021-01:08'),
(113, '', '#5C70EF', 'color', '2021-07-21 19:10:37', '', '22-07-2021-01:10'),
(114, '', '#FFFFFF', 'texto', '2021-07-21 19:10:37', '', '22-07-2021-01:10'),
(115, '', '#FFFFFF', 'piecolor', '2021-07-21 19:10:37', '', '22-07-2021-01:10'),
(116, '', '#EF4F4F', 'color', '2021-07-21 19:10:37', '', '22-07-2021-01:10'),
(117, '', '#EF4F4F', 'pie', '2021-07-21 19:10:37', '', '22-07-2021-01:10'),
(118, '', '#8675A9', 'boton', '2021-07-21 19:10:37', '', '22-07-2021-01:10'),
(119, '', 'Bolsa', 'carro', '2021-07-21 19:10:37', '', '22-07-2021-01:10'),
(120, '', 'Bolsa', 'carro', '2021-07-27 22:43:21', '', '28-07-2021-04:43'),
(121, '', '#FFFFFF', 'texto', '2021-07-27 22:43:21', '', '28-07-2021-04:43'),
(122, '', '#FFFFFF', 'piecolor', '2021-07-27 22:43:21', '', '28-07-2021-04:43'),
(123, '', '#69FF31', 'color', '2021-07-27 22:43:21', '', '28-07-2021-04:43'),
(124, '', '#000000', 'pie', '2021-07-27 22:43:21', '', '28-07-2021-04:43'),
(125, '', '#000000', 'boton', '2021-07-27 22:43:21', '', '28-07-2021-04:43'),
(126, '', '#69FF31', 'color', '2021-07-27 22:43:21', '', '28-07-2021-04:43'),
(127, '', '#FF5A9A', 'texto', '2021-07-27 22:49:11', '', '28-07-2021-04:49'),
(128, '', '#2728FF', 'color', '2021-07-27 22:49:11', '', '28-07-2021-04:49'),
(129, '', 'Bolsa', 'carro', '2021-07-27 22:49:11', '', '28-07-2021-04:49'),
(130, '', '#FFFFFF', 'texto', '2021-07-27 22:49:11', '', '28-07-2021-04:49'),
(131, '', '#FFFFFF', 'piecolor', '2021-07-27 22:49:11', '', '28-07-2021-04:49'),
(132, '', '#69FF31', 'color', '2021-07-27 22:49:11', '', '28-07-2021-04:49'),
(133, '', '#000000', 'pie', '2021-07-27 22:49:11', '', '28-07-2021-04:49'),
(134, '', '#3C84FF', 'color', '2021-07-27 23:06:00', '', '28-07-2021-05:06'),
(135, '', 'Bolsa', 'carro', '2021-07-27 23:06:00', '', '28-07-2021-05:06'),
(136, '', '#FFFFFF', 'texto', '2021-07-27 23:06:00', '', '28-07-2021-05:06'),
(137, '', '#FFFFFF', 'piecolor', '2021-07-27 23:06:00', '', '28-07-2021-05:06'),
(138, '', '#000000', 'color', '2021-07-27 23:06:00', '', '28-07-2021-05:06'),
(139, '', '#000000', 'pie', '2021-07-27 23:06:00', '', '28-07-2021-05:06'),
(140, '', '#000000', 'boton', '2021-07-27 23:06:00', '', '28-07-2021-05:06'),
(141, '', '#FF318B', 'color', '2021-07-27 23:32:46', '', '28-07-2021-05:32'),
(142, '', '#3C84FF', 'color', '2021-07-27 23:32:46', '', '28-07-2021-05:32'),
(143, '', 'Bolsa', 'carro', '2021-07-27 23:32:46', '', '28-07-2021-05:32'),
(144, '', '#FFFFFF', 'texto', '2021-07-27 23:32:46', '', '28-07-2021-05:32'),
(145, '', '#FFFFFF', 'piecolor', '2021-07-27 23:32:46', '', '28-07-2021-05:32'),
(146, '', '#000000', 'color', '2021-07-27 23:32:46', '', '28-07-2021-05:32'),
(147, '', '#000000', 'pie', '2021-07-27 23:32:46', '', '28-07-2021-05:32'),
(148, '', '#3FEF50', 'color', '2021-09-16 13:59:36', '', '16-09-2021-19:59'),
(149, '', '#FFFFFF', 'texto', '2021-09-16 13:59:36', '', '16-09-2021-19:59'),
(150, '', '#FFFFFF', 'piecolor', '2021-09-16 13:59:36', '', '16-09-2021-19:59'),
(151, '', '#EF4F4F', 'color', '2021-09-16 13:59:36', '', '16-09-2021-19:59'),
(152, '', '#EF4F4F', 'pie', '2021-09-16 13:59:36', '', '16-09-2021-19:59'),
(153, '', '#8675A9', 'boton', '2021-09-16 13:59:36', '', '16-09-2021-19:59'),
(154, '', '#FFFFFF', 'texto', '2021-09-16 13:59:36', '', '16-09-2021-19:59'),
(155, '', '#F8FF2F', 'boton', '2021-12-23 16:06:23', '', '23-12-2021-21:06'),
(156, '', 'Bolsa', 'carro', '2021-12-23 16:06:23', '', '23-12-2021-21:06'),
(157, '', '#5243FF', 'texto', '2021-12-23 16:06:23', '', '23-12-2021-21:06'),
(158, '', '#5155FF', 'piecolor', '2021-12-23 16:06:23', '', '23-12-2021-21:06'),
(159, '', '#6BFF45', 'color', '2021-12-23 16:06:23', '', '23-12-2021-21:06'),
(160, '', '#FF54AA', 'pie', '2021-12-23 16:06:23', '', '23-12-2021-21:06'),
(161, '', '#000000', 'boton', '2021-12-23 16:06:23', '', '23-12-2021-21:06'),
(162, '', '#DC51FF', 'pie', '2022-01-12 20:22:11', '', '13-01-2022-01:22'),
(163, '', '#DC51FF', 'pie', '2022-01-12 20:22:11', '', '13-01-2022-01:22'),
(164, '', 'Bolsa', 'carro', '2022-01-12 20:22:11', '', '13-01-2022-01:22'),
(165, '', '#FFFFFF', 'texto', '2022-01-12 20:22:11', '', '13-01-2022-01:22'),
(166, '', '#FFFFFF', 'piecolor', '2022-01-12 20:22:11', '', '13-01-2022-01:22'),
(167, '', '#59F8FF', 'color', '2022-01-12 20:22:11', '', '13-01-2022-01:22'),
(168, '', '#000000', 'pie', '2022-01-12 20:22:11', '', '13-01-2022-01:22'),
(169, '', 'Bolsa', 'carro', '2022-02-07 09:58:28', '', '07-02-2022-14:58'),
(170, '', '#BCFF5C', 'texto', '2022-02-07 09:58:28', '', '07-02-2022-14:58'),
(171, '', '#FFFFFF', 'piecolor', '2022-02-07 09:58:28', '', '07-02-2022-14:58'),
(172, '', '#88FFC7', 'color', '2022-02-07 09:58:28', '', '07-02-2022-14:58'),
(173, '', '#000000', 'pie', '2022-02-07 09:58:28', '', '07-02-2022-14:58'),
(174, '', '#FFB779', 'boton', '2022-02-07 09:58:28', '', '07-02-2022-14:58'),
(175, '', 'Bolsa', 'carro', '2022-02-07 09:58:28', '', '07-02-2022-14:58'),
(176, '', 'Bolsa', 'carro', '2022-02-07 13:22:07', '', '07-02-2022-18:22'),
(177, '', '#BCFF5C', 'texto', '2022-02-07 13:22:07', '', '07-02-2022-18:22'),
(178, '', '#FFFFFF', 'piecolor', '2022-02-07 13:22:07', '', '07-02-2022-18:22'),
(179, '', '#88FFC7', 'color', '2022-02-07 13:22:07', '', '07-02-2022-18:22'),
(180, '', '#000000', 'pie', '2022-02-07 13:22:07', '', '07-02-2022-18:22'),
(181, '', '#FFB779', 'boton', '2022-02-07 13:22:07', '', '07-02-2022-18:22'),
(182, '', 'Bolsa', 'carro', '2022-02-07 13:22:07', '', '07-02-2022-18:22'),
(183, '', '#7C3BFF', 'color', '2022-02-07 13:22:34', '', '07-02-2022-18:22'),
(184, '', 'Bolsa', 'carro', '2022-02-07 13:22:34', '', '07-02-2022-18:22'),
(185, '', '#BCFF5C', 'texto', '2022-02-07 13:22:34', '', '07-02-2022-18:22'),
(186, '', '#FFFFFF', 'piecolor', '2022-02-07 13:22:34', '', '07-02-2022-18:22'),
(187, '', '#88FFC7', 'color', '2022-02-07 13:22:34', '', '07-02-2022-18:22'),
(188, '', '#000000', 'pie', '2022-02-07 13:22:34', '', '07-02-2022-18:22'),
(189, '', '#FFB779', 'boton', '2022-02-07 13:22:34', '', '07-02-2022-18:22'),
(190, '', '#FF92D4', 'boton', '2022-02-07 13:23:51', '', '07-02-2022-18:23'),
(191, '', '#96FFBA', 'piecolor', '2022-02-07 13:23:51', '', '07-02-2022-18:23'),
(192, '', '#FFD0BD', 'texto', '2022-02-07 13:23:51', '', '07-02-2022-18:23'),
(193, '', '#080411', 'color', '2022-02-07 13:23:51', '', '07-02-2022-18:23'),
(194, '', '#7C3BFF', 'color', '2022-02-07 13:23:51', '', '07-02-2022-18:23'),
(195, '', 'Bolsa', 'carro', '2022-02-07 13:23:51', '', '07-02-2022-18:23'),
(196, '', '#BCFF5C', 'texto', '2022-02-07 13:23:51', '', '07-02-2022-18:23'),
(197, '', '#FF92D4', 'boton', '2022-02-07 13:45:50', '', '07-02-2022-18:45'),
(198, '', '#96FFBA', 'piecolor', '2022-02-07 13:45:50', '', '07-02-2022-18:45'),
(199, '', '#FFD0BD', 'texto', '2022-02-07 13:45:50', '', '07-02-2022-18:45'),
(200, '', '#080411', 'color', '2022-02-07 13:45:50', '', '07-02-2022-18:45'),
(201, '', '#7C3BFF', 'color', '2022-02-07 13:45:50', '', '07-02-2022-18:45'),
(202, '', 'Bolsa', 'carro', '2022-02-07 13:45:50', '', '07-02-2022-18:45'),
(203, '', '#BCFF5C', 'texto', '2022-02-07 13:45:50', '', '07-02-2022-18:45'),
(204, '', '#FF92D4', 'boton', '2022-02-07 14:15:10', '', '07-02-2022-19:15'),
(205, '', '#96FFBA', 'piecolor', '2022-02-07 14:15:10', '', '07-02-2022-19:15'),
(206, '', '#FFD0BD', 'texto', '2022-02-07 14:15:10', '', '07-02-2022-19:15'),
(207, '', '#080411', 'color', '2022-02-07 14:15:10', '', '07-02-2022-19:15'),
(208, '', '#7C3BFF', 'color', '2022-02-07 14:15:10', '', '07-02-2022-19:15'),
(209, '', 'Bolsa', 'carro', '2022-02-07 14:15:10', '', '07-02-2022-19:15'),
(210, '', '#BCFF5C', 'texto', '2022-02-07 14:15:10', '', '07-02-2022-19:15'),
(211, '', '#FF92D4', 'boton', '2022-02-07 14:23:36', '', '07-02-2022-19:23'),
(212, '', '#96FFBA', 'piecolor', '2022-02-07 14:23:36', '', '07-02-2022-19:23'),
(213, '', '#FFD0BD', 'texto', '2022-02-07 14:23:36', '', '07-02-2022-19:23'),
(214, '', '#080411', 'color', '2022-02-07 14:23:36', '', '07-02-2022-19:23'),
(215, '', '#7C3BFF', 'color', '2022-02-07 14:23:36', '', '07-02-2022-19:23'),
(216, '', 'Bolsa', 'carro', '2022-02-07 14:23:36', '', '07-02-2022-19:23'),
(217, '', '#BCFF5C', 'texto', '2022-02-07 14:23:36', '', '07-02-2022-19:23'),
(218, '', '#FF92D4', 'boton', '2022-02-07 14:35:45', '', '07-02-2022-19:35'),
(219, '', '#96FFBA', 'piecolor', '2022-02-07 14:35:45', '', '07-02-2022-19:35'),
(220, '', '#FFD0BD', 'texto', '2022-02-07 14:35:45', '', '07-02-2022-19:35'),
(221, '', '#080411', 'color', '2022-02-07 14:35:45', '', '07-02-2022-19:35'),
(222, '', '#7C3BFF', 'color', '2022-02-07 14:35:45', '', '07-02-2022-19:35'),
(223, '', 'Bolsa', 'carro', '2022-02-07 14:35:45', '', '07-02-2022-19:35'),
(224, '', '#BCFF5C', 'texto', '2022-02-07 14:35:45', '', '07-02-2022-19:35'),
(225, '', '#FF92D4', 'boton', '2022-02-07 14:38:33', '', '07-02-2022-19:38'),
(226, '', '#96FFBA', 'piecolor', '2022-02-07 14:38:33', '', '07-02-2022-19:38'),
(227, '', '#FFD0BD', 'texto', '2022-02-07 14:38:33', '', '07-02-2022-19:38'),
(228, '', '#080411', 'color', '2022-02-07 14:38:33', '', '07-02-2022-19:38'),
(229, '', '#7C3BFF', 'color', '2022-02-07 14:38:33', '', '07-02-2022-19:38'),
(230, '', 'Bolsa', 'carro', '2022-02-07 14:38:33', '', '07-02-2022-19:38'),
(231, '', '#BCFF5C', 'texto', '2022-02-07 14:38:33', '', '07-02-2022-19:38'),
(232, '', '#FF92D4', 'boton', '2022-02-07 15:03:45', '', '07-02-2022-20:03'),
(233, '', '#96FFBA', 'piecolor', '2022-02-07 15:03:45', '', '07-02-2022-20:03'),
(234, '', '#FFD0BD', 'texto', '2022-02-07 15:03:45', '', '07-02-2022-20:03'),
(235, '', '#080411', 'color', '2022-02-07 15:03:45', '', '07-02-2022-20:03'),
(236, '', '#7C3BFF', 'color', '2022-02-07 15:03:45', '', '07-02-2022-20:03'),
(237, '', 'Bolsa', 'carro', '2022-02-07 15:03:45', '', '07-02-2022-20:03'),
(238, '', '#BCFF5C', 'texto', '2022-02-07 15:03:45', '', '07-02-2022-20:03'),
(239, '', '#FF92D4', 'boton', '2022-02-07 15:06:21', '', '07-02-2022-20:06'),
(240, '', '#96FFBA', 'piecolor', '2022-02-07 15:06:21', '', '07-02-2022-20:06'),
(241, '', '#FFD0BD', 'texto', '2022-02-07 15:06:21', '', '07-02-2022-20:06'),
(242, '', '#080411', 'color', '2022-02-07 15:06:21', '', '07-02-2022-20:06'),
(243, '', '#7C3BFF', 'color', '2022-02-07 15:06:21', '', '07-02-2022-20:06'),
(244, '', 'Bolsa', 'carro', '2022-02-07 15:06:21', '', '07-02-2022-20:06'),
(245, '', '#BCFF5C', 'texto', '2022-02-07 15:06:21', '', '07-02-2022-20:06'),
(246, '', '#FF92D4', 'boton', '2022-02-07 15:06:55', '', '07-02-2022-20:06'),
(247, '', '#96FFBA', 'piecolor', '2022-02-07 15:06:55', '', '07-02-2022-20:06'),
(248, '', '#FFD0BD', 'texto', '2022-02-07 15:06:55', '', '07-02-2022-20:06'),
(249, '', '#080411', 'color', '2022-02-07 15:06:55', '', '07-02-2022-20:06'),
(250, '', '#7C3BFF', 'color', '2022-02-07 15:06:55', '', '07-02-2022-20:06'),
(251, '', 'Bolsa', 'carro', '2022-02-07 15:06:55', '', '07-02-2022-20:06'),
(252, '', '#BCFF5C', 'texto', '2022-02-07 15:06:55', '', '07-02-2022-20:06'),
(253, '', '#FF92D4', 'boton', '2022-02-07 15:07:58', '', '07-02-2022-20:07'),
(254, '', '#96FFBA', 'piecolor', '2022-02-07 15:07:58', '', '07-02-2022-20:07'),
(255, '', '#FFD0BD', 'texto', '2022-02-07 15:07:58', '', '07-02-2022-20:07'),
(256, '', '#080411', 'color', '2022-02-07 15:07:58', '', '07-02-2022-20:07'),
(257, '', '#7C3BFF', 'color', '2022-02-07 15:07:58', '', '07-02-2022-20:07'),
(258, '', 'Bolsa', 'carro', '2022-02-07 15:07:58', '', '07-02-2022-20:07'),
(259, '', '#BCFF5C', 'texto', '2022-02-07 15:07:58', '', '07-02-2022-20:07'),
(260, '', '#FF92D4', 'boton', '2022-02-07 15:09:00', '', '07-02-2022-20:09'),
(261, '', '#96FFBA', 'piecolor', '2022-02-07 15:09:00', '', '07-02-2022-20:09'),
(262, '', '#FFD0BD', 'texto', '2022-02-07 15:09:00', '', '07-02-2022-20:09'),
(263, '', '#080411', 'color', '2022-02-07 15:09:00', '', '07-02-2022-20:09'),
(264, '', '#7C3BFF', 'color', '2022-02-07 15:09:00', '', '07-02-2022-20:09'),
(265, '', 'Bolsa', 'carro', '2022-02-07 15:09:00', '', '07-02-2022-20:09'),
(266, '', '#BCFF5C', 'texto', '2022-02-07 15:09:00', '', '07-02-2022-20:09'),
(267, '', '#FF92D4', 'boton', '2022-02-07 15:14:50', '', '07-02-2022-20:14'),
(268, '', '#96FFBA', 'piecolor', '2022-02-07 15:14:50', '', '07-02-2022-20:14'),
(269, '', '#FFD0BD', 'texto', '2022-02-07 15:14:50', '', '07-02-2022-20:14'),
(270, '', '#080411', 'color', '2022-02-07 15:14:50', '', '07-02-2022-20:14'),
(271, '', '#7C3BFF', 'color', '2022-02-07 15:14:50', '', '07-02-2022-20:14'),
(272, '', 'Bolsa', 'carro', '2022-02-07 15:14:50', '', '07-02-2022-20:14'),
(273, '', '#BCFF5C', 'texto', '2022-02-07 15:14:50', '', '07-02-2022-20:14'),
(274, '', '#FF92D4', 'boton', '2022-02-07 15:16:27', '', '07-02-2022-20:16'),
(275, '', '#96FFBA', 'piecolor', '2022-02-07 15:16:27', '', '07-02-2022-20:16'),
(276, '', '#FFD0BD', 'texto', '2022-02-07 15:16:27', '', '07-02-2022-20:16'),
(277, '', '#080411', 'color', '2022-02-07 15:16:27', '', '07-02-2022-20:16'),
(278, '', '#7C3BFF', 'color', '2022-02-07 15:16:27', '', '07-02-2022-20:16'),
(279, '', 'Bolsa', 'carro', '2022-02-07 15:16:27', '', '07-02-2022-20:16'),
(280, '', '#BCFF5C', 'texto', '2022-02-07 15:16:27', '', '07-02-2022-20:16'),
(281, '', '#FF92D4', 'boton', '2022-02-07 15:18:00', '', '07-02-2022-20:18'),
(282, '', '#96FFBA', 'piecolor', '2022-02-07 15:18:00', '', '07-02-2022-20:18'),
(283, '', '#FFD0BD', 'texto', '2022-02-07 15:18:00', '', '07-02-2022-20:18'),
(284, '', '#080411', 'color', '2022-02-07 15:18:00', '', '07-02-2022-20:18'),
(285, '', '#7C3BFF', 'color', '2022-02-07 15:18:00', '', '07-02-2022-20:18'),
(286, '', 'Bolsa', 'carro', '2022-02-07 15:18:00', '', '07-02-2022-20:18'),
(287, '', '#BCFF5C', 'texto', '2022-02-07 15:18:00', '', '07-02-2022-20:18'),
(288, '', '#FF92D4', 'boton', '2022-02-07 15:21:25', '', '07-02-2022-20:21'),
(289, '', '#96FFBA', 'piecolor', '2022-02-07 15:21:25', '', '07-02-2022-20:21'),
(290, '', '#FFD0BD', 'texto', '2022-02-07 15:21:25', '', '07-02-2022-20:21'),
(291, '', '#080411', 'color', '2022-02-07 15:21:25', '', '07-02-2022-20:21'),
(292, '', '#7C3BFF', 'color', '2022-02-07 15:21:25', '', '07-02-2022-20:21'),
(293, '', 'Bolsa', 'carro', '2022-02-07 15:21:25', '', '07-02-2022-20:21'),
(294, '', '#BCFF5C', 'texto', '2022-02-07 15:21:25', '', '07-02-2022-20:21'),
(295, '', '#FF92D4', 'boton', '2022-02-07 15:22:05', '', '07-02-2022-20:22'),
(296, '', '#96FFBA', 'piecolor', '2022-02-07 15:22:05', '', '07-02-2022-20:22'),
(297, '', '#FFD0BD', 'texto', '2022-02-07 15:22:05', '', '07-02-2022-20:22'),
(298, '', '#080411', 'color', '2022-02-07 15:22:05', '', '07-02-2022-20:22'),
(299, '', '#7C3BFF', 'color', '2022-02-07 15:22:05', '', '07-02-2022-20:22'),
(300, '', 'Bolsa', 'carro', '2022-02-07 15:22:05', '', '07-02-2022-20:22'),
(301, '', '#BCFF5C', 'texto', '2022-02-07 15:22:05', '', '07-02-2022-20:22'),
(302, '', '#FF92D4', 'boton', '2022-02-07 15:23:08', '', '07-02-2022-20:23'),
(303, '', '#96FFBA', 'piecolor', '2022-02-07 15:23:08', '', '07-02-2022-20:23'),
(304, '', '#FFD0BD', 'texto', '2022-02-07 15:23:08', '', '07-02-2022-20:23'),
(305, '', '#080411', 'color', '2022-02-07 15:23:08', '', '07-02-2022-20:23'),
(306, '', '#7C3BFF', 'color', '2022-02-07 15:23:08', '', '07-02-2022-20:23'),
(307, '', 'Bolsa', 'carro', '2022-02-07 15:23:08', '', '07-02-2022-20:23'),
(308, '', '#BCFF5C', 'texto', '2022-02-07 15:23:08', '', '07-02-2022-20:23'),
(309, '', '#FF92D4', 'boton', '2022-02-07 15:45:20', '', '07-02-2022-20:45'),
(310, '', '#96FFBA', 'piecolor', '2022-02-07 15:45:20', '', '07-02-2022-20:45'),
(311, '', '#FFD0BD', 'texto', '2022-02-07 15:45:20', '', '07-02-2022-20:45'),
(312, '', '#080411', 'color', '2022-02-07 15:45:20', '', '07-02-2022-20:45'),
(313, '', '#7C3BFF', 'color', '2022-02-07 15:45:20', '', '07-02-2022-20:45'),
(314, '', 'Bolsa', 'carro', '2022-02-07 15:45:20', '', '07-02-2022-20:45'),
(315, '', '#BCFF5C', 'texto', '2022-02-07 15:45:20', '', '07-02-2022-20:45'),
(316, '', '#FF92D4', 'boton', '2022-02-07 16:03:14', '', '07-02-2022-21:03'),
(317, '', '#96FFBA', 'piecolor', '2022-02-07 16:03:14', '', '07-02-2022-21:03'),
(318, '', '#FFD0BD', 'texto', '2022-02-07 16:03:14', '', '07-02-2022-21:03'),
(319, '', '#080411', 'color', '2022-02-07 16:03:14', '', '07-02-2022-21:03'),
(320, '', '#7C3BFF', 'color', '2022-02-07 16:03:14', '', '07-02-2022-21:03'),
(321, '', 'Bolsa', 'carro', '2022-02-07 16:03:14', '', '07-02-2022-21:03'),
(322, '', '#BCFF5C', 'texto', '2022-02-07 16:03:14', '', '07-02-2022-21:03'),
(323, '', '#FF92D4', 'boton', '2022-02-07 16:50:43', '', '07-02-2022-21:50'),
(324, '', '#96FFBA', 'piecolor', '2022-02-07 16:50:43', '', '07-02-2022-21:50'),
(325, '', '#FFD0BD', 'texto', '2022-02-07 16:50:43', '', '07-02-2022-21:50'),
(326, '', '#080411', 'color', '2022-02-07 16:50:43', '', '07-02-2022-21:50'),
(327, '', '#7C3BFF', 'color', '2022-02-07 16:50:43', '', '07-02-2022-21:50'),
(328, '', 'Bolsa', 'carro', '2022-02-07 16:50:43', '', '07-02-2022-21:50'),
(329, '', '#BCFF5C', 'texto', '2022-02-07 16:50:43', '', '07-02-2022-21:50'),
(330, '', '#FF92D4', 'boton', '2022-02-07 17:50:36', '', '07-02-2022-22:50'),
(331, '', '#96FFBA', 'piecolor', '2022-02-07 17:50:36', '', '07-02-2022-22:50'),
(332, '', '#FFD0BD', 'texto', '2022-02-07 17:50:36', '', '07-02-2022-22:50'),
(333, '', '#080411', 'color', '2022-02-07 17:50:36', '', '07-02-2022-22:50'),
(334, '', '#7C3BFF', 'color', '2022-02-07 17:50:36', '', '07-02-2022-22:50'),
(335, '', 'Bolsa', 'carro', '2022-02-07 17:50:36', '', '07-02-2022-22:50'),
(336, '', '#BCFF5C', 'texto', '2022-02-07 17:50:36', '', '07-02-2022-22:50'),
(337, '', '#FF92D4', 'boton', '2022-02-07 17:55:45', '', '07-02-2022-22:55'),
(338, '', '#96FFBA', 'piecolor', '2022-02-07 17:55:45', '', '07-02-2022-22:55'),
(339, '', '#FFD0BD', 'texto', '2022-02-07 17:55:45', '', '07-02-2022-22:55'),
(340, '', '#080411', 'color', '2022-02-07 17:55:45', '', '07-02-2022-22:55'),
(341, '', '#7C3BFF', 'color', '2022-02-07 17:55:45', '', '07-02-2022-22:55'),
(342, '', 'Bolsa', 'carro', '2022-02-07 17:55:45', '', '07-02-2022-22:55'),
(343, '', '#BCFF5C', 'texto', '2022-02-07 17:55:45', '', '07-02-2022-22:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image_tiendacoloreslista`
--

CREATE TABLE `image_tiendacoloreslista` (
  `id` int(11) NOT NULL,
  `db` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `activado` bigint(10) NOT NULL,
  `id_tmp` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `image_tiendacoloreslista`
--

INSERT INTO `image_tiendacoloreslista` (`id`, `db`, `nombre`, `codigo`, `fecha`, `activado`, `id_tmp`) VALUES
(38, '', '', '', '2022-02-07 15:21:25', 0, '07-02-2022-20:21'),
(33, '', '', '', '2022-02-07 15:07:58', 0, '07-02-2022-20:07'),
(34, '', '', '', '2022-02-07 15:09:00', 0, '07-02-2022-20:09'),
(35, '', '', '', '2022-02-07 15:14:50', 0, '07-02-2022-20:14'),
(36, '', '', '', '2022-02-07 15:16:27', 0, '07-02-2022-20:16'),
(37, '', '', '', '2022-02-07 15:18:00', 0, '07-02-2022-20:18'),
(39, '', '', '', '2022-02-07 15:22:05', 0, '07-02-2022-20:22'),
(42, '', '', '', '2022-02-07 16:03:14', 0, '07-02-2022-21:03'),
(41, '', '', '', '2022-02-07 15:45:20', 0, '07-02-2022-20:45'),
(43, '', '', '', '2022-02-07 16:50:43', 0, '07-02-2022-21:50'),
(44, '', '', '', '2022-02-07 17:50:36', 0, '07-02-2022-22:50'),
(45, '', '', '', '2022-02-07 17:55:45', 0, '07-02-2022-22:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image_tiendapruebas`
--

CREATE TABLE `image_tiendapruebas` (
  `id` int(11) NOT NULL,
  `db` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tamano` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `image_tiendapruebas`
--

INSERT INTO `image_tiendapruebas` (`id`, `db`, `nombre`, `codigo`, `fecha`, `tamano`) VALUES
(1, '', '#000000', 'boton', '2022-02-08 11:14:14', ''),
(2, '', '#000000', 'pie', '2022-02-08 11:14:14', ''),
(3, '', '#000000', 'color', '2022-02-08 11:14:14', ''),
(4, '', '#FFFFFF', 'piecolor', '2022-02-08 11:14:14', ''),
(5, '', '#FFFFFF', 'texto', '2022-02-08 11:14:14', ''),
(6, '', 'red', 'boton', '2022-02-08 11:14:21', ''),
(7, '', 'red', 'pie', '2022-02-08 11:14:21', ''),
(8, '', 'red', 'color', '2022-02-08 11:14:21', ''),
(9, '', '#FFFFFF', 'piecolor', '2022-02-08 11:14:21', ''),
(10, '', '#FFFFFF', 'texto', '2022-02-08 11:14:21', ''),
(11, '', '#FFB4B4', 'boton', '2022-02-08 11:14:27', ''),
(12, '', '#FFC1F3', 'pie', '2022-02-08 11:14:27', ''),
(13, '', '#FFC1F3', 'color', '2022-02-08 11:14:27', ''),
(14, '', '#FFFFFF', 'piecolor', '2022-02-08 11:14:27', ''),
(15, '', '#FFFFFF', 'texto', '2022-02-08 11:14:27', ''),
(16, '', '#000000', 'boton', '2022-02-08 13:11:08', ''),
(17, '', '#000000', 'pie', '2022-02-08 13:11:08', ''),
(18, '', '#000000', 'color', '2022-02-08 13:11:08', ''),
(19, '', '#FFFFFF', 'piecolor', '2022-02-08 13:11:08', ''),
(20, '', '#FFFFFF', 'texto', '2022-02-08 13:11:08', ''),
(21, '', 'red', 'boton', '2022-11-02 12:44:38', ''),
(22, '', 'red', 'pie', '2022-11-02 12:44:38', ''),
(23, '', 'red', 'color', '2022-11-02 12:44:38', ''),
(24, '', '#FFFFFF', 'piecolor', '2022-11-02 12:44:38', ''),
(25, '', '#FFFFFF', 'texto', '2022-11-02 12:44:38', ''),
(26, '', '#FFB0CF', 'color', '2022-11-02 13:57:24', ''),
(27, '', '#1DACFF', 'boton', '2022-11-02 13:58:29', ''),
(28, '', '#F0FF9D', 'piecolor', '2022-11-02 13:58:29', ''),
(29, '', '#F09BFF', 'pie', '2022-11-02 13:58:29', ''),
(30, '', '#FF9345', 'texto', '2022-11-02 13:58:29', ''),
(31, '', '#A3FF4D', 'color', '2022-11-02 13:58:29', ''),
(32, '', '#A3FF4D', 'color', '2022-11-02 13:58:29', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image_tiendavistaprevia`
--

CREATE TABLE `image_tiendavistaprevia` (
  `id` int(11) NOT NULL,
  `db` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tamano` varchar(1000) NOT NULL,
  `id_tmp` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorios`
--

CREATE TABLE `laboratorios` (
  `id` int(11) NOT NULL,
  `empresa` varchar(255) NOT NULL,
  `direccion` text NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `telefono` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `ciudad` text NOT NULL,
  `web` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `visitas` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista7`
--

CREATE TABLE `lista7` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `codigo` text NOT NULL,
  `precio_compra` bigint(255) NOT NULL,
  `precio_venta` bigint(255) NOT NULL,
  `cantidad` bigint(255) NOT NULL,
  `fecha` date NOT NULL,
  `visible` bigint(10) NOT NULL,
  `caracteristicas` varchar(2500) NOT NULL,
  `CodigoCat` varchar(20) NOT NULL,
  `CodSubcategoria` varchar(255) NOT NULL,
  `publicado` bigint(5) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `impuesto` bigint(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `medida` varchar(10) NOT NULL,
  `tiempo` bigint(100) NOT NULL,
  `comision` bigint(10) NOT NULL,
  `precio_lista_2` bigint(10) NOT NULL,
  `precio_lista_3` bigint(255) NOT NULL,
  `descuento_unitario` bigint(255) NOT NULL,
  `oferta` bigint(10) NOT NULL,
  `stock0` bigint(2) NOT NULL,
  `offimpuesto` bigint(10) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `precio_antes` bigint(100) NOT NULL,
  `imagen_principal` bigint(5) NOT NULL,
  `listaPrecioPrincipal` bigint(5) NOT NULL,
  `destacado` bigint(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `lista7`
--

INSERT INTO `lista7` (`id`, `descripcion`, `codigo`, `precio_compra`, `precio_venta`, `cantidad`, `fecha`, `visible`, `caracteristicas`, `CodigoCat`, `CodSubcategoria`, `publicado`, `categoria`, `impuesto`, `tipo`, `medida`, `tiempo`, `comision`, `precio_lista_2`, `precio_lista_3`, `descuento_unitario`, `oferta`, `stock0`, `offimpuesto`, `imagen`, `precio_antes`, `imagen_principal`, `listaPrecioPrincipal`, `destacado`) VALUES
(1, 'Cargador Celular Generico', '2432', 2000, 3000, -7, '0000-00-00', 0, '', '', '', 0, '', 2, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 1),
(7, 'Cable Iphone', '98798', 15000, 30000, 1000, '0000-00-00', 0, '', '', '', 0, '', 19, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista7elect`
--

CREATE TABLE `lista7elect` (
  `id` int(11) NOT NULL,
  `codigo_item` varchar(255) NOT NULL,
  `esquema_item` text NOT NULL,
  `codigo_unspc` text NOT NULL,
  `unidad_medida` text NOT NULL,
  `impuesto` text NOT NULL,
  `porcentaje` text NOT NULL,
  `fecha` date NOT NULL,
  `visible` bigint(10) NOT NULL,
  `caracteristicas` varchar(2500) NOT NULL,
  `CodigoCat` varchar(20) NOT NULL,
  `CodSubcategoria` varchar(255) NOT NULL,
  `publicado` bigint(5) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `comision` bigint(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_retenciones`
--

CREATE TABLE `lista_retenciones` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `tipo_ajuste` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `beneficiario` varchar(255) NOT NULL,
  `cuenta_banco` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `pagar_dia` bigint(255) NOT NULL,
  `pagar_cada` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `lista_retenciones`
--

INSERT INTO `lista_retenciones` (`id`, `numero`, `valor`, `descripcion`, `tipo_ajuste`, `nombre`, `direccion`, `concepto`, `beneficiario`, `cuenta_banco`, `fecha`, `pagar_dia`, `pagar_cada`) VALUES
(172, 0, '2.50', 'Impuesto', 'Retencion en la FUENTE', 'Compras generales (declarantes)', '860000', '', '', '', '2018-10-03 15:32:53', 0, 0),
(173, 0, '3.50', 'Impuesto', 'Retencion en la FUENTE', 'Compras generales (no declarantes)', '860000', '', '', '', '2018-10-03 15:32:53', 0, 0),
(174, 0, '1.50', 'Impuesto', 'Retencion en la FUENTE', 'Compras con tarjeta dÃ©bito o crÃ©dito', '100%', '', '', '', '2018-10-03 15:32:53', 0, 0),
(175, 0, '1.50', 'Impuesto', 'Retencion en la FUENTE', 'Compras de bienes o productos agrÃ­colas o pecuarios sin procesamiento industrial', '2931000', '', '', '', '2018-10-03 15:32:53', 0, 0),
(176, 0, '1.50', 'Impuesto', 'Retencion en la FUENTE', 'Compras de bienes o productos agrÃ­colas o pecuarios sin procesamiento industrial', '2931000', '', '', '', '2018-10-03 15:32:53', 0, 0),
(177, 0, '2.50', 'Impuesto', 'Retencion en la FUENTE', 'Compras de bienes o productos agrÃ­colas o pecuarios con procesamiento industrial (declarantes)', '860000', '', '', '', '2018-10-03 15:32:53', 0, 0),
(178, 0, '3.50', 'Impuesto', 'Retencion en la FUENTE', 'Compras de bienes o productos agrÃ­colas o pecuarios con procesamiento industrial declarantes (no declarantes))', '860000', '', '', '', '2018-10-03 15:32:53', 0, 0),
(179, 0, '0.50', 'Impuesto', 'Retencion en la FUENTE', 'Compras de cafÃ© pergamino o cereza', '5097000', '', '', '', '2018-10-03 15:32:53', 0, 0),
(180, 0, '0.10', 'Impuesto', 'Retencion en la FUENTE', 'Compras de combustibles derivados del petrÃ³leo', '100%', '', '', '', '2018-10-03 15:32:53', 0, 0),
(181, 0, '1', 'Impuesto', 'Retencion en la FUENTE', 'Compras de vehÃ­culos', '100%', '', '', '', '2018-10-03 15:32:53', 0, 0),
(182, 0, '1', 'Impuesto', 'Retencion en la FUENTE', 'Compras de bienes raÃ­ces cuya destinaciÃ³n y uso sea vivienda de habitaciÃ³n (por las primeras 20.000 UVT, es decir hasta $637.780.000)', '100%', '', '', '', '2018-10-03 15:32:53', 0, 0),
(183, 0, '2.50', 'Impuesto', 'Retencion en la FUENTE', 'Compras  de bienes raÃ­ces cuya destinaciÃ³n y uso sea vivienda de habitaciÃ³n (exceso de las primeras 20.000 UVT, es decir superior a $637.780.000)', '637180000', '', '', '', '2018-10-03 15:32:53', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medios_pago`
--

CREATE TABLE `medios_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `id_test` varchar(100) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `numero_cuenta` varchar(255) NOT NULL,
  `tipo_cuenta` text NOT NULL,
  `banco` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `activado` bigint(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `medios_pago`
--

INSERT INTO `medios_pago` (`id`, `nombre`, `id_test`, `id_user`, `numero_cuenta`, `tipo_cuenta`, `banco`, `user_pass`, `tipo`, `activado`) VALUES
(218, 'Transferencia bancaria', '3', '3', '34523454', 'ahorros', 'bancolom', '3', 'transferencia', 0),
(220, 'Wompi Bancolombia', '3', '3', '', '', '', '3', 'wompi', 0),
(221, 'Mercado Pago', '3', '3', '', '', '', '3', 'mercadopago', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medios_pagocontra`
--

CREATE TABLE `medios_pagocontra` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `id_test` varchar(100) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `numero_cuenta` varchar(255) NOT NULL,
  `tipo_cuenta` text NOT NULL,
  `banco` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `activado` bigint(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `medios_pagocontra`
--

INSERT INTO `medios_pagocontra` (`id`, `nombre`, `id_test`, `id_user`, `numero_cuenta`, `tipo_cuenta`, `banco`, `user_pass`, `tipo`, `activado`) VALUES
(220, 'Wompi Bancolombia', '3', '3', '', '', '', '3', 'wompi', 0),
(221, 'Mercado Pago', '3', '3', '', '', '', '3', 'mercadopago', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `numero` varchar(5000) NOT NULL,
  `celu` varchar(100) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `fecha2` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina`
--

CREATE TABLE `nomina` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `numero_cuenta` varchar(255) NOT NULL,
  `dias` bigint(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `valor` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_credito`
--

CREATE TABLE `notas_credito` (
  `id` int(11) NOT NULL,
  `numero_nota` bigint(255) NOT NULL,
  `beneficiario` varchar(255) NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `valor` bigint(255) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `observaciones` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `pagada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `notas_credito`
--

INSERT INTO `notas_credito` (`id`, `numero_nota`, `beneficiario`, `identificacion`, `telefono`, `direccion`, `valor`, `concepto`, `observaciones`, `fecha`, `pagada`) VALUES
(161, 1, 'carlos perez', '57', 'Sabaneta', '32908238472', 1000000, 'devolucion de factura 23', 'undefined', '2018-09-03 10:58:52', '0000-00-00 00:00:00'),
(162, 2, 'carlos perez', '57', 'Sabaneta', '32908238472', 100000, 'devolucin 100 pedales', 'undefined', '2018-09-27 09:51:23', '0000-00-00 00:00:00'),
(163, 3, 'Dany Gutierrez Hernandez', '', '', '', 45000, ' Devolucion documento No 10000  - Entrada Inventario No 96', 'undefined', '2021-04-09 08:09:10', '2021-04-14 08:07:49'),
(164, 4, 'carlos3', '', '', '', 20000, ' Devolucion documento No 9898798  - Entrada Inventario No 106', 'undefined', '2021-11-23 17:52:06', '0000-00-00 00:00:00'),
(165, 5, 'carlos3', '', '', '', 10000, ' Devolucion documento No 4354325  - Entrada Inventario No 107', 'undefined', '2021-11-23 17:53:45', '0000-00-00 00:00:00'),
(166, 6, 'carlos3', '', '', '', 40000, ' Devolucion documento No 45234235  - Entrada Inventario No 108', 'undefined', '2021-11-24 08:46:34', '0000-00-00 00:00:00'),
(167, 7, 'carlos3', '', '', '', 20000, ' Devolucion documento No 23  - Entrada Inventario No 110', 'undefined', '2021-11-25 16:19:10', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_debito`
--

CREATE TABLE `notas_debito` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `proveedor` varchar(255) NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `observaciones` varchar(500) NOT NULL,
  `valor_total` bigint(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `notas_debito`
--

INSERT INTO `notas_debito` (`id`, `numero`, `proveedor`, `identificacion`, `telefono`, `direccion`, `observaciones`, `valor_total`, `fecha`, `estado`) VALUES
(132, 1, 'carlos perez suares', '89798798', '28937409238', 'Sabaneta', 'devolcuoion dmercancia', 10000, '2018-09-03 10:53:38', 'Cobrada'),
(133, 2, 'carlos perez suares', '89798798', '28937409238', 'Sabaneta', 'devolucion por mercancia', 10000, '2018-09-12 10:19:42', 'Cobrada'),
(134, 3, 'carlos perez suares', '89798798', '28937409238', 'Sabaneta', 'devolucion peda', 10000, '2018-09-27 09:45:14', 'Cobrada'),
(135, 4, 'Emunah Shelemah', '97898798', 'email@facturoe.com', 'medellin', 'dgtererytr', 100000, '2021-04-09 14:32:30', ''),
(136, 5, 'Emunah Shelemah', '97898798', 'email@facturoe.com', 'medellin', 'dgtererytr', 100000, '2021-04-09 14:34:26', ''),
(137, 6, 'Juan Camilo Sandoval', '97898798', 'email@facturoe.com', 'medellin', 'werewr', 222, '2021-04-09 14:52:57', ''),
(138, 7, 'Emunah Shelemah', '97898798', 'email@facturoe.com', 'medellin', 'qweqwe', 10000, '2021-04-09 14:53:54', ''),
(139, 8, 'Emunah Shelemah', '97898798', 'email@facturoe.com', 'medellin', 'sdaf', 1000, '2021-04-09 14:54:42', ''),
(140, 9, 'direcciÃ³n', '234234', '', 'direcciÃ³n', 'sdaf', 1000, '2021-04-09 14:55:58', 'Cobrada'),
(141, 10, 'direcciÃ³n', '234234', '', 'direcciÃ³n', 'r', 10000, '2021-04-09 15:07:11', 'Cobrada'),
(142, 11, 'carlos3', '', '2231', 'dir', 'dgfds', 330000, '2021-11-22 17:50:03', 'Cobrada'),
(143, 12, 'carlos3', '', '2231', 'dir', 'asdasd', 200000, '2021-11-23 10:54:06', 'Cobrada'),
(144, 13, 'carlos3', '', '2231', 'dir', 'asdasd', 200000, '2021-11-23 10:55:24', 'Cobrada'),
(145, 14, 'carlos3', '', '2231', 'dir', 'dasfd', 4000, '2021-11-23 10:57:26', 'Cobrada'),
(146, 15, 'carlos3', '', '2231', 'dir', 'sfsdf', 100000, '2021-11-23 10:59:50', 'Cobrada'),
(147, 16, 'carlos3', '', '2231', 'dir', '29', 10000, '2021-11-23 11:10:45', 'Cobrada'),
(148, 17, 'carlos3', '', '2231', 'dir', '29', 10000, '2021-11-23 11:12:03', 'Cobrada'),
(149, 18, 'carlos3', '', '2231', 'dir', '25', 1000, '2021-11-23 18:40:29', 'Cobrada'),
(150, 19, 'carlos3', '', '2231', 'dir', '25', 30000, '2021-11-25 15:22:31', 'Cobrada'),
(151, 20, 'AndrÃ©s Velez', '23413', '', '', '24', 1000000, '2021-11-30 13:21:55', 'Cobrada'),
(152, 21, 'nombres y apellidos', 'No. IdentificaciÃ³n', 'telÃ©fono', 'direcciÃ³n', '46', 100000, '2021-12-16 14:39:03', 'Cobrada'),
(153, 22, 'carlos3', '', '2231', 'dir', '24', 100000, '2022-02-03 07:42:00', ''),
(154, 23, 'carlos3', '', '2231', 'dir', '21', 100000, '2022-02-03 07:42:42', 'Cobrada'),
(155, 24, 'carlos3', '', '2231', 'dir', '3', 10000, '2022-02-04 14:20:33', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenesservicio`
--

CREATE TABLE `ordenesservicio` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `numero_factura` bigint(255) NOT NULL,
  `recibido_de` varchar(255) NOT NULL,
  `concepto` varchar(5000) NOT NULL,
  `valor` bigint(255) NOT NULL,
  `forma_pago` varchar(255) NOT NULL,
  `numero_transferencia` varchar(255) NOT NULL,
  `numero_cheque` varchar(255) NOT NULL,
  `banco` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `observaciones` varchar(5000) NOT NULL,
  `cuenta_banco` varchar(255) NOT NULL,
  `anulada` bigint(255) NOT NULL,
  `estado` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ordenesservicio`
--

INSERT INTO `ordenesservicio` (`id`, `numero`, `numero_factura`, `recibido_de`, `concepto`, `valor`, `forma_pago`, `numero_transferencia`, `numero_cheque`, `banco`, `fecha`, `observaciones`, `cuenta_banco`, `anulada`, `estado`) VALUES
(129, 1, 0, 'Andres Pelaez', 'kajhsd asjhdgas asjhdgas asgdf dsaufgsda fuyasdgf', 10, '09809', '098098', 'adrdsd@gmail.com', '89009', '2018-05-04 15:59:46', '', '', 1, 1),
(130, 2, 0, 'Andres Pelaez', 'ghjasgd jhasgd asjhgdas ajhgsgdasj bb asjghd8qwye98q asdgjajhsdbznbcx zhxvc zhzd hdvavdsamdkauq q duqkwdkadasdj  dashjd axahwb wadwhja', 0, '09809', '098098', 'adrdsd@gmail.com', '89009', '2018-05-04 16:04:38', '', '', 1, 1),
(131, 3, 0, 'Andres Pelaez', 'dsafads', 10, 'telefono', 'Sabaneta', 'adrdsd@gmail.com', '89009', '2018-05-08 09:37:46', '', '', 1, 1),
(132, 4, 0, 'Andres Pelaez', 'asdfs', 4, 'telefono', 'Sabaneta', 'adrdsd@gmail.com', 'undefined', '2018-05-28 17:21:55', '', '', 1, 1),
(133, 5, 0, 'Andres Pelaez', 'das', 2, 'telefono', 'Sabaneta', 'adrdsd@gmail.com', 'undefined', '2018-05-28 17:27:35', '', '', 1, 1),
(134, 6, 0, 'Andres Pelaez', 'SDFASDF', 3, 'telefono', 'Sabaneta', 'adrdsd@gmail.com', 'undefined', '2018-05-28 17:42:29', '', '', 1, 0),
(135, 7, 0, 'Andres Pelaez', 'wfsfdf', 1, 'telefono', 'Sabaneta', 'adrdsd@gmail.com', 'undefined', '2018-05-28 17:44:07', 'asdkjhaskjhd', '', 1, 1),
(136, 8, 0, 'Andres Pelaez', 'werwer', 1, 'telefono', 'Sabaneta', 'adrdsd@gmail.com', 'undefined', '2018-05-28 17:47:07', 'sdsafasfasd', '', 0, 0),
(137, 9, 0, 'carlos perez', 'biciltea sfre shgfs dhgs sh d, spar manterimjenti', 0, '32908238472', 'Sabaneta', '21312@gmail.com', 'undefined', '2018-09-27 09:21:00', 'hay que cambiar pedales, cambiar llanta costo 40.000', 'jorge Gomez', 0, 1),
(138, 10, 0, 'carlos perez', 'Deja su Gafa para poner tornillos ', 5000, '32908238472', 'Sabaneta', '21312@gmail.com', '57', '2018-10-09 10:37:33', 'No se pudo reparar se devuelve y solo se cobra revisiÃ³n ', '', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `osremisiones`
--

CREATE TABLE `osremisiones` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `come` varchar(5000) NOT NULL,
  `celu` varchar(100) NOT NULL,
  `nit` varchar(255) NOT NULL,
  `num` bigint(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `fecha2` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ostemporal`
--

CREATE TABLE `ostemporal` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `come` varchar(5000) NOT NULL,
  `celu` varchar(100) NOT NULL,
  `nit` varchar(255) NOT NULL,
  `num` bigint(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `fecha2` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ostemporalclientes`
--

CREATE TABLE `ostemporalclientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nit` varchar(5000) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `num` bigint(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `fecha2` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ostemporalclientes`
--

INSERT INTO `ostemporalclientes` (`id`, `nombre`, `nit`, `direccion`, `email`, `num`, `telefono`, `ciudad`, `vencimiento`, `impuesto`, `nota`, `descuento`, `dolar`, `retefuente`, `fecha`, `usuario`, `visible`, `fecha2`) VALUES
(1, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 15:10:18', '', 0, '0000-00-00'),
(2, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 19:06:34', '', 0, '0000-00-00'),
(3, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 20:01:45', '', 0, '0000-00-00'),
(4, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 20:01:53', '', 0, '0000-00-00'),
(5, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 20:01:56', '', 0, '0000-00-00'),
(6, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:06:30', '', 0, '0000-00-00'),
(7, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:06:37', '', 0, '0000-00-00'),
(8, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:07:03', '', 0, '0000-00-00'),
(9, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:24:55', '', 0, '0000-00-00'),
(10, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:25:14', '', 0, '0000-00-00'),
(11, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:25:17', '', 0, '0000-00-00'),
(12, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:25:22', '', 0, '0000-00-00'),
(13, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:25:50', '', 0, '0000-00-00'),
(14, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:26:58', '', 0, '0000-00-00'),
(15, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:27:20', '', 0, '0000-00-00'),
(16, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:27:52', '', 0, '0000-00-00'),
(17, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:28:10', '', 0, '0000-00-00'),
(18, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:28:19', '', 0, '0000-00-00'),
(19, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:29:54', '', 0, '0000-00-00'),
(20, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:30:00', '', 0, '0000-00-00'),
(21, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:30:42', '', 0, '0000-00-00'),
(22, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:30:45', '', 0, '0000-00-00'),
(23, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:30:46', '', 0, '0000-00-00'),
(24, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:31:04', '', 0, '0000-00-00'),
(25, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:31:06', '', 0, '0000-00-00'),
(26, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:33:48', '', 0, '0000-00-00'),
(27, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:34:37', '', 0, '0000-00-00'),
(28, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:36:58', '', 0, '0000-00-00'),
(29, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:37:37', '', 0, '0000-00-00'),
(30, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:37:46', '', 0, '0000-00-00'),
(31, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:37:50', '', 0, '0000-00-00'),
(32, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:37:58', '', 0, '0000-00-00'),
(33, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:38:18', '', 0, '0000-00-00'),
(34, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:38:36', '', 0, '0000-00-00'),
(35, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:38:45', '', 0, '0000-00-00'),
(36, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:40:09', '', 0, '0000-00-00'),
(37, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:40:31', '', 0, '0000-00-00'),
(38, 'qwe', '', '', '', 0, 'qwe', '', '', '', '', '', '', 0, '2024-08-05 23:40:43', '', 0, '0000-00-00'),
(39, 'qwe', '', '', '', 0, 'qwe', '', '', '', '', '', '', 0, '2024-08-05 23:40:44', '', 0, '0000-00-00'),
(40, 'qwe', '', '', '', 0, 'qwe', '', '', '', '', '', '', 0, '2024-08-05 23:40:46', '', 0, '0000-00-00'),
(41, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:41:04', '', 0, '0000-00-00'),
(42, 'Andres Perez', '', '', '', 0, 'Andres Perez', '', '', '', '', '', '', 0, '2024-08-05 23:41:08', '', 0, '0000-00-00'),
(43, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:41:39', '', 0, '0000-00-00'),
(44, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-05 23:41:41', '', 0, '0000-00-00'),
(45, 'Andres Perez', '', '', '', 0, 'Andres Perez', '', '', '', '', '', '', 0, '2024-08-05 23:41:45', '', 0, '0000-00-00'),
(46, 'Andres Perez', '', '', '', 0, 'Andres Perez', '', '', '', '', '', '', 0, '2024-08-05 23:42:28', '', 0, '0000-00-00'),
(47, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 02:56:42', '', 0, '0000-00-00'),
(48, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 02:56:44', '', 0, '0000-00-00'),
(49, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 02:58:02', '', 0, '0000-00-00'),
(50, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 02:58:06', '', 0, '0000-00-00'),
(51, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 02:58:07', '', 0, '0000-00-00'),
(52, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 02:59:26', '', 0, '0000-00-00'),
(53, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 02:59:53', '', 0, '0000-00-00'),
(54, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 17:16:29', '', 0, '0000-00-00'),
(55, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:24:21', '', 0, '0000-00-00'),
(56, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:25:30', '', 0, '0000-00-00'),
(57, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:26:59', '', 0, '0000-00-00'),
(58, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:27:25', '', 0, '0000-00-00'),
(59, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:30:11', '', 0, '0000-00-00'),
(60, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:30:44', '', 0, '0000-00-00'),
(61, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:31:02', '', 0, '0000-00-00'),
(62, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:31:29', '', 0, '0000-00-00'),
(63, 'Andres Perez', '3000', 'adas', '', 0, 'Andres Perez', '', '', '', '', '', '', 0, '2024-08-06 12:31:33', '', 0, '0000-00-00'),
(64, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:34:07', '', 0, '0000-00-00'),
(65, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:35:14', '', 0, '0000-00-00'),
(66, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:36:37', '', 0, '0000-00-00'),
(67, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:37:53', '', 0, '0000-00-00'),
(68, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:38:31', '', 0, '0000-00-00'),
(69, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:38:42', '', 0, '0000-00-00'),
(70, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:38:49', '', 0, '0000-00-00'),
(71, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:39:07', '', 0, '0000-00-00'),
(72, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:39:40', '', 0, '0000-00-00'),
(73, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:40:18', '', 0, '0000-00-00'),
(74, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:40:45', '', 0, '0000-00-00'),
(75, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:40:59', '', 0, '0000-00-00'),
(76, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:41:06', '', 0, '0000-00-00'),
(77, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:41:44', '', 0, '0000-00-00'),
(78, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:41:49', '', 0, '0000-00-00'),
(79, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:41:55', '', 0, '0000-00-00'),
(80, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:42:05', '', 0, '0000-00-00'),
(81, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:42:12', '', 0, '0000-00-00'),
(82, 'Andres Perez', '3000', 'adas', '', 0, 'Andres Perez', '', '', '', '', '', '', 0, '2024-08-06 12:42:18', '', 0, '0000-00-00'),
(83, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:42:42', '', 0, '0000-00-00'),
(84, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:43:57', '', 0, '0000-00-00'),
(85, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:44:25', '', 0, '0000-00-00'),
(86, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:44:44', '', 0, '0000-00-00'),
(87, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 12:44:47', '', 0, '0000-00-00'),
(113, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:04:10', '', 0, '0000-00-00'),
(114, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:04:29', '', 0, '0000-00-00'),
(115, '3333333333333333', 'dasasd', 'asd', 'd', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:15:45', '', 0, '0000-00-00'),
(116, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:16:49', '', 0, '0000-00-00'),
(117, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:16:53', '', 0, '0000-00-00'),
(118, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:17:02', '', 0, '0000-00-00'),
(119, 'Andres Perez', '3000', 'adas', '', 0, 'Andres Perez', '', '', '', '', '', '', 0, '2024-08-06 13:17:20', '', 0, '0000-00-00'),
(120, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:17:32', '', 0, '0000-00-00'),
(121, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:19:07', '', 0, '0000-00-00'),
(122, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:19:43', '', 0, '0000-00-00'),
(123, 'asd', 'asd', '', 'asd', 0, 'asd', '', '', '', '', '', '', 0, '2024-08-06 13:19:48', '', 0, '0000-00-00'),
(124, 'wwwwwwwwwwwwwwwww', 'asd', '', 'asd', 0, 'asd', '', '', '', '', '', '', 0, '2024-08-06 13:19:53', '', 0, '0000-00-00'),
(125, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:25:13', '', 0, '0000-00-00'),
(126, 'dsdeeeeeeeeeeeeeee', 'ad', '', 'sda', 0, 'sda', '', '', '', '', '', '', 0, '2024-08-06 13:25:21', '', 0, '0000-00-00'),
(127, 'Andres Perez', '3000', 'adas', '', 0, 'Andres Perez', '', '', '', '', '', '', 0, '2024-08-06 13:25:26', '', 0, '0000-00-00'),
(128, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:26:03', '', 0, '0000-00-00'),
(129, 'dsfsd', 'fsdf', '', 'sfs', 0, 'sfs', '', '', '', '', '', '', 0, '2024-08-06 13:26:08', '', 0, '0000-00-00'),
(130, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:28:53', '', 0, '0000-00-00'),
(131, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:29:11', '', 0, '0000-00-00'),
(132, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:30:24', '', 0, '0000-00-00'),
(133, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:31:29', '', 0, '0000-00-00'),
(134, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:31:50', '', 0, '0000-00-00'),
(135, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:32:19', '', 0, '0000-00-00'),
(136, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:33:02', '', 0, '0000-00-00'),
(137, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:35:59', '', 0, '0000-00-00'),
(138, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:37:38', '', 0, '0000-00-00'),
(139, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:37:55', '', 0, '0000-00-00'),
(140, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:46:20', '', 0, '0000-00-00'),
(141, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:47:22', '', 0, '0000-00-00'),
(142, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:47:46', '', 0, '0000-00-00'),
(143, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:49:34', '', 0, '0000-00-00'),
(144, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:55:18', '', 0, '0000-00-00'),
(145, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:57:44', '', 0, '0000-00-00'),
(146, 'sdds', 'asda', '', 'asd', 0, 'asd', '', '', '', '', '', '', 0, '2024-08-06 14:03:04', '', 0, '0000-00-00'),
(147, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:04:25', '', 0, '0000-00-00'),
(148, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:05:22', '', 0, '0000-00-00'),
(149, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:07:39', '', 0, '0000-00-00'),
(150, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:08:30', '', 0, '0000-00-00'),
(151, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:08:51', '', 0, '0000-00-00'),
(152, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:08:59', '', 0, '0000-00-00'),
(153, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:09:59', '', 0, '0000-00-00'),
(154, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:10:56', '', 0, '0000-00-00'),
(155, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:11:19', '', 0, '0000-00-00'),
(156, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:12:23', '', 0, '0000-00-00'),
(157, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:12:28', '', 0, '0000-00-00'),
(158, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:13:34', '', 0, '0000-00-00'),
(159, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:15:03', '', 0, '0000-00-00'),
(160, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:15:26', '', 0, '0000-00-00'),
(161, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:16:18', '', 0, '0000-00-00'),
(162, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:16:49', '', 0, '0000-00-00'),
(163, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:17:03', '', 0, '0000-00-00'),
(164, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:17:13', '', 0, '0000-00-00'),
(165, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:17:16', '', 0, '0000-00-00'),
(166, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:17:21', '', 0, '0000-00-00'),
(167, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:17:27', '', 0, '0000-00-00'),
(168, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:17:48', '', 0, '0000-00-00'),
(169, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:18:07', '', 0, '0000-00-00'),
(170, 'Andres Perez', '3000', 'adas', '', 0, 'Andres Perez', '', '', '', '', '', '', 0, '2024-08-06 14:18:33', '', 0, '0000-00-00'),
(171, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:20:53', '', 0, '0000-00-00'),
(172, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:22:06', '', 0, '0000-00-00'),
(173, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:22:34', '', 0, '0000-00-00'),
(174, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:22:57', '', 0, '0000-00-00'),
(175, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:23:41', '', 0, '0000-00-00'),
(176, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:24:20', '', 0, '0000-00-00'),
(177, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:25:04', '', 0, '0000-00-00'),
(178, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:25:12', '', 0, '0000-00-00'),
(179, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:26:10', '', 0, '0000-00-00'),
(180, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:27:00', '', 0, '0000-00-00'),
(181, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:28:20', '', 0, '0000-00-00'),
(182, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:28:43', '', 0, '0000-00-00'),
(183, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:31:02', '', 0, '0000-00-00'),
(184, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:31:06', '', 0, '0000-00-00'),
(185, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:31:33', '', 0, '0000-00-00'),
(186, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:31:38', '', 0, '0000-00-00'),
(187, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:31:57', '', 0, '0000-00-00'),
(188, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:32:04', '', 0, '0000-00-00'),
(189, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:32:21', '', 0, '0000-00-00'),
(190, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:32:40', '', 0, '0000-00-00'),
(191, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:32:51', '', 0, '0000-00-00'),
(192, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:33:12', '', 0, '0000-00-00'),
(193, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:33:40', '', 0, '0000-00-00'),
(194, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:34:20', '', 0, '0000-00-00'),
(195, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 14:34:26', '', 0, '0000-00-00'),
(196, 'asdsad', 'asd', '', 'das', 0, 'das', '', '', '', '', '', '', 0, '2024-08-06 14:34:53', '', 0, '0000-00-00'),
(197, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 15:03:03', '', 0, '0000-00-00'),
(198, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 15:14:35', '', 0, '0000-00-00'),
(199, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 15:14:47', '', 0, '0000-00-00'),
(200, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 15:17:22', '', 0, '0000-00-00'),
(201, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 15:19:35', '', 0, '0000-00-00'),
(202, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 15:19:43', '', 0, '0000-00-00'),
(203, 'Andres Perez', '3000', 'adas', '', 0, 'Andres Perez', '', '', '', '', '', '', 0, '2024-08-06 15:20:18', '', 0, '0000-00-00'),
(204, 'ssssssssssssssssssssssssssssssssssssssss', 'aa', '', 'asd', 0, 'asd', '', '', '', '', '', '', 0, '2024-08-06 15:20:29', '', 0, '0000-00-00'),
(205, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 15:20:41', '', 0, '0000-00-00'),
(206, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 15:21:23', '', 0, '0000-00-00'),
(207, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 15:21:59', '', 0, '0000-00-00'),
(208, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 15:22:08', '', 0, '0000-00-00'),
(209, 'Andres Perez', '3000', 'adas', '', 0, 'Andres Perez', '', '', '', '', '', '', 0, '2024-08-06 15:22:24', '', 0, '0000-00-00'),
(210, 'dsfsd', 'fsdf', '', '', 0, 'dsfsd', '', '', '', '', '', '', 0, '2024-08-06 15:22:27', '', 0, '0000-00-00'),
(211, 'Andres Perez', '3000', 'adas', '', 0, 'Andres Perez', '', '', '', '', '', '', 0, '2024-08-06 15:22:29', '', 0, '0000-00-00'),
(212, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 16:43:37', '', 0, '0000-00-00'),
(213, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 16:43:42', '', 0, '0000-00-00'),
(214, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 16:43:49', '', 0, '0000-00-00'),
(215, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 17:20:57', '', 0, '0000-00-00'),
(216, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:05:42', '', 0, '0000-00-00'),
(217, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:06:15', '', 0, '0000-00-00'),
(218, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:06:17', '', 0, '0000-00-00'),
(219, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:06:29', '', 0, '0000-00-00'),
(220, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:06:35', '', 0, '0000-00-00'),
(221, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:06:42', '', 0, '0000-00-00'),
(222, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:06:53', '', 0, '0000-00-00'),
(223, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:07:22', '', 0, '0000-00-00'),
(224, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:07:26', '', 0, '0000-00-00'),
(225, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:07:28', '', 0, '0000-00-00'),
(226, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:08:54', '', 0, '0000-00-00'),
(227, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:08:56', '', 0, '0000-00-00'),
(228, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:09:09', '', 0, '0000-00-00'),
(229, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:09:10', '', 0, '0000-00-00'),
(230, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:09:18', '', 0, '0000-00-00'),
(231, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:09:21', '', 0, '0000-00-00'),
(232, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:09:22', '', 0, '0000-00-00'),
(233, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:09:51', '', 0, '0000-00-00'),
(234, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:09:55', '', 0, '0000-00-00'),
(235, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:10:32', '', 0, '0000-00-00'),
(236, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:10:35', '', 0, '0000-00-00'),
(237, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:10:36', '', 0, '0000-00-00'),
(238, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:10:37', '', 0, '0000-00-00'),
(239, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:10:51', '', 0, '0000-00-00'),
(240, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:11:05', '', 0, '0000-00-00'),
(241, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:11:12', '', 0, '0000-00-00'),
(242, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:11:21', '', 0, '0000-00-00'),
(243, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:11:39', '', 0, '0000-00-00'),
(244, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:11:47', '', 0, '0000-00-00'),
(245, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:11:48', '', 0, '0000-00-00'),
(246, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:11:49', '', 0, '0000-00-00'),
(247, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:12:44', '', 0, '0000-00-00'),
(248, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:13:07', '', 0, '0000-00-00'),
(249, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:13:35', '', 0, '0000-00-00'),
(250, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:14:13', '', 0, '0000-00-00'),
(251, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:14:22', '', 0, '0000-00-00'),
(252, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:14:24', '', 0, '0000-00-00'),
(253, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:14:41', '', 0, '0000-00-00'),
(254, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:15:59', '', 0, '0000-00-00'),
(255, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:16:10', '', 0, '0000-00-00'),
(256, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:16:34', '', 0, '0000-00-00'),
(257, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:16:37', '', 0, '0000-00-00'),
(258, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:17:02', '', 0, '0000-00-00'),
(259, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:17:44', '', 0, '0000-00-00'),
(260, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:17:51', '', 0, '0000-00-00'),
(261, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:18:24', '', 0, '0000-00-00'),
(262, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:18:29', '', 0, '0000-00-00'),
(263, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:18:55', '', 0, '0000-00-00'),
(264, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:18:56', '', 0, '0000-00-00'),
(265, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:20:02', '', 0, '0000-00-00'),
(266, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:24:51', '', 0, '0000-00-00'),
(267, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:25:39', '', 0, '0000-00-00'),
(268, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:27:11', '', 0, '0000-00-00'),
(269, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:27:17', '', 0, '0000-00-00'),
(270, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:27:18', '', 0, '0000-00-00'),
(271, 'sss', 'as', 'as', 'sa', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:27:34', '', 0, '0000-00-00'),
(272, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 18:46:17', '', 0, '0000-00-00'),
(273, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 19:03:57', '', 0, '0000-00-00'),
(274, '', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 20:15:26', '', 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ostemporalequipos`
--

CREATE TABLE `ostemporalequipos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nit` varchar(5000) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `num` bigint(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `fecha2` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ostemporalequipos`
--

INSERT INTO `ostemporalequipos` (`id`, `nombre`, `nit`, `direccion`, `email`, `num`, `telefono`, `ciudad`, `vencimiento`, `impuesto`, `nota`, `descuento`, `dolar`, `retefuente`, `fecha`, `usuario`, `visible`, `fecha2`) VALUES
(176, 'celular', 'sintomas', 'serial', 'estado fisoc', 0, 'accesorios', '', '', '', '', '', '', 0, '2024-08-06 15:03:36', '', 0, '0000-00-00'),
(175, 'sada', 'asd', 'asd', 'asdf', 0, 'asdfdsafsdaf', '', '', '', '', '', '', 0, '2024-08-06 14:34:44', '', 0, '0000-00-00'),
(174, 'celular', 'pantalla quebrada', 'serial', 'rayado', 0, 'con cargador', '', '', '', '', '', '', 0, '2024-08-06 14:20:21', '', 0, '0000-00-00'),
(173, 'asd', 'asd', 'asd', 'asda', 0, 'sd', '', '', '', '', '', '', 0, '2024-08-06 14:07:48', '', 0, '0000-00-00'),
(172, 'erew', 'wreew', 'wre', 'wer', 0, 'werwe', '', '', '', '', '', '', 0, '2024-08-06 14:07:04', '', 0, '0000-00-00'),
(171, 'erew', 'wreew', 'wre', 'wer', 0, 'werwe', '', '', '', '', '', '', 0, '2024-08-06 14:05:34', '', 0, '0000-00-00'),
(170, 'erew', 'wreew', 'wre', 'wer', 0, 'werwe', '', '', '', '', '', '', 0, '2024-08-06 14:05:31', '', 0, '0000-00-00'),
(169, 'erew', 'wreew', 'wre', 'wer', 0, 'werwe', '', '', '', '', '', '', 0, '2024-08-06 14:05:29', '', 0, '0000-00-00'),
(168, 'iiiiiiiiiiiiiiiiiiiiiiii', 'das', 'asdasd', 'asd', 0, 'asds', '', '', '', '', '', '', 0, '2024-08-06 14:04:05', '', 0, '0000-00-00'),
(167, 'iiiiiiiiiiiiiiiiiiiiiiii', 'das', 'asdasd', 'asd', 0, 'asds', '', '', '', '', '', '', 0, '2024-08-06 14:02:48', '', 0, '0000-00-00'),
(166, 'asdas', 'das', 'asdasd', 'asd', 0, 'asds', '', '', '', '', '', '', 0, '2024-08-06 14:02:42', '', 0, '0000-00-00'),
(165, 'asdas', 'das', 'asdasd', 'asd', 0, 'asds', '', '', '', '', '', '', 0, '2024-08-06 14:02:18', '', 0, '0000-00-00'),
(164, 'asdas', 'das', 'asdasd', 'asd', 0, 'asds', '', '', '', '', '', '', 0, '2024-08-06 14:02:06', '', 0, '0000-00-00'),
(163, 'asdas', 'das', 'asdasd', 'asd', 0, 'asds', '', '', '', '', '', '', 0, '2024-08-06 14:01:43', '', 0, '0000-00-00'),
(162, 'asdas', 'das', 'asdasd', 'asd', 0, 'asds', '', '', '', '', '', '', 0, '2024-08-06 13:58:27', '', 0, '0000-00-00'),
(161, 'asdas', 'das', 'asdasd', 'asd', 0, 'asds', '', '', '', '', '', '', 0, '2024-08-06 13:58:09', '', 0, '0000-00-00'),
(160, 'asdas', 'das', 'asdasd', 'asd', 0, 'asds', '', '', '', '', '', '', 0, '2024-08-06 13:57:49', '', 0, '0000-00-00'),
(159, 'asdasd333333df', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:57:20', '', 0, '0000-00-00'),
(158, '3333333333333333333333333333df', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:57:18', '', 0, '0000-00-00'),
(157, '3333333333333333333333333333df', 'sdf', 'sdf', 'sdf', 0, 'sdfsd', '', '', '', '', '', '', 0, '2024-08-06 13:56:56', '', 0, '0000-00-00'),
(156, '3333333333333333333333333333df', 'sdf', 'sdf', 'sdf', 0, 'sdfsd', '', '', '', '', '', '', 0, '2024-08-06 13:56:19', '', 0, '0000-00-00'),
(155, 'sdf', 'sdf', 'sdf', 'sdf', 0, 'sdfsd', '', '', '', '', '', '', 0, '2024-08-06 13:56:07', '', 0, '0000-00-00'),
(154, 'sdf', 'sdf', 'sdf', 'sdf', 0, 'sdfsd', '', '', '', '', '', '', 0, '2024-08-06 13:55:24', '', 0, '0000-00-00'),
(153, 'sdfsdfdddddddddddddddddddddddddddddd', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:54:24', '', 0, '0000-00-00'),
(152, 'sdfsdfdddddddddddddddddddddddddddddd', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:54:23', '', 0, '0000-00-00'),
(151, 'sdfsdfdddddddddddddddddddddddddddddd', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:53:15', '', 0, '0000-00-00'),
(150, 'sdfsdf', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:52:46', '', 0, '0000-00-00'),
(149, 'sdfsdf', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:52:21', '', 0, '0000-00-00'),
(148, 'sdfsdf', '', '', '', 0, '', '', '', '', '', '', '', 0, '2024-08-06 13:51:49', '', 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ostemporalingresos`
--

CREATE TABLE `ostemporalingresos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `come` varchar(5000) NOT NULL,
  `celu` varchar(100) NOT NULL,
  `nit` varchar(255) NOT NULL,
  `num` bigint(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `fecha2` date NOT NULL,
  `lote` varchar(500) NOT NULL,
  `vencimiento2` date NOT NULL,
  `temperatura` varchar(500) NOT NULL,
  `laboratorio` varchar(500) NOT NULL,
  `registro` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ostemporalingresos`
--

INSERT INTO `ostemporalingresos` (`id`, `titulo`, `come`, `celu`, `nit`, `num`, `estado`, `direccion`, `ciudad`, `vencimiento`, `impuesto`, `nota`, `descuento`, `dolar`, `retefuente`, `fecha`, `usuario`, `visible`, `fecha2`, `lote`, `vencimiento2`, `temperatura`, `laboratorio`, `registro`) VALUES
(244, 'Pantalon RED221', '1', 'r2at4samavedbihe8i12cp7705', '', 24, '9878767811111', '', '', '', '', '', '', '', 0, '2022-02-04 14:32:35', '', 0, '0000-00-00', '', '0000-00-00', '', '', ''),
(160, 'Camiseta ONNÍ', '1', 'fdl2am5ro599bjorvom3kmc4u0', '', 1094, '2323214', '', '', '', '', '', '', '', 0, '2022-02-03 09:00:08', '', 0, '0000-00-00', '', '0000-00-00', '', '', ''),
(245, 'Zapato LEY111', '1', 'fdl2am5ro599bjorvom3kmc4u0', '', 148, '553321313', '', '', '', '', '', '', '', 0, '2022-02-03 09:00:03', '', 0, '0000-00-00', '', '0000-00-00', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ostemporalnomina`
--

CREATE TABLE `ostemporalnomina` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `come` varchar(5000) NOT NULL,
  `celu` varchar(100) NOT NULL,
  `nit` varchar(255) NOT NULL,
  `num` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `fecha2` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ostemporalpedidos`
--

CREATE TABLE `ostemporalpedidos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `come` varchar(5000) NOT NULL,
  `celu` varchar(100) NOT NULL,
  `nit` varchar(255) NOT NULL,
  `num` bigint(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `fecha2` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ostemporalpedidos`
--

INSERT INTO `ostemporalpedidos` (`id`, `titulo`, `come`, `celu`, `nit`, `num`, `estado`, `direccion`, `ciudad`, `vencimiento`, `impuesto`, `nota`, `descuento`, `dolar`, `retefuente`, `fecha`, `usuario`, `visible`, `fecha2`) VALUES
(160, 'Camiseta ONNÍ', '1', 'ie08ufq5i3pqlfm2cru5gslcd4', '', 0, '2323214', '', '', '', '', '', '', '', 0, '2022-02-03 20:11:13', '', 0, '0000-00-00'),
(225, 'Pantalon RED', '1', 'r2at4samavedbihe8i12cp7705', '', 0, '98787678', '', '', '', '', '', '', '', 0, '2022-02-04 14:24:06', '', 0, '0000-00-00'),
(231, 'Pantalon RED', '1', 'r2at4samavedbihe8i12cp7705', '', 0, '98787678', '', '', '', '', '', '', '', 0, '2022-02-04 14:24:07', '', 0, '0000-00-00'),
(233, 'Pantalon RED', '1', 'r2at4samavedbihe8i12cp7705', '', 0, '98787678', '', '', '', '', '', '', '', 0, '2022-02-04 14:24:08', '', 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ostemporalproduccion`
--

CREATE TABLE `ostemporalproduccion` (
  `id` int(11) NOT NULL,
  `titulo` bigint(255) NOT NULL,
  `come` varchar(5000) NOT NULL,
  `celu` varchar(100) NOT NULL,
  `nit` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ostemporalproduccion`
--

INSERT INTO `ostemporalproduccion` (`id`, `titulo`, `come`, `celu`, `nit`) VALUES
(1, 1000, '', '', ''),
(2, 5000, '', '', ''),
(3, 10000, '', '', ''),
(4, 20000, '', '', ''),
(5, 50000, '', '', ''),
(6, 100000, '', '', ''),
(7, 0, 'modificado', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ostemporal_cotizaciones`
--

CREATE TABLE `ostemporal_cotizaciones` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `come` varchar(5000) NOT NULL,
  `celu` varchar(100) NOT NULL,
  `nit` varchar(255) NOT NULL,
  `num` bigint(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` bigint(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `fecha2` date NOT NULL,
  `mesa` bigint(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ostemporal_cotizaciones`
--

INSERT INTO `ostemporal_cotizaciones` (`id`, `titulo`, `come`, `celu`, `nit`, `num`, `estado`, `direccion`, `telefono`, `vencimiento`, `impuesto`, `nota`, `descuento`, `dolar`, `retefuente`, `fecha`, `usuario`, `visible`, `fecha2`, `mesa`) VALUES
(13, 'Hit', '1', 'q8tntaaj2760r6hrvouil9q7tg', '', 1988, '', '', '', '', 6, '', '', '', 0, '2024-08-02 15:11:59', '', 0, '0000-00-00', 0),
(18, 'Cragador Celular Generico', '3', 'q8tntaaj2760r6hrvouil9q7tg', '', 2550, '', '', '', '', 2, '', '', '', 0, '2024-08-06 16:43:44', '', 0, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ostemporal_mesas`
--

CREATE TABLE `ostemporal_mesas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `come` varchar(5000) NOT NULL,
  `celu` varchar(100) NOT NULL,
  `nit` varchar(255) NOT NULL,
  `num` bigint(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `fecha2` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ostemporal_mesas`
--

INSERT INTO `ostemporal_mesas` (`id`, `titulo`, `come`, `celu`, `nit`, `num`, `estado`, `direccion`, `ciudad`, `vencimiento`, `impuesto`, `nota`, `descuento`, `dolar`, `retefuente`, `fecha`, `usuario`, `visible`, `fecha2`) VALUES
(45, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-29 21:42:59', '', 0, '0000-00-00'),
(46, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-29 21:42:59', '', 0, '0000-00-00'),
(47, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-29 21:43:12', '', 0, '0000-00-00'),
(48, '17', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-29 21:43:35', '', 0, '0000-00-00'),
(49, '16', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-29 21:43:48', '', 0, '0000-00-00'),
(50, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-29 21:43:55', '', 0, '0000-00-00'),
(51, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-29 21:44:14', '', 0, '0000-00-00'),
(52, '13', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-29 21:49:08', '', 0, '0000-00-00'),
(53, '12', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-29 22:38:00', '', 0, '0000-00-00'),
(54, '11', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-29 22:39:11', '', 0, '0000-00-00'),
(55, '10', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 13:42:15', '', 0, '0000-00-00'),
(56, '9', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 14:17:36', '', 0, '0000-00-00'),
(57, '8', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 15:06:32', '', 0, '0000-00-00'),
(58, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 15:06:39', '', 0, '0000-00-00'),
(59, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:42:38', '', 0, '0000-00-00'),
(60, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 18:44:24', '', 0, '0000-00-00'),
(61, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 18:46:55', '', 0, '0000-00-00'),
(62, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 18:47:06', '', 0, '0000-00-00'),
(63, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 18:47:28', '', 0, '0000-00-00'),
(64, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 18:51:44', '', 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ostemporal_mesas2`
--

CREATE TABLE `ostemporal_mesas2` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `come` varchar(5000) NOT NULL,
  `celu` varchar(100) NOT NULL,
  `nit` varchar(255) NOT NULL,
  `num` bigint(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `fecha2` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ostemporal_mesas2`
--

INSERT INTO `ostemporal_mesas2` (`id`, `titulo`, `come`, `celu`, `nit`, `num`, `estado`, `direccion`, `ciudad`, `vencimiento`, `impuesto`, `nota`, `descuento`, `dolar`, `retefuente`, `fecha`, `usuario`, `visible`, `fecha2`) VALUES
(771, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:04:12', '', 0, '0000-00-00'),
(770, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:04:10', '', 0, '0000-00-00'),
(769, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:03:37', '', 0, '0000-00-00'),
(768, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:03:35', '', 0, '0000-00-00'),
(767, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:03:33', '', 0, '0000-00-00'),
(766, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:03:27', '', 0, '0000-00-00'),
(765, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:03:07', '', 0, '0000-00-00'),
(764, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:03:03', '', 0, '0000-00-00'),
(763, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 01:23:57', '', 0, '0000-00-00'),
(762, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 01:23:57', '', 0, '0000-00-00'),
(761, '8', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 01:23:56', '', 0, '0000-00-00'),
(760, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 01:23:53', '', 0, '0000-00-00'),
(759, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 01:23:50', '', 0, '0000-00-00'),
(758, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 01:23:45', '', 0, '0000-00-00'),
(757, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 01:23:40', '', 0, '0000-00-00'),
(756, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 00:26:10', '', 0, '0000-00-00'),
(755, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 00:26:08', '', 0, '0000-00-00'),
(754, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 00:26:08', '', 0, '0000-00-00'),
(753, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 00:26:06', '', 0, '0000-00-00'),
(752, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 00:26:03', '', 0, '0000-00-00'),
(751, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 00:26:00', '', 0, '0000-00-00'),
(750, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 00:25:55', '', 0, '0000-00-00'),
(749, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:23:07', '', 0, '0000-00-00'),
(748, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:23:01', '', 0, '0000-00-00'),
(747, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:22:58', '', 0, '0000-00-00'),
(746, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:22:51', '', 0, '0000-00-00'),
(745, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:22:49', '', 0, '0000-00-00'),
(744, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:22:13', '', 0, '0000-00-00'),
(742, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:21:57', '', 0, '0000-00-00'),
(743, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:22:02', '', 0, '0000-00-00'),
(675, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:08:25', '', 0, '0000-00-00'),
(676, '12', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:08:39', '', 0, '0000-00-00'),
(677, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:08:40', '', 0, '0000-00-00'),
(678, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:08:42', '', 0, '0000-00-00'),
(679, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:08:45', '', 0, '0000-00-00'),
(680, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:10', '', 0, '0000-00-00'),
(681, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:12', '', 0, '0000-00-00'),
(682, '16', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:13', '', 0, '0000-00-00'),
(683, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:14', '', 0, '0000-00-00'),
(684, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:16', '', 0, '0000-00-00'),
(685, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:17', '', 0, '0000-00-00'),
(686, '16', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:18', '', 0, '0000-00-00'),
(687, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:19', '', 0, '0000-00-00'),
(688, '10', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:22', '', 0, '0000-00-00'),
(689, '12', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:23', '', 0, '0000-00-00'),
(690, '13', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:24', '', 0, '0000-00-00'),
(691, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:24', '', 0, '0000-00-00'),
(692, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:25', '', 0, '0000-00-00'),
(693, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:26', '', 0, '0000-00-00'),
(694, '8', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:27', '', 0, '0000-00-00'),
(695, '9', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:28', '', 0, '0000-00-00'),
(696, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:09:29', '', 0, '0000-00-00'),
(697, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:10:12', '', 0, '0000-00-00'),
(698, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:10:27', '', 0, '0000-00-00'),
(699, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:10:28', '', 0, '0000-00-00'),
(700, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:10:43', '', 0, '0000-00-00'),
(701, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:10:46', '', 0, '0000-00-00'),
(702, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:11:00', '', 0, '0000-00-00'),
(703, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:11:07', '', 0, '0000-00-00'),
(704, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:11:09', '', 0, '0000-00-00'),
(705, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:11:11', '', 0, '0000-00-00'),
(706, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:11:13', '', 0, '0000-00-00'),
(707, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:11:47', '', 0, '0000-00-00'),
(708, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:11:48', '', 0, '0000-00-00'),
(709, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:11:52', '', 0, '0000-00-00'),
(710, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:12:42', '', 0, '0000-00-00'),
(711, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:12:44', '', 0, '0000-00-00'),
(712, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:13:07', '', 0, '0000-00-00'),
(713, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:13:08', '', 0, '0000-00-00'),
(714, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:13:26', '', 0, '0000-00-00'),
(715, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:13:29', '', 0, '0000-00-00'),
(716, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:13:31', '', 0, '0000-00-00'),
(717, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:13:34', '', 0, '0000-00-00'),
(718, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:13:49', '', 0, '0000-00-00'),
(719, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:13:52', '', 0, '0000-00-00'),
(720, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:13:53', '', 0, '0000-00-00'),
(721, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:15:59', '', 0, '0000-00-00'),
(722, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:16:53', '', 0, '0000-00-00'),
(723, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:16:59', '', 0, '0000-00-00'),
(674, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:07:50', '', 0, '0000-00-00'),
(724, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:17:01', '', 0, '0000-00-00'),
(725, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:17:05', '', 0, '0000-00-00'),
(726, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:17:28', '', 0, '0000-00-00'),
(727, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:17:29', '', 0, '0000-00-00'),
(728, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:17:33', '', 0, '0000-00-00'),
(729, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:17:34', '', 0, '0000-00-00'),
(730, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:20:05', '', 0, '0000-00-00'),
(731, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:20:14', '', 0, '0000-00-00'),
(732, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:20:40', '', 0, '0000-00-00'),
(733, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:20:42', '', 0, '0000-00-00'),
(734, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:20:43', '', 0, '0000-00-00'),
(735, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:20:47', '', 0, '0000-00-00'),
(736, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:20:48', '', 0, '0000-00-00'),
(737, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:20:52', '', 0, '0000-00-00'),
(738, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:20:57', '', 0, '0000-00-00'),
(739, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:21:01', '', 0, '0000-00-00'),
(740, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:21:17', '', 0, '0000-00-00'),
(741, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-07-31 23:21:51', '', 0, '0000-00-00'),
(772, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:04:13', '', 0, '0000-00-00'),
(773, '8', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:04:16', '', 0, '0000-00-00'),
(774, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:04:18', '', 0, '0000-00-00'),
(775, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:04:20', '', 0, '0000-00-00'),
(776, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:04:23', '', 0, '0000-00-00'),
(777, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:04:50', '', 0, '0000-00-00'),
(778, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:04:51', '', 0, '0000-00-00'),
(779, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:04:53', '', 0, '0000-00-00'),
(780, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:04:58', '', 0, '0000-00-00'),
(781, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:05:01', '', 0, '0000-00-00'),
(782, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:05:06', '', 0, '0000-00-00'),
(783, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:06:45', '', 0, '0000-00-00'),
(784, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:06:49', '', 0, '0000-00-00'),
(785, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:06:50', '', 0, '0000-00-00'),
(786, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:06:57', '', 0, '0000-00-00'),
(787, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:07:00', '', 0, '0000-00-00'),
(788, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:07:02', '', 0, '0000-00-00'),
(789, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:07:05', '', 0, '0000-00-00'),
(790, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:07:13', '', 0, '0000-00-00'),
(791, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:07:48', '', 0, '0000-00-00'),
(792, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:07:53', '', 0, '0000-00-00'),
(793, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:07:57', '', 0, '0000-00-00'),
(794, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:10:41', '', 0, '0000-00-00'),
(795, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:10:43', '', 0, '0000-00-00'),
(796, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:10:59', '', 0, '0000-00-00'),
(797, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:11:37', '', 0, '0000-00-00'),
(798, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:11:45', '', 0, '0000-00-00'),
(799, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:11:53', '', 0, '0000-00-00'),
(800, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:12:44', '', 0, '0000-00-00'),
(801, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:12:57', '', 0, '0000-00-00'),
(802, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:13:01', '', 0, '0000-00-00'),
(803, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:13:17', '', 0, '0000-00-00'),
(804, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:13:21', '', 0, '0000-00-00'),
(805, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:13:32', '', 0, '0000-00-00'),
(806, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:18:24', '', 0, '0000-00-00'),
(807, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:18:36', '', 0, '0000-00-00'),
(808, '9', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:18:39', '', 0, '0000-00-00'),
(809, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:18:40', '', 0, '0000-00-00'),
(810, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:18:56', '', 0, '0000-00-00'),
(811, '10', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:18:56', '', 0, '0000-00-00'),
(812, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:18:57', '', 0, '0000-00-00'),
(813, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:18:58', '', 0, '0000-00-00'),
(814, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:19:00', '', 0, '0000-00-00'),
(815, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:22:31', '', 0, '0000-00-00'),
(816, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:22:33', '', 0, '0000-00-00'),
(817, '9', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:22:34', '', 0, '0000-00-00'),
(818, '11', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:22:35', '', 0, '0000-00-00'),
(819, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:22:36', '', 0, '0000-00-00'),
(820, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:22:39', '', 0, '0000-00-00'),
(821, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:22:40', '', 0, '0000-00-00'),
(822, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:22:41', '', 0, '0000-00-00'),
(823, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:22:47', '', 0, '0000-00-00'),
(824, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:22:48', '', 0, '0000-00-00'),
(825, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:23:22', '', 0, '0000-00-00'),
(826, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:23:51', '', 0, '0000-00-00'),
(827, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:23:53', '', 0, '0000-00-00'),
(828, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:23:54', '', 0, '0000-00-00'),
(829, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:23:55', '', 0, '0000-00-00'),
(830, '12', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:23:55', '', 0, '0000-00-00'),
(831, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:23:56', '', 0, '0000-00-00'),
(832, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:23:57', '', 0, '0000-00-00'),
(833, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:23:59', '', 0, '0000-00-00'),
(834, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:24:00', '', 0, '0000-00-00'),
(835, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:24:01', '', 0, '0000-00-00'),
(836, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:24:03', '', 0, '0000-00-00'),
(837, '10', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:24:09', '', 0, '0000-00-00'),
(838, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:24:10', '', 0, '0000-00-00'),
(839, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:24:12', '', 0, '0000-00-00'),
(840, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:24:13', '', 0, '0000-00-00'),
(841, '16', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:24:14', '', 0, '0000-00-00'),
(842, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:24:24', '', 0, '0000-00-00'),
(843, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:25:47', '', 0, '0000-00-00'),
(844, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:26:39', '', 0, '0000-00-00'),
(845, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:26:49', '', 0, '0000-00-00'),
(846, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:27:00', '', 0, '0000-00-00'),
(847, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:27:23', '', 0, '0000-00-00'),
(848, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:27:40', '', 0, '0000-00-00'),
(849, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:28:06', '', 0, '0000-00-00'),
(850, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:28:23', '', 0, '0000-00-00'),
(851, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:28:33', '', 0, '0000-00-00'),
(852, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:28:57', '', 0, '0000-00-00'),
(853, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:29:12', '', 0, '0000-00-00'),
(854, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:29:31', '', 0, '0000-00-00'),
(855, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:29:52', '', 0, '0000-00-00'),
(856, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:30:02', '', 0, '0000-00-00'),
(857, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:30:04', '', 0, '0000-00-00'),
(858, '17', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:30:06', '', 0, '0000-00-00'),
(859, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:30:06', '', 0, '0000-00-00'),
(860, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:30:07', '', 0, '0000-00-00'),
(861, '13', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:30:08', '', 0, '0000-00-00'),
(862, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:30:09', '', 0, '0000-00-00'),
(863, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:30:10', '', 0, '0000-00-00'),
(864, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:30:11', '', 0, '0000-00-00'),
(865, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:30:11', '', 0, '0000-00-00'),
(866, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:30:12', '', 0, '0000-00-00'),
(867, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:30:13', '', 0, '0000-00-00'),
(868, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:31:33', '', 0, '0000-00-00'),
(869, '13', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:31:36', '', 0, '0000-00-00'),
(870, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:31:37', '', 0, '0000-00-00'),
(871, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:31:38', '', 0, '0000-00-00'),
(872, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:31:40', '', 0, '0000-00-00'),
(873, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:31:41', '', 0, '0000-00-00'),
(874, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:31:41', '', 0, '0000-00-00'),
(875, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:31:42', '', 0, '0000-00-00'),
(876, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:31:45', '', 0, '0000-00-00'),
(877, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:31:46', '', 0, '0000-00-00'),
(878, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:32:23', '', 0, '0000-00-00'),
(879, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:33:03', '', 0, '0000-00-00'),
(880, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:33:19', '', 0, '0000-00-00'),
(881, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:33:56', '', 0, '0000-00-00'),
(882, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:34:05', '', 0, '0000-00-00'),
(883, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:34:37', '', 0, '0000-00-00'),
(884, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:35:22', '', 0, '0000-00-00'),
(885, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:35:34', '', 0, '0000-00-00'),
(886, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:36:39', '', 0, '0000-00-00'),
(887, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:36:50', '', 0, '0000-00-00'),
(888, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:37:01', '', 0, '0000-00-00'),
(889, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:37:34', '', 0, '0000-00-00'),
(890, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:37:42', '', 0, '0000-00-00'),
(891, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:11', '', 0, '0000-00-00'),
(892, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:27', '', 0, '0000-00-00'),
(893, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:30', '', 0, '0000-00-00'),
(894, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:31', '', 0, '0000-00-00'),
(895, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:33', '', 0, '0000-00-00'),
(896, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:34', '', 0, '0000-00-00'),
(897, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:36', '', 0, '0000-00-00'),
(898, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:37', '', 0, '0000-00-00'),
(899, '8', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:37', '', 0, '0000-00-00'),
(900, '9', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:38', '', 0, '0000-00-00'),
(901, '10', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:38', '', 0, '0000-00-00'),
(902, '11', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:39', '', 0, '0000-00-00'),
(903, '12', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:39', '', 0, '0000-00-00'),
(904, '13', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:40', '', 0, '0000-00-00'),
(905, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:40', '', 0, '0000-00-00'),
(906, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:42', '', 0, '0000-00-00'),
(907, '16', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:51', '', 0, '0000-00-00'),
(908, '17', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:52', '', 0, '0000-00-00'),
(909, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:53', '', 0, '0000-00-00'),
(910, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:54', '', 0, '0000-00-00'),
(911, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:38:56', '', 0, '0000-00-00'),
(912, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:43:09', '', 0, '0000-00-00'),
(913, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:43:14', '', 0, '0000-00-00'),
(914, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:43:16', '', 0, '0000-00-00'),
(915, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:43:18', '', 0, '0000-00-00'),
(916, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:43:19', '', 0, '0000-00-00'),
(917, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:43:20', '', 0, '0000-00-00'),
(918, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:43:21', '', 0, '0000-00-00'),
(919, '17', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:43:22', '', 0, '0000-00-00'),
(920, '13', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:43:23', '', 0, '0000-00-00'),
(921, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:43:24', '', 0, '0000-00-00'),
(922, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:43:25', '', 0, '0000-00-00'),
(923, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:43:26', '', 0, '0000-00-00'),
(924, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:43:27', '', 0, '0000-00-00'),
(925, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:44:55', '', 0, '0000-00-00'),
(926, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:44:56', '', 0, '0000-00-00'),
(927, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:44:57', '', 0, '0000-00-00'),
(928, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:44:59', '', 0, '0000-00-00'),
(929, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:45:01', '', 0, '0000-00-00'),
(930, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:45:03', '', 0, '0000-00-00'),
(931, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:45:29', '', 0, '0000-00-00'),
(932, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:45:31', '', 0, '0000-00-00'),
(933, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:45:32', '', 0, '0000-00-00'),
(934, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:45:33', '', 0, '0000-00-00'),
(935, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:46:18', '', 0, '0000-00-00'),
(936, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:46:42', '', 0, '0000-00-00'),
(937, '12', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:46:49', '', 0, '0000-00-00'),
(938, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:46:51', '', 0, '0000-00-00'),
(939, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:46:53', '', 0, '0000-00-00'),
(940, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:46:54', '', 0, '0000-00-00'),
(941, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:46:55', '', 0, '0000-00-00'),
(942, '13', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:47:59', '', 0, '0000-00-00'),
(943, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:48:00', '', 0, '0000-00-00'),
(944, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:48:21', '', 0, '0000-00-00'),
(945, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:48:43', '', 0, '0000-00-00'),
(946, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:48:50', '', 0, '0000-00-00'),
(947, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:54:07', '', 0, '0000-00-00'),
(948, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:54:09', '', 0, '0000-00-00'),
(949, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 13:54:57', '', 0, '0000-00-00'),
(950, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:00:50', '', 0, '0000-00-00'),
(951, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:01:15', '', 0, '0000-00-00'),
(952, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:01:21', '', 0, '0000-00-00'),
(953, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:01:24', '', 0, '0000-00-00'),
(954, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:01:29', '', 0, '0000-00-00'),
(955, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:01:35', '', 0, '0000-00-00'),
(956, '10', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:01:36', '', 0, '0000-00-00'),
(957, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:01:42', '', 0, '0000-00-00'),
(958, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:03:12', '', 0, '0000-00-00'),
(959, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:03:15', '', 0, '0000-00-00'),
(960, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:03:17', '', 0, '0000-00-00'),
(961, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:10:08', '', 0, '0000-00-00'),
(962, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:10:10', '', 0, '0000-00-00'),
(963, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:11:07', '', 0, '0000-00-00'),
(964, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:12:21', '', 0, '0000-00-00'),
(965, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:15:20', '', 0, '0000-00-00'),
(966, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:15:22', '', 0, '0000-00-00'),
(967, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:16:31', '', 0, '0000-00-00'),
(968, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:16:34', '', 0, '0000-00-00'),
(969, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:16:35', '', 0, '0000-00-00'),
(970, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:16:36', '', 0, '0000-00-00'),
(971, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:16:37', '', 0, '0000-00-00'),
(972, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:16:39', '', 0, '0000-00-00'),
(973, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:16:41', '', 0, '0000-00-00'),
(974, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:17:08', '', 0, '0000-00-00'),
(975, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:17:09', '', 0, '0000-00-00'),
(976, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:17:12', '', 0, '0000-00-00'),
(977, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:18:04', '', 0, '0000-00-00'),
(978, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:18:06', '', 0, '0000-00-00'),
(979, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:18:09', '', 0, '0000-00-00'),
(980, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:18:10', '', 0, '0000-00-00'),
(981, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:18:11', '', 0, '0000-00-00'),
(982, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:18:34', '', 0, '0000-00-00'),
(983, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:18:36', '', 0, '0000-00-00'),
(984, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:18:38', '', 0, '0000-00-00'),
(985, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:18:42', '', 0, '0000-00-00'),
(986, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:19:14', '', 0, '0000-00-00'),
(987, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:19:15', '', 0, '0000-00-00'),
(988, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:19:35', '', 0, '0000-00-00'),
(989, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:23:33', '', 0, '0000-00-00'),
(990, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:24:01', '', 0, '0000-00-00'),
(991, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:24:10', '', 0, '0000-00-00'),
(992, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:24:46', '', 0, '0000-00-00'),
(993, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:25:07', '', 0, '0000-00-00'),
(994, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:26:58', '', 0, '0000-00-00'),
(995, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:27:12', '', 0, '0000-00-00'),
(996, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:28:18', '', 0, '0000-00-00'),
(997, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:29:00', '', 0, '0000-00-00'),
(998, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:29:11', '', 0, '0000-00-00'),
(999, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:29:19', '', 0, '0000-00-00'),
(1000, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:29:21', '', 0, '0000-00-00'),
(1001, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:29:46', '', 0, '0000-00-00'),
(1002, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:35:18', '', 0, '0000-00-00'),
(1003, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:35:24', '', 0, '0000-00-00'),
(1004, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:36:50', '', 0, '0000-00-00'),
(1005, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:36:51', '', 0, '0000-00-00'),
(1006, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:36:53', '', 0, '0000-00-00'),
(1007, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:37:47', '', 0, '0000-00-00'),
(1008, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:37:51', '', 0, '0000-00-00'),
(1009, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:42:22', '', 0, '0000-00-00'),
(1010, '11', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:42:52', '', 0, '0000-00-00'),
(1011, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:42:59', '', 0, '0000-00-00'),
(1012, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:43:27', '', 0, '0000-00-00'),
(1013, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:43:43', '', 0, '0000-00-00'),
(1014, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:43:48', '', 0, '0000-00-00'),
(1015, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:43:49', '', 0, '0000-00-00'),
(1016, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:43:50', '', 0, '0000-00-00'),
(1017, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:43:50', '', 0, '0000-00-00'),
(1018, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:43:51', '', 0, '0000-00-00'),
(1019, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:43:53', '', 0, '0000-00-00'),
(1020, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:43:55', '', 0, '0000-00-00'),
(1021, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:43:56', '', 0, '0000-00-00'),
(1022, '9', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:43:58', '', 0, '0000-00-00'),
(1023, '10', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:43:58', '', 0, '0000-00-00'),
(1024, '11', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:43:59', '', 0, '0000-00-00'),
(1025, '12', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:43:59', '', 0, '0000-00-00'),
(1026, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:45:12', '', 0, '0000-00-00'),
(1027, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:45:45', '', 0, '0000-00-00'),
(1028, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:46:31', '', 0, '0000-00-00'),
(1029, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:47:54', '', 0, '0000-00-00'),
(1030, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:47:56', '', 0, '0000-00-00'),
(1031, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:49:18', '', 0, '0000-00-00'),
(1032, '17', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:49:20', '', 0, '0000-00-00'),
(1033, '16', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:49:48', '', 0, '0000-00-00'),
(1034, '17', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:49:49', '', 0, '0000-00-00'),
(1035, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:49:51', '', 0, '0000-00-00'),
(1036, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:51:17', '', 0, '0000-00-00'),
(1037, '12', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:51:20', '', 0, '0000-00-00'),
(1038, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:51:22', '', 0, '0000-00-00'),
(1039, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:51:23', '', 0, '0000-00-00'),
(1040, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:51:24', '', 0, '0000-00-00'),
(1041, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:51:47', '', 0, '0000-00-00'),
(1042, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:53:28', '', 0, '0000-00-00'),
(1043, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:01', '', 0, '0000-00-00'),
(1044, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:18', '', 0, '0000-00-00'),
(1045, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:19', '', 0, '0000-00-00'),
(1046, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:24', '', 0, '0000-00-00'),
(1047, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:26', '', 0, '0000-00-00'),
(1048, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:38', '', 0, '0000-00-00'),
(1049, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:39', '', 0, '0000-00-00'),
(1050, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:41', '', 0, '0000-00-00'),
(1051, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:42', '', 0, '0000-00-00'),
(1052, '13', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:42', '', 0, '0000-00-00'),
(1053, '12', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:43', '', 0, '0000-00-00'),
(1054, '10', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:43', '', 0, '0000-00-00'),
(1055, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:44', '', 0, '0000-00-00'),
(1056, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:52', '', 0, '0000-00-00'),
(1057, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:54:55', '', 0, '0000-00-00'),
(1058, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:55:16', '', 0, '0000-00-00'),
(1059, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:55:17', '', 0, '0000-00-00'),
(1060, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 14:55:18', '', 0, '0000-00-00'),
(1061, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 15:40:12', '', 0, '0000-00-00'),
(1062, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 15:41:15', '', 0, '0000-00-00'),
(1063, '11', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 15:41:19', '', 0, '0000-00-00'),
(1064, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 15:41:20', '', 0, '0000-00-00'),
(1065, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 15:41:23', '', 0, '0000-00-00'),
(1066, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 15:41:25', '', 0, '0000-00-00'),
(1067, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 15:41:27', '', 0, '0000-00-00'),
(1068, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 15:41:29', '', 0, '0000-00-00'),
(1069, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 15:41:35', '', 0, '0000-00-00'),
(1070, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 15:41:36', '', 0, '0000-00-00'),
(1071, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 16:00:03', '', 0, '0000-00-00'),
(1072, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 16:00:14', '', 0, '0000-00-00'),
(1073, '13', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 16:00:20', '', 0, '0000-00-00'),
(1074, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 16:00:29', '', 0, '0000-00-00'),
(1075, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 16:00:32', '', 0, '0000-00-00'),
(1076, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:30:29', '', 0, '0000-00-00'),
(1077, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:30:34', '', 0, '0000-00-00'),
(1078, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:30:35', '', 0, '0000-00-00'),
(1079, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:30:37', '', 0, '0000-00-00'),
(1080, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:32:18', '', 0, '0000-00-00'),
(1081, '10', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:32:23', '', 0, '0000-00-00'),
(1082, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:35:21', '', 0, '0000-00-00'),
(1083, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:36:32', '', 0, '0000-00-00'),
(1084, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:37:51', '', 0, '0000-00-00'),
(1085, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:38:53', '', 0, '0000-00-00'),
(1086, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:40:45', '', 0, '0000-00-00'),
(1087, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:41:53', '', 0, '0000-00-00'),
(1088, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:42:09', '', 0, '0000-00-00'),
(1089, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:42:48', '', 0, '0000-00-00'),
(1090, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:43:10', '', 0, '0000-00-00'),
(1091, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:43:20', '', 0, '0000-00-00'),
(1092, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:43:34', '', 0, '0000-00-00'),
(1093, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:44:21', '', 0, '0000-00-00'),
(1094, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:46:55', '', 0, '0000-00-00'),
(1095, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:46:56', '', 0, '0000-00-00'),
(1096, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:47:22', '', 0, '0000-00-00'),
(1097, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:47:29', '', 0, '0000-00-00'),
(1098, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:55:49', '', 0, '0000-00-00'),
(1099, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:55:54', '', 0, '0000-00-00'),
(1100, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:56:12', '', 0, '0000-00-00'),
(1101, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:56:30', '', 0, '0000-00-00'),
(1102, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:56:33', '', 0, '0000-00-00'),
(1103, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:57:10', '', 0, '0000-00-00'),
(1104, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:57:17', '', 0, '0000-00-00'),
(1105, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:57:32', '', 0, '0000-00-00'),
(1106, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:57:46', '', 0, '0000-00-00'),
(1107, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:58:01', '', 0, '0000-00-00'),
(1108, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:58:20', '', 0, '0000-00-00'),
(1109, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:58:27', '', 0, '0000-00-00'),
(1110, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:58:37', '', 0, '0000-00-00'),
(1111, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:59:08', '', 0, '0000-00-00'),
(1112, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:59:17', '', 0, '0000-00-00'),
(1113, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 17:59:31', '', 0, '0000-00-00'),
(1114, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:00:55', '', 0, '0000-00-00'),
(1115, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:01:32', '', 0, '0000-00-00'),
(1116, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:02:06', '', 0, '0000-00-00'),
(1117, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:02:53', '', 0, '0000-00-00'),
(1118, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:03:53', '', 0, '0000-00-00'),
(1119, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:04:13', '', 0, '0000-00-00'),
(1120, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:04:19', '', 0, '0000-00-00'),
(1121, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:06:18', '', 0, '0000-00-00'),
(1122, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:15:57', '', 0, '0000-00-00'),
(1123, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:17:30', '', 0, '0000-00-00'),
(1124, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:17:35', '', 0, '0000-00-00'),
(1125, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:17:51', '', 0, '0000-00-00'),
(1126, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:17:55', '', 0, '0000-00-00'),
(1127, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:17:57', '', 0, '0000-00-00'),
(1128, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:17:59', '', 0, '0000-00-00'),
(1129, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:18:01', '', 0, '0000-00-00'),
(1130, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:18:01', '', 0, '0000-00-00'),
(1131, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:18:04', '', 0, '0000-00-00'),
(1132, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:18:05', '', 0, '0000-00-00'),
(1133, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:18:09', '', 0, '0000-00-00'),
(1134, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:18:14', '', 0, '0000-00-00'),
(1135, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:18:15', '', 0, '0000-00-00'),
(1136, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:18:16', '', 0, '0000-00-00'),
(1137, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:18:18', '', 0, '0000-00-00'),
(1138, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:18:19', '', 0, '0000-00-00'),
(1139, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:18:20', '', 0, '0000-00-00'),
(1140, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:19:02', '', 0, '0000-00-00'),
(1141, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:20:07', '', 0, '0000-00-00'),
(1142, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:20:11', '', 0, '0000-00-00'),
(1143, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:20:46', '', 0, '0000-00-00'),
(1144, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:20:53', '', 0, '0000-00-00'),
(1145, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:20:58', '', 0, '0000-00-00'),
(1146, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:21:07', '', 0, '0000-00-00'),
(1147, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:21:26', '', 0, '0000-00-00'),
(1148, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:21:29', '', 0, '0000-00-00'),
(1149, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:21:31', '', 0, '0000-00-00'),
(1150, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:21:32', '', 0, '0000-00-00');
INSERT INTO `ostemporal_mesas2` (`id`, `titulo`, `come`, `celu`, `nit`, `num`, `estado`, `direccion`, `ciudad`, `vencimiento`, `impuesto`, `nota`, `descuento`, `dolar`, `retefuente`, `fecha`, `usuario`, `visible`, `fecha2`) VALUES
(1151, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:21:34', '', 0, '0000-00-00'),
(1152, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:22:32', '', 0, '0000-00-00'),
(1153, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:23:05', '', 0, '0000-00-00'),
(1154, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:23:16', '', 0, '0000-00-00'),
(1155, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:23:21', '', 0, '0000-00-00'),
(1156, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:23:40', '', 0, '0000-00-00'),
(1157, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:23:42', '', 0, '0000-00-00'),
(1158, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:23:43', '', 0, '0000-00-00'),
(1159, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:23:48', '', 0, '0000-00-00'),
(1160, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:23:49', '', 0, '0000-00-00'),
(1161, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:23:51', '', 0, '0000-00-00'),
(1162, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:23:56', '', 0, '0000-00-00'),
(1163, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:24:02', '', 0, '0000-00-00'),
(1164, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:24:04', '', 0, '0000-00-00'),
(1165, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:24:05', '', 0, '0000-00-00'),
(1166, '17', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:24:06', '', 0, '0000-00-00'),
(1167, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:24:12', '', 0, '0000-00-00'),
(1168, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:24:19', '', 0, '0000-00-00'),
(1169, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:24:22', '', 0, '0000-00-00'),
(1170, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:24:24', '', 0, '0000-00-00'),
(1171, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:28:28', '', 0, '0000-00-00'),
(1172, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:28:44', '', 0, '0000-00-00'),
(1173, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:28:50', '', 0, '0000-00-00'),
(1174, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:29:12', '', 0, '0000-00-00'),
(1175, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:29:25', '', 0, '0000-00-00'),
(1176, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:29:28', '', 0, '0000-00-00'),
(1177, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:29:32', '', 0, '0000-00-00'),
(1178, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:29:34', '', 0, '0000-00-00'),
(1179, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:29:43', '', 0, '0000-00-00'),
(1180, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:30:03', '', 0, '0000-00-00'),
(1181, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:30:05', '', 0, '0000-00-00'),
(1182, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:30:14', '', 0, '0000-00-00'),
(1183, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:30:34', '', 0, '0000-00-00'),
(1184, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:30:36', '', 0, '0000-00-00'),
(1185, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:30:37', '', 0, '0000-00-00'),
(1186, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:30:39', '', 0, '0000-00-00'),
(1187, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:30:41', '', 0, '0000-00-00'),
(1188, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:30:50', '', 0, '0000-00-00'),
(1189, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:02', '', 0, '0000-00-00'),
(1190, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:03', '', 0, '0000-00-00'),
(1191, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:04', '', 0, '0000-00-00'),
(1192, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:05', '', 0, '0000-00-00'),
(1193, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:06', '', 0, '0000-00-00'),
(1194, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:06', '', 0, '0000-00-00'),
(1195, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:07', '', 0, '0000-00-00'),
(1196, '8', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:07', '', 0, '0000-00-00'),
(1197, '9', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:08', '', 0, '0000-00-00'),
(1198, '10', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:09', '', 0, '0000-00-00'),
(1199, '11', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:09', '', 0, '0000-00-00'),
(1200, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:10', '', 0, '0000-00-00'),
(1201, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:11', '', 0, '0000-00-00'),
(1202, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:12', '', 0, '0000-00-00'),
(1203, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:13', '', 0, '0000-00-00'),
(1204, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:31:13', '', 0, '0000-00-00'),
(1205, '9', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:32:06', '', 0, '0000-00-00'),
(1206, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:32:08', '', 0, '0000-00-00'),
(1207, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:32:09', '', 0, '0000-00-00'),
(1208, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:32:11', '', 0, '0000-00-00'),
(1209, '12', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:32:15', '', 0, '0000-00-00'),
(1210, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:32:16', '', 0, '0000-00-00'),
(1211, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:33:13', '', 0, '0000-00-00'),
(1212, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:33:14', '', 0, '0000-00-00'),
(1213, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:33:16', '', 0, '0000-00-00'),
(1214, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:33:18', '', 0, '0000-00-00'),
(1215, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:36:00', '', 0, '0000-00-00'),
(1216, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:36:05', '', 0, '0000-00-00'),
(1217, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:36:08', '', 0, '0000-00-00'),
(1218, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:36:09', '', 0, '0000-00-00'),
(1219, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:36:10', '', 0, '0000-00-00'),
(1220, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:39:50', '', 0, '0000-00-00'),
(1221, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:39:54', '', 0, '0000-00-00'),
(1222, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:39:55', '', 0, '0000-00-00'),
(1223, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:39:55', '', 0, '0000-00-00'),
(1224, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:39:56', '', 0, '0000-00-00'),
(1225, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:39:57', '', 0, '0000-00-00'),
(1226, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:39:58', '', 0, '0000-00-00'),
(1227, '10', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:39:58', '', 0, '0000-00-00'),
(1228, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:39:59', '', 0, '0000-00-00'),
(1229, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:40:19', '', 0, '0000-00-00'),
(1230, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:42:45', '', 0, '0000-00-00'),
(1231, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 18:49:19', '', 0, '0000-00-00'),
(1232, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:02:46', '', 0, '0000-00-00'),
(1233, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:02:55', '', 0, '0000-00-00'),
(1234, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:06:10', '', 0, '0000-00-00'),
(1235, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:06:12', '', 0, '0000-00-00'),
(1236, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:06:13', '', 0, '0000-00-00'),
(1237, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:07:21', '', 0, '0000-00-00'),
(1238, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:07:32', '', 0, '0000-00-00'),
(1239, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:07:42', '', 0, '0000-00-00'),
(1240, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:07:43', '', 0, '0000-00-00'),
(1241, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:07:46', '', 0, '0000-00-00'),
(1242, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:08:14', '', 0, '0000-00-00'),
(1243, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:08:17', '', 0, '0000-00-00'),
(1244, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:08:18', '', 0, '0000-00-00'),
(1245, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:08:19', '', 0, '0000-00-00'),
(1246, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:08:20', '', 0, '0000-00-00'),
(1247, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:08:22', '', 0, '0000-00-00'),
(1248, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:09:52', '', 0, '0000-00-00'),
(1249, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:13:29', '', 0, '0000-00-00'),
(1250, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:15:24', '', 0, '0000-00-00'),
(1251, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:15:50', '', 0, '0000-00-00'),
(1252, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:16:54', '', 0, '0000-00-00'),
(1253, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:06', '', 0, '0000-00-00'),
(1254, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:08', '', 0, '0000-00-00'),
(1255, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:09', '', 0, '0000-00-00'),
(1256, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:11', '', 0, '0000-00-00'),
(1257, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:14', '', 0, '0000-00-00'),
(1258, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:16', '', 0, '0000-00-00'),
(1259, '12', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:16', '', 0, '0000-00-00'),
(1260, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:17', '', 0, '0000-00-00'),
(1261, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:18', '', 0, '0000-00-00'),
(1262, '16', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:20', '', 0, '0000-00-00'),
(1263, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:20', '', 0, '0000-00-00'),
(1264, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:21', '', 0, '0000-00-00'),
(1265, '11', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:23', '', 0, '0000-00-00'),
(1266, '9', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:24', '', 0, '0000-00-00'),
(1267, '8', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:25', '', 0, '0000-00-00'),
(1268, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:26', '', 0, '0000-00-00'),
(1269, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:26', '', 0, '0000-00-00'),
(1270, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:27', '', 0, '0000-00-00'),
(1271, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:27', '', 0, '0000-00-00'),
(1272, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:28', '', 0, '0000-00-00'),
(1273, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:28', '', 0, '0000-00-00'),
(1274, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:29', '', 0, '0000-00-00'),
(1275, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:30', '', 0, '0000-00-00'),
(1276, '13', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:30', '', 0, '0000-00-00'),
(1277, '12', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:31', '', 0, '0000-00-00'),
(1278, '11', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:31', '', 0, '0000-00-00'),
(1279, '10', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:32', '', 0, '0000-00-00'),
(1280, '8', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:32', '', 0, '0000-00-00'),
(1281, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:33', '', 0, '0000-00-00'),
(1282, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:33', '', 0, '0000-00-00'),
(1283, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:35', '', 0, '0000-00-00'),
(1284, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:44', '', 0, '0000-00-00'),
(1285, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:47', '', 0, '0000-00-00'),
(1286, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:52', '', 0, '0000-00-00'),
(1287, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:56', '', 0, '0000-00-00'),
(1288, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:58', '', 0, '0000-00-00'),
(1289, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:17:59', '', 0, '0000-00-00'),
(1290, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:18:29', '', 0, '0000-00-00'),
(1291, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:18:33', '', 0, '0000-00-00'),
(1292, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:18:35', '', 0, '0000-00-00'),
(1293, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:18:37', '', 0, '0000-00-00'),
(1294, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:19:05', '', 0, '0000-00-00'),
(1295, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:19:07', '', 0, '0000-00-00'),
(1296, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:19:08', '', 0, '0000-00-00'),
(1297, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:19:49', '', 0, '0000-00-00'),
(1298, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:19:50', '', 0, '0000-00-00'),
(1299, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:19:51', '', 0, '0000-00-00'),
(1300, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:19:58', '', 0, '0000-00-00'),
(1301, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:20:08', '', 0, '0000-00-00'),
(1302, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:20:33', '', 0, '0000-00-00'),
(1303, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:20:35', '', 0, '0000-00-00'),
(1304, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:20:36', '', 0, '0000-00-00'),
(1305, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:20:38', '', 0, '0000-00-00'),
(1306, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:20:40', '', 0, '0000-00-00'),
(1307, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:20:41', '', 0, '0000-00-00'),
(1308, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:23:37', '', 0, '0000-00-00'),
(1309, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:23:47', '', 0, '0000-00-00'),
(1310, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:23:50', '', 0, '0000-00-00'),
(1311, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:23:51', '', 0, '0000-00-00'),
(1312, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:23:52', '', 0, '0000-00-00'),
(1313, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:23:53', '', 0, '0000-00-00'),
(1314, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:23:55', '', 0, '0000-00-00'),
(1315, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:23:56', '', 0, '0000-00-00'),
(1316, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:23:58', '', 0, '0000-00-00'),
(1317, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:28:44', '', 0, '0000-00-00'),
(1318, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:29:22', '', 0, '0000-00-00'),
(1319, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:36:23', '', 0, '0000-00-00'),
(1320, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:37:07', '', 0, '0000-00-00'),
(1321, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:37:10', '', 0, '0000-00-00'),
(1322, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:37:36', '', 0, '0000-00-00'),
(1323, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:37:41', '', 0, '0000-00-00'),
(1324, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:37:46', '', 0, '0000-00-00'),
(1325, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:39:33', '', 0, '0000-00-00'),
(1326, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:40:12', '', 0, '0000-00-00'),
(1327, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:41:08', '', 0, '0000-00-00'),
(1328, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:41:38', '', 0, '0000-00-00'),
(1329, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:41:40', '', 0, '0000-00-00'),
(1330, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:41:42', '', 0, '0000-00-00'),
(1331, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:41:43', '', 0, '0000-00-00'),
(1332, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:41:45', '', 0, '0000-00-00'),
(1333, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:02', '', 0, '0000-00-00'),
(1334, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:04', '', 0, '0000-00-00'),
(1335, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:05', '', 0, '0000-00-00'),
(1336, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:07', '', 0, '0000-00-00'),
(1337, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:10', '', 0, '0000-00-00'),
(1338, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:11', '', 0, '0000-00-00'),
(1339, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:22', '', 0, '0000-00-00'),
(1340, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:35', '', 0, '0000-00-00'),
(1341, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:39', '', 0, '0000-00-00'),
(1342, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:42', '', 0, '0000-00-00'),
(1343, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:49', '', 0, '0000-00-00'),
(1344, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:50', '', 0, '0000-00-00'),
(1345, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:52', '', 0, '0000-00-00'),
(1346, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:53', '', 0, '0000-00-00'),
(1347, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:55', '', 0, '0000-00-00'),
(1348, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:42:57', '', 0, '0000-00-00'),
(1349, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:43:00', '', 0, '0000-00-00'),
(1350, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:45:35', '', 0, '0000-00-00'),
(1351, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:45:58', '', 0, '0000-00-00'),
(1352, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:46:13', '', 0, '0000-00-00'),
(1353, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:46:14', '', 0, '0000-00-00'),
(1354, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:46:17', '', 0, '0000-00-00'),
(1355, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:46:18', '', 0, '0000-00-00'),
(1356, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:46:29', '', 0, '0000-00-00'),
(1357, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:49:41', '', 0, '0000-00-00'),
(1358, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:49:46', '', 0, '0000-00-00'),
(1359, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:49:48', '', 0, '0000-00-00'),
(1360, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:49:48', '', 0, '0000-00-00'),
(1361, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:49:49', '', 0, '0000-00-00'),
(1362, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:49:52', '', 0, '0000-00-00'),
(1363, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:49:53', '', 0, '0000-00-00'),
(1364, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:49:54', '', 0, '0000-00-00'),
(1365, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:49:55', '', 0, '0000-00-00'),
(1366, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:49:56', '', 0, '0000-00-00'),
(1367, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:49:59', '', 0, '0000-00-00'),
(1368, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:53:18', '', 0, '0000-00-00'),
(1369, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:53:19', '', 0, '0000-00-00'),
(1370, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:53:43', '', 0, '0000-00-00'),
(1371, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:53:48', '', 0, '0000-00-00'),
(1372, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:53:56', '', 0, '0000-00-00'),
(1373, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:53:57', '', 0, '0000-00-00'),
(1374, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:05', '', 0, '0000-00-00'),
(1375, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:08', '', 0, '0000-00-00'),
(1376, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:09', '', 0, '0000-00-00'),
(1377, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:25', '', 0, '0000-00-00'),
(1378, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:27', '', 0, '0000-00-00'),
(1379, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:29', '', 0, '0000-00-00'),
(1380, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:31', '', 0, '0000-00-00'),
(1381, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:32', '', 0, '0000-00-00'),
(1382, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:33', '', 0, '0000-00-00'),
(1383, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:35', '', 0, '0000-00-00'),
(1384, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:35', '', 0, '0000-00-00'),
(1385, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:36', '', 0, '0000-00-00'),
(1386, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:37', '', 0, '0000-00-00'),
(1387, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:49', '', 0, '0000-00-00'),
(1388, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:50', '', 0, '0000-00-00'),
(1389, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:52', '', 0, '0000-00-00'),
(1390, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:54:56', '', 0, '0000-00-00'),
(1391, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:55:08', '', 0, '0000-00-00'),
(1392, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:55:16', '', 0, '0000-00-00'),
(1393, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:55:18', '', 0, '0000-00-00'),
(1394, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:55:19', '', 0, '0000-00-00'),
(1395, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:55:20', '', 0, '0000-00-00'),
(1396, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:55:46', '', 0, '0000-00-00'),
(1397, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:55:59', '', 0, '0000-00-00'),
(1398, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:57:00', '', 0, '0000-00-00'),
(1399, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:57:54', '', 0, '0000-00-00'),
(1400, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:57:55', '', 0, '0000-00-00'),
(1401, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:58:08', '', 0, '0000-00-00'),
(1402, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:58:09', '', 0, '0000-00-00'),
(1403, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:58:22', '', 0, '0000-00-00'),
(1404, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:58:23', '', 0, '0000-00-00'),
(1405, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:58:24', '', 0, '0000-00-00'),
(1406, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:58:53', '', 0, '0000-00-00'),
(1407, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 19:59:42', '', 0, '0000-00-00'),
(1408, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:00:11', '', 0, '0000-00-00'),
(1409, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:00:46', '', 0, '0000-00-00'),
(1410, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:01:01', '', 0, '0000-00-00'),
(1411, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:01:02', '', 0, '0000-00-00'),
(1412, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:01:04', '', 0, '0000-00-00'),
(1413, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:01:09', '', 0, '0000-00-00'),
(1414, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:01:49', '', 0, '0000-00-00'),
(1415, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:02:23', '', 0, '0000-00-00'),
(1416, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:03:05', '', 0, '0000-00-00'),
(1417, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:03:28', '', 0, '0000-00-00'),
(1418, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:03:29', '', 0, '0000-00-00'),
(1419, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:03:30', '', 0, '0000-00-00'),
(1420, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:03:31', '', 0, '0000-00-00'),
(1421, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:04:02', '', 0, '0000-00-00'),
(1422, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:04:13', '', 0, '0000-00-00'),
(1423, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:04:28', '', 0, '0000-00-00'),
(1424, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:05:28', '', 0, '0000-00-00'),
(1425, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:05:35', '', 0, '0000-00-00'),
(1426, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:05:36', '', 0, '0000-00-00'),
(1427, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:05:37', '', 0, '0000-00-00'),
(1428, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:05:38', '', 0, '0000-00-00'),
(1429, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:05:39', '', 0, '0000-00-00'),
(1430, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:05:46', '', 0, '0000-00-00'),
(1431, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:05:47', '', 0, '0000-00-00'),
(1432, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:05:47', '', 0, '0000-00-00'),
(1433, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:05:48', '', 0, '0000-00-00'),
(1434, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:05:50', '', 0, '0000-00-00'),
(1435, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:06:12', '', 0, '0000-00-00'),
(1436, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:06:15', '', 0, '0000-00-00'),
(1437, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:06:26', '', 0, '0000-00-00'),
(1438, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:06:39', '', 0, '0000-00-00'),
(1439, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:07:31', '', 0, '0000-00-00'),
(1440, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:07:50', '', 0, '0000-00-00'),
(1441, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:07:51', '', 0, '0000-00-00'),
(1442, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:07:54', '', 0, '0000-00-00'),
(1443, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:07:55', '', 0, '0000-00-00'),
(1444, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:07:56', '', 0, '0000-00-00'),
(1445, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:07:56', '', 0, '0000-00-00'),
(1446, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:07:57', '', 0, '0000-00-00'),
(1447, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:07:58', '', 0, '0000-00-00'),
(1448, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:08:01', '', 0, '0000-00-00'),
(1449, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:08:02', '', 0, '0000-00-00'),
(1450, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:08:03', '', 0, '0000-00-00'),
(1451, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:08:04', '', 0, '0000-00-00'),
(1452, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:08:07', '', 0, '0000-00-00'),
(1453, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:10:36', '', 0, '0000-00-00'),
(1454, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:11:34', '', 0, '0000-00-00'),
(1455, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:11:46', '', 0, '0000-00-00'),
(1456, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:11:47', '', 0, '0000-00-00'),
(1457, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:11:48', '', 0, '0000-00-00'),
(1458, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:11:49', '', 0, '0000-00-00'),
(1459, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:13:39', '', 0, '0000-00-00'),
(1460, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:13:47', '', 0, '0000-00-00'),
(1461, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:14:43', '', 0, '0000-00-00'),
(1462, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:15:31', '', 0, '0000-00-00'),
(1463, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:15:33', '', 0, '0000-00-00'),
(1464, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:16:05', '', 0, '0000-00-00'),
(1465, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:16:14', '', 0, '0000-00-00'),
(1466, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:16:15', '', 0, '0000-00-00'),
(1467, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:16:17', '', 0, '0000-00-00'),
(1468, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:16:18', '', 0, '0000-00-00'),
(1469, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:16:46', '', 0, '0000-00-00'),
(1470, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:16:47', '', 0, '0000-00-00'),
(1471, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:16:49', '', 0, '0000-00-00'),
(1472, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:16:49', '', 0, '0000-00-00'),
(1473, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:17:56', '', 0, '0000-00-00'),
(1474, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:18:11', '', 0, '0000-00-00'),
(1475, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:18:15', '', 0, '0000-00-00'),
(1476, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:18:18', '', 0, '0000-00-00'),
(1477, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:18:19', '', 0, '0000-00-00'),
(1478, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:19:17', '', 0, '0000-00-00'),
(1479, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:19:47', '', 0, '0000-00-00'),
(1480, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:20:11', '', 0, '0000-00-00'),
(1481, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:20:25', '', 0, '0000-00-00'),
(1482, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:20:26', '', 0, '0000-00-00'),
(1483, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:20:47', '', 0, '0000-00-00'),
(1484, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:20:49', '', 0, '0000-00-00'),
(1485, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:20:50', '', 0, '0000-00-00'),
(1486, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:20:52', '', 0, '0000-00-00'),
(1487, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:20:52', '', 0, '0000-00-00'),
(1488, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:20:57', '', 0, '0000-00-00'),
(1489, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:20:58', '', 0, '0000-00-00'),
(1490, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:20:59', '', 0, '0000-00-00'),
(1491, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:21:15', '', 0, '0000-00-00'),
(1492, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:21:16', '', 0, '0000-00-00'),
(1493, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:21:18', '', 0, '0000-00-00'),
(1494, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:21:19', '', 0, '0000-00-00'),
(1495, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:21:37', '', 0, '0000-00-00'),
(1496, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:21:40', '', 0, '0000-00-00'),
(1497, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:22:08', '', 0, '0000-00-00'),
(1498, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:22:11', '', 0, '0000-00-00'),
(1499, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:23:00', '', 0, '0000-00-00'),
(1500, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:23:01', '', 0, '0000-00-00'),
(1501, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:23:02', '', 0, '0000-00-00'),
(1502, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:23:09', '', 0, '0000-00-00'),
(1503, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:23:10', '', 0, '0000-00-00'),
(1504, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:23:55', '', 0, '0000-00-00'),
(1505, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:23:56', '', 0, '0000-00-00'),
(1506, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:23:57', '', 0, '0000-00-00'),
(1507, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:24:28', '', 0, '0000-00-00'),
(1508, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:24:35', '', 0, '0000-00-00'),
(1509, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:25:56', '', 0, '0000-00-00'),
(1510, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:26:00', '', 0, '0000-00-00'),
(1511, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:26:01', '', 0, '0000-00-00'),
(1512, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:26:03', '', 0, '0000-00-00'),
(1513, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:36:32', '', 0, '0000-00-00'),
(1514, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:36:32', '', 0, '0000-00-00'),
(1515, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:36:52', '', 0, '0000-00-00'),
(1516, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:37:08', '', 0, '0000-00-00'),
(1517, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:37:09', '', 0, '0000-00-00'),
(1518, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:37:11', '', 0, '0000-00-00'),
(1519, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:37:13', '', 0, '0000-00-00'),
(1520, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:38:58', '', 0, '0000-00-00'),
(1521, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:39:14', '', 0, '0000-00-00'),
(1522, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:42:15', '', 0, '0000-00-00'),
(1523, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:44:07', '', 0, '0000-00-00'),
(1524, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:45:01', '', 0, '0000-00-00'),
(1525, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:45:52', '', 0, '0000-00-00'),
(1526, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:46:01', '', 0, '0000-00-00'),
(1527, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:46:51', '', 0, '0000-00-00'),
(1528, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:46:52', '', 0, '0000-00-00'),
(1529, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:46:53', '', 0, '0000-00-00'),
(1530, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:46:54', '', 0, '0000-00-00'),
(1531, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:46:55', '', 0, '0000-00-00'),
(1532, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:47:20', '', 0, '0000-00-00'),
(1533, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:47:21', '', 0, '0000-00-00'),
(1534, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:47:23', '', 0, '0000-00-00'),
(1535, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:48:21', '', 0, '0000-00-00'),
(1536, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:48:30', '', 0, '0000-00-00'),
(1537, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:48:31', '', 0, '0000-00-00'),
(1538, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:48:32', '', 0, '0000-00-00'),
(1539, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:48:32', '', 0, '0000-00-00'),
(1540, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:49:06', '', 0, '0000-00-00'),
(1541, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:49:09', '', 0, '0000-00-00'),
(1542, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:49:16', '', 0, '0000-00-00'),
(1543, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:50:02', '', 0, '0000-00-00'),
(1544, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:52:29', '', 0, '0000-00-00'),
(1545, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:52:53', '', 0, '0000-00-00'),
(1546, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:53:25', '', 0, '0000-00-00'),
(1547, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:53:34', '', 0, '0000-00-00'),
(1548, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:53:35', '', 0, '0000-00-00'),
(1549, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:56:29', '', 0, '0000-00-00'),
(1550, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:57:27', '', 0, '0000-00-00'),
(1551, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:59:04', '', 0, '0000-00-00'),
(1552, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:59:05', '', 0, '0000-00-00'),
(1553, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:59:07', '', 0, '0000-00-00'),
(1554, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:59:10', '', 0, '0000-00-00'),
(1555, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:59:13', '', 0, '0000-00-00'),
(1556, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:59:15', '', 0, '0000-00-00'),
(1557, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:59:16', '', 0, '0000-00-00'),
(1558, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:59:17', '', 0, '0000-00-00'),
(1559, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:59:18', '', 0, '0000-00-00'),
(1560, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:59:20', '', 0, '0000-00-00'),
(1561, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:59:21', '', 0, '0000-00-00'),
(1562, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 20:59:21', '', 0, '0000-00-00'),
(1563, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:05:31', '', 0, '0000-00-00'),
(1564, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:06:19', '', 0, '0000-00-00'),
(1565, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:06:27', '', 0, '0000-00-00'),
(1566, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:06:28', '', 0, '0000-00-00'),
(1567, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:06:29', '', 0, '0000-00-00'),
(1568, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:06:31', '', 0, '0000-00-00'),
(1569, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:06:32', '', 0, '0000-00-00'),
(1570, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:06:33', '', 0, '0000-00-00'),
(1571, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:06:33', '', 0, '0000-00-00'),
(1572, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:06:34', '', 0, '0000-00-00'),
(1573, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:06:35', '', 0, '0000-00-00'),
(1574, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:08:35', '', 0, '0000-00-00'),
(1575, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:09:15', '', 0, '0000-00-00'),
(1576, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:09:32', '', 0, '0000-00-00'),
(1577, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:09:36', '', 0, '0000-00-00'),
(1578, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:09:37', '', 0, '0000-00-00'),
(1579, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:09:38', '', 0, '0000-00-00'),
(1580, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:09:39', '', 0, '0000-00-00'),
(1581, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:09:41', '', 0, '0000-00-00'),
(1582, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:09:42', '', 0, '0000-00-00'),
(1583, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:09:44', '', 0, '0000-00-00'),
(1584, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:09:45', '', 0, '0000-00-00'),
(1585, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:09:45', '', 0, '0000-00-00'),
(1586, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:09:48', '', 0, '0000-00-00'),
(1587, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:09:49', '', 0, '0000-00-00'),
(1588, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:09:55', '', 0, '0000-00-00'),
(1589, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:11:21', '', 0, '0000-00-00'),
(1590, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:11:36', '', 0, '0000-00-00'),
(1591, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:12:17', '', 0, '0000-00-00'),
(1592, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:12:40', '', 0, '0000-00-00'),
(1593, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:12:44', '', 0, '0000-00-00'),
(1594, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:12:45', '', 0, '0000-00-00'),
(1595, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:12:46', '', 0, '0000-00-00'),
(1596, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:12:47', '', 0, '0000-00-00'),
(1597, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:12:48', '', 0, '0000-00-00'),
(1598, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:12:55', '', 0, '0000-00-00'),
(1599, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:12:56', '', 0, '0000-00-00'),
(1600, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:14:46', '', 0, '0000-00-00'),
(1601, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:15:17', '', 0, '0000-00-00'),
(1602, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:16:07', '', 0, '0000-00-00'),
(1603, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:16:12', '', 0, '0000-00-00'),
(1604, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:20:40', '', 0, '0000-00-00'),
(1605, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:22:30', '', 0, '0000-00-00'),
(1606, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:22:56', '', 0, '0000-00-00'),
(1607, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:23:47', '', 0, '0000-00-00'),
(1608, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:34:33', '', 0, '0000-00-00'),
(1609, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:35:37', '', 0, '0000-00-00'),
(1610, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:37:02', '', 0, '0000-00-00'),
(1611, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:37:04', '', 0, '0000-00-00'),
(1612, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:37:05', '', 0, '0000-00-00'),
(1613, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:37:14', '', 0, '0000-00-00'),
(1614, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:37:16', '', 0, '0000-00-00'),
(1615, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:37:17', '', 0, '0000-00-00'),
(1616, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:37:18', '', 0, '0000-00-00'),
(1617, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:37:19', '', 0, '0000-00-00'),
(1618, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:38:24', '', 0, '0000-00-00'),
(1619, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:38:25', '', 0, '0000-00-00'),
(1620, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:38:27', '', 0, '0000-00-00'),
(1621, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:38:28', '', 0, '0000-00-00'),
(1622, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:38:29', '', 0, '0000-00-00'),
(1623, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:38:30', '', 0, '0000-00-00'),
(1624, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:38:31', '', 0, '0000-00-00');
INSERT INTO `ostemporal_mesas2` (`id`, `titulo`, `come`, `celu`, `nit`, `num`, `estado`, `direccion`, `ciudad`, `vencimiento`, `impuesto`, `nota`, `descuento`, `dolar`, `retefuente`, `fecha`, `usuario`, `visible`, `fecha2`) VALUES
(1625, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:38:34', '', 0, '0000-00-00'),
(1626, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:38:35', '', 0, '0000-00-00'),
(1627, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:38:36', '', 0, '0000-00-00'),
(1628, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:38:37', '', 0, '0000-00-00'),
(1629, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:38:53', '', 0, '0000-00-00'),
(1630, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:41:13', '', 0, '0000-00-00'),
(1631, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:41:30', '', 0, '0000-00-00'),
(1632, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:41:42', '', 0, '0000-00-00'),
(1633, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:41:43', '', 0, '0000-00-00'),
(1634, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:41:44', '', 0, '0000-00-00'),
(1635, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:41:45', '', 0, '0000-00-00'),
(1636, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:50:10', '', 0, '0000-00-00'),
(1637, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:50:10', '', 0, '0000-00-00'),
(1638, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:51:18', '', 0, '0000-00-00'),
(1639, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 21:51:53', '', 0, '0000-00-00'),
(1640, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:09', '', 0, '0000-00-00'),
(1641, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:20', '', 0, '0000-00-00'),
(1642, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:22', '', 0, '0000-00-00'),
(1643, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:24', '', 0, '0000-00-00'),
(1644, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:25', '', 0, '0000-00-00'),
(1645, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:26', '', 0, '0000-00-00'),
(1646, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:26', '', 0, '0000-00-00'),
(1647, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:27', '', 0, '0000-00-00'),
(1648, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:27', '', 0, '0000-00-00'),
(1649, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:28', '', 0, '0000-00-00'),
(1650, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:28', '', 0, '0000-00-00'),
(1651, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:31', '', 0, '0000-00-00'),
(1652, '8', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:33', '', 0, '0000-00-00'),
(1653, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:34', '', 0, '0000-00-00'),
(1654, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:37', '', 0, '0000-00-00'),
(1655, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:37', '', 0, '0000-00-00'),
(1656, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:39', '', 0, '0000-00-00'),
(1657, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:00:44', '', 0, '0000-00-00'),
(1658, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:07:21', '', 0, '0000-00-00'),
(1659, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:07:23', '', 0, '0000-00-00'),
(1660, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:07:24', '', 0, '0000-00-00'),
(1661, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:18', '', 0, '0000-00-00'),
(1662, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:21', '', 0, '0000-00-00'),
(1663, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:25', '', 0, '0000-00-00'),
(1664, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:27', '', 0, '0000-00-00'),
(1665, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:28', '', 0, '0000-00-00'),
(1666, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:29', '', 0, '0000-00-00'),
(1667, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:30', '', 0, '0000-00-00'),
(1668, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:30', '', 0, '0000-00-00'),
(1669, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:31', '', 0, '0000-00-00'),
(1670, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:32', '', 0, '0000-00-00'),
(1671, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:33', '', 0, '0000-00-00'),
(1672, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:34', '', 0, '0000-00-00'),
(1673, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:36', '', 0, '0000-00-00'),
(1674, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:38', '', 0, '0000-00-00'),
(1675, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:38', '', 0, '0000-00-00'),
(1676, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:39', '', 0, '0000-00-00'),
(1677, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:40', '', 0, '0000-00-00'),
(1678, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:40', '', 0, '0000-00-00'),
(1679, '8', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:42', '', 0, '0000-00-00'),
(1680, '9', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:43', '', 0, '0000-00-00'),
(1681, '8', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:44', '', 0, '0000-00-00'),
(1682, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:44', '', 0, '0000-00-00'),
(1683, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:09:46', '', 0, '0000-00-00'),
(1684, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:13:11', '', 0, '0000-00-00'),
(1685, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:13:24', '', 0, '0000-00-00'),
(1686, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:13:26', '', 0, '0000-00-00'),
(1687, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:13:27', '', 0, '0000-00-00'),
(1688, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:13:28', '', 0, '0000-00-00'),
(1689, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:13:31', '', 0, '0000-00-00'),
(1690, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:13:32', '', 0, '0000-00-00'),
(1691, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:13:35', '', 0, '0000-00-00'),
(1692, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:13:41', '', 0, '0000-00-00'),
(1693, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:13:45', '', 0, '0000-00-00'),
(1694, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:03', '', 0, '0000-00-00'),
(1695, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:14', '', 0, '0000-00-00'),
(1696, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:25', '', 0, '0000-00-00'),
(1697, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:25', '', 0, '0000-00-00'),
(1698, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:26', '', 0, '0000-00-00'),
(1699, '17', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:26', '', 0, '0000-00-00'),
(1700, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:28', '', 0, '0000-00-00'),
(1701, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:29', '', 0, '0000-00-00'),
(1702, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:30', '', 0, '0000-00-00'),
(1703, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:31', '', 0, '0000-00-00'),
(1704, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:32', '', 0, '0000-00-00'),
(1705, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:33', '', 0, '0000-00-00'),
(1706, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:34', '', 0, '0000-00-00'),
(1707, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:35', '', 0, '0000-00-00'),
(1708, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:14:37', '', 0, '0000-00-00'),
(1709, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:37:04', '', 0, '0000-00-00'),
(1710, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:37:05', '', 0, '0000-00-00'),
(1711, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:37:07', '', 0, '0000-00-00'),
(1712, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:38:52', '', 0, '0000-00-00'),
(1713, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:38:53', '', 0, '0000-00-00'),
(1714, '9', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:38:55', '', 0, '0000-00-00'),
(1715, '8', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:38:56', '', 0, '0000-00-00'),
(1716, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:38:57', '', 0, '0000-00-00'),
(1717, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:39:22', '', 0, '0000-00-00'),
(1718, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:39:23', '', 0, '0000-00-00'),
(1719, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:39:24', '', 0, '0000-00-00'),
(1720, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:39:26', '', 0, '0000-00-00'),
(1721, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:39:27', '', 0, '0000-00-00'),
(1722, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:39:28', '', 0, '0000-00-00'),
(1723, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:39:29', '', 0, '0000-00-00'),
(1724, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:39:30', '', 0, '0000-00-00'),
(1725, '13', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:39:30', '', 0, '0000-00-00'),
(1726, '8', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:39:31', '', 0, '0000-00-00'),
(1727, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:39:31', '', 0, '0000-00-00'),
(1728, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:39:32', '', 0, '0000-00-00'),
(1729, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:39:33', '', 0, '0000-00-00'),
(1730, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:52:33', '', 0, '0000-00-00'),
(1731, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:52:35', '', 0, '0000-00-00'),
(1732, '7', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:52:36', '', 0, '0000-00-00'),
(1733, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:52:37', '', 0, '0000-00-00'),
(1734, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:52:37', '', 0, '0000-00-00'),
(1735, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:52:39', '', 0, '0000-00-00'),
(1736, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:52:39', '', 0, '0000-00-00'),
(1737, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:52:40', '', 0, '0000-00-00'),
(1738, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:52:42', '', 0, '0000-00-00'),
(1739, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:52:42', '', 0, '0000-00-00'),
(1740, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:52:43', '', 0, '0000-00-00'),
(1741, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:52:43', '', 0, '0000-00-00'),
(1742, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:54:57', '', 0, '0000-00-00'),
(1743, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:55:19', '', 0, '0000-00-00'),
(1744, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:55:20', '', 0, '0000-00-00'),
(1745, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:55:21', '', 0, '0000-00-00'),
(1746, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:55:23', '', 0, '0000-00-00'),
(1747, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:55:25', '', 0, '0000-00-00'),
(1748, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:55:29', '', 0, '0000-00-00'),
(1749, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 22:55:31', '', 0, '0000-00-00'),
(1750, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-01 23:13:05', '', 0, '0000-00-00'),
(1751, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:06', '', 0, '0000-00-00'),
(1752, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:19', '', 0, '0000-00-00'),
(1753, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:21', '', 0, '0000-00-00'),
(1754, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:23', '', 0, '0000-00-00'),
(1755, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:24', '', 0, '0000-00-00'),
(1756, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:25', '', 0, '0000-00-00'),
(1757, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:26', '', 0, '0000-00-00'),
(1758, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:28', '', 0, '0000-00-00'),
(1759, '18', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:31', '', 0, '0000-00-00'),
(1760, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:33', '', 0, '0000-00-00'),
(1761, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:38', '', 0, '0000-00-00'),
(1762, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:39', '', 0, '0000-00-00'),
(1763, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:41', '', 0, '0000-00-00'),
(1764, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:42', '', 0, '0000-00-00'),
(1765, '16', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:43', '', 0, '0000-00-00'),
(1766, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:44', '', 0, '0000-00-00'),
(1767, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:46', '', 0, '0000-00-00'),
(1768, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:11:47', '', 0, '0000-00-00'),
(1769, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:13:48', '', 0, '0000-00-00'),
(1770, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:14:40', '', 0, '0000-00-00'),
(1771, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:14:55', '', 0, '0000-00-00'),
(1772, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:16:01', '', 0, '0000-00-00'),
(1773, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:18:39', '', 0, '0000-00-00'),
(1774, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:18:40', '', 0, '0000-00-00'),
(1775, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:18:42', '', 0, '0000-00-00'),
(1776, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:18:42', '', 0, '0000-00-00'),
(1777, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:18:45', '', 0, '0000-00-00'),
(1778, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:18:47', '', 0, '0000-00-00'),
(1779, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:18:50', '', 0, '0000-00-00'),
(1780, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:18:56', '', 0, '0000-00-00'),
(1781, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:18:57', '', 0, '0000-00-00'),
(1782, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:19:00', '', 0, '0000-00-00'),
(1783, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:19:00', '', 0, '0000-00-00'),
(1784, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:21:59', '', 0, '0000-00-00'),
(1785, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:22:01', '', 0, '0000-00-00'),
(1786, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:22:03', '', 0, '0000-00-00'),
(1787, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:22:10', '', 0, '0000-00-00'),
(1788, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:22:13', '', 0, '0000-00-00'),
(1789, '6', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:22:14', '', 0, '0000-00-00'),
(1790, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:22:16', '', 0, '0000-00-00'),
(1791, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:22:18', '', 0, '0000-00-00'),
(1792, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:22:19', '', 0, '0000-00-00'),
(1793, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 15:22:21', '', 0, '0000-00-00'),
(1794, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 16:33:07', '', 0, '0000-00-00'),
(1795, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 19:33:42', '', 0, '0000-00-00'),
(1796, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 19:33:44', '', 0, '0000-00-00'),
(1797, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 19:33:44', '', 0, '0000-00-00'),
(1798, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 19:33:45', '', 0, '0000-00-00'),
(1799, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 19:33:46', '', 0, '0000-00-00'),
(1800, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 19:33:47', '', 0, '0000-00-00'),
(1801, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 19:33:49', '', 0, '0000-00-00'),
(1802, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 19:33:49', '', 0, '0000-00-00'),
(1803, '14', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 19:33:50', '', 0, '0000-00-00'),
(1804, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 19:33:51', '', 0, '0000-00-00'),
(1805, '13', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-02 19:33:51', '', 0, '0000-00-00'),
(1806, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-03 18:19:45', '', 0, '0000-00-00'),
(1807, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-03 18:19:48', '', 0, '0000-00-00'),
(1808, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-03 18:19:49', '', 0, '0000-00-00'),
(1809, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-03 18:19:50', '', 0, '0000-00-00'),
(1810, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-03 18:19:55', '', 0, '0000-00-00'),
(1811, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-03 18:19:56', '', 0, '0000-00-00'),
(1812, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-03 18:19:58', '', 0, '0000-00-00'),
(1813, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-03 18:19:58', '', 0, '0000-00-00'),
(1814, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-03 18:20:00', '', 0, '0000-00-00'),
(1815, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:16:15', '', 0, '0000-00-00'),
(1816, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:16:18', '', 0, '0000-00-00'),
(1817, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:16:20', '', 0, '0000-00-00'),
(1818, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:16:21', '', 0, '0000-00-00'),
(1819, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:16:22', '', 0, '0000-00-00'),
(1820, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:16:23', '', 0, '0000-00-00'),
(1821, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:16:25', '', 0, '0000-00-00'),
(1822, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:18:01', '', 0, '0000-00-00'),
(1823, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:26:22', '', 0, '0000-00-00'),
(1824, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:26:23', '', 0, '0000-00-00'),
(1825, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:26:24', '', 0, '0000-00-00'),
(1826, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:26:25', '', 0, '0000-00-00'),
(1827, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:26:26', '', 0, '0000-00-00'),
(1828, '19', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:26:28', '', 0, '0000-00-00'),
(1829, '20', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:26:29', '', 0, '0000-00-00'),
(1830, '15', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:26:30', '', 0, '0000-00-00'),
(1831, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-04 20:26:32', '', 0, '0000-00-00'),
(1832, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 12:36:33', '', 0, '0000-00-00'),
(1833, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 12:39:09', '', 0, '0000-00-00'),
(1834, '5', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 12:39:19', '', 0, '0000-00-00'),
(1835, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 12:39:20', '', 0, '0000-00-00'),
(1836, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 12:39:21', '', 0, '0000-00-00'),
(1837, '4', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 12:39:22', '', 0, '0000-00-00'),
(1838, '2', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 12:39:23', '', 0, '0000-00-00'),
(1839, '3', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 12:39:24', '', 0, '0000-00-00'),
(1840, '1', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 12:39:25', '', 0, '0000-00-00'),
(1841, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 15:10:18', '', 0, '0000-00-00'),
(1842, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 19:06:34', '', 0, '0000-00-00'),
(1843, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 20:01:56', '', 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ostemporal_parqueadero`
--

CREATE TABLE `ostemporal_parqueadero` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `come` varchar(5000) NOT NULL,
  `celu` varchar(100) NOT NULL,
  `nit` varchar(255) NOT NULL,
  `num` bigint(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `descuento` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `fecha2` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ostemporal_parqueadero`
--

INSERT INTO `ostemporal_parqueadero` (`id`, `titulo`, `come`, `celu`, `nit`, `num`, `estado`, `direccion`, `ciudad`, `vencimiento`, `impuesto`, `nota`, `descuento`, `dolar`, `retefuente`, `fecha`, `usuario`, `visible`, `fecha2`) VALUES
(1, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 15:10:18', '', 0, '0000-00-00'),
(2, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 19:06:34', '', 0, '0000-00-00'),
(3, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 20:01:45', '', 0, '0000-00-00'),
(4, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 20:01:53', '', 0, '0000-00-00'),
(5, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 20:01:56', '', 0, '0000-00-00'),
(6, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:06:30', '', 0, '0000-00-00'),
(7, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:06:37', '', 0, '0000-00-00'),
(8, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:07:03', '', 0, '0000-00-00'),
(9, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:24:55', '', 0, '0000-00-00'),
(10, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:25:14', '', 0, '0000-00-00'),
(11, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:25:17', '', 0, '0000-00-00'),
(12, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:25:22', '', 0, '0000-00-00'),
(13, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:25:50', '', 0, '0000-00-00'),
(14, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:26:58', '', 0, '0000-00-00'),
(15, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:27:20', '', 0, '0000-00-00'),
(16, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:27:52', '', 0, '0000-00-00'),
(17, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:28:10', '', 0, '0000-00-00'),
(18, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:28:19', '', 0, '0000-00-00'),
(19, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:29:54', '', 0, '0000-00-00'),
(20, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:30:00', '', 0, '0000-00-00'),
(21, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:30:42', '', 0, '0000-00-00'),
(22, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:30:45', '', 0, '0000-00-00'),
(23, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:30:46', '', 0, '0000-00-00'),
(24, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:31:04', '', 0, '0000-00-00'),
(25, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:31:06', '', 0, '0000-00-00'),
(26, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:33:48', '', 0, '0000-00-00'),
(27, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:34:37', '', 0, '0000-00-00'),
(28, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:36:58', '', 0, '0000-00-00'),
(29, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:37:37', '', 0, '0000-00-00'),
(30, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:37:46', '', 0, '0000-00-00'),
(31, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:37:50', '', 0, '0000-00-00'),
(32, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:37:58', '', 0, '0000-00-00'),
(33, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:38:18', '', 0, '0000-00-00'),
(34, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:38:36', '', 0, '0000-00-00'),
(35, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:38:45', '', 0, '0000-00-00'),
(36, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:40:09', '', 0, '0000-00-00'),
(37, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:40:31', '', 0, '0000-00-00'),
(38, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:41:04', '', 0, '0000-00-00'),
(39, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:41:39', '', 0, '0000-00-00'),
(40, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-05 23:41:41', '', 0, '0000-00-00'),
(41, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 02:56:42', '', 0, '0000-00-00'),
(42, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 02:56:44', '', 0, '0000-00-00'),
(43, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 02:58:02', '', 0, '0000-00-00'),
(44, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 02:58:06', '', 0, '0000-00-00'),
(45, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 02:58:07', '', 0, '0000-00-00'),
(46, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 02:59:26', '', 0, '0000-00-00'),
(47, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 02:59:53', '', 0, '0000-00-00'),
(48, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 17:16:29', '', 0, '0000-00-00'),
(49, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:24:21', '', 0, '0000-00-00'),
(50, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:25:30', '', 0, '0000-00-00'),
(51, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:26:59', '', 0, '0000-00-00'),
(52, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:27:25', '', 0, '0000-00-00'),
(53, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:30:11', '', 0, '0000-00-00'),
(54, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:30:44', '', 0, '0000-00-00'),
(55, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:31:02', '', 0, '0000-00-00'),
(56, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:31:29', '', 0, '0000-00-00'),
(57, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:34:07', '', 0, '0000-00-00'),
(58, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:35:14', '', 0, '0000-00-00'),
(59, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:36:37', '', 0, '0000-00-00'),
(60, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:37:53', '', 0, '0000-00-00'),
(61, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:38:31', '', 0, '0000-00-00'),
(62, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:38:42', '', 0, '0000-00-00'),
(63, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:38:49', '', 0, '0000-00-00'),
(64, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:39:07', '', 0, '0000-00-00'),
(65, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:39:40', '', 0, '0000-00-00'),
(66, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:40:18', '', 0, '0000-00-00'),
(67, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:40:45', '', 0, '0000-00-00'),
(68, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:40:59', '', 0, '0000-00-00'),
(69, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:41:06', '', 0, '0000-00-00'),
(70, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:41:45', '', 0, '0000-00-00'),
(71, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:41:49', '', 0, '0000-00-00'),
(72, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:41:55', '', 0, '0000-00-00'),
(73, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:42:05', '', 0, '0000-00-00'),
(74, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:42:12', '', 0, '0000-00-00'),
(75, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:42:42', '', 0, '0000-00-00'),
(76, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:43:57', '', 0, '0000-00-00'),
(77, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:44:25', '', 0, '0000-00-00'),
(78, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:44:44', '', 0, '0000-00-00'),
(79, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:44:47', '', 0, '0000-00-00'),
(80, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:45:04', '', 0, '0000-00-00'),
(81, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:45:16', '', 0, '0000-00-00'),
(82, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:45:21', '', 0, '0000-00-00'),
(83, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:45:35', '', 0, '0000-00-00'),
(84, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:45:54', '', 0, '0000-00-00'),
(85, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:46:27', '', 0, '0000-00-00'),
(86, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:46:40', '', 0, '0000-00-00'),
(87, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:49:11', '', 0, '0000-00-00'),
(88, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:57:45', '', 0, '0000-00-00'),
(89, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:57:49', '', 0, '0000-00-00'),
(90, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:58:08', '', 0, '0000-00-00'),
(91, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 12:59:59', '', 0, '0000-00-00'),
(92, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:00:05', '', 0, '0000-00-00'),
(93, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:00:10', '', 0, '0000-00-00'),
(94, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:00:36', '', 0, '0000-00-00'),
(95, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:00:56', '', 0, '0000-00-00'),
(96, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:01:10', '', 0, '0000-00-00'),
(97, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:01:15', '', 0, '0000-00-00'),
(98, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:01:26', '', 0, '0000-00-00'),
(99, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:02:09', '', 0, '0000-00-00'),
(100, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:02:16', '', 0, '0000-00-00'),
(101, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:04:10', '', 0, '0000-00-00'),
(102, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:04:29', '', 0, '0000-00-00'),
(103, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:16:49', '', 0, '0000-00-00'),
(104, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:16:53', '', 0, '0000-00-00'),
(105, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:17:02', '', 0, '0000-00-00'),
(106, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:17:32', '', 0, '0000-00-00'),
(107, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:19:07', '', 0, '0000-00-00'),
(108, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:19:43', '', 0, '0000-00-00'),
(109, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:25:13', '', 0, '0000-00-00'),
(110, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:26:03', '', 0, '0000-00-00'),
(111, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:28:53', '', 0, '0000-00-00'),
(112, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:29:11', '', 0, '0000-00-00'),
(113, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:30:24', '', 0, '0000-00-00'),
(114, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:31:29', '', 0, '0000-00-00'),
(115, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:31:50', '', 0, '0000-00-00'),
(116, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:32:19', '', 0, '0000-00-00'),
(117, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:33:02', '', 0, '0000-00-00'),
(118, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:35:59', '', 0, '0000-00-00'),
(119, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:37:38', '', 0, '0000-00-00'),
(120, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:37:55', '', 0, '0000-00-00'),
(121, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:46:20', '', 0, '0000-00-00'),
(122, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:47:22', '', 0, '0000-00-00'),
(123, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:47:46', '', 0, '0000-00-00'),
(124, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:49:34', '', 0, '0000-00-00'),
(125, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:55:18', '', 0, '0000-00-00'),
(126, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 13:57:44', '', 0, '0000-00-00'),
(127, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:04:25', '', 0, '0000-00-00'),
(128, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:05:22', '', 0, '0000-00-00'),
(129, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:07:39', '', 0, '0000-00-00'),
(130, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:08:30', '', 0, '0000-00-00'),
(131, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:08:51', '', 0, '0000-00-00'),
(132, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:08:59', '', 0, '0000-00-00'),
(133, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:09:59', '', 0, '0000-00-00'),
(134, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:10:56', '', 0, '0000-00-00'),
(135, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:11:19', '', 0, '0000-00-00'),
(136, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:12:23', '', 0, '0000-00-00'),
(137, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:12:28', '', 0, '0000-00-00'),
(138, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:13:34', '', 0, '0000-00-00'),
(139, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:15:03', '', 0, '0000-00-00'),
(140, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:15:26', '', 0, '0000-00-00'),
(141, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:16:18', '', 0, '0000-00-00'),
(142, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:16:49', '', 0, '0000-00-00'),
(143, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:17:03', '', 0, '0000-00-00'),
(144, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:17:13', '', 0, '0000-00-00'),
(145, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:17:16', '', 0, '0000-00-00'),
(146, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:17:21', '', 0, '0000-00-00'),
(147, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:17:27', '', 0, '0000-00-00'),
(148, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:17:48', '', 0, '0000-00-00'),
(149, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:18:07', '', 0, '0000-00-00'),
(150, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:20:53', '', 0, '0000-00-00'),
(151, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:22:06', '', 0, '0000-00-00'),
(152, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:22:34', '', 0, '0000-00-00'),
(153, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:22:57', '', 0, '0000-00-00'),
(154, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:23:41', '', 0, '0000-00-00'),
(155, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:24:20', '', 0, '0000-00-00'),
(156, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:25:04', '', 0, '0000-00-00'),
(157, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:25:12', '', 0, '0000-00-00'),
(158, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:26:10', '', 0, '0000-00-00'),
(159, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:27:00', '', 0, '0000-00-00'),
(160, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:28:20', '', 0, '0000-00-00'),
(161, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:28:43', '', 0, '0000-00-00'),
(162, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:31:02', '', 0, '0000-00-00'),
(163, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:31:06', '', 0, '0000-00-00'),
(164, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:31:33', '', 0, '0000-00-00'),
(165, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:31:38', '', 0, '0000-00-00'),
(166, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:31:57', '', 0, '0000-00-00'),
(167, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:32:04', '', 0, '0000-00-00'),
(168, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:32:21', '', 0, '0000-00-00'),
(169, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:32:40', '', 0, '0000-00-00'),
(170, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:32:51', '', 0, '0000-00-00'),
(171, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:33:12', '', 0, '0000-00-00'),
(172, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:33:40', '', 0, '0000-00-00'),
(173, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:34:20', '', 0, '0000-00-00'),
(174, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 14:34:26', '', 0, '0000-00-00'),
(175, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 15:03:03', '', 0, '0000-00-00'),
(176, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 15:14:35', '', 0, '0000-00-00'),
(177, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 15:14:47', '', 0, '0000-00-00'),
(178, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 15:17:22', '', 0, '0000-00-00'),
(179, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 15:19:35', '', 0, '0000-00-00'),
(180, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 15:19:43', '', 0, '0000-00-00'),
(181, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 15:20:41', '', 0, '0000-00-00'),
(182, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 15:21:23', '', 0, '0000-00-00'),
(183, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 15:21:59', '', 0, '0000-00-00'),
(184, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 15:22:08', '', 0, '0000-00-00'),
(185, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 16:43:37', '', 0, '0000-00-00'),
(186, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 16:43:42', '', 0, '0000-00-00'),
(187, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 16:43:49', '', 0, '0000-00-00'),
(188, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 17:20:57', '', 0, '0000-00-00'),
(189, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:05:42', '', 0, '0000-00-00'),
(190, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:06:15', '', 0, '0000-00-00'),
(191, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:06:17', '', 0, '0000-00-00'),
(192, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:06:29', '', 0, '0000-00-00'),
(193, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:06:35', '', 0, '0000-00-00'),
(194, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:06:42', '', 0, '0000-00-00'),
(195, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:06:53', '', 0, '0000-00-00'),
(196, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:07:22', '', 0, '0000-00-00'),
(197, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:07:26', '', 0, '0000-00-00'),
(198, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:07:28', '', 0, '0000-00-00'),
(199, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:08:54', '', 0, '0000-00-00'),
(200, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:08:56', '', 0, '0000-00-00'),
(201, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:09:09', '', 0, '0000-00-00'),
(202, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:09:10', '', 0, '0000-00-00'),
(203, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:09:18', '', 0, '0000-00-00'),
(204, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:09:21', '', 0, '0000-00-00'),
(205, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:09:22', '', 0, '0000-00-00'),
(206, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:09:51', '', 0, '0000-00-00'),
(207, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:09:55', '', 0, '0000-00-00'),
(208, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:10:32', '', 0, '0000-00-00'),
(209, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:10:35', '', 0, '0000-00-00'),
(210, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:10:36', '', 0, '0000-00-00'),
(211, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:10:37', '', 0, '0000-00-00'),
(212, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:10:51', '', 0, '0000-00-00'),
(213, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:11:05', '', 0, '0000-00-00'),
(214, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:11:12', '', 0, '0000-00-00'),
(215, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:11:21', '', 0, '0000-00-00'),
(216, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:11:39', '', 0, '0000-00-00'),
(217, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:11:47', '', 0, '0000-00-00'),
(218, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:11:48', '', 0, '0000-00-00'),
(219, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:11:49', '', 0, '0000-00-00'),
(220, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:12:44', '', 0, '0000-00-00'),
(221, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:13:07', '', 0, '0000-00-00'),
(222, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:13:35', '', 0, '0000-00-00'),
(223, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:14:13', '', 0, '0000-00-00'),
(224, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:14:22', '', 0, '0000-00-00'),
(225, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:14:24', '', 0, '0000-00-00'),
(226, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:14:41', '', 0, '0000-00-00'),
(227, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:15:59', '', 0, '0000-00-00'),
(228, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:16:10', '', 0, '0000-00-00'),
(229, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:16:34', '', 0, '0000-00-00'),
(230, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:16:37', '', 0, '0000-00-00'),
(231, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:17:02', '', 0, '0000-00-00'),
(232, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:17:44', '', 0, '0000-00-00'),
(233, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:17:51', '', 0, '0000-00-00'),
(234, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:18:24', '', 0, '0000-00-00'),
(235, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:18:29', '', 0, '0000-00-00'),
(236, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:18:55', '', 0, '0000-00-00'),
(237, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:18:56', '', 0, '0000-00-00'),
(238, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:20:02', '', 0, '0000-00-00'),
(239, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:24:51', '', 0, '0000-00-00'),
(240, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:25:39', '', 0, '0000-00-00'),
(241, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:27:11', '', 0, '0000-00-00'),
(242, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:27:17', '', 0, '0000-00-00'),
(243, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:27:18', '', 0, '0000-00-00'),
(244, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 18:46:17', '', 0, '0000-00-00'),
(245, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 19:03:57', '', 0, '0000-00-00'),
(246, '', '', '', '', 0, '', '', '', '', '', '', '', '', 0, '2024-08-06 20:15:26', '', 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `NUMERO` bigint(255) NOT NULL,
  `tipo_documento` varchar(255) NOT NULL,
  `numero_documento` varchar(5000) NOT NULL,
  `proveedor` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `forma_pago` varchar(255) NOT NULL,
  `valor_documento` bigint(255) NOT NULL,
  `vencimiento` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `recibe` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `identi` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `observaciones` varchar(5000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `NUMERO`, `tipo_documento`, `numero_documento`, `proveedor`, `telefono`, `identificacion`, `direccion`, `ciudad`, `forma_pago`, `valor_documento`, `vencimiento`, `fecha`, `recibe`, `nota`, `dolar`, `retefuente`, `usuario`, `visible`, `retesi`, `cliente`, `identi`, `estado`, `observaciones`) VALUES
(1966, 1, 'undefined', 'undefined', 'carlos perez suares', '28937409238', '89798798', 'Sabaneta', '', 'undefined', 0, '', '2018-10-19 10:44:40', '', '', '', 0, '', 0, '', '', '', '', 'Pedido mercancia'),
(1967, 2, 'undefined', 'undefined', 'carlos perez suares', '28937409238', '89798798', 'Sabaneta', '', 'undefined', 0, '09/02/2019', '2019-01-31 11:11:33', '', '', '', 0, '', 0, '', '', '', 'Recibido', ''),
(1968, 3, 'undefined', 'undefined', 'Dany Gutierrez Hernandez', 'email@facturoe.com', '97898798', 'medellin', '', 'undefined', 0, '', '2021-04-09 09:57:26', '', '', '', 0, '', 0, '', '', '', 'Recibido', ''),
(1969, 4, 'undefined', 'undefined', 'Nelson Losada', 'email@facturoe.com', '97898798', 'medellin', '', 'undefined', 0, '', '2021-04-09 10:23:21', '', '', '', 0, '', 0, '', '', '', 'Anulado', ''),
(1970, 5, 'undefined', 'undefined', 'nombres y apellidos', 'telÃ©fono', 'No. IdentificaciÃ³n', 'direcciÃ³n', 'municipio', 'undefined', 0, '', '2021-11-24 10:30:15', '', '', '', 0, '', 0, '', '', '', '', 'dgrtrew'),
(1971, 6, 'undefined', 'undefined', 'nombres y apellidos', 'telÃ©fono', 'No. IdentificaciÃ³n', 'direcciÃ³n', 'municipio', 'undefined', 0, '', '2021-11-24 10:33:21', '', '', '', 0, '', 0, '', '', '', '', ''),
(1972, 7, 'undefined', 'undefined', 'nombres y apellidos', 'telÃ©fono', 'No. IdentificaciÃ³n', 'direcciÃ³n', 'municipio', 'undefined', 0, '', '2021-11-24 10:33:49', '', '', '', 0, '', 0, '', '', '', '', ''),
(1973, 8, 'undefined', 'undefined', 'nombres y apellidos', 'telÃ©fono', 'No. IdentificaciÃ³n', 'direcciÃ³n', 'municipio', 'undefined', 0, '', '2021-11-24 10:35:40', '', '', '', 0, '', 0, '', '', '', 'Recibido', 'uy'),
(1974, 9, 'undefined', 'undefined', 'nombres y apellidos', 'telÃ©fono', 'No. IdentificaciÃ³n', 'direcciÃ³n', 'municipio', 'undefined', 0, '', '2021-11-25 16:21:43', '', '', '', 0, '', 0, '', '', '', '', 'sdfasd'),
(1975, 10, 'undefined', 'undefined', 'nombres y apellidos', 'telÃ©fono', 'No. IdentificaciÃ³n', 'direcciÃ³n', 'municipio', 'undefined', 0, '', '2021-11-25 16:22:25', '', '', '', 0, '', 0, '', '', '', '', ''),
(1976, 11, 'undefined', 'undefined', 'nombres y apellidos', 'telÃ©fono', 'No. IdentificaciÃ³n', 'direcciÃ³n', 'municipio', 'undefined', 0, '', '2021-12-17 14:35:56', '', '', '', 0, '', 0, '', '', '', 'Recibido', 'fsdf'),
(1977, 12, 'undefined', 'undefined', 'nombres y apellidos', 'telÃ©fono', 'No. IdentificaciÃ³n', 'direcciÃ³n', 'municipio', 'undefined', 0, '', '2021-12-17 14:45:21', '', '', '', 0, '', 0, '', '', '', 'Anulado', ''),
(1978, 13, 'undefined', 'undefined', 'nombres y apellidos', 'telÃ©fono', 'No. IdentificaciÃ³n', 'direcciÃ³n', 'municipio', 'undefined', 0, '', '2021-12-17 15:12:29', '', '', '', 0, '', 0, '', '', '', '', ''),
(1979, 14, 'undefined', 'undefined', 'nombres y apellidos', 'telÃ©fono', 'No. IdentificaciÃ³n', 'direcciÃ³n', 'municipio', 'undefined', 0, '', '2022-02-03 20:11:21', '', '', '', 0, '', 0, '', '', '', 'Anulado', ''),
(1980, 15, 'undefined', 'undefined', 'nombres y apellidos', 'telÃ©fono', 'No. IdentificaciÃ³n', 'direcciÃ³n', 'municipio', 'undefined', 0, '', '2022-02-04 14:24:10', '', '', '', 0, '', 0, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `nombre_comercial` varchar(100) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `regimen` varchar(255) NOT NULL,
  `numero_iden` varchar(255) NOT NULL,
  `Resolucion_dian` varchar(255) NOT NULL,
  `FECHA` timestamp NOT NULL DEFAULT current_timestamp(),
  `iva` varchar(255) NOT NULL,
  `regimen_seleccionado` bigint(255) NOT NULL,
  `retefuente` float NOT NULL,
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `consecutivo` bigint(100) NOT NULL,
  `configurando` bigint(10) NOT NULL,
  `configurando_2` bigint(10) NOT NULL,
  `configurando_3` bigint(10) NOT NULL,
  `configurando_4` bigint(10) NOT NULL,
  `configurando_5` bigint(10) NOT NULL,
  `configurando_6` bigint(10) NOT NULL,
  `configurando_7` bigint(5) NOT NULL,
  `impresora` varchar(100) NOT NULL,
  `papel_tamano` varchar(100) NOT NULL,
  `pie_ordenes` varchar(5000) NOT NULL,
  `pie_facturas` varchar(5000) NOT NULL,
  `prefijo` varchar(100) NOT NULL,
  `subdominio` varchar(250) NOT NULL,
  `dominio` varchar(250) NOT NULL,
  `correotienda` varchar(50) NOT NULL,
  `correoclave` varchar(50) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `gratis_activado` bigint(5) NOT NULL,
  `nombresyapellidos` text NOT NULL,
  `identificacion1` text NOT NULL,
  `movil` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `nombre_comercial`, `nombre`, `direccion`, `telefono`, `email`, `ciudad`, `regimen`, `numero_iden`, `Resolucion_dian`, `FECHA`, `iva`, `regimen_seleccionado`, `retefuente`, `usuario`, `visible`, `retesi`, `logo`, `consecutivo`, `configurando`, `configurando_2`, `configurando_3`, `configurando_4`, `configurando_5`, `configurando_6`, `configurando_7`, `impresora`, `papel_tamano`, `pie_ordenes`, `pie_facturas`, `prefijo`, `subdominio`, `dominio`, `correotienda`, `correoclave`, `departamento`, `gratis_activado`, `nombresyapellidos`, `identificacion1`, `movil`) VALUES
(1465, 'uytt', 'jhgjg', 'gjh', 'jhgjhg', '', 'Amalfi', '', 'jgjh', '', '0000-00-00 00:00:00', '', 0, 0, '', 0, '', '', 0, 0, 0, 1, 1, 1, 1, 0, '', '', '', '', '', '', '', '', '', 'ANTIOQUIA', 1, 'sadasd', 'ytuyt', 'uytuyt');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantillas`
--

CREATE TABLE `plantillas` (
  `id` int(11) NOT NULL,
  `plantilla` bigint(5) NOT NULL,
  `direccion` text NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `tipo_identificacion` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `plantillas`
--

INSERT INTO `plantillas` (`id`, `plantilla`, `direccion`, `identificacion`, `tipo_identificacion`) VALUES
(1, 1, '', '', ''),
(2, 1, '', '', ''),
(3, 1, '', '', ''),
(4, 1, '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantillas2`
--

CREATE TABLE `plantillas2` (
  `id` int(11) NOT NULL,
  `plantilla` bigint(5) NOT NULL,
  `direccion` text NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `tipo_identificacion` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `plantillas2`
--

INSERT INTO `plantillas2` (`id`, `plantilla`, `direccion`, `identificacion`, `tipo_identificacion`) VALUES
(134, 1, '', '', ''),
(135, 11, '', '', ''),
(610, 1, '', '', ''),
(137, 2, '', '', ''),
(613, 11, '', '', ''),
(614, 11, '', '', ''),
(615, 11, '', '', ''),
(616, 11, '', '', ''),
(617, 1, '', '', ''),
(618, 1, '', '', ''),
(619, 10, '', '', ''),
(620, 1, '', '', ''),
(621, 10, '', '', ''),
(622, 1, '', '', ''),
(623, 10, '', '', ''),
(624, 1, '', '', ''),
(625, 10, '', '', ''),
(626, 1, '', '', ''),
(627, 10, '', '', ''),
(628, 1, '', '', ''),
(629, 1, '', '', ''),
(630, 1, '', '', ''),
(631, 1, '', '', ''),
(632, 1, '', '', ''),
(633, 1, '', '', ''),
(634, 10, '', '', ''),
(635, 1, '', '', ''),
(636, 1, '', '', ''),
(637, 1, '', '', ''),
(638, 1, '', '', ''),
(639, 10, '', '', ''),
(640, 1, '', '', ''),
(641, 1, '', '', ''),
(642, 10, '', '', ''),
(643, 1, '', '', ''),
(644, 1, '', '', ''),
(645, 1, '', '', ''),
(646, 10, '', '', ''),
(647, 1, '', '', ''),
(648, 1, '', '', ''),
(649, 10, '', '', ''),
(650, 1, '', '', ''),
(651, 1, '', '', ''),
(652, 10, '', '', ''),
(653, 10, '', '', ''),
(654, 1, '', '', ''),
(655, 1, '', '', ''),
(656, 10, '', '', ''),
(657, 1, '', '', ''),
(658, 10, '', '', ''),
(659, 1, '', '', ''),
(660, 10, '', '', ''),
(661, 1, '', '', ''),
(662, 10, '', '', ''),
(663, 1, '', '', ''),
(664, 1, '', '', ''),
(665, 1, '', '', ''),
(666, 10, '', '', ''),
(667, 1, '', '', ''),
(668, 1, '', '', ''),
(669, 1, '', '', ''),
(670, 10, '', '', ''),
(671, 10, '', '', ''),
(672, 1, '', '', ''),
(673, 10, '', '', ''),
(674, 1, '', '', ''),
(675, 10, '', '', ''),
(676, 1, '', '', ''),
(677, 1, '', '', ''),
(678, 1, '', '', ''),
(679, 10, '', '', ''),
(680, 1, '', '', ''),
(681, 1, '', '', ''),
(682, 1, '', '', ''),
(683, 10, '', '', ''),
(684, 1, '', '', ''),
(685, 10, '', '', ''),
(686, 10, '', '', ''),
(687, 1, '', '', ''),
(688, 10, '', '', ''),
(689, 1, '', '', ''),
(690, 1, '', '', ''),
(691, 10, '', '', ''),
(692, 1, '', '', ''),
(693, 10, '', '', ''),
(694, 1, '', '', ''),
(695, 10, '', '', ''),
(696, 1, '', '', ''),
(697, 10, '', '', ''),
(698, 1, '', '', ''),
(699, 10, '', '', ''),
(700, 1, '', '', ''),
(701, 10, '', '', ''),
(702, 10, '', '', ''),
(703, 1, '', '', ''),
(704, 1, '', '', ''),
(705, 1, '', '', ''),
(706, 1, '', '', ''),
(707, 10, '', '', ''),
(708, 1, '', '', ''),
(709, 10, '', '', ''),
(710, 1, '', '', ''),
(711, 10, '', '', ''),
(712, 1, '', '', ''),
(713, 10, '', '', ''),
(714, 1, '', '', ''),
(715, 1, '', '', ''),
(716, 1, '', '', ''),
(717, 1, '', '', ''),
(718, 10, '', '', ''),
(719, 1, '', '', ''),
(720, 10, '', '', ''),
(721, 10, '', '', ''),
(722, 1, '', '', ''),
(723, 1, '', '', ''),
(724, 1, '', '', ''),
(725, 1, '', '', ''),
(726, 1, '', '', ''),
(727, 1, '', '', ''),
(728, 10, '', '', ''),
(729, 1, '', '', ''),
(730, 10, '', '', ''),
(731, 1, '', '', ''),
(732, 1, '', '', ''),
(733, 1, '', '', ''),
(734, 1, '', '', ''),
(735, 10, '', '', ''),
(736, 1, '', '', ''),
(737, 1, '', '', ''),
(738, 10, '', '', ''),
(739, 10, '', '', ''),
(740, 10, '', '', ''),
(741, 10, '', '', ''),
(742, 1, '', '', ''),
(743, 10, '', '', ''),
(744, 1, '', '', ''),
(745, 10, '', '', ''),
(746, 10, '', '', ''),
(747, 1, '', '', ''),
(748, 1, '', '', ''),
(749, 1, '', '', ''),
(750, 10, '', '', ''),
(751, 1, '', '', ''),
(752, 1, '', '', ''),
(753, 1, '', '', ''),
(754, 1, '', '', ''),
(755, 1, '', '', ''),
(756, 10, '', '', ''),
(757, 1, '', '', ''),
(758, 10, '', '', ''),
(759, 10, '', '', ''),
(760, 1, '', '', ''),
(761, 10, '', '', ''),
(762, 1, '', '', ''),
(763, 10, '', '', ''),
(764, 1, '', '', ''),
(765, 1, '', '', ''),
(766, 1, '', '', ''),
(767, 1, '', '', ''),
(768, 10, '', '', ''),
(769, 1, '', '', ''),
(770, 10, '', '', ''),
(771, 1, '', '', ''),
(772, 1, '', '', ''),
(773, 1, '', '', ''),
(774, 1, '', '', ''),
(775, 1, '', '', ''),
(776, 1, '', '', ''),
(777, 10, '', '', ''),
(778, 1, '', '', ''),
(779, 1, '', '', ''),
(780, 1, '', '', ''),
(781, 1, '', '', ''),
(782, 1, '', '', ''),
(783, 1, '', '', ''),
(784, 1, '', '', ''),
(785, 1, '', '', ''),
(786, 1, '', '', ''),
(787, 1, '', '', ''),
(788, 1, '', '', ''),
(789, 1, '', '', ''),
(790, 1, '', '', ''),
(791, 1, '', '', ''),
(792, 1, '', '', ''),
(793, 1, '', '', ''),
(794, 1, '', '', ''),
(795, 1, '', '', ''),
(796, 1, '', '', ''),
(797, 1, '', '', ''),
(798, 1, '', '', ''),
(799, 1, '', '', ''),
(800, 1, '', '', ''),
(801, 1, '', '', ''),
(802, 10, '', '', ''),
(803, 10, '', '', ''),
(804, 1, '', '', ''),
(805, 1, '', '', ''),
(806, 10, '', '', ''),
(807, 10, '', '', ''),
(808, 10, '', '', ''),
(809, 10, '', '', ''),
(810, 1, '', '', ''),
(811, 1, '', '', ''),
(812, 1, '', '', ''),
(813, 1, '', '', ''),
(814, 1, '', '', ''),
(815, 1, '', '', ''),
(816, 1, '', '', ''),
(817, 1, '', '', ''),
(818, 1, '', '', ''),
(819, 1, '', '', ''),
(820, 1, '', '', ''),
(821, 1, '', '', ''),
(822, 1, '', '', ''),
(823, 1, '', '', ''),
(824, 1, '', '', ''),
(825, 1, '', '', ''),
(826, 1, '', '', ''),
(827, 1, '', '', ''),
(828, 1, '', '', ''),
(829, 1, '', '', ''),
(830, 10, '', '', ''),
(831, 1, '', '', ''),
(832, 10, '', '', ''),
(833, 1, '', '', ''),
(834, 1, '', '', ''),
(835, 1, '', '', ''),
(836, 1, '', '', ''),
(837, 1, '', '', ''),
(838, 10, '', '', ''),
(839, 1, '', '', ''),
(840, 1, '', '', ''),
(841, 1, '', '', ''),
(842, 1, '', '', ''),
(843, 10, '', '', ''),
(844, 1, '', '', ''),
(845, 1, '', '', ''),
(846, 1, '', '', ''),
(847, 1, '', '', ''),
(848, 1, '', '', ''),
(849, 1, '', '', ''),
(850, 1, '', '', ''),
(851, 10, '', '', ''),
(852, 1, '', '', ''),
(853, 10, '', '', ''),
(854, 1, '', '', ''),
(855, 1, '', '', ''),
(856, 1, '', '', ''),
(857, 10, '', '', ''),
(858, 1, '', '', ''),
(859, 10, '', '', ''),
(860, 1, '', '', ''),
(861, 1, '', '', ''),
(862, 1, '', '', ''),
(863, 10, '', '', ''),
(864, 1, '', '', ''),
(865, 10, '', '', ''),
(866, 10, '', '', ''),
(867, 10, '', '', ''),
(868, 1, '', '', ''),
(869, 10, '', '', ''),
(870, 1, '', '', ''),
(871, 10, '', '', ''),
(872, 10, '', '', ''),
(873, 1, '', '', ''),
(874, 10, '', '', ''),
(875, 1, '', '', ''),
(876, 10, '', '', ''),
(877, 1, '', '', ''),
(878, 10, '', '', ''),
(879, 1, '', '', ''),
(880, 10, '', '', ''),
(881, 10, '', '', ''),
(882, 10, '', '', ''),
(883, 10, '', '', ''),
(884, 1, '', '', ''),
(885, 10, '', '', ''),
(886, 1, '', '', ''),
(887, 1, '', '', ''),
(888, 1, '', '', ''),
(889, 1, '', '', ''),
(890, 1, '', '', ''),
(891, 10, '', '', ''),
(892, 10, '', '', ''),
(893, 1, '', '', ''),
(894, 10, '', '', ''),
(895, 1, '', '', ''),
(896, 1, '', '', ''),
(897, 10, '', '', ''),
(898, 1, '', '', ''),
(899, 10, '', '', ''),
(900, 1, '', '', ''),
(901, 10, '', '', ''),
(902, 11, '', '', ''),
(903, 1, '', '', ''),
(904, 10, '', '', ''),
(905, 11, '', '', ''),
(906, 1, '', '', ''),
(907, 11, '', '', ''),
(908, 1, '', '', ''),
(909, 10, '', '', ''),
(910, 11, '', '', ''),
(911, 1, '', '', ''),
(912, 10, '', '', ''),
(913, 11, '', '', ''),
(914, 1, '', '', ''),
(915, 1, '', '', ''),
(916, 10, '', '', ''),
(917, 1, '', '', ''),
(918, 1, '', '', ''),
(919, 1, '', '', ''),
(920, 10, '', '', ''),
(921, 1, '', '', ''),
(922, 10, '', '', ''),
(923, 1, '', '', ''),
(924, 10, '', '', ''),
(925, 10, '', '', ''),
(926, 1, '', '', ''),
(927, 1, '', '', ''),
(928, 1, '', '', ''),
(929, 1, '', '', ''),
(930, 10, '', '', ''),
(931, 1, '', '', ''),
(932, 10, '', '', ''),
(933, 1, '', '', ''),
(934, 1, '', '', ''),
(935, 1, '', '', ''),
(936, 1, '', '', ''),
(937, 1, '', '', ''),
(938, 11, '', '', ''),
(939, 1, '', '', ''),
(940, 11, '', '', ''),
(941, 1, '', '', ''),
(942, 11, '', '', ''),
(943, 10, '', '', ''),
(944, 11, '', '', ''),
(945, 11, '', '', ''),
(946, 10, '', '', ''),
(947, 1, '', '', ''),
(948, 10, '', '', ''),
(949, 1, '', '', ''),
(950, 11, '', '', ''),
(951, 10, '', '', ''),
(952, 1, '', '', ''),
(953, 10, '', '', ''),
(954, 1, '', '', ''),
(955, 10, '', '', ''),
(956, 1, '', '', ''),
(957, 1, '', '', ''),
(958, 1, '', '', ''),
(959, 1, '', '', ''),
(960, 1, '', '', ''),
(961, 1, '', '', ''),
(962, 1, '', '', ''),
(963, 1, '', '', ''),
(964, 1, '', '', ''),
(965, 1, '', '', ''),
(966, 1, '', '', ''),
(967, 1, '', '', ''),
(968, 1, '', '', ''),
(969, 1, '', '', ''),
(970, 10, '', '', ''),
(971, 10, '', '', ''),
(972, 10, '', '', ''),
(973, 10, '', '', ''),
(974, 1, '', '', ''),
(975, 10, '', '', ''),
(976, 11, '', '', ''),
(977, 11, '', '', ''),
(978, 11, '', '', ''),
(979, 11, '', '', ''),
(980, 11, '', '', ''),
(981, 11, '', '', ''),
(982, 11, '', '', ''),
(983, 11, '', '', ''),
(984, 11, '', '', ''),
(985, 10, '', '', ''),
(986, 1, '', '', ''),
(987, 11, '', '', ''),
(988, 10, '', '', ''),
(989, 1, '', '', ''),
(990, 11, '', '', ''),
(991, 1, '', '', ''),
(992, 10, '', '', ''),
(993, 11, '', '', ''),
(994, 1, '', '', ''),
(995, 11, '', '', ''),
(996, 10, '', '', ''),
(997, 11, '', '', ''),
(998, 11, '', '', ''),
(999, 10, '', '', ''),
(1000, 11, '', '', ''),
(1001, 11, '', '', ''),
(1002, 10, '', '', ''),
(1003, 1, '', '', ''),
(1004, 1, '', '', ''),
(1005, 10, '', '', ''),
(1006, 1, '', '', ''),
(1007, 1, '', '', ''),
(1008, 10, '', '', ''),
(1009, 11, '', '', ''),
(1010, 10, '', '', ''),
(1011, 1, '', '', ''),
(1012, 10, '', '', ''),
(1013, 1, '', '', ''),
(1014, 1, '', '', ''),
(1015, 10, '', '', ''),
(1016, 1, '', '', ''),
(1017, 10, '', '', ''),
(1018, 1, '', '', ''),
(1019, 11, '', '', ''),
(1020, 10, '', '', ''),
(1021, 1, '', '', ''),
(1022, 1, '', '', ''),
(1023, 10, '', '', ''),
(1024, 1, '', '', ''),
(1025, 1, '', '', ''),
(1026, 1, '', '', ''),
(1027, 1, '', '', ''),
(1028, 1, '', '', ''),
(1029, 1, '', '', ''),
(1030, 1, '', '', ''),
(1031, 1, '', '', ''),
(1032, 1, '', '', ''),
(1033, 1, '', '', ''),
(1034, 1, '', '', ''),
(1035, 1, '', '', ''),
(1036, 1, '', '', ''),
(1037, 1, '', '', ''),
(1038, 1, '', '', ''),
(1039, 1, '', '', ''),
(1040, 1, '', '', ''),
(1041, 11, '', '', ''),
(1042, 1, '', '', ''),
(1043, 1, '', '', ''),
(1044, 10, '', '', ''),
(1045, 1, '', '', ''),
(1046, 1, '', '', ''),
(1047, 1, '', '', ''),
(1048, 1, '', '', ''),
(1049, 10, '', '', ''),
(1050, 11, '', '', ''),
(1051, 11, '', '', ''),
(1052, 10, '', '', ''),
(1053, 1, '', '', ''),
(1054, 10, '', '', ''),
(1055, 11, '', '', ''),
(1056, 10, '', '', ''),
(1057, 10, '', '', ''),
(1058, 11, '', '', ''),
(1059, 1, '', '', ''),
(1060, 10, '', '', ''),
(1061, 10, '', '', ''),
(1062, 10, '', '', ''),
(1063, 10, '', '', ''),
(1064, 11, '', '', ''),
(1065, 1, '', '', ''),
(1066, 1, '', '', ''),
(1067, 10, '', '', ''),
(1068, 10, '', '', ''),
(1069, 1, '', '', ''),
(1070, 1, '', '', ''),
(1071, 11, '', '', ''),
(1072, 10, '', '', ''),
(1073, 11, '', '', ''),
(1074, 11, '', '', ''),
(1075, 10, '', '', ''),
(1076, 1, '', '', ''),
(1077, 10, '', '', ''),
(1078, 1, '', '', ''),
(1079, 11, '', '', ''),
(1080, 11, '', '', ''),
(1081, 11, '', '', ''),
(1082, 1, '', '', ''),
(1083, 11, '', '', ''),
(1084, 1, '', '', ''),
(1085, 1, '', '', ''),
(1086, 10, '', '', ''),
(1087, 11, '', '', ''),
(1088, 1, '', '', ''),
(1089, 10, '', '', ''),
(1090, 1, '', '', ''),
(1091, 11, '', '', ''),
(1092, 1, '', '', ''),
(1093, 10, '', '', ''),
(1094, 1, '', '', ''),
(1095, 1, '', '', ''),
(1096, 1, '', '', ''),
(1097, 1, '', '', ''),
(1098, 10, '', '', ''),
(1099, 1, '', '', ''),
(1100, 1, '', '', ''),
(1101, 1, '', '', ''),
(1102, 1, '', '', ''),
(1103, 1, '', '', ''),
(1104, 1, '', '', ''),
(1105, 11, '', '', ''),
(1106, 10, '', '', ''),
(1107, 1, '', '', ''),
(1108, 11, '', '', ''),
(1109, 11, '', '', ''),
(1110, 11, '', '', ''),
(1111, 11, '', '', ''),
(1112, 11, '', '', ''),
(1113, 11, '', '', ''),
(1114, 11, '', '', ''),
(1115, 11, '', '', ''),
(1116, 11, '', '', ''),
(1117, 11, '', '', ''),
(1118, 11, '', '', ''),
(1119, 11, '', '', ''),
(1120, 11, '', '', ''),
(1121, 11, '', '', ''),
(1122, 11, '', '', ''),
(1123, 11, '', '', ''),
(1124, 11, '', '', ''),
(1125, 11, '', '', ''),
(1126, 11, '', '', ''),
(1127, 11, '', '', ''),
(1128, 11, '', '', ''),
(1129, 1, '', '', ''),
(1130, 10, '', '', ''),
(1131, 11, '', '', ''),
(1132, 1, '', '', ''),
(1133, 1, '', '', ''),
(1134, 10, '', '', ''),
(1135, 11, '', '', ''),
(1136, 10, '', '', ''),
(1137, 1, '', '', ''),
(1138, 11, '', '', ''),
(1139, 1, '', '', ''),
(1140, 1, '', '', ''),
(1141, 1, '', '', ''),
(1142, 10, '', '', ''),
(1143, 1, '', '', ''),
(1144, 11, '', '', ''),
(1145, 1, '', '', ''),
(1146, 10, '', '', ''),
(1147, 11, '', '', ''),
(1148, 1, '', '', ''),
(1149, 11, '', '', ''),
(1150, 10, '', '', ''),
(1151, 11, '', '', ''),
(1152, 11, '', '', ''),
(1153, 1, '', '', ''),
(1154, 10, '', '', ''),
(1155, 11, '', '', ''),
(1156, 11, '', '', ''),
(1157, 11, '', '', ''),
(1158, 11, '', '', ''),
(1159, 11, '', '', ''),
(1160, 11, '', '', ''),
(1161, 11, '', '', ''),
(1162, 1, '', '', ''),
(1163, 10, '', '', ''),
(1164, 11, '', '', ''),
(1165, 11, '', '', ''),
(1166, 1, '', '', ''),
(1167, 1, '', '', ''),
(1168, 10, '', '', ''),
(1169, 11, '', '', ''),
(1170, 11, '', '', ''),
(1171, 11, '', '', ''),
(1172, 11, '', '', ''),
(1173, 11, '', '', ''),
(1174, 11, '', '', ''),
(1175, 11, '', '', ''),
(1176, 11, '', '', ''),
(1177, 11, '', '', ''),
(1178, 11, '', '', ''),
(1179, 11, '', '', ''),
(1180, 11, '', '', ''),
(1181, 11, '', '', ''),
(1182, 11, '', '', ''),
(1183, 11, '', '', ''),
(1184, 1, '', '', ''),
(1185, 1, '', '', ''),
(1186, 10, '', '', ''),
(1187, 1, '', '', ''),
(1188, 1, '', '', ''),
(1189, 10, '', '', ''),
(1190, 11, '', '', ''),
(1191, 11, '', '', ''),
(1192, 10, '', '', ''),
(1193, 1, '', '', ''),
(1194, 1, '', '', ''),
(1195, 10, '', '', ''),
(1196, 11, '', '', ''),
(1197, 11, '', '', ''),
(1198, 1, '', '', ''),
(1199, 10, '', '', ''),
(1200, 11, '', '', ''),
(1201, 1, '', '', ''),
(1202, 11, '', '', ''),
(1203, 1, '', '', ''),
(1204, 1, '', '', ''),
(1205, 1, '', '', ''),
(1206, 1, '', '', ''),
(1207, 1, '', '', ''),
(1208, 1, '', '', ''),
(1209, 1, '', '', ''),
(1210, 1, '', '', ''),
(1211, 10, '', '', ''),
(1212, 11, '', '', ''),
(1213, 1, '', '', ''),
(1214, 10, '', '', ''),
(1215, 11, '', '', ''),
(1216, 1, '', '', ''),
(1217, 1, '', '', ''),
(1218, 1, '', '', ''),
(1219, 10, '', '', ''),
(1220, 10, '', '', ''),
(1221, 11, '', '', ''),
(1222, 10, '', '', ''),
(1223, 1, '', '', ''),
(1224, 11, '', '', ''),
(1225, 11, '', '', ''),
(1226, 11, '', '', ''),
(1227, 11, '', '', ''),
(1228, 1, '', '', ''),
(1229, 10, '', '', ''),
(1230, 11, '', '', ''),
(1231, 11, '', '', ''),
(1232, 1, '', '', ''),
(1233, 10, '', '', ''),
(1234, 11, '', '', ''),
(1235, 11, '', '', ''),
(1236, 10, '', '', ''),
(1237, 11, '', '', ''),
(1238, 11, '', '', ''),
(1239, 11, '', '', ''),
(1240, 11, '', '', ''),
(1241, 10, '', '', ''),
(1242, 11, '', '', ''),
(1243, 11, '', '', ''),
(1244, 1, '', '', ''),
(1245, 11, '', '', ''),
(1246, 11, '', '', ''),
(1247, 10, '', '', ''),
(1248, 1, '', '', ''),
(1249, 10, '', '', ''),
(1250, 11, '', '', ''),
(1251, 10, '', '', ''),
(1252, 1, '', '', ''),
(1253, 10, '', '', ''),
(1254, 11, '', '', ''),
(1255, 10, '', '', ''),
(1256, 1, '', '', ''),
(1257, 10, '', '', ''),
(1258, 11, '', '', ''),
(1259, 11, '', '', ''),
(1260, 1, '', '', ''),
(1261, 10, '', '', ''),
(1262, 11, '', '', ''),
(1263, 1, '', '', ''),
(1264, 1, '', '', ''),
(1265, 10, '', '', ''),
(1266, 11, '', '', ''),
(1267, 1, '', '', ''),
(1268, 10, '', '', ''),
(1269, 11, '', '', ''),
(1270, 11, '', '', ''),
(1271, 11, '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `empleado` varchar(255) NOT NULL,
  `empleado_nombre` varchar(255) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `valor` bigint(255) NOT NULL,
  `forma_pago` varchar(255) NOT NULL,
  `numero_transferencia` varchar(255) NOT NULL,
  `numero_cheque` varchar(255) NOT NULL,
  `banco` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `observaciones` varchar(5000) NOT NULL,
  `cuenta_banco` varchar(255) NOT NULL,
  `nombres` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos_abonos`
--

CREATE TABLE `prestamos_abonos` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `empleado` varchar(255) NOT NULL,
  `empleado_nombre` varchar(255) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `valor` bigint(255) NOT NULL,
  `forma_pago` varchar(255) NOT NULL,
  `numero_transferencia` varchar(255) NOT NULL,
  `numero_cheque` varchar(255) NOT NULL,
  `banco` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `observaciones` varchar(5000) NOT NULL,
  `cuenta_banco` varchar(255) NOT NULL,
  `nombres` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `id` int(11) NOT NULL,
  `NUMERO` bigint(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `bodega_materia` varchar(5000) NOT NULL,
  `bodega_producto` varchar(255) NOT NULL,
  `observaciones` varchar(5000) NOT NULL,
  `forma_pago` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `inicio` date NOT NULL,
  `fin` date NOT NULL,
  `tiempo` bigint(255) NOT NULL,
  `retefuente` float NOT NULL,
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `saldo` bigint(255) NOT NULL,
  `inicio_p` timestamp NOT NULL DEFAULT current_timestamp(),
  `fin_p` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `empresa` varchar(255) NOT NULL,
  `direccion` text NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `tipo_identificacion` varchar(100) NOT NULL,
  `telefono` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `ciudad` text NOT NULL,
  `pais` varchar(100) NOT NULL,
  `departamento` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `visitas` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `codigo` text NOT NULL,
  `precio_compra` bigint(255) NOT NULL,
  `precio_venta` bigint(255) NOT NULL,
  `cantidad` bigint(255) NOT NULL,
  `fecha` date NOT NULL,
  `visible` bigint(10) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `caracteristicas` varchar(150) NOT NULL,
  `CodigoCat` bigint(20) NOT NULL,
  `publicado` varchar(50) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `impuesto` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `medida` varchar(10) NOT NULL,
  `receta_expli` varchar(5000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `descripcion`, `codigo`, `precio_compra`, `precio_venta`, `cantidad`, `fecha`, `visible`, `imagen`, `caracteristicas`, `CodigoCat`, `publicado`, `categoria`, `impuesto`, `tipo`, `medida`, `receta_expli`) VALUES
(1588, 'boton', '74', 1000, 0, 100, '0000-00-00', 76, '', 'unidades', 0, '', 'Material', '', '', '', ''),
(1569, 'Coser', '74', 2000, 0, 0, '0000-00-00', 0, '', '30', 0, '', 'Proceso', '', '', '30', ''),
(1591, 'tela x3', '75', 500, 0, 10, '0000-00-00', 67, '', 'centimetro', 0, '', 'Material', '', '', '', ''),
(1580, 'Planchado', '74', 3000, 0, 0, '0000-00-00', 0, '', '10', 0, '', 'Proceso', '', '', '10', ''),
(1589, 'hilo verde', '74', 10, 0, 100, '0000-00-00', 68, '', 'centimetro', 0, '', 'Material', '', '', '', ''),
(1592, 'Planchado', '75', 3000, 0, 0, '0000-00-00', 0, '', '10', 0, '', 'Proceso', '', '', '10', ''),
(1593, 'transporte prendas', '75', 5000, 0, 0, '0000-00-00', 0, '', 'unidades', 0, '', 'Costo', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registered_users`
--

CREATE TABLE `registered_users` (
  `id` int(8) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` text DEFAULT NULL,
  `about` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registered_users`
--

INSERT INTO `registered_users` (`id`, `user_name`, `display_name`, `password`, `email`, `photo`, `about`) VALUES
(1, 'kate_91', 'Kate Winslet', '$2y$10$LVISX0lCiIsQU1vUX/dAGunHTRhXmpcpiuU7G7.1lbnvhPSg7exmW', 'kate@wince.com', 'images/photo.jpeg', 'Web developer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrados`
--

CREATE TABLE `registrados` (
  `id` int(11) NOT NULL,
  `activado` bigint(10) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `redirect` bigint(5) NOT NULL,
  `verified` bigint(5) NOT NULL,
  `last_login` date DEFAULT NULL,
  `regimen` bigint(5) NOT NULL,
  `crea_empresa` bigint(10) NOT NULL,
  `configurando` bigint(10) NOT NULL,
  `tipo_cuenta` bigint(5) NOT NULL,
  `perfil` bigint(5) NOT NULL,
  `estado` bigint(5) NOT NULL,
  `plan` varchar(255) NOT NULL,
  `codigo` bigint(255) NOT NULL,
  `fechahoy` date NOT NULL,
  `fecha` date NOT NULL,
  `plan_vence` date NOT NULL,
  `fecha_creacion` date NOT NULL,
  `meses` bigint(255) NOT NULL,
  `usuario2` varchar(255) NOT NULL,
  `password2` varchar(255) NOT NULL,
  `tienda` bigint(10) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `sesion4` varchar(100) NOT NULL,
  `sesion5` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `registrados`
--

INSERT INTO `registrados` (`id`, `activado`, `firstname`, `username`, `password`, `email`, `redirect`, `verified`, `last_login`, `regimen`, `crea_empresa`, `configurando`, `tipo_cuenta`, `perfil`, `estado`, `plan`, `codigo`, `fechahoy`, `fecha`, `plan_vence`, `fecha_creacion`, `meses`, `usuario2`, `password2`, `tienda`, `celular`, `departamento`, `municipio`, `direccion`, `sesion4`, `sesion5`) VALUES
(885, 0, 'Lina Nieto', '876345876435235', 'eed76087a8437be9d7555830825faefd', 'ventas1@facturoe.com', 0, 1, '0000-00-00', 0, 0, 0, 0, 0, 0, '', 0, '0000-00-00', '0000-00-00', '0000-00-00', '2020-09-03', 0, '181.129.173.170', '', 0, '3147942494', '', '', '', '', ''),
(886, 0, 'dfggsdfgfsd', '', '202cb962ac59075b964b07152d234b70', 'ventas@facturoe.com', 0, 0, '0000-00-00', 0, 0, 0, 0, 0, 0, '', 0, '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 0, '', '', 0, '12', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remisiones`
--

CREATE TABLE `remisiones` (
  `id` int(11) NOT NULL,
  `NUMERO` bigint(255) NOT NULL,
  `numero_guia` varchar(255) NOT NULL,
  `numero_transaccion` varchar(5000) NOT NULL,
  `forma_pago_verificada` bigint(4) NOT NULL,
  `FORMA_PAGO` varchar(255) NOT NULL,
  `entrega1` text NOT NULL,
  `FECHA` timestamp NOT NULL DEFAULT current_timestamp(),
  `iva` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `identi` varchar(100) NOT NULL,
  `anular` bigint(5) NOT NULL,
  `anular_motivo` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `departamento` text NOT NULL,
  `pais` text NOT NULL,
  `valor_sub` bigint(255) NOT NULL,
  `valor_descuento` bigint(255) NOT NULL,
  `valor_iva` bigint(255) NOT NULL,
  `valor_retencion` bigint(255) NOT NULL,
  `valor_total` bigint(255) NOT NULL,
  `observaciones` varchar(500) NOT NULL,
  `cuenta_banco` varchar(100) NOT NULL,
  `vendedor` varchar(100) NOT NULL,
  `estado` bigint(10) NOT NULL,
  `dias_entrega` text NOT NULL,
  `envio_costo` varchar(100) NOT NULL,
  `num_factura` text NOT NULL,
  `codigo_image` varchar(100) NOT NULL,
  `id_factura` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE `salidas` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `origen` varchar(5000) NOT NULL,
  `observaciones` varchar(255) NOT NULL,
  `valor` bigint(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tallas`
--

CREATE TABLE `tallas` (
  `id` int(11) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `telefono` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `ciudad` text NOT NULL,
  `web` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` varchar(100) NOT NULL,
  `visitas` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tallas`
--

INSERT INTO `tallas` (`id`, `numero`, `item_id`, `telefono`, `email`, `ciudad`, `web`, `fecha`, `usuario`, `visible`, `visitas`) VALUES
(530, 'M', '435342', '', '', '', '', '2021-04-27 10:40:49', '', '0', 0),
(528, 'M', '322223', '', '', '', '', '2021-04-13 17:35:51', '', '0', 0),
(527, 'L', '322223', '', '', '', '', '2021-04-13 15:08:49', '', '0', 0),
(525, '09', '4555', '', '', '', '', '2021-04-08 14:01:03', '', '0', 0),
(524, 'L', '4555', '', '', '', '', '2021-04-08 14:00:48', '', '0', 0),
(529, 'S', '435342', '', '', '', '', '2021-04-27 10:40:49', '', '0', 0),
(522, '12', '4555', '', '', '', '', '2021-04-08 14:00:48', '', '0', 0),
(520, 'M', '12ee3331231', '', '', '', '', '2021-04-08 13:37:44', '', '0', 0),
(519, 'XXL', '12ee3331231', '', '', '', '', '2021-04-08 13:37:39', '', '0', 0),
(518, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(517, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(516, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(515, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(514, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(513, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(512, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(511, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(510, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(509, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(508, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(507, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(506, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(505, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(504, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(502, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(499, 'XXL', 'qwreqw', '', '', '', '', '2021-04-08 13:35:39', '', '0', 0),
(503, '', '1231231', '', '', '', '', '2021-04-08 13:36:22', '', '0', 0),
(501, '05', 'qwreqw', '', '', '', '', '2021-04-08 13:35:48', '', '0', 0),
(500, '05', 'qwreqw', '', '', '', '', '2021-04-08 13:35:46', '', '0', 0),
(498, '11', '22342', '', '', '', '', '2021-04-08 13:30:22', '', '0', 0),
(497, '11', '22342', '', '', '', '', '2021-04-08 13:30:21', '', '0', 0),
(494, '3XL', '34534534543', '', '', '', '', '2021-04-08 13:29:13', '', '0', 0),
(476, 'L', '34534534542223', '', '', '', '', '2021-04-08 12:48:52', '', '0', 0),
(532, '09', '435342', '', '', '', '', '2021-04-29 13:23:27', '', '', 0),
(552, 'L', '12312', '', '', '', '', '2021-08-06 12:05:11', '', '', 0),
(535, '27', '435342', '', '', '', '', '2021-04-29 13:23:37', '', '', 0),
(536, '41', '435342', '', '', '', '', '2021-04-29 13:23:41', '', '', 0),
(553, '06', '12312222111', '', '', '', '', '2021-08-06 12:35:46', '', '', 0),
(551, 'XL', '4eee33e44333', '', '', '', '', '2021-08-04 13:13:28', '', '', 0),
(550, 'XL', '23452345', '', '', '', '', '2021-08-04 12:42:11', '', '', 0),
(555, '02', '7767272', '', '', '', '', '2021-08-30 20:50:10', '', '', 0),
(556, '3XL', '7767272', '', '', '', '', '2021-08-30 20:50:10', '', '', 0),
(557, 'L', '553321313', '', '', '', '', '2021-10-15 14:52:58', '', '', 0),
(558, 'M', '553321313', '', '', '', '', '2021-10-15 14:53:01', '', '', 0),
(559, 'M', 'erter', '', '', '', '', '2021-12-02 11:37:07', '', '', 0),
(560, '06', '23213112223', '', '', '', '', '2022-01-05 09:23:56', '', '', 0),
(561, 'XXL', '23213112223', '', '', '', '', '2022-01-05 09:24:02', '', '', 0),
(562, 'S', '23213112223', '', '', '', '', '2022-01-05 09:24:07', '', '', 0),
(563, 'M', '23213112223', '', '', '', '', '2022-01-05 09:24:10', '', '', 0),
(564, '28', '1234215231', '', '', '', '', '2022-01-25 16:13:32', '', '', 0),
(565, '30', '1234215231', '', '', '', '', '2022-01-25 16:13:37', '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tallas_tmp`
--

CREATE TABLE `tallas_tmp` (
  `id` int(11) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `direccion` text NOT NULL,
  `identificacion` varchar(255) NOT NULL,
  `telefono` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `ciudad` text NOT NULL,
  `web` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `visitas` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `first_name`, `last_name`, `contact_number`, `email`, `username`, `password`) VALUES
(2, 'Administrador', '1', '2147483647', 'lorem.ipsum@gmail.com', 'admin', '123'),
(3, 'Ventas 2', '2', '', '', 'Rafael Técnico', '111111'),
(4, 'Ventas 3', '2', '', '', 'Pedro Técnico', '111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `asunto` varchar(100) NOT NULL,
  `descripcion` varchar(5000) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `prioridad` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `respuesta` varchar(5000) NOT NULL,
  `fecha_respuesta` date NOT NULL,
  `usuario` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets_numero`
--

CREATE TABLE `tickets_numero` (
  `id` int(11) NOT NULL,
  `numero` bigint(255) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` varchar(5000) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `prioridad` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `respuesta` varchar(5000) NOT NULL,
  `fecha_respuesta` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tickets_numero`
--

INSERT INTO `tickets_numero` (`id`, `numero`, `usuario`, `titulo`, `descripcion`, `estado`, `prioridad`, `fecha`, `respuesta`, `fecha_respuesta`) VALUES
(1, 842607, '', 'Servicio al Cliente', 'sadfdsf', 'Pendiente', 'Alta', '2020-11-10 14:32:24', '', '0000-00-00'),
(2, 842607, 'soporte', 'Servicio al Cliente', 'sadfdsf', 'Pendiente', 'Alta', '2020-11-10 14:32:24', '', '0000-00-00'),
(3, 84260722, '', 'Servicio al Cliente', 'sadfdsf', 'Pendiente', 'Alta', '2020-11-10 14:32:24', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets_parqueadero`
--

CREATE TABLE `tickets_parqueadero` (
  `id` int(11) NOT NULL,
  `NUMERO` varchar(255) NOT NULL,
  `RETENSION` varchar(255) NOT NULL,
  `TIPO_RETENSION` varchar(5000) NOT NULL,
  `DESCUENTO` varchar(100) NOT NULL,
  `FORMA_PAGO` varchar(255) NOT NULL,
  `VENCIMIENTO` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA` timestamp NOT NULL DEFAULT current_timestamp(),
  `iva` varchar(255) NOT NULL,
  `impuesto` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `dolar` varchar(255) NOT NULL,
  `retefuente` float NOT NULL,
  `usuario` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `retesi` varchar(10) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `identi` varchar(100) NOT NULL,
  `anular` bigint(5) NOT NULL,
  `anular_motivo` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `valor_sub` bigint(255) NOT NULL,
  `valor_descuento` bigint(255) NOT NULL,
  `valor_iva` bigint(255) NOT NULL,
  `valor_retencion` bigint(255) NOT NULL,
  `valor_total` bigint(255) NOT NULL,
  `observaciones` varchar(500) NOT NULL,
  `cuenta_banco` varchar(100) NOT NULL,
  `vendedor` varchar(100) NOT NULL,
  `saldo` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda_footer`
--

CREATE TABLE `tienda_footer` (
  `id` int(11) NOT NULL,
  `numero_atencion` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sobrenosotros` text NOT NULL,
  `politica_privacidad` varchar(2500) NOT NULL,
  `politica_envio` varchar(2500) NOT NULL,
  `facebook_enlace` varchar(500) NOT NULL,
  `instagram_enlace` varchar(500) NOT NULL,
  `twitter_enlace` varchar(255) NOT NULL,
  `youtube_enlace` varchar(255) NOT NULL,
  `whatsapp_enlace` varchar(100) NOT NULL,
  `seo_titulo` varchar(255) NOT NULL,
  `seo_descripcion` varchar(255) NOT NULL,
  `seo_seguimiento` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda_pedidos`
--

CREATE TABLE `tienda_pedidos` (
  `id` int(11) NOT NULL,
  `NUMERO` bigint(255) NOT NULL,
  `subtotal` varchar(255) NOT NULL,
  `costo_envio` varchar(5000) NOT NULL,
  `valor_total` varchar(100) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `FECHA` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_correo` varchar(255) NOT NULL,
  `usuario_telefono` varchar(255) NOT NULL,
  `pedido` varchar(5000) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `tipo_envio` varchar(100) NOT NULL,
  `tipo_envio1` varchar(100) NOT NULL,
  `despachado` bigint(5) NOT NULL,
  `entregado` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `social_id` varchar(100) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `empresa` varchar(255) NOT NULL,
  `codigo` text NOT NULL,
  `nive` varchar(255) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `nombre` text NOT NULL,
  `cc` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `empresa`, `codigo`, `nive`, `pass`, `nombre`, `cc`, `email`, `fecha`) VALUES
(1, 'Administrador', '1', 'Completo', 'claves', 'Carlos11', '7878788', '', '2022-06-09 15:16:59'),
(2, 'Vendedor 1', '2', 'Ventas', 'hola', 'admin2', '', '', '2022-09-14 14:52:17'),
(8, 'Vendedor 2', '2', 'Ventas', '33', 'ventas pablo', '66', '', '2022-09-23 04:41:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_cuenta`
--

CREATE TABLE `usuarios_cuenta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `activado` bigint(5) NOT NULL,
  `nivel` bigint(5) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios_cuenta`
--

INSERT INTO `usuarios_cuenta` (`id`, `nombre`, `usuario`, `activado`, `nivel`, `email`) VALUES
(224, 'Mensajero', '', 0, 0, ''),
(223, 'Administrador', '', 5, 0, ''),
(222, 'Inventario', '', 5, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `num` text NOT NULL,
  `fecha2` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `visitas`
--

INSERT INTO `visitas` (`id`, `ip`, `fecha`, `num`, `fecha2`) VALUES
(1, '181.130.23.174', '2022-02-08', '1', '2022-02'),
(2, '181.130.23.174', '2022-02-08', '1', '2022-02'),
(3, '179.15.16.237', '2022-05-11', '1', '2022-05'),
(4, '190.0.247.163', '2022-09-07', '1', '2022-09'),
(5, '190.0.247.163', '2022-09-07', '1', '2022-09'),
(6, '190.0.247.163', '2022-09-07', '1', '2022-09'),
(7, '190.0.247.163', '2022-09-07', '1', '2022-09'),
(8, '190.0.247.163', '2022-09-07', '1', '2022-09'),
(9, '191.95.145.254', '2022-10-18', '1', '2022-10'),
(10, '191.95.145.254', '2022-10-18', '1', '2022-10'),
(11, '191.95.145.254', '2022-10-18', '1', '2022-10'),
(12, '191.95.145.10', '2022-11-02', '1', '2022-11'),
(13, '191.95.145.10', '2022-11-02', '1', '2022-11'),
(14, '191.95.145.10', '2022-11-02', '1', '2022-11'),
(15, '191.95.145.10', '2022-11-02', '1', '2022-11');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ajustes_contables`
--
ALTER TABLE `ajustes_contables`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bancoscontraentrega`
--
ALTER TABLE `bancoscontraentrega`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bancos_detalles`
--
ALTER TABLE `bancos_detalles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cargos_empleados`
--
ALTER TABLE `cargos_empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias_tienda`
--
ALTER TABLE `categorias_tienda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `chart_data`
--
ALTER TABLE `chart_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clavestmp`
--
ALTER TABLE `clavestmp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes2`
--
ALTER TABLE `clientes2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clienteselectronica`
--
ALTER TABLE `clienteselectronica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `codigo_descuento`
--
ALTER TABLE `codigo_descuento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `codigo_pago`
--
ALTER TABLE `codigo_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comprobantespago`
--
ALTER TABLE `comprobantespago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `datos_servicios`
--
ALTER TABLE `datos_servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_cotizacion`
--
ALTER TABLE `detalles_cotizacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_empleados`
--
ALTER TABLE `detalles_empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_facturas`
--
ALTER TABLE `detalles_facturas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_facturas_electronicas`
--
ALTER TABLE `detalles_facturas_electronicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_ingresos`
--
ALTER TABLE `detalles_ingresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_notadebito`
--
ALTER TABLE `detalles_notadebito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_pedidos`
--
ALTER TABLE `detalles_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_produccion`
--
ALTER TABLE `detalles_produccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_remisiones`
--
ALTER TABLE `detalles_remisiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_salidas`
--
ALTER TABLE `detalles_salidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_tienda`
--
ALTER TABLE `detalles_tienda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturas_electronicas`
--
ALTER TABLE `facturas_electronicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gastos_fijos`
--
ALTER TABLE `gastos_fijos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image_cesta`
--
ALTER TABLE `image_cesta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image_cestatema`
--
ALTER TABLE `image_cestatema`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image_comprobante`
--
ALTER TABLE `image_comprobante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image_principal`
--
ALTER TABLE `image_principal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image_principalactivar`
--
ALTER TABLE `image_principalactivar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image_principalactivartema`
--
ALTER TABLE `image_principalactivartema`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image_principaltema`
--
ALTER TABLE `image_principaltema`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image_tallas`
--
ALTER TABLE `image_tallas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image_tienda`
--
ALTER TABLE `image_tienda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image_tiendacolores`
--
ALTER TABLE `image_tiendacolores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image_tiendacoloreslista`
--
ALTER TABLE `image_tiendacoloreslista`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image_tiendapruebas`
--
ALTER TABLE `image_tiendapruebas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image_tiendavistaprevia`
--
ALTER TABLE `image_tiendavistaprevia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lista7`
--
ALTER TABLE `lista7`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lista7elect`
--
ALTER TABLE `lista7elect`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lista_retenciones`
--
ALTER TABLE `lista_retenciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medios_pago`
--
ALTER TABLE `medios_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medios_pagocontra`
--
ALTER TABLE `medios_pagocontra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nomina`
--
ALTER TABLE `nomina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notas_credito`
--
ALTER TABLE `notas_credito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notas_debito`
--
ALTER TABLE `notas_debito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenesservicio`
--
ALTER TABLE `ordenesservicio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `osremisiones`
--
ALTER TABLE `osremisiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ostemporal`
--
ALTER TABLE `ostemporal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ostemporalclientes`
--
ALTER TABLE `ostemporalclientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ostemporalequipos`
--
ALTER TABLE `ostemporalequipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ostemporalingresos`
--
ALTER TABLE `ostemporalingresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ostemporalnomina`
--
ALTER TABLE `ostemporalnomina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ostemporalpedidos`
--
ALTER TABLE `ostemporalpedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ostemporalproduccion`
--
ALTER TABLE `ostemporalproduccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ostemporal_cotizaciones`
--
ALTER TABLE `ostemporal_cotizaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ostemporal_mesas`
--
ALTER TABLE `ostemporal_mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ostemporal_mesas2`
--
ALTER TABLE `ostemporal_mesas2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ostemporal_parqueadero`
--
ALTER TABLE `ostemporal_parqueadero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plantillas`
--
ALTER TABLE `plantillas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plantillas2`
--
ALTER TABLE `plantillas2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prestamos_abonos`
--
ALTER TABLE `prestamos_abonos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registered_users`
--
ALTER TABLE `registered_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registrados`
--
ALTER TABLE `registrados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `remisiones`
--
ALTER TABLE `remisiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tallas`
--
ALTER TABLE `tallas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tallas_tmp`
--
ALTER TABLE `tallas_tmp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets_numero`
--
ALTER TABLE `tickets_numero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets_parqueadero`
--
ALTER TABLE `tickets_parqueadero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tienda_footer`
--
ALTER TABLE `tienda_footer`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tienda_pedidos`
--
ALTER TABLE `tienda_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `email` (`email`),
  ADD KEY `login` (`password`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abonos`
--
ALTER TABLE `abonos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ajustes_contables`
--
ALTER TABLE `ajustes_contables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT de la tabla `bancoscontraentrega`
--
ALTER TABLE `bancoscontraentrega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT de la tabla `bancos_detalles`
--
ALTER TABLE `bancos_detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargos_empleados`
--
ALTER TABLE `cargos_empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categorias_tienda`
--
ALTER TABLE `categorias_tienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `chart_data`
--
ALTER TABLE `chart_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clavestmp`
--
ALTER TABLE `clavestmp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes2`
--
ALTER TABLE `clientes2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `clienteselectronica`
--
ALTER TABLE `clienteselectronica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;

--
-- AUTO_INCREMENT de la tabla `codigo_descuento`
--
ALTER TABLE `codigo_descuento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `codigo_pago`
--
ALTER TABLE `codigo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=431;

--
-- AUTO_INCREMENT de la tabla `comprobantespago`
--
ALTER TABLE `comprobantespago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos_servicios`
--
ALTER TABLE `datos_servicios`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_cotizacion`
--
ALTER TABLE `detalles_cotizacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_empleados`
--
ALTER TABLE `detalles_empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_facturas`
--
ALTER TABLE `detalles_facturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=554;

--
-- AUTO_INCREMENT de la tabla `detalles_facturas_electronicas`
--
ALTER TABLE `detalles_facturas_electronicas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `detalles_ingresos`
--
ALTER TABLE `detalles_ingresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_notadebito`
--
ALTER TABLE `detalles_notadebito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2002;

--
-- AUTO_INCREMENT de la tabla `detalles_pedidos`
--
ALTER TABLE `detalles_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_produccion`
--
ALTER TABLE `detalles_produccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_remisiones`
--
ALTER TABLE `detalles_remisiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_salidas`
--
ALTER TABLE `detalles_salidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_tienda`
--
ALTER TABLE `detalles_tienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `egresos`
--
ALTER TABLE `egresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT de la tabla `facturas_electronicas`
--
ALTER TABLE `facturas_electronicas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gastos_fijos`
--
ALTER TABLE `gastos_fijos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `image_cesta`
--
ALTER TABLE `image_cesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `image_cestatema`
--
ALTER TABLE `image_cestatema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=725;

--
-- AUTO_INCREMENT de la tabla `image_comprobante`
--
ALTER TABLE `image_comprobante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `image_principal`
--
ALTER TABLE `image_principal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `image_principalactivar`
--
ALTER TABLE `image_principalactivar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `image_principalactivartema`
--
ALTER TABLE `image_principalactivartema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `image_principaltema`
--
ALTER TABLE `image_principaltema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `image_tallas`
--
ALTER TABLE `image_tallas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT de la tabla `image_tienda`
--
ALTER TABLE `image_tienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `image_tiendacolores`
--
ALTER TABLE `image_tiendacolores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT de la tabla `image_tiendacoloreslista`
--
ALTER TABLE `image_tiendacoloreslista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `image_tiendapruebas`
--
ALTER TABLE `image_tiendapruebas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `image_tiendavistaprevia`
--
ALTER TABLE `image_tiendavistaprevia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lista7`
--
ALTER TABLE `lista7`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `lista7elect`
--
ALTER TABLE `lista7elect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT de la tabla `lista_retenciones`
--
ALTER TABLE `lista_retenciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT de la tabla `medios_pago`
--
ALTER TABLE `medios_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT de la tabla `medios_pagocontra`
--
ALTER TABLE `medios_pagocontra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `nomina`
--
ALTER TABLE `nomina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT de la tabla `notas_credito`
--
ALTER TABLE `notas_credito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT de la tabla `notas_debito`
--
ALTER TABLE `notas_debito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT de la tabla `ordenesservicio`
--
ALTER TABLE `ordenesservicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT de la tabla `osremisiones`
--
ALTER TABLE `osremisiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ostemporal`
--
ALTER TABLE `ostemporal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT de la tabla `ostemporalclientes`
--
ALTER TABLE `ostemporalclientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=275;

--
-- AUTO_INCREMENT de la tabla `ostemporalequipos`
--
ALTER TABLE `ostemporalequipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT de la tabla `ostemporalingresos`
--
ALTER TABLE `ostemporalingresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT de la tabla `ostemporalnomina`
--
ALTER TABLE `ostemporalnomina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ostemporalpedidos`
--
ALTER TABLE `ostemporalpedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT de la tabla `ostemporalproduccion`
--
ALTER TABLE `ostemporalproduccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ostemporal_cotizaciones`
--
ALTER TABLE `ostemporal_cotizaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `ostemporal_mesas`
--
ALTER TABLE `ostemporal_mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `ostemporal_mesas2`
--
ALTER TABLE `ostemporal_mesas2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1844;

--
-- AUTO_INCREMENT de la tabla `ostemporal_parqueadero`
--
ALTER TABLE `ostemporal_parqueadero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1981;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1466;

--
-- AUTO_INCREMENT de la tabla `plantillas`
--
ALTER TABLE `plantillas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `plantillas2`
--
ALTER TABLE `plantillas2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1272;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamos_abonos`
--
ALTER TABLE `prestamos_abonos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1594;

--
-- AUTO_INCREMENT de la tabla `registered_users`
--
ALTER TABLE `registered_users`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `registrados`
--
ALTER TABLE `registrados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=887;

--
-- AUTO_INCREMENT de la tabla `remisiones`
--
ALTER TABLE `remisiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salidas`
--
ALTER TABLE `salidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tallas`
--
ALTER TABLE `tallas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=566;

--
-- AUTO_INCREMENT de la tabla `tallas_tmp`
--
ALTER TABLE `tallas_tmp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tickets_numero`
--
ALTER TABLE `tickets_numero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tickets_parqueadero`
--
ALTER TABLE `tickets_parqueadero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tienda_footer`
--
ALTER TABLE `tienda_footer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=383;

--
-- AUTO_INCREMENT de la tabla `tienda_pedidos`
--
ALTER TABLE `tienda_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
