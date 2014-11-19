-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Nov 2014 um 11:25
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `adapplication`
--

INSERT INTO `adapplication` (`id`, `message`, `smoker`, `timeLimitation`, `title`, `ad_id`, `applicant_id`) VALUES
(1, 'Hallo\r\nIch habe interesse an dem Zimmer. Wann kann ich es besichtigen.', 0, '', 'Anschauen', 1, 1),
(2, 'Hallo\r\nIch will das Zimmer besichtigen.', 0, '', 'Anschauen', 6, 3);

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
  `roomPrice` int(11) NOT NULL,
  `roomSpace` int(11) NOT NULL,
  `rooms` int(11) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Daten für Tabelle `advertisement`
--

INSERT INTO `advertisement` (`id`, `address`, `ageRange`, `city`, `creationDate`, `description`, `description_ad`, `description_room`, `description_us`, `furnished`, `genderWeLookFor`, `hasBalcony`, `hasBuiltInCloset`, `hasCables`, `hasDishwasher`, `hasLaundry`, `hasPets`, `isToBalcony`, `kanton`, `nmbrOfRoommates`, `plz`, `roomPrice`, `roomSpace`, `rooms`, `smoker`, `smokingInside`, `start`, `title`, `until`, `wgGender`, `wgType`, `whoWeAreLookingFor`, `wlan`, `creator_id`, `mainPic_id`) VALUES
(1, 'Monbijoustrasse 71', '20-30', 'Bern', '2014-11-12 10:20:42', NULL, 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 0, 'dontcare', 1, 1, 0, 0, 1, 0, 0, 'Bern', 2, 3007, 430, 18, 4, 'dontcare', 0, '11/20/2014', '18m&sup2 Zimmer in einer 3er-WG in Bern für 430 CHF', '04/23/2015', 'mixed', 'calm', 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 1, 2, 1),
(2, 'Murtenstrasse 24', '25-35', 'Muehleberg', '2014-11-12 10:27:46', NULL, 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 0, 'male', 1, 0, 1, 1, 0, 0, 1, 'Bern', 1, 3203, 500, 20, 3, 'smoker', 1, '01/01/2015', '20m&sup2 Zimmer in einer 2er-WG in Muehleberg für 500 CHF', '09/17/2015', 'male', 'undef', 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 0, 2, 5),
(3, 'Oberburgstrasse 13', '', 'Burgdorf', '2014-11-12 10:35:18', NULL, 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 'Das ist ein Beispiel-Tet... Das ist ein Beispiel-Tet... Das ist ein Beispiel-Tet... Das ist ein Beispiel-Tet... Das ist ein Beispiel-Tet... Das ist ein Beispiel-Tet... Das ist ein Beispiel-Tet... Das ist ein Beispiel-Tet... Das ist ein Beispiel-Tet... ', 'Das ist ein Beispiel-Tet... Das ist ein Beispiel-Tet... ', 1, 'female', 0, 0, 0, 0, 0, 0, 0, 'Bern', 4, 3400, 300, 12, 5, 'dontcare', 0, '12/24/2014', '12m&sup2 Zimmer in einer 5er-WG in Burgdorf für 300 CHF', '02/20/2015', 'female', 'wild', 'Das ist ein Beispiel-Tet... ', 0, 2, NULL),
(4, 'Bahnhofmatte 2', '', 'Rubigen', '2014-11-12 10:38:02', NULL, '', '', '', 0, 'dontcare', 0, 0, 0, 0, 0, 0, 0, 'Bern', 2, 3113, 850, 18, 4, 'dontcare', 0, '06/12/2015', '18m&sup2 Zimmer in einer 3er-WG in Rubigen für 850 CHF', '01/21/2016', 'mixed', 'undef', '', 0, 2, NULL),
(5, 'Bahnhofmatte 3', '', 'Rubigen', '2014-11-12 10:43:29', NULL, 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 0, 'dontcare', 1, 0, 1, 1, 1, 0, 1, 'Bern', 2, 3113, 730, 25, 3, 'nonsmoker', 0, '01/16/2015', '25m&sup2 Zimmer in einer 3er-WG in Rubigen für 730 CHF', '11/13/2022', 'mixed', 'calm', 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 1, 2, 9),
(6, 'Junkerngasse 16', '20-30', 'Bern', '2014-11-12 10:50:44', NULL, 'Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... ', 'Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... ', 'Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... ', 0, 'male', 0, 1, 0, 1, 0, 0, 0, 'Bern', 1, 3011, 900, 19, 2, 'nonsmoker', 0, '11/16/2014', '19m&sup2 Zimmer in einer 2er-WG in Bern für 900 CHF', '01/08/2019', 'male', 'undef', 'Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... Dies ist ein Beispiel-Text... ', 1, 1, 13),
(7, 'Muggerstrasse 3', '', 'Bern', '2014-11-12 11:11:51', NULL, 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 1, 'male', 0, 1, 0, 1, 0, 0, 0, 'Bern', 2, 3006, 550, 15, 3, 'smoker', 0, '04/23/2015', '15m&sup2 Zimmer in einer 3er-WG in Bern für 550 CHF', '01/21/2016', 'male', 'undef', 'Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... Das ist ein Beispiel-Text... ', 0, 4, NULL);

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
(5, 10),
(5, 11),
(5, 12),
(6, 14),
(6, 15),
(6, 16);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `appointment`
--

CREATE TABLE IF NOT EXISTS `appointment` (
`id` bigint(20) NOT NULL,
  `additionalInfosForTheVisitors` varchar(255) DEFAULT NULL,
  `blockLength` varchar(255) DEFAULT NULL,
  `ad_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `appointment`
--

INSERT INTO `appointment` (`id`, `additionalInfosForTheVisitors`, `blockLength`, `ad_id`) VALUES
(1, 'Liebe Interessierte:\r\nIch lade euch zur Besichtigung des Zimmers ein.\r\n\r\nMit freundlichen Gruessen.\r\nTest1', NULL, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `appointmentdate`
--

CREATE TABLE IF NOT EXISTS `appointmentdate` (
`id` bigint(20) NOT NULL,
  `day` datetime DEFAULT NULL,
  `endHour` varchar(255) DEFAULT NULL,
  `startHour` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `appointmentdate`
--

INSERT INTO `appointmentdate` (`id`, `day`, `endHour`, `startHour`) VALUES
(1, '2014-11-21 00:00:00', '13:00', '11:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `appointment_appointmentdate`
--

CREATE TABLE IF NOT EXISTS `appointment_appointmentdate` (
  `Appointment_id` bigint(20) NOT NULL,
  `appointmentDate_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `appointment_appointmentdate`
--

INSERT INTO `appointment_appointmentdate` (`Appointment_id`, `appointmentDate_id`) VALUES
(1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `customfilterad`
--

INSERT INTO `customfilterad` (`id`, `address`, `ageRange`, `city`, `description`, `description_ad`, `description_room`, `description_us`, `furnished`, `genderWeLookFor`, `hasBalcony`, `hasBuiltInCloset`, `hasCables`, `hasDishwasher`, `hasLaundry`, `hasPets`, `isToBalcony`, `kanton`, `nmbrOfRoommates`, `plz`, `roomPrice`, `roomSpace`, `rooms`, `smoker`, `smokingInside`, `title`, `wgGender`, `wgType`, `whoWeAreLookingFor`, `wlan`, `creator_id`) VALUES
(1, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 0, 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, 'dontcare', 'undef', NULL, 0, NULL),
(2, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 0, 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, 'dontcare', 'undef', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `message`
--

CREATE TABLE IF NOT EXISTS `message` (
`id` bigint(20) NOT NULL,
  `appointedAd` bigint(20) DEFAULT NULL,
  `messageText` longtext,
  `recipientDeleted` tinyint(1) NOT NULL,
  `senderDeleted` tinyint(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `appointmentInvitations_id` bigint(20) DEFAULT NULL,
  `notifications_id` bigint(20) DEFAULT NULL,
  `recipient_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Daten für Tabelle `message`
--

INSERT INTO `message` (`id`, `appointedAd`, `messageText`, `recipientDeleted`, `senderDeleted`, `title`, `appointmentInvitations_id`, `notifications_id`, `recipient_id`, `sender_id`) VALUES
(2, NULL, 'Ich habe eine Frage:\r\nGibt es auch eine Mikrowelle?', 0, 0, 'Mikrowelle', NULL, NULL, 2, 1),
(3, NULL, 'Ja wir haben eine Mikrowelle.', 0, 0, 'Aw:Mikr...', NULL, NULL, 1, 2),
(4, NULL, 'Hey, Test1, du hast einen neuen Interessenten für dein Ad mit dem Titel 18m&sup2 Zimmer in einer 3er-WG in Bern für 430 CHFclicke <a href="interessentDetails?applicationId=1">HIER </a> um die Bewerbung anzusehen.', 0, 0, 'Neuen Interessenten für, 18m&sup2 Zimmer in einer 3er-WG in Bern für 430 CHF', NULL, 2, NULL, NULL),
(5, 1, 'Hallo, du wurdest von Test1 User zur besichtigung eingeladen\n der Termin wäre amFri Nov 21 00:00:00 CET 2014 um11:00clicke auf den Knopf am ende dieser Nachricht um auszuwählen ob es dir passt oder nicht', 0, 0, 'Einladung zu einer Wohnungbesichtigung', 1, NULL, NULL, 2),
(6, NULL, 'Wie schnell ist euer wlan?', 0, 0, 'Wlan', NULL, NULL, 1, 3),
(7, NULL, 'Hey, Hans, du hast einen neuen Interessenten für dein Ad mit dem Titel 19m&sup2 Zimmer in einer 2er-WG in Bern für 900 CHFclicke <a href="interessentDetails?applicationId=2">HIER </a> um die Bewerbung anzusehen.', 0, 0, 'Neuen Interessenten für, 19m&sup2 Zimmer in einer 2er-WG in Bern für 900 CHF', NULL, 1, NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Daten für Tabelle `picture`
--

INSERT INTO `picture` (`id`, `absoluteFilePath`, `isMainPic`, `relativeFilePath`, `ad_id`) VALUES
(1, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\430Monbijoustrasse 71Bernimg1-ad1.jpg', 1, '/img/adPictures/test1@user.ch/430Monbijoustrasse 71Bernimg1-ad1.jpg', NULL),
(2, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\430Monbijoustrasse 71Bernimg2-ad1.jpg', 0, '/img/adPictures/test1@user.ch/430Monbijoustrasse 71Bernimg2-ad1.jpg', NULL),
(3, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\430Monbijoustrasse 71Bernimg3-ad1.jpg', 0, '/img/adPictures/test1@user.ch/430Monbijoustrasse 71Bernimg3-ad1.jpg', NULL),
(4, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\430Monbijoustrasse 71Bernimg4-ad1.jpg', 0, '/img/adPictures/test1@user.ch/430Monbijoustrasse 71Bernimg4-ad1.jpg', NULL),
(5, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\500Murtenstrasse 24MÃ¼hlebergimg1Ad2.jpg', 1, '/img/adPictures/test1@user.ch/500Murtenstrasse 24MÃ¼hlebergimg1Ad2.jpg', NULL),
(6, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\500Murtenstrasse 24MÃ¼hlebergimg2Ad2.jpg', 0, '/img/adPictures/test1@user.ch/500Murtenstrasse 24MÃ¼hlebergimg2Ad2.jpg', NULL),
(7, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\500Murtenstrasse 24MÃ¼hlebergimg3Ad2.jpg', 0, '/img/adPictures/test1@user.ch/500Murtenstrasse 24MÃ¼hlebergimg3Ad2.jpg', NULL),
(8, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\500Murtenstrasse 24MÃ¼hlebergimg4Ad2.jpg', 0, '/img/adPictures/test1@user.ch/500Murtenstrasse 24MÃ¼hlebergimg4Ad2.jpg', NULL),
(9, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\730Bahnhofmatte 3Rubigenimg2Ad3.jpg', 1, '/img/adPictures/test1@user.ch/730Bahnhofmatte 3Rubigenimg2Ad3.jpg', NULL),
(10, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\730Bahnhofmatte 3Rubigenimg1Ad3.jpg', 0, '/img/adPictures/test1@user.ch/730Bahnhofmatte 3Rubigenimg1Ad3.jpg', NULL),
(11, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\730Bahnhofmatte 3Rubigenimg3Ad3.jpg', 0, '/img/adPictures/test1@user.ch/730Bahnhofmatte 3Rubigenimg3Ad3.jpg', NULL),
(12, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\test1@user.ch\\730Bahnhofmatte 3Rubigenimg4Ad3.jpg', 0, '/img/adPictures/test1@user.ch/730Bahnhofmatte 3Rubigenimg4Ad3.jpg', NULL),
(13, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\ese@ese.ch\\900Junkerngasse 16Bernimg1Ad4.jpg', 1, '/img/adPictures/ese@ese.ch/900Junkerngasse 16Bernimg1Ad4.jpg', NULL),
(14, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\ese@ese.ch\\900Junkerngasse 16Bernimg2Ad4.jpg', 0, '/img/adPictures/ese@ese.ch/900Junkerngasse 16Bernimg2Ad4.jpg', NULL),
(15, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\ese@ese.ch\\900Junkerngasse 16Bernimg3Ad4.jpg', 0, '/img/adPictures/ese@ese.ch/900Junkerngasse 16Bernimg3Ad4.jpg', NULL),
(16, 'C:\\Users\\Carl\\Documents\\Eclipse\\git\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\ese@ese.ch\\900Junkerngasse 16Bernimg4Ad4.jpg', 0, '/img/adPictures/ese@ese.ch/900Junkerngasse 16Bernimg4Ad4.jpg', NULL);

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
(1, 'ese@ese.ch', 1, 'Hans', 'Hubert', '$2a$10$cLFXbvlrMbnlOjH1r9SZo.dUTMULNYQSvmlaZ3TyejBovkyNz80Ta', 2, NULL),
(2, 'test1@user.ch', 1, 'Test1', 'User', '$2a$10$doMQenI9j8jiTlUmw3Sk0uPp3KqdP7yiWt8flfFLjRF.XlwrhvtOS', NULL, NULL),
(3, 'test2@user.ch', 1, 'Test2', 'User', '$2a$10$jfLLy72uB0.G632EY7SIweGJMjcbm9diQCM6fJALOVmYUUxJh/j.S', NULL, NULL),
(4, 'test3@user.ch', 1, 'Test3', 'User', '$2a$10$XRKxlvzggLW9cf8/UrFVY.4kaNSClgpXNBwC8TLrTsrWy9uEbFSoa', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_advertisement`
--

CREATE TABLE IF NOT EXISTS `user_advertisement` (
  `User_id` bigint(20) NOT NULL,
  `advertisements_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `user_advertisement`
--

INSERT INTO `user_advertisement` (`User_id`, `advertisements_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(1, 6),
(4, 7);

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
 ADD PRIMARY KEY (`id`), ADD KEY `FKB7F037FC9D1A1B1` (`ad_id`);

--
-- Indexes for table `appointmentdate`
--
ALTER TABLE `appointmentdate`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment_appointmentdate`
--
ALTER TABLE `appointment_appointmentdate`
 ADD UNIQUE KEY `appointmentDate_id` (`appointmentDate_id`), ADD KEY `FK49E30B0D1562CE6F` (`appointmentDate_id`), ADD KEY `FK49E30B0D2F7B938F` (`Appointment_id`);

--
-- Indexes for table `appointment_user`
--
ALTER TABLE `appointment_user`
 ADD KEY `FK48856CAB8484CEB6` (`invitations_id`), ADD KEY `FK48856CAB3748315C` (`usersInvitations_id`);

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
-- Indexes for table `user_advertisement`
--
ALTER TABLE `user_advertisement`
 ADD PRIMARY KEY (`User_id`,`advertisements_id`), ADD UNIQUE KEY `advertisements_id` (`advertisements_id`), ADD KEY `FK7C4B7C91D5ECD2E6` (`advertisements_id`), ADD KEY `FK7C4B7C9156720145` (`User_id`);

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
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
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
-- AUTO_INCREMENT for table `customfilterad`
--
ALTER TABLE `customfilterad`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `picture`
--
ALTER TABLE `picture`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
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
ADD CONSTRAINT `FKB7F037FC9D1A1B1` FOREIGN KEY (`ad_id`) REFERENCES `advertisement` (`id`);

--
-- Constraints der Tabelle `appointment_appointmentdate`
--
ALTER TABLE `appointment_appointmentdate`
ADD CONSTRAINT `FK49E30B0D1562CE6F` FOREIGN KEY (`appointmentDate_id`) REFERENCES `appointmentdate` (`id`),
ADD CONSTRAINT `FK49E30B0D2F7B938F` FOREIGN KEY (`Appointment_id`) REFERENCES `appointment` (`id`);

--
-- Constraints der Tabelle `appointment_user`
--
ALTER TABLE `appointment_user`
ADD CONSTRAINT `FK48856CAB3748315C` FOREIGN KEY (`usersInvitations_id`) REFERENCES `appointment` (`id`),
ADD CONSTRAINT `FK48856CAB8484CEB6` FOREIGN KEY (`invitations_id`) REFERENCES `user` (`id`);

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
-- Constraints der Tabelle `user_advertisement`
--
ALTER TABLE `user_advertisement`
ADD CONSTRAINT `FK7C4B7C9156720145` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`),
ADD CONSTRAINT `FK7C4B7C91D5ECD2E6` FOREIGN KEY (`advertisements_id`) REFERENCES `advertisement` (`id`);

--
-- Constraints der Tabelle `user_roles`
--
ALTER TABLE `user_roles`
ADD CONSTRAINT `FK7342994956720145` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
