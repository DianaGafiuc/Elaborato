-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 06, 2021 alle 23:03
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
  `id` int(11) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `natura`
--

INSERT INTO `natura` (`id`, `descrizione`) VALUES
(121, 'ACQUISTO DI BENI'),
(112, 'ACQUISTO O REALIZZAZIONE DI SERVIZI'),
(129, 'CONCESSIONE DI CONTRIBUTI AD ALTRI SOGGETTI (DIVERSI DA UNITA\' PRODUTTIVE)'),
(110, 'CONCESSIONE DI INCENTIVI AD UNITA\' PRODUTTIVE'),
(107, 'REALIZZAZIONE DI LAVORI PUBBLICI (OPERE ED IMPIANTISTICA)'),
(109, 'SOTTOSCRIZIONE INIZIALE O AUMENTO DI CAPITALE SOCIALE (COMPRESI SPIN OFF), FONDI DI RISCHIO O DI GARANZIA');

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
  `id_tema` int(11) DEFAULT NULL,
  `id_natura` int(11) DEFAULT NULL,
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
  `id` int(11) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `stato`
--

CREATE TABLE `stato` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `stato`
--

INSERT INTO `stato` (`id`, `descrizione`) VALUES
(111, 'Concluso'),
(100, 'In corso'),
(102, 'Liquidato'),
(121, 'Non avviato');

-- --------------------------------------------------------

--
-- Struttura della tabella `temi`
--

CREATE TABLE `temi` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `territori`
--

CREATE TABLE `territori` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `territori`
--

INSERT INTO `territori` (`id`, `descrizione`) VALUES
(4001, 'acceglio-comune'),
(6001, 'acqui-terme-comune'),
(33001, 'agazzano-comune'),
(5001, 'agliano-terme-comune'),
(1001, 'aglie-comune'),
(3001, 'agrate-conturbia-comune'),
(96001, 'ailoche-comune'),
(1002, 'airasca-comune'),
(4002, 'aisone-comune'),
(1003, 'ala-di-stura-comune'),
(2002, 'alagna-valsesia-comune'),
(4003, 'alba-comune'),
(2003, 'albano-vercellese-comune'),
(34001, 'albareto-comune'),
(4004, 'albaretto-della-torre-comune'),
(6002, 'albera-ligure-comune'),
(1004, 'albiano-divrea-comune'),
(35001, 'albinea-comune'),
(5002, 'albugnano-comune'),
(6003, 'alessandria-comune'),
(99003, 'alessandria-provincia'),
(6004, 'alfiano-natta-comune'),
(39001, 'alfonsine-comune'),
(6005, 'alice-bel-colle-comune'),
(2004, 'alice-castello-comune'),
(7001, 'allein-comune'),
(6192, 'alluvioni-piovera-comune'),
(1006, 'almese-comune'),
(1007, 'alpette-comune'),
(33002, 'alseno-comune'),
(33049, 'alta-val-tidone-comune'),
(37062, 'alto-reno-terme-comune'),
(7002, 'antey-saint-andre-comune'),
(37001, 'anzola-dellemilia-comune'),
(7003, 'aosta-comune'),
(37002, 'argelato-comune'),
(38001, 'argenta-comune'),
(7004, 'arnad-comune'),
(7005, 'arvier-comune'),
(99004, 'asti-provincia'),
(7006, 'avise-comune'),
(7007, 'ayas-comune'),
(7008, 'aymavilles-comune'),
(39003, 'bagnara-di-romagna-comune'),
(40001, 'bagno-di-romagna-comune'),
(35002, 'bagnolo-in-piano-comune'),
(35003, 'baiso-comune'),
(7009, 'bard-comune'),
(34002, 'bardi-comune'),
(37003, 'baricella-comune'),
(36001, 'bastiglia-comune'),
(34003, 'bedonia-comune'),
(99001, 'bellaria-igea-marina-comune'),
(37005, 'bentivoglio-comune'),
(34004, 'berceto-comune'),
(40003, 'bertinoro-comune'),
(33003, 'besenzone-comune'),
(7010, 'bionaz-comune'),
(39002, 'bologna-provincia'),
(7011, 'brissogne-comune'),
(7012, 'brusson-comune'),
(7013, 'challand-saint-anselme-comune'),
(7014, 'challand-saint-victor-comune'),
(7015, 'chambave-comune'),
(7016, 'chamois-comune'),
(7017, 'champdepraz-comune'),
(7018, 'champorcher-comune'),
(7019, 'charvensod-comune'),
(7020, 'chatillon-comune'),
(7021, 'cogne-comune'),
(7022, 'courmayeur-comune'),
(7023, 'donnas-comune'),
(7024, 'doues-comune'),
(7025, 'emarese-comune');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `natura`
--
ALTER TABLE `natura`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descrizione` (`descrizione`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descrizione` (`descrizione`);

--
-- Indici per le tabelle `stato`
--
ALTER TABLE `stato`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descrizione` (`descrizione`);

--
-- Indici per le tabelle `temi`
--
ALTER TABLE `temi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descrizione` (`descrizione`);

--
-- Indici per le tabelle `territori`
--
ALTER TABLE `territori`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descrizione` (`descrizione`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `natura`
--
ALTER TABLE `natura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;

--
-- AUTO_INCREMENT per la tabella `soggetti`
--
ALTER TABLE `soggetti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167810;

--
-- AUTO_INCREMENT per la tabella `stato`
--
ALTER TABLE `stato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;

--
-- AUTO_INCREMENT per la tabella `temi`
--
ALTER TABLE `temi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;

--
-- AUTO_INCREMENT per la tabella `territori`
--
ALTER TABLE `territori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99007;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `progetti`
--
ALTER TABLE `progetti`
  ADD CONSTRAINT `progetti_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `temi` (`id`),
  ADD CONSTRAINT `progetti_ibfk_2` FOREIGN KEY (`id_natura`) REFERENCES `natura` (`id`),
  ADD CONSTRAINT `progetti_ibfk_3` FOREIGN KEY (`id_stato`) REFERENCES `stato` (`id`);

--
-- Limiti per la tabella `progetti_soggetti`
--
ALTER TABLE `progetti_soggetti`
  ADD CONSTRAINT `progetti_soggetti_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `progetti` (`id_progetto`) ON DELETE CASCADE,
  ADD CONSTRAINT `progetti_soggetti_ibfk_2` FOREIGN KEY (`id_soggetto`) REFERENCES `soggetti` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `progetti_territori`
--
ALTER TABLE `progetti_territori`
  ADD CONSTRAINT `progetti_territori_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `progetti` (`id_progetto`) ON DELETE CASCADE,
  ADD CONSTRAINT `progetti_territori_ibfk_2` FOREIGN KEY (`id_territorio`) REFERENCES `territori` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
