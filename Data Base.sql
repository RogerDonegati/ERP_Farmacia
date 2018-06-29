-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2016 a las 05:18:27
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `farmacia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caixa`
--

CREATE TABLE `caixa` (
  `cod_caixa` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `data` date NOT NULL,
  `vendas_total` int(11) NOT NULL,
  `vendas_dia` int(11) NOT NULL,
  `valor_dia` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `caixa`
--

INSERT INTO `caixa` (`cod_caixa`, `status`, `data`, `vendas_total`, `vendas_dia`, `valor_dia`) VALUES
(12, 0, '2016-11-30', 20, 20, 238),
(13, 0, '2016-12-01', 45, 25, 276),
(14, 0, '2016-12-02', 80, 35, 330),
(15, 0, '2016-12-03', 100, 20, 200),
(16, 0, '2016-12-04', 127, 27, 245),
(17, 0, '2016-12-05', 128, 1, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cod_cliente` int(11) NOT NULL,
  `nome` varchar(75) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `tipo` tinyint(1) NOT NULL,
  `endereco` varchar(80) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cod_cliente`, `nome`, `cpf`, `rg`, `tipo`, `endereco`, `telefone`, `nascimento`) VALUES
(24, 'Joao Souza', '24861975590', '403289440', 1, 'Rua James Stolz Nº2100', '1143679275', '1950-02-10'),
(27, 'Joao Carlos', '36341132433', '403289440', 0, 'Rua tabatinga Nº600', '1164294728', '1990-10-05'),
(28, 'Sergio da Cunha', '14921963479', '366521779', 0, 'Alameda dos imigrantes', '11736471', '1995-08-22'),
(29, 'Pedro Oliveira', '89858451105', '418757896', 0, 'Rua dos Autonomistas', '1172459375', '1997-05-17'),
(30, 'Rafel dos Santos', '32152897501', '2977269', 1, 'Av Paes de Barros', '1173458253', '1970-05-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fornecedor`
--

CREATE TABLE `fornecedor` (
  `cod_fornecedor` int(11) NOT NULL,
  `nome` varchar(75) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `telefone` int(11) NOT NULL,
  `endereco` varchar(80) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fornecedor`
--

INSERT INTO `fornecedor` (`cod_fornecedor`, `nome`, `cnpj`, `telefone`, `endereco`, `email`) VALUES
(12, 'D-Hosp', '43405564000117', 1135260600, 'Av. Ibirapuera, 2332', 'direcao@dhosp.com'),
(14, 'Quality Medical', '60348393000150', 1120214004, 'Av. Alberto Ramos, 274 - São Lucas, São Paulo', 'sergio.quality@quality.com'),
(15, 'Abafarma', '44282135000162', 1150803636, 'Rua Machado Bitencourt, 205 - Vila Clementino', 'business@Abafarma.com'),
(16, 'Tudo Farma', '58112171000192', 1132630044, 'Av. Paulista - Cerqueira César, São Paulo', 'rhTudoFarma@tudofarma.com'),
(17, 'Drogacenter', '67355377000134', 1121719393, 'Av. Recife, 70 - Pimentas, Guarulhos', 'diretoria@drogacenter.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionario`
--

CREATE TABLE `funcionario` (
  `cod_funcionario` int(11) NOT NULL,
  `nome` varchar(75) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `endereco` varchar(80) DEFAULT NULL,
  `email` varchar(35) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `ver_caixa` tinyint(1) NOT NULL DEFAULT '0',
  `ver_cliente` tinyint(1) NOT NULL DEFAULT '0',
  `ver_fornecedor` tinyint(1) NOT NULL DEFAULT '0',
  `ver_funcionario` tinyint(1) NOT NULL DEFAULT '0',
  `ver_medicamento` tinyint(1) NOT NULL DEFAULT '0',
  `alterar_precos` tinyint(1) NOT NULL DEFAULT '0',
  `ver_senha` tinyint(1) NOT NULL DEFAULT '0',
  `ver_relatorio` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `funcionario`
--

INSERT INTO `funcionario` (`cod_funcionario`, `nome`, `cpf`, `telefone`, `endereco`, `email`, `senha`, `ver_caixa`, `ver_cliente`, `ver_fornecedor`, `ver_funcionario`, `ver_medicamento`, `alterar_precos`, `ver_senha`, `ver_relatorio`) VALUES
(1, 'admin', '44770208804', '1124173868', 'Rua Geronimo de mendonça', 'admin@gmail.com', 'admin', 1, 1, 1, 1, 1, 1, 1, 1),
(11, 'roger donegati', '10136474594', '1133332258', ' R. Antônio Muniz Fagundes, 53 - Vila Virginia', 'roger_donegati@hotmail.com', '123abc', 1, 1, 0, 0, 1, 0, 0, 1),
(12, 'Antonio Silva', '17207717318', '11973570351', 'Av Paulista Nº1000', 'antonio-silva@gmail.com', 'esmeralda', 1, 1, 0, 0, 1, 0, 0, 0),
(13, 'Paulo Marques', '56164427207', '1148070342', 'Rua da Mooca Nº2300', 'paulo_marques@hotmail.com', 'rex', 1, 0, 0, 0, 0, 0, 0, 0),
(14, 'Cesar Carvalho', '60832585025', '1140028922', 'Av Estrada das Lagrimas Nª200', 'cesar.carvalho.gmail.com', 'carvalho', 1, 1, 1, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `cod_medicamento` int(11) NOT NULL,
  `cod_fornecedor` int(11) NOT NULL,
  `nome` varchar(75) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`cod_medicamento`, `cod_fornecedor`, `nome`, `quantidade`, `preco`) VALUES
(18, 12, 'aspirina', 276, 16),
(19, 12, 'paracetamol', 185, 10),
(20, 12, 'soro fisiológico', 161, 3),
(21, 14, 'gadernal', 44, 8),
(22, 15, 'Sinvastatina', 111, 13),
(23, 16, 'berotec', 122, 18),
(24, 17, 'Dipirona', 195, 2),
(25, 17, 'dorflex', 163, 12),
(26, 14, 'Neosaldina', 49, 18.5),
(27, 16, 'lisador', 275, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `cod_pedido` int(11) NOT NULL,
  `cod_venda` int(11) NOT NULL,
  `cod_medicamento` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`cod_pedido`, `cod_venda`, `cod_medicamento`, `quantidade`, `valor`) VALUES
(26, 1, 20, 23, 253),
(27, 1, 18, 20, 240),
(28, 9, 18, 5, 60),
(29, 10, 20, 4, 44),
(30, 10, 18, 20, 240),
(31, 10, 19, 20, 40),
(32, 11, 20, 2, 22),
(33, 11, 18, 4, 48),
(34, 11, 19, 10, 20),
(35, 12, 18, 5, 80),
(36, 12, 21, 2, 16),
(37, 12, 26, 1, 18.5),
(38, 12, 20, 7, 21),
(39, 13, 24, 5, 10),
(40, 13, 22, 4, 52),
(41, 13, 27, 7, 175),
(42, 13, 19, 4, 40),
(43, 13, 23, 6, 108),
(44, 14, 18, 6, 96),
(45, 14, 27, 6, 150),
(46, 14, 26, 2, 37),
(47, 14, 22, 1, 13),
(48, 15, 27, 5, 125),
(49, 15, 18, 8, 128),
(50, 16, 18, 5, 80),
(51, 16, 23, 3, 54),
(52, 16, 25, 7, 84),
(53, 16, 21, 4, 32),
(54, 16, 27, 7, 175),
(55, 16, 26, 3, 55.5),
(56, 16, 19, 11, 110),
(57, 16, 20, 2, 6),
(58, 16, 22, 4, 52),
(59, 17, 23, 1, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relatorio`
--

CREATE TABLE `relatorio` (
  `cod_relatorio` int(11) NOT NULL,
  `comando` varchar(300) NOT NULL,
  `colunas` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `relatorio`
--

INSERT INTO `relatorio` (`cod_relatorio`, `comando`, `colunas`, `titulo`) VALUES
(1, 'select m.nome as coluna0,  sum(p.quantidade) as coluna1 from pedido p\nright join medicamento m on m.cod_medicamento = p.cod_medicamento\ngroup by p.cod_medicamento order by coluna1 desc', 2, 'Medicamentos mais Vendidos'),
(2, 'select c.nome as coluna0, count(v.cod_venda) as coluna1, sum(v.valor) as coluna2 from venda v\nright join cliente c on v.cod_cliente = c.cod_cliente\ngroup by c.cod_cliente order by c.nome asc', 3, 'Vendas por Cliente'),
(3, 'select f.nome as coluna0, count(m.cod_medicamento) as coluna1\nfrom medicamento m \nright join fornecedor f on m.cod_fornecedor = f.cod_fornecedor\ngroup by f.cod_fornecedor order by f.nome asc', 2, 'Medicamentos por Fornecedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relatorio_colunas`
--

CREATE TABLE `relatorio_colunas` (
  `cod_relatorio_colunas` int(11) NOT NULL,
  `cod_relatorio` int(11) NOT NULL,
  `coluna` varchar(30) NOT NULL,
  `ordem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `relatorio_colunas`
--

INSERT INTO `relatorio_colunas` (`cod_relatorio_colunas`, `cod_relatorio`, `coluna`, `ordem`) VALUES
(1, 1, 'Medicamento', 1),
(2, 1, 'Vendas', 2),
(3, 2, 'Cliente', 1),
(4, 2, 'Vendas', 2),
(5, 2, 'Valor Total Vendido', 3),
(6, 3, 'Fornecedor', 1),
(7, 3, 'Medicamentos Fornecidos', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venda`
--

CREATE TABLE `venda` (
  `cod_venda` int(11) NOT NULL,
  `cod_caixa` int(11) NOT NULL,
  `cod_cliente` int(11) NOT NULL,
  `cod_funcionario` int(11) NOT NULL,
  `valor` float NOT NULL,
  `desconto` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venda`
--

INSERT INTO `venda` (`cod_venda`, `cod_caixa`, `cod_cliente`, `cod_funcionario`, `valor`, `desconto`) VALUES
(12, 17, 27, 1, 135.5, 6.775),
(13, 17, 24, 1, 385, 77),
(14, 17, 28, 1, 296, 14.8),
(15, 17, 24, 1, 253, 50.6),
(16, 17, 30, 1, 648.5, 129.7),
(17, 17, 27, 1, 18, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caixa`
--
ALTER TABLE `caixa`
  ADD PRIMARY KEY (`cod_caixa`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Indices de la tabla `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`cod_fornecedor`);

--
-- Indices de la tabla `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`cod_funcionario`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`cod_medicamento`),
  ADD KEY `cod_fornecedor` (`cod_fornecedor`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`cod_pedido`),
  ADD KEY `cod_venda` (`cod_venda`,`cod_medicamento`);

--
-- Indices de la tabla `relatorio`
--
ALTER TABLE `relatorio`
  ADD PRIMARY KEY (`cod_relatorio`);

--
-- Indices de la tabla `relatorio_colunas`
--
ALTER TABLE `relatorio_colunas`
  ADD PRIMARY KEY (`cod_relatorio_colunas`);

--
-- Indices de la tabla `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`cod_venda`),
  ADD KEY `cod_caixa` (`cod_caixa`,`cod_cliente`,`cod_funcionario`),
  ADD KEY `cod_funcionario` (`cod_funcionario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caixa`
--
ALTER TABLE `caixa`
  MODIFY `cod_caixa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cod_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `cod_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `cod_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `cod_medicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `cod_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT de la tabla `relatorio`
--
ALTER TABLE `relatorio`
  MODIFY `cod_relatorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `relatorio_colunas`
--
ALTER TABLE `relatorio_colunas`
  MODIFY `cod_relatorio_colunas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `venda`
--
ALTER TABLE `venda`
  MODIFY `cod_venda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `venda`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
