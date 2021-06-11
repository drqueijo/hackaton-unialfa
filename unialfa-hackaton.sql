-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Jun-2021 às 01:59
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
-- Banco de dados: `unialfa-hackaton`
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
(2, 'branco'),
(3, 'roxo'),
(4, 'marrom'),
(5, 'GM');

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `marca` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `marca`
--

INSERT INTO `marca` (`id`, `marca`) VALUES
(2, 'bmw'),
(3, 'abcd');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(150) NOT NULL,
  `foto` varchar(30) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `ativo` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `login`, `senha`, `foto`, `tipo_id`, `ativo`) VALUES
(1, 'Steve Jobisson', 'steve@jobisson.com', 'steve', '$2y$10$8sk6AfAW3b98X6GcdATA2OEtS/M2odQyQpbXXIp.WH.oKb.bjZ/cq', 'jobs', 1, 'S'),
(3, 'Hysteven Ispilberg', 'spil@berg.com.br', 'hysteven', 'spilberg', '', 1, 'N'),
(4, 'asd', '123@gmail.com', 'asd', '$2y$10$9Vn68L5SUpR/6n6nl8NLtuQ7idW.f0V1bVjVXPywz3cCd1MgDU.r.', '1623268845_1', 2, 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `id` int(11) NOT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `anomodelo` varchar(45) DEFAULT NULL,
  `anofabricacao` varchar(45) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `fotoDestaque` varchar(45) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `cor_id` int(11) DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `veiculo`
--

INSERT INTO `veiculo` (`id`, `modelo`, `anomodelo`, `anofabricacao`, `valor`, `tipo`, `fotoDestaque`, `usuario_id`, `cor_id`, `marca_id`) VALUES
(1, 'Astra2', '2010', '2009', 200.02, 's', '1609540750_1', 1, 2, 2),
(2, 'Vectra', '2000', '2001', 200.45, 'n', '1609540750_1', 1, 3, 2),
(3, 'Uno', '1991', '1990', 2222, 'n', '1609540750_1', 3, 4, 3),
(5, 'jipe', '2010', '2010', 200, 'n', NULL, 1, 5, 3),
(6, 'jipe2', '2010', '2010', 5000, 's', NULL, 1, 5, 3),
(7, 'rx-7', '2010', '2010', 5000, 's', 'veiculo_1623205899_1', 1, 3, 3);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `tipo_id` (`tipo_id`);

--
-- Índices para tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_veiculo` (`usuario_id`),
  ADD KEY `cor_veiculo` (`cor_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cor`
--
ALTER TABLE `cor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`tipo_id`) REFERENCES `tipo` (`id`);

--
-- Limitadores para a tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `cor_veiculo` FOREIGN KEY (`cor_id`) REFERENCES `cor` (`id`),
  ADD CONSTRAINT `usuario_veiculo` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
