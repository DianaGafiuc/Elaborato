-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 31, 2021 alle 21:06
-- Versione del server: 10.4.14-MariaDB
-- Versione PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poggers`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `natura`
--

CREATE TABLE `natura` (
  `id_natura` int(11) NOT NULL,
  `desc_natura` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `progetti`
--

CREATE TABLE `progetti` (
  `id_progetto` varchar(15) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `tot_pagamenti` float DEFAULT NULL,
  `perc_av` float DEFAULT NULL,
  `id_beneficiario` int(11) DEFAULT NULL,
  `id_tema` int(11) DEFAULT NULL,
  `id_natura` int(11) DEFAULT NULL,
  `id_territorio` int(11) DEFAULT NULL,
  `id_stato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `progetti_soggetti`
--

CREATE TABLE `progetti_soggetti` (
  `id_progetto` varchar(15) NOT NULL,
  `id_soggetto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `progetti_territori`
--

CREATE TABLE `progetti_territori` (
  `id_progetto` varchar(15) NOT NULL,
  `id_territorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `soggetti`
--

CREATE TABLE `soggetti` (
  `id_soggetto` int(11) NOT NULL,
  `desc_soggetto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `stato`
--

CREATE TABLE `stato` (
  `id_stato` int(11) NOT NULL,
  `desc_stato` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `temi`
--

CREATE TABLE `temi` (
  `id_tema` int(11) NOT NULL,
  `desc_tema` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `territori`
--

CREATE TABLE `territori` (
  `id_territorio` int(11) NOT NULL,
  `desc_territorio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `natura`
--
ALTER TABLE `natura`
  ADD PRIMARY KEY (`id_natura`);

--
-- Indici per le tabelle `progetti`
--
ALTER TABLE `progetti`
  ADD PRIMARY KEY (`id_progetto`),
  ADD KEY `id_tema` (`id_tema`),
  ADD KEY `id_natura` (`id_natura`),
  ADD KEY `id_stato` (`id_stato`);

--
-- Indici per le tabelle `progetti_soggetti`
--
ALTER TABLE `progetti_soggetti`
  ADD PRIMARY KEY (`id_progetto`,`id_soggetto`),
  ADD KEY `id_soggetto` (`id_soggetto`);

--
-- Indici per le tabelle `progetti_territori`
--
ALTER TABLE `progetti_territori`
  ADD PRIMARY KEY (`id_progetto`,`id_territorio`),
  ADD KEY `id_territorio` (`id_territorio`);

--
-- Indici per le tabelle `soggetti`
--
ALTER TABLE `soggetti`
  ADD PRIMARY KEY (`id_soggetto`);

--
-- Indici per le tabelle `stato`
--
ALTER TABLE `stato`
  ADD PRIMARY KEY (`id_stato`);

--
-- Indici per le tabelle `temi`
--
ALTER TABLE `temi`
  ADD PRIMARY KEY (`id_tema`);

--
-- Indici per le tabelle `territori`
--
ALTER TABLE `territori`
  ADD PRIMARY KEY (`id_territorio`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `natura`
--
ALTER TABLE `natura`
  MODIFY `id_natura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `soggetti`
--
ALTER TABLE `soggetti`
  MODIFY `id_soggetto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `stato`
--
ALTER TABLE `stato`
  MODIFY `id_stato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `temi`
--
ALTER TABLE `temi`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `territori`
--
ALTER TABLE `territori`
  MODIFY `id_territorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `progetti`
--
ALTER TABLE `progetti`
  ADD CONSTRAINT `progetti_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `temi` (`id_tema`),
  ADD CONSTRAINT `progetti_ibfk_2` FOREIGN KEY (`id_natura`) REFERENCES `natura` (`id_natura`),
  ADD CONSTRAINT `progetti_ibfk_3` FOREIGN KEY (`id_stato`) REFERENCES `stato` (`id_stato`);

--
-- Limiti per la tabella `progetti_soggetti`
--
ALTER TABLE `progetti_soggetti`
  ADD CONSTRAINT `progetti_soggetti_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `progetti` (`id_progetto`),
  ADD CONSTRAINT `progetti_soggetti_ibfk_2` FOREIGN KEY (`id_soggetto`) REFERENCES `soggetti` (`id_soggetto`);

--
-- Limiti per la tabella `progetti_territori`
--
ALTER TABLE `progetti_territori`
  ADD CONSTRAINT `progetti_territori_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `progetti` (`id_progetto`),
  ADD CONSTRAINT `progetti_territori_ibfk_2` FOREIGN KEY (`id_territorio`) REFERENCES `territori` (`id_territorio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
