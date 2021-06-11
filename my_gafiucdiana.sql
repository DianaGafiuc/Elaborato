-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 11, 2021 at 10:33 PM
-- Server version: 8.0.21
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_gafiucdiana`
--

-- --------------------------------------------------------

--
-- Table structure for table `natura`
--

CREATE TABLE IF NOT EXISTS `natura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descrizione` (`descrizione`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AUTO_INCREMENT=453 ;

--
-- Dumping data for table `natura`
--

INSERT INTO `natura` (`id`, `descrizione`) VALUES
(121, 'ACQUISTO DI BENI'),
(112, 'ACQUISTO O REALIZZAZIONE DI SERVIZI'),
(129, 'CONCESSIONE DI CONTRIBUTI AD ALTRI SOGGETTI (DIVERSI DA UNITA'' PRODUTTIVE)'),
(110, 'CONCESSIONE DI INCENTIVI AD UNITA'' PRODUTTIVE'),
(107, 'REALIZZAZIONE DI LAVORI PUBBLICI (OPERE ED IMPIANTISTICA)'),
(109, 'SOTTOSCRIZIONE INIZIALE O AUMENTO DI CAPITALE SOCIALE (COMPRESI SPIN OFF), FONDI DI RISCHIO O DI GARANZIA');

-- --------------------------------------------------------

--
-- Table structure for table `progetti`
--

CREATE TABLE IF NOT EXISTS `progetti` (
  `id_progetto` varchar(15) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `tot_pagamenti` float DEFAULT NULL,
  `perc_av` float DEFAULT NULL,
  `id_tema` int DEFAULT NULL,
  `id_natura` int DEFAULT NULL,
  `id_stato` int DEFAULT NULL,
  PRIMARY KEY (`id_progetto`),
  KEY `id_tema` (`id_tema`),
  KEY `id_natura` (`id_natura`),
  KEY `id_stato` (`id_stato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `progetti`
--

INSERT INTO `progetti` (`id_progetto`, `nome`, `descrizione`, `tot_pagamenti`, `perc_av`, `id_tema`, `id_natura`, `id_stato`) VALUES
('3PIPBAN-14489', '(0258000020) PRODUZIONE DI ENERGIA DA FONTI RINNOVABILI (FOTOVOLTAICO INNOVATIVO)', '', 1743840, 100, 454, 110, 111),
('3PIPBAN-15140', '(REG_2014_C.3.3) PISU ALESSANDRIA PONTE SUL FIUME TANARO DI COLLEGAMENTO CON AREA DELLA CITTADELLA MILITARE', '', 6717420, 100, 449, 107, 111),
('3PIPBAN-18910', '(0309000035) ALESSANDRIA SUPER TIRE ADVANCED ROLLING', '', 1070200, 62, 452, 110, 100),
('3PIPBAN-19235', '(0315000030) RIQUALIFICAZIONE ENERGETICA PLESSO RODARI', '', 0, 0, 454, 107, 121),
('3PIPBAN-19994', '(A19_2017_PALAZZO_CALLORI) RIQUALIFICAZIONE ED ADEGUAMENTO ALLE NORME DI SICUREZZA DELL''EDIFICIO DENOMINATO PALAZZO CALLORI', '', 2207070, 73, 448, 107, 100),
('3PIPBAN-20630', '(A19_POR-FESR-2014-2020_2018_FD3899)  MANUTENZIONE STRAORDINARIA DEL COMPLESSO RESIDENZIALE DI VIA BRIGHENTI IN TORTONA (AL)', '', 0, 0, 454, 107, 100),
('3PIPBAN-20631', '(A19_POR-FESR-2014-2020_2018_FD3905) INTERVENTO DI RIQUALIFICAZIONE ENERGETICA DI EDIFICIO RESIDENZIALE AD USO ABITATIVO SITO IN ALBA - VIA PINOT GALLIZIO, 12-14-16', '', 0, 0, 454, 107, 100),
('3PIPBAN-20632', '(A19_POR-FESR-2014-2020_2018_FD4194) INTERVENTO DI RIQUALIFICAZIONE ENERGETICA DI EDIFICIO RESIDENZIALE AD USO ABITATIVO SITO IN ASTI - VIA UNGARETTI, 18-20-22', '', 0, 0, 454, 107, 100),
('3PIPBAN-5362', '(0120000007) REALIZZAZIONE DI UN CAMPO FOTOVOLTAICO  DA 2 MWP EX-DISCARICA DI 2Â°CAT ?', '', 2722300, 100, 454, 110, 111),
('3PIPBAN-5712', '(REG_POR-FESR_2010_8633) RECUPERO,RIUSO E RIQUALIFICAZIONE DEL CASTELLO DI CASALE MONFERRATO- LOTTI  5Â° ED 8Â°', '', 2957860, 100, 448, 107, 111),
('3PISIFPL-23372', 'PROGETTO CRISI ATTIVITA CONVENZIONE 55827 - OPERATORE C33 - DIRETTIVA 76-2010 - FONTE 25', '', 4814720, 86, 450, 112, 100),
('3PISIFPL-23379', 'PROGETTO CRISI ATTIVITA CONVENZIONE 55829 - OPERATORE A139 - DIRETTIVA 76-2010 - FONTE 25', '', 3067580, 99, 450, 112, 111);

-- --------------------------------------------------------

--
-- Table structure for table `progetti_soggetti`
--

CREATE TABLE IF NOT EXISTS `progetti_soggetti` (
  `id_progetto` varchar(15) NOT NULL,
  `id_soggetto` int NOT NULL,
  PRIMARY KEY (`id_progetto`,`id_soggetto`),
  KEY `id_soggetto` (`id_soggetto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `progetti_territori`
--

CREATE TABLE IF NOT EXISTS `progetti_territori` (
  `id_progetto` varchar(15) NOT NULL,
  `id_territorio` int NOT NULL,
  PRIMARY KEY (`id_progetto`,`id_territorio`),
  KEY `id_territorio` (`id_territorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `soggetti`
--

CREATE TABLE IF NOT EXISTS `soggetti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descrizione` (`descrizione`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AUTO_INCREMENT=167810 ;

-- --------------------------------------------------------

--
-- Table structure for table `stato`
--

CREATE TABLE IF NOT EXISTS `stato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descrizione` (`descrizione`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AUTO_INCREMENT=446 ;

--
-- Dumping data for table `stato`
--

INSERT INTO `stato` (`id`, `descrizione`) VALUES
(111, 'Concluso'),
(100, 'In corso'),
(102, 'Liquidato'),
(121, 'Non avviato');

-- --------------------------------------------------------

--
-- Table structure for table `temi`
--

CREATE TABLE IF NOT EXISTS `temi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descrizione` (`descrizione`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AUTO_INCREMENT=455 ;

--
-- Dumping data for table `temi`
--

INSERT INTO `temi` (`id`, `descrizione`) VALUES
(447, 'Agenda digitale'),
(453, 'Ambiente e prevenzione dei rischi'),
(448, 'Attrazione culturale, naturale e turistica'),
(454, 'Energia e efficienza energetica'),
(451, 'Inclusione sociale'),
(450, 'Occupazione e mobilità dei lavoratori'),
(452, 'Ricerca e innovazione'),
(449, 'Rinnovamento urbano  e rurale'),
(446, 'why non funzioni');

-- --------------------------------------------------------

--
-- Table structure for table `territori`
--

CREATE TABLE IF NOT EXISTS `territori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descrizione` (`descrizione`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AUTO_INCREMENT=99007 ;

--
-- Dumping data for table `territori`
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
-- Constraints for dumped tables
--

--
-- Constraints for table `progetti`
--
ALTER TABLE `progetti`
  ADD CONSTRAINT `progetti_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `temi` (`id`),
  ADD CONSTRAINT `progetti_ibfk_2` FOREIGN KEY (`id_natura`) REFERENCES `natura` (`id`),
  ADD CONSTRAINT `progetti_ibfk_3` FOREIGN KEY (`id_stato`) REFERENCES `stato` (`id`);

--
-- Constraints for table `progetti_soggetti`
--
ALTER TABLE `progetti_soggetti`
  ADD CONSTRAINT `progetti_soggetti_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `progetti` (`id_progetto`) ON DELETE CASCADE,
  ADD CONSTRAINT `progetti_soggetti_ibfk_2` FOREIGN KEY (`id_soggetto`) REFERENCES `soggetti` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `progetti_territori`
--
ALTER TABLE `progetti_territori`
  ADD CONSTRAINT `progetti_territori_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `progetti` (`id_progetto`) ON DELETE CASCADE,
  ADD CONSTRAINT `progetti_territori_ibfk_2` FOREIGN KEY (`id_territorio`) REFERENCES `territori` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
