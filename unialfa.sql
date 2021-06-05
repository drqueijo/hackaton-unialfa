-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Jun-2021 às 10:25
-- Versão do servidor: 10.4.19-MariaDB
-- versão do PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `unialfa`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cor`
--

CREATE TABLE `cor` (
  `id` int(11) NOT NULL,
  `cor` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cor`
--

INSERT INTO `cor` (`id`, `cor`) VALUES
(1, 'azul'),
(2, 'vermelho');

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `marca` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `marca`
--

INSERT INTO `marca` (`id`, `marca`) VALUES
(1, 'fiat'),
(2, 'gm');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `login`, `senha`, `foto`) VALUES
(1, 'joao', NULL, NULL, NULL),
(2, 'jose', NULL, NULL, NULL),
(3, 'alfredo', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `id` int(11) NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `anomodelo` varchar(45) DEFAULT NULL,
  `anofabricacao` varchar(45) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `fotoDestaque` varchar(45) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `cor_id` int(11) DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `veiculo`
--

INSERT INTO `veiculo` (`id`, `modelo`, `anomodelo`, `anofabricacao`, `valor`, `tipo`, `foto`, `fotoDestaque`, `usuario_id`, `cor_id`, `marca_id`) VALUES
(1, '123', '2010', '2006', 1000, 'a', 'asd', 'asd', 1, 1, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cor`
--
ALTER TABLE `cor`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_veiculo` (`usuario_id`),
  ADD KEY `marca_veiculo` (`marca_id`),
  ADD KEY `cor_veiculo` (`cor_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cor`
--
ALTER TABLE `cor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `cor_veiculo` FOREIGN KEY (`cor_id`) REFERENCES `cor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `marca_veiculo` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_veiculo` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
