-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Dez 2014 um 12:33
-- Server Version: 5.6.20
-- PHP-Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `ese`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adapplication`
--

CREATE TABLE IF NOT EXISTS `adapplication` (
`id` bigint(20) NOT NULL,
  `message` text,
  `smoker` tinyint(1) NOT NULL,
  `timeLimitation` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ad_id` bigint(20) DEFAULT NULL,
  `applicant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Daten für Tabelle `adapplication`
--

INSERT INTO `adapplication` (`id`, `message`, `smoker`, `timeLimitation`, `title`, `ad_id`, `applicant_id`) VALUES
(1, 'Ich bin ein Mensch.', 0, '02/25/2015', NULL, 5, 1),
(2, 'Wann kann ich die Wohnung anschauen kommen?', 0, 'sobald wie möglich', NULL, 10, 2),
(3, 'Die Wohnung sieht super aus!', 0, '12/19/2014', NULL, 10, 3),
(4, 'Ich will einziehen!', 0, 'sobald wie möglich', NULL, 10, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `advertisement`
--

CREATE TABLE IF NOT EXISTS `advertisement` (
`id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `ageRange` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `description_ad` longtext,
  `description_room` longtext,
  `description_us` longtext,
  `furnished` tinyint(1) NOT NULL,
  `genderWeLookFor` varchar(255) DEFAULT NULL,
  `hasBalcony` tinyint(1) NOT NULL,
  `hasBuiltInCloset` tinyint(1) NOT NULL,
  `hasCables` tinyint(1) NOT NULL,
  `hasDishwasher` tinyint(1) NOT NULL,
  `hasLaundry` tinyint(1) NOT NULL,
  `hasPets` tinyint(1) NOT NULL,
  `isToBalcony` tinyint(1) NOT NULL,
  `kanton` varchar(255) DEFAULT NULL,
  `nmbrOfRoommates` int(11) NOT NULL,
  `plz` int(11) NOT NULL,
  `publicVisit` varchar(255) DEFAULT NULL,
  `roomPrice` int(11) NOT NULL,
  `roomSpace` float NOT NULL,
  `rooms` float NOT NULL,
  `smoker` varchar(255) DEFAULT NULL,
  `smokingInside` tinyint(1) NOT NULL,
  `start` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `until` varchar(255) DEFAULT NULL,
  `wgGender` varchar(255) DEFAULT NULL,
  `wgType` varchar(255) DEFAULT NULL,
  `whoWeAreLookingFor` longtext,
  `wlan` tinyint(1) NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `mainPic_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Daten für Tabelle `advertisement`
--

INSERT INTO `advertisement` (`id`, `address`, `ageRange`, `city`, `creationDate`, `description`, `description_ad`, `description_room`, `description_us`, `furnished`, `genderWeLookFor`, `hasBalcony`, `hasBuiltInCloset`, `hasCables`, `hasDishwasher`, `hasLaundry`, `hasPets`, `isToBalcony`, `kanton`, `nmbrOfRoommates`, `plz`, `publicVisit`, `roomPrice`, `roomSpace`, `rooms`, `smoker`, `smokingInside`, `start`, `title`, `until`, `wgGender`, `wgType`, `whoWeAreLookingFor`, `wlan`, `creator_id`, `mainPic_id`) VALUES
(1, 'Monbijoustrasse 71', '20-30', 'Bern', '2014-12-03 10:52:10', NULL, 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 0, 'male', 0, 1, 0, 1, 1, 0, 0, 'Bern', 2, 3007, 'Keiner', 600, 15, 4, 'dontcare', 0, '01/01/2015', '15m&sup2 Zimmer in einer 3er-WG in Bern für 600 CHF', '04/30/2015', 'male', 'calm', 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 1, 2, 1),
(2, 'Bizusstrasse 12', '', 'Zürich', '2014-12-03 10:55:31', NULL, 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 0, 'dontcare', 1, 0, 0, 1, 1, 0, 1, 'Zürich', 1, 8025, 'Keiner', 850, 18, 3, '', 1, 'Per sofort', '18m&sup2 Zimmer in einer 2er-WG in Zürich für 850 CHF', '', '', 'undef', 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 1, 2, 5),
(3, 'RueDüCroc', '27-28', 'Basel', '2014-12-03 11:10:44', NULL, 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 0, 'dontcare', 1, 1, 0, 0, 0, 0, 0, 'Basel-Stad', 3, 9001, '24/12/2014', 450, 14, 4, 'smoker', 1, '01/31/2015', '14m&sup2 Zimmer in einer 4er-WG in Basel für 450 CHF', '02/29/2016', 'mixed', 'wild', 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 1, 2, NULL),
(4, 'Murtenstrasse 99', '', 'Bern', '2014-12-03 11:14:47', NULL, 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 1, 'male', 1, 0, 1, 1, 1, 0, 1, 'Bern', 2, 3049, 'Keiner', 900, 20, 4, '', 0, '03/13/2015', '20m&sup2 Zimmer in einer 3er-WG in Bern für 900 CHF', '06/18/2015', 'female', 'calm', 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 1, 2, 9),
(5, 'ZüriStinktStrass 13', '', 'Zürich', '2014-12-03 11:20:26', NULL, 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 'Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext... Das ist ein Beispieltext...', 0, 'dontcare', 0, 0, 0, 0, 1, 1, 0, 'Zürich', 2, 5034, 'Keiner', 550, 10, 3, '', 0, '02/02/2015', '10m&sup2 Zimmer in einer 3er-WG in Zürich für 550 CHF', '', '', 'wild', '', 1, 2, NULL),
(6, 'Bahnhofstrasse 2', '', 'Basel', '2014-12-03 11:27:37', NULL, 'Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext...', 'Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext...', 'Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext...', 0, 'dontcare', 0, 0, 1, 1, 1, 0, 0, 'BaselStadt', 2, 6666, 'Keiner', 1000, 25, 5, '', 0, '12/19/2014', '25m&sup2 Zimmer in einer 3er-WG in Basel für 1000 CHF', '06/26/2015', 'mixed', 'undef', 'Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext...', 1, 2, 13),
(7, 'Kuederstrasse 44', '', 'Bern', '2014-12-03 11:29:36', NULL, 'Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext...', 'Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext...', 'Das ist ein Beispeltext... Das ist ein Beispeltext... Das ist ein Beispeltext...', 0, 'dontcare', 0, 0, 0, 0, 0, 0, 0, 'Bern', 1, 3006, 'Keiner', 700, 10, 2, '', 0, '12/11/2014', '10m&sup2 Zimmer in einer 2er-WG in Bern für 700 CHF', '', '', 'undef', 'Das ist ein Beispeltext... Das ist ein Beispeltext...', 0, 2, NULL),
(8, 'Limmatweg 2', '', 'Zürich', '2014-12-03 11:57:57', NULL, 'Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ...', 'Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ...', 'Das ist ein Beispieltext ... Das ist ein Beispieltext ...', 0, 'female', 1, 0, 0, 1, 0, 0, 0, 'Zürich', 2, 5000, 'Keiner', 430, 15, 3, '', 0, '03/19/2015', '15m&sup2 Zimmer in einer 3er-WG in Zürich für 430 CHF', '09/23/2015', 'female', 'undef', '', 1, 2, 17),
(9, 'Baselstrasse', '', 'Basel', '2014-12-03 11:59:19', NULL, 'Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ...', 'Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ...', 'Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ...', 0, 'dontcare', 0, 0, 0, 0, 0, 0, 0, 'BaselStadt', 3, 3409, 'Keiner', 678, 17, 5, 'smoker', 1, 'Per sofort', '17m&sup2 Zimmer in einer 4er-WG in Basel für 678 CHF', '', '', 'wild', 'Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ...', 0, 2, NULL),
(10, 'Bärengraben 4', '20-30', 'Bern', '2014-12-03 12:02:55', NULL, 'Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ...', 'Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ...', 'Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ...', 0, 'dontcare', 0, 1, 0, 1, 1, 0, 0, 'Bern', 1, 4340, 'Keiner', 505, 30, 3, 'nonsmoker', 0, '12/26/2014', '30m&sup2 Zimmer in einer 2er-WG in Bern für 505 CHF', '06/30/2015', 'male', 'calm', 'Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ... Das ist ein Beispieltext ...', 1, 1, 21),
(11, 'Hansweg', '', 'Bern', '2014-12-03 12:32:11', NULL, '', '', '', 0, 'dontcare', 0, 0, 0, 0, 0, 0, 0, 'Bern', 1, 3011, 'Keiner', 343, 12, 2, '', 0, 'Per sofort', '12m&sup2 Zimmer in einer 2er-WG in Bern für 343 CHF', '', '', 'calm', '', 1, 4, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `advertisement_picture`
--

CREATE TABLE IF NOT EXISTS `advertisement_picture` (
  `Advertisement_id` bigint(20) NOT NULL,
  `pictures_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `advertisement_picture`
--

INSERT INTO `advertisement_picture` (`Advertisement_id`, `pictures_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 6),
(2, 7),
(2, 8),
(4, 10),
(4, 11),
(4, 12),
(6, 14),
(6, 15),
(6, 16),
(8, 18),
(8, 19),
(8, 20),
(10, 22),
(10, 23),
(10, 24);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `appointment`
--

CREATE TABLE IF NOT EXISTS `appointment` (
`id` bigint(20) NOT NULL,
  `additionalInfosForTheVisitors` varchar(255) DEFAULT NULL,
  `blockLength` varchar(255) DEFAULT NULL,
  `ad_id` bigint(20) DEFAULT NULL,
  `appointmentDate_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `appointment`
--

INSERT INTO `appointment` (`id`, `additionalInfosForTheVisitors`, `blockLength`, `ad_id`, `appointmentDate_id`) VALUES
(1, 'Komm mit dem Bus es hat keinen Parkplatz', NULL, 5, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `appointmentdate`
--

CREATE TABLE IF NOT EXISTS `appointmentdate` (
`id` bigint(20) NOT NULL,
  `day` varchar(255) DEFAULT NULL,
  `endHour` varchar(255) DEFAULT NULL,
  `startHour` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `appointmentdate`
--

INSERT INTO `appointmentdate` (`id`, `day`, `endHour`, `startHour`) VALUES
(1, '04/12/2014', '13:57', '12:23');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `appointment_user`
--

CREATE TABLE IF NOT EXISTS `appointment_user` (
  `usersInvitations_id` bigint(20) NOT NULL,
  `invitations_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `appointment_user`
--

INSERT INTO `appointment_user` (`usersInvitations_id`, `invitations_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bookmark`
--

CREATE TABLE IF NOT EXISTS `bookmark` (
`id` bigint(20) NOT NULL,
  `ad_id` bigint(20) DEFAULT NULL,
  `bookmarker_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `bookmark`
--

INSERT INTO `bookmark` (`id`, `ad_id`, `bookmarker_id`) VALUES
(1, 5, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customfilterad`
--

CREATE TABLE IF NOT EXISTS `customfilterad` (
`id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `ageRange` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `description_ad` varchar(255) DEFAULT NULL,
  `description_room` varchar(255) DEFAULT NULL,
  `description_us` varchar(255) DEFAULT NULL,
  `furnished` tinyint(1) NOT NULL,
  `genderWeLookFor` varchar(255) DEFAULT NULL,
  `hasBalcony` tinyint(1) NOT NULL,
  `hasBuiltInCloset` tinyint(1) NOT NULL,
  `hasCables` tinyint(1) NOT NULL,
  `hasDishwasher` tinyint(1) NOT NULL,
  `hasLaundry` tinyint(1) NOT NULL,
  `hasPets` tinyint(1) NOT NULL,
  `isToBalcony` tinyint(1) NOT NULL,
  `kanton` varchar(255) DEFAULT NULL,
  `nmbrOfRoommates` int(11) NOT NULL,
  `plz` int(11) NOT NULL,
  `roomPrice` int(11) NOT NULL,
  `roomSpace` int(11) NOT NULL,
  `rooms` int(11) NOT NULL,
  `smoker` varchar(255) DEFAULT NULL,
  `smokingInside` tinyint(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `wgGender` varchar(255) DEFAULT NULL,
  `wgType` varchar(255) DEFAULT NULL,
  `whoWeAreLookingFor` varchar(255) DEFAULT NULL,
  `wlan` tinyint(1) NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `customfilterad`
--

INSERT INTO `customfilterad` (`id`, `address`, `ageRange`, `city`, `description`, `description_ad`, `description_room`, `description_us`, `furnished`, `genderWeLookFor`, `hasBalcony`, `hasBuiltInCloset`, `hasCables`, `hasDishwasher`, `hasLaundry`, `hasPets`, `isToBalcony`, `kanton`, `nmbrOfRoommates`, `plz`, `roomPrice`, `roomSpace`, `rooms`, `smoker`, `smokingInside`, `title`, `wgGender`, `wgType`, `whoWeAreLookingFor`, `wlan`, `creator_id`) VALUES
(1, NULL, NULL, 'Bern', NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, 'dontcare', 'calm', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `message`
--

CREATE TABLE IF NOT EXISTS `message` (
`id` bigint(20) NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `appointedAppointment` bigint(20) DEFAULT NULL,
  `messageText` longtext,
  `readMessage` tinyint(1) NOT NULL,
  `recipientDeleted` tinyint(1) NOT NULL,
  `rejected` tinyint(1) NOT NULL,
  `senderDeleted` tinyint(1) NOT NULL,
  `title` longtext,
  `appointmentInvitations_id` bigint(20) DEFAULT NULL,
  `notifications_id` bigint(20) DEFAULT NULL,
  `recipient_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Daten für Tabelle `message`
--

INSERT INTO `message` (`id`, `accepted`, `appointedAppointment`, `messageText`, `readMessage`, `recipientDeleted`, `rejected`, `senderDeleted`, `title`, `appointmentInvitations_id`, `notifications_id`, `recipient_id`, `sender_id`) VALUES
(1, 0, NULL, 'Ich habe eine Frage bezüglich des Ads <a href="adprofile?adId=5">10m&sup2 Zimmer in einer 3er-WG in Zürich für 550 CHF</a> :  <br>Hallo Ich habe eine Frage: Wie schnell ist euer internet?', 1, 0, 0, 0, 'Internet', NULL, NULL, 2, 1),
(2, 0, NULL, 'Es ist SUPER schnell!', 0, 0, 0, 0, 'AW: Internet', NULL, NULL, 1, 2),
(3, 0, NULL, 'Hey, Test1, du hast einen neuen Interessenten für dein Ad mit dem Titel 10m&sup2 Zimmer in einer 3er-WG in Zürich für 550 CHFclicke <a href="interessentDetails?applicationId=1">HIER </a> um die Bewerbung anzusehen.', 0, 0, 0, 0, 'Neuen Interessenten für, 10m&sup2 Zimmer in einer 3er-WG in Zürich für 550 CHF', NULL, 2, NULL, NULL),
(4, 0, 1, 'Hallo, du wurdest von Test1 User zur besichtigung des Ads: <a href="adprofile?adId=5">10m&sup2 Zimmer in einer 3er-WG in Zürich für 550 CHF</a> eingeladen<br> der Termin wäre am 04/12/2014 um 12:23 Einladungsnachricht des Zimmerbesitzers: <br> Komm mit dem Bus es hat keinen Parkplatz', 1, 0, 0, 0, 'Einladung zu einer Wohnungbesichtigung', 1, NULL, NULL, NULL),
(5, 0, NULL, 'Ich habe eine Frage bezüglich des Ads <a href="adprofile?adId=10">30m&sup2 Zimmer in einer 2er-WG in Bern für 505 CHF</a> :  <br>Habt ihr eine Mikrowelle?', 0, 0, 0, 0, 'Mikrowelle', NULL, NULL, 1, 2),
(6, 0, NULL, 'Hey, Software, du hast einen neuen Interessenten für dein Ad mit dem Titel 30m&sup2 Zimmer in einer 2er-WG in Bern für 505 CHFclicke <a href="interessentDetails?applicationId=2">HIER </a> um die Bewerbung anzusehen.', 0, 0, 0, 0, 'Neuen Interessenten für, 30m&sup2 Zimmer in einer 2er-WG in Bern für 505 CHF', NULL, 1, NULL, NULL),
(7, 0, NULL, 'Hey, Software, du hast einen neuen Interessenten für dein Ad mit dem Titel 30m&sup2 Zimmer in einer 2er-WG in Bern für 505 CHFclicke <a href="interessentDetails?applicationId=3">HIER </a> um die Bewerbung anzusehen.', 0, 0, 0, 0, 'Neuen Interessenten für, 30m&sup2 Zimmer in einer 2er-WG in Bern für 505 CHF', NULL, 1, NULL, NULL),
(8, 0, NULL, 'Hey, Software, du hast einen neuen Interessenten für dein Ad mit dem Titel 30m&sup2 Zimmer in einer 2er-WG in Bern für 505 CHFclicke <a href="interessentDetails?applicationId=4">HIER </a> um die Bewerbung anzusehen.', 0, 0, 0, 0, 'Neuen Interessenten für, 30m&sup2 Zimmer in einer 2er-WG in Bern für 505 CHF', NULL, 1, NULL, NULL),
(9, 0, NULL, 'A new ad has been put up http://localhost8080:Skeleton/adprofile?adId=11', 0, 0, 0, 0, 'Ein neues Ad das dich interssieren könnte wurde aufgeschaltet', NULL, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `note`
--

CREATE TABLE IF NOT EXISTS `note` (
`id` bigint(20) NOT NULL,
  `text` longtext,
  `applicant_id` bigint(20) DEFAULT NULL,
  `appointment_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `picture`
--

CREATE TABLE IF NOT EXISTS `picture` (
`id` bigint(20) NOT NULL,
  `absoluteFilePath` varchar(255) DEFAULT NULL,
  `isMainPic` tinyint(1) NOT NULL,
  `relativeFilePath` varchar(255) DEFAULT NULL,
  `ad_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Daten für Tabelle `picture`
--

INSERT INTO `picture` (`id`, `absoluteFilePath`, `isMainPic`, `relativeFilePath`, `ad_id`) VALUES
(1, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\600Monbijoustrasse 71Bernimg1-ad1.jpg', 1, '/img/adPictures/test1@user.ch/600Monbijoustrasse 71Bernimg1-ad1.jpg', NULL),
(2, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\600Monbijoustrasse 71Bernimg2-ad1.jpg', 0, '/img/adPictures/test1@user.ch/600Monbijoustrasse 71Bernimg2-ad1.jpg', NULL),
(3, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\600Monbijoustrasse 71Bernimg3-ad1.jpg', 0, '/img/adPictures/test1@user.ch/600Monbijoustrasse 71Bernimg3-ad1.jpg', NULL),
(4, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\600Monbijoustrasse 71Bernimg4-ad1.jpg', 0, '/img/adPictures/test1@user.ch/600Monbijoustrasse 71Bernimg4-ad1.jpg', NULL),
(5, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\850Bizusstrasse 12Zürichimg1Ad2.jpg', 1, '/img/adPictures/test1@user.ch/850Bizusstrasse 12Zürichimg1Ad2.jpg', NULL),
(6, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\850Bizusstrasse 12Zürichimg2Ad2.jpg', 0, '/img/adPictures/test1@user.ch/850Bizusstrasse 12Zürichimg2Ad2.jpg', NULL),
(7, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\850Bizusstrasse 12Zürichimg3Ad2.jpg', 0, '/img/adPictures/test1@user.ch/850Bizusstrasse 12Zürichimg3Ad2.jpg', NULL),
(8, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\850Bizusstrasse 12Zürichimg4Ad2.jpg', 0, '/img/adPictures/test1@user.ch/850Bizusstrasse 12Zürichimg4Ad2.jpg', NULL),
(9, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\900Murtenstrasse 99Bernimg2Ad3.jpg', 1, '/img/adPictures/test1@user.ch/900Murtenstrasse 99Bernimg2Ad3.jpg', NULL),
(10, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\900Murtenstrasse 99Bernimg1Ad3.jpg', 0, '/img/adPictures/test1@user.ch/900Murtenstrasse 99Bernimg1Ad3.jpg', NULL),
(11, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\900Murtenstrasse 99Bernimg3Ad3.jpg', 0, '/img/adPictures/test1@user.ch/900Murtenstrasse 99Bernimg3Ad3.jpg', NULL),
(12, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\900Murtenstrasse 99Bernimg4Ad3.jpg', 0, '/img/adPictures/test1@user.ch/900Murtenstrasse 99Bernimg4Ad3.jpg', NULL),
(13, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\1000Bahnhofstrasse 2Baselimg1Ad4.jpg', 1, '/img/adPictures/test1@user.ch/1000Bahnhofstrasse 2Baselimg1Ad4.jpg', NULL),
(14, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\1000Bahnhofstrasse 2Baselimg2Ad4.jpg', 0, '/img/adPictures/test1@user.ch/1000Bahnhofstrasse 2Baselimg2Ad4.jpg', NULL),
(15, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\1000Bahnhofstrasse 2Baselimg3Ad4.jpg', 0, '/img/adPictures/test1@user.ch/1000Bahnhofstrasse 2Baselimg3Ad4.jpg', NULL),
(16, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\1000Bahnhofstrasse 2Baselimg4Ad4.jpg', 0, '/img/adPictures/test1@user.ch/1000Bahnhofstrasse 2Baselimg4Ad4.jpg', NULL),
(17, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\430Limmatweg 2Zürichimg2Ad2.jpg', 1, '/img/adPictures/test1@user.ch/430Limmatweg 2Zürichimg2Ad2.jpg', NULL),
(18, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\430Limmatweg 2Zürichimg1Ad3.jpg', 0, '/img/adPictures/test1@user.ch/430Limmatweg 2Zürichimg1Ad3.jpg', NULL),
(19, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\430Limmatweg 2Zürichimg4Ad3.jpg', 0, '/img/adPictures/test1@user.ch/430Limmatweg 2Zürichimg4Ad3.jpg', NULL),
(20, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\430Limmatweg 2Zürichimg3Ad2.jpg', 0, '/img/adPictures/test1@user.ch/430Limmatweg 2Zürichimg3Ad2.jpg', NULL),
(21, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\ese@ese.ch\\505Bärengraben 4Bernimg2-ad1.jpg', 1, '/img/adPictures/ese@ese.ch/505Bärengraben 4Bernimg2-ad1.jpg', NULL),
(22, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\ese@ese.ch\\505Bärengraben 4Bernimg4-ad1.jpg', 0, '/img/adPictures/ese@ese.ch/505Bärengraben 4Bernimg4-ad1.jpg', NULL),
(23, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\ese@ese.ch\\505Bärengraben 4Bernimg3Ad4.jpg', 0, '/img/adPictures/ese@ese.ch/505Bärengraben 4Bernimg3Ad4.jpg', NULL),
(24, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\ese@ese.ch\\505Bärengraben 4Bernimg3-ad1.jpg', 0, '/img/adPictures/ese@ese.ch/505Bärengraben 4Bernimg3-ad1.jpg', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `roomie`
--

CREATE TABLE IF NOT EXISTS `roomie` (
`id` bigint(20) NOT NULL,
  `age` int(11) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `hasPets` tinyint(1) NOT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `personalityType` varchar(255) DEFAULT NULL,
  `smoker` int(11) NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `mainPic_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `roomie_picture`
--

CREATE TABLE IF NOT EXISTS `roomie_picture` (
  `Roomie_id` bigint(20) NOT NULL,
  `pictures_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` bigint(20) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `exampleAd_id` bigint(20) DEFAULT NULL,
  `roomie_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `EMAIL`, `enabled`, `firstName`, `lastName`, `password`, `exampleAd_id`, `roomie_id`) VALUES
(1, 'ese@ese.ch', 1, 'Software', 'Engineer', '$2a$10$3hxHCOtnObCTFCmdOapO4uYivMLAHxlsxeihc.uVePCCBFlgw0vyu', 1, NULL),
(2, 'test1@user.ch', 1, 'Test1', 'User', '$2a$10$Hx7C0lEUhcx6fJ5LgjlRJ.rDYG3YfEBgniCSr5ZFQ/BMRwU9yonSm', NULL, NULL),
(3, 'test2@user.ch', 1, 'Test2', 'User', '$2a$10$QzGZ3kJV5wM.pTlH/awPHuszeQh9oXmwJhYiAxA9l8A.EwXCMsk8G', NULL, NULL),
(4, 'test3@user.ch', 1, 'Test3', 'User', '$2a$10$V83Vn763woBCN4HiGu0BR.wRUww.ro/bi0xc7P1ym7JVRv/TDYj..', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
`id` bigint(20) NOT NULL,
  `role` varchar(45) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Daten für Tabelle `user_roles`
--

INSERT INTO `user_roles` (`id`, `role`, `user_id`) VALUES
(1, 'ROLE_USER', 1),
(2, 'ROLE_USER', 2),
(3, 'ROLE_USER', 3),
(4, 'ROLE_USER', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adapplication`
--
ALTER TABLE `adapplication`
 ADD PRIMARY KEY (`id`), ADD KEY `FK50B6ED0DC9D1A1B1` (`ad_id`), ADD KEY `FK50B6ED0D96C3EEAE` (`applicant_id`);

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
 ADD PRIMARY KEY (`id`), ADD KEY `FK27FD01E5B16E0544` (`creator_id`), ADD KEY `FK27FD01E57D0C6C9C` (`mainPic_id`);

--
-- Indexes for table `advertisement_picture`
--
ALTER TABLE `advertisement_picture`
 ADD PRIMARY KEY (`Advertisement_id`,`pictures_id`), ADD UNIQUE KEY `pictures_id` (`pictures_id`), ADD KEY `FK8DFBE884E4AEE018` (`pictures_id`), ADD KEY `FK8DFBE8847248788F` (`Advertisement_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
 ADD PRIMARY KEY (`id`), ADD KEY `FKB7F037FC9D1A1B1` (`ad_id`), ADD KEY `FKB7F037F1562CE6F` (`appointmentDate_id`);

--
-- Indexes for table `appointmentdate`
--
ALTER TABLE `appointmentdate`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment_user`
--
ALTER TABLE `appointment_user`
 ADD KEY `FK48856CAB8484CEB6` (`invitations_id`), ADD KEY `FK48856CAB3748315C` (`usersInvitations_id`);

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
 ADD PRIMARY KEY (`id`), ADD KEY `FK7B620956C9D1A1B1` (`ad_id`), ADD KEY `FK7B6209567598C9AD` (`bookmarker_id`);

--
-- Indexes for table `customfilterad`
--
ALTER TABLE `customfilterad`
 ADD PRIMARY KEY (`id`), ADD KEY `FKF135906CB16E0544` (`creator_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
 ADD PRIMARY KEY (`id`), ADD KEY `FK9C2397E7B1E5E815` (`appointmentInvitations_id`), ADD KEY `FK9C2397E7BF52E708` (`notifications_id`), ADD KEY `FK9C2397E7AA953037` (`recipient_id`), ADD KEY `FK9C2397E76122429B` (`sender_id`);

--
-- Indexes for table `note`
--
ALTER TABLE `note`
 ADD PRIMARY KEY (`id`), ADD KEY `FK25241296C3EEAE` (`applicant_id`), ADD KEY `FK2524122F7B938F` (`appointment_id`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
 ADD PRIMARY KEY (`id`), ADD KEY `FK40C8F4DEC9D1A1B1` (`ad_id`);

--
-- Indexes for table `roomie`
--
ALTER TABLE `roomie`
 ADD PRIMARY KEY (`id`), ADD KEY `FK923DAF57B16E0544` (`creator_id`), ADD KEY `FK923DAF577D0C6C9C` (`mainPic_id`);

--
-- Indexes for table `roomie_picture`
--
ALTER TABLE `roomie_picture`
 ADD PRIMARY KEY (`Roomie_id`,`pictures_id`), ADD UNIQUE KEY `pictures_id` (`pictures_id`), ADD KEY `FKFDB903F6E4AEE018` (`pictures_id`), ADD KEY `FKFDB903F629538B05` (`Roomie_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `EMAIL` (`EMAIL`), ADD UNIQUE KEY `EMAIL_2` (`EMAIL`), ADD KEY `FK285FEBD985F184` (`exampleAd_id`), ADD KEY `FK285FEB29538B05` (`roomie_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
 ADD PRIMARY KEY (`id`), ADD KEY `FK7342994956720145` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adapplication`
--
ALTER TABLE `adapplication`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `appointmentdate`
--
ALTER TABLE `appointmentdate`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bookmark`
--
ALTER TABLE `bookmark`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customfilterad`
--
ALTER TABLE `customfilterad`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `note`
--
ALTER TABLE `note`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `picture`
--
ALTER TABLE `picture`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `roomie`
--
ALTER TABLE `roomie`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `adapplication`
--
ALTER TABLE `adapplication`
ADD CONSTRAINT `FK50B6ED0D96C3EEAE` FOREIGN KEY (`applicant_id`) REFERENCES `user` (`id`),
ADD CONSTRAINT `FK50B6ED0DC9D1A1B1` FOREIGN KEY (`ad_id`) REFERENCES `advertisement` (`id`);

--
-- Constraints der Tabelle `advertisement`
--
ALTER TABLE `advertisement`
ADD CONSTRAINT `FK27FD01E57D0C6C9C` FOREIGN KEY (`mainPic_id`) REFERENCES `picture` (`id`),
ADD CONSTRAINT `FK27FD01E5B16E0544` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `advertisement_picture`
--
ALTER TABLE `advertisement_picture`
ADD CONSTRAINT `FK8DFBE8847248788F` FOREIGN KEY (`Advertisement_id`) REFERENCES `advertisement` (`id`),
ADD CONSTRAINT `FK8DFBE884E4AEE018` FOREIGN KEY (`pictures_id`) REFERENCES `picture` (`id`);

--
-- Constraints der Tabelle `appointment`
--
ALTER TABLE `appointment`
ADD CONSTRAINT `FKB7F037F1562CE6F` FOREIGN KEY (`appointmentDate_id`) REFERENCES `appointmentdate` (`id`),
ADD CONSTRAINT `FKB7F037FC9D1A1B1` FOREIGN KEY (`ad_id`) REFERENCES `advertisement` (`id`);

--
-- Constraints der Tabelle `appointment_user`
--
ALTER TABLE `appointment_user`
ADD CONSTRAINT `FK48856CAB3748315C` FOREIGN KEY (`usersInvitations_id`) REFERENCES `appointment` (`id`),
ADD CONSTRAINT `FK48856CAB8484CEB6` FOREIGN KEY (`invitations_id`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `bookmark`
--
ALTER TABLE `bookmark`
ADD CONSTRAINT `FK7B6209567598C9AD` FOREIGN KEY (`bookmarker_id`) REFERENCES `user` (`id`),
ADD CONSTRAINT `FK7B620956C9D1A1B1` FOREIGN KEY (`ad_id`) REFERENCES `advertisement` (`id`);

--
-- Constraints der Tabelle `customfilterad`
--
ALTER TABLE `customfilterad`
ADD CONSTRAINT `FKF135906CB16E0544` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `message`
--
ALTER TABLE `message`
ADD CONSTRAINT `FK9C2397E76122429B` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`),
ADD CONSTRAINT `FK9C2397E7AA953037` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`id`),
ADD CONSTRAINT `FK9C2397E7B1E5E815` FOREIGN KEY (`appointmentInvitations_id`) REFERENCES `user` (`id`),
ADD CONSTRAINT `FK9C2397E7BF52E708` FOREIGN KEY (`notifications_id`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `note`
--
ALTER TABLE `note`
ADD CONSTRAINT `FK2524122F7B938F` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`),
ADD CONSTRAINT `FK25241296C3EEAE` FOREIGN KEY (`applicant_id`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `picture`
--
ALTER TABLE `picture`
ADD CONSTRAINT `FK40C8F4DEC9D1A1B1` FOREIGN KEY (`ad_id`) REFERENCES `advertisement` (`id`);

--
-- Constraints der Tabelle `roomie`
--
ALTER TABLE `roomie`
ADD CONSTRAINT `FK923DAF577D0C6C9C` FOREIGN KEY (`mainPic_id`) REFERENCES `picture` (`id`),
ADD CONSTRAINT `FK923DAF57B16E0544` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `roomie_picture`
--
ALTER TABLE `roomie_picture`
ADD CONSTRAINT `FKFDB903F629538B05` FOREIGN KEY (`Roomie_id`) REFERENCES `roomie` (`id`),
ADD CONSTRAINT `FKFDB903F6E4AEE018` FOREIGN KEY (`pictures_id`) REFERENCES `picture` (`id`);

--
-- Constraints der Tabelle `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `FK285FEB29538B05` FOREIGN KEY (`roomie_id`) REFERENCES `roomie` (`id`),
ADD CONSTRAINT `FK285FEBD985F184` FOREIGN KEY (`exampleAd_id`) REFERENCES `customfilterad` (`id`);

--
-- Constraints der Tabelle `user_roles`
--
ALTER TABLE `user_roles`
ADD CONSTRAINT `FK7342994956720145` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
