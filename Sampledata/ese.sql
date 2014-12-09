-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 09. Dez 2014 um 13:51
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
  `favored` tinyint(1) NOT NULL,
  `message` text,
  `smoker` tinyint(1) NOT NULL,
  `timeLimitation` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ad_id` bigint(20) DEFAULT NULL,
  `applicant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Daten für Tabelle `adapplication`
--

INSERT INTO `adapplication` (`id`, `favored`, `message`, `smoker`, `timeLimitation`, `title`, `ad_id`, `applicant_id`) VALUES
(2, 1, 'Hey, coole Wohnung. Hat es noch Platz?', 0, 'sobald wie möglich', NULL, 3, 6),
(3, 0, 'Dein Schloss gefällt! Ich bin ehemaliger Investor und schwimme im Geld!', 0, 'sobald wie möglich', NULL, 5, 1),
(4, 1, 'Coole Abstellkammer, kann ich einziehen? Bin eine 18 Jährige Studentin.', 0, 'sobald wie möglich', NULL, 2, 2),
(6, 0, 'I like!', 0, 'sobald wie möglich', NULL, 3, 3),
(7, 0, 'I like!', 0, 'sobald wie möglich', NULL, 5, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Daten für Tabelle `advertisement`
--

INSERT INTO `advertisement` (`id`, `address`, `ageRange`, `city`, `creationDate`, `description`, `description_ad`, `description_room`, `description_us`, `furnished`, `genderWeLookFor`, `hasBalcony`, `hasBuiltInCloset`, `hasCables`, `hasDishwasher`, `hasLaundry`, `hasPets`, `isToBalcony`, `kanton`, `nmbrOfRoommates`, `plz`, `publicVisit`, `roomPrice`, `roomSpace`, `rooms`, `smoker`, `smokingInside`, `start`, `title`, `until`, `wgGender`, `wgType`, `whoWeAreLookingFor`, `wlan`, `creator_id`, `mainPic_id`) VALUES
(2, 'Kramgasse 20', '18-23', 'Bern', '2014-12-05 11:27:30', NULL, 'Es ist eine 1.5 Zimmer Wohnung mit einer Abstellkammer. Du lebst in der Abstellkammer.', 'Das Zimmer ist eine kleine Abstellkammer für Menschen die keine hohen Ansprüche haben.', 'Ich bin ein 50 Jähriger berufstätiger Mann.', 1, 'female', 0, 0, 0, 0, 0, 1, 0, 'Bern', 1, 3000, '13.01.2015', 200, 8, 1.5, 'dontcare', 0, 'Per sofort', '8.0m&sup2 Zimmer in einer 11er-WG in Bern für 200 CHF', 'Unbefristet', 'male', 'wild', 'Eine unkomplizierte junge Frau, die gerne in einer Abstellkammer lebt.', 1, 1, 5),
(3, 'gurzelngasse 5', '', 'Solothurn', '2014-12-05 11:29:19', NULL, '', '', '', 0, 'dontcare', 1, 1, 1, 1, 1, 0, 0, 'Solothurn', 2, 4500, 'Keiner', 600, 15, 4, '', 0, 'Per sofort', '15m&sup2 Zimmer in einer 3er-WG in Solothurn für 600 CHF', '', '', 'undef', '', 1, 2, 7),
(4, 'Bahnhofstrasse 3', '', 'Zürich', '2014-12-05 11:30:27', NULL, '', '', '', 0, 'dontcare', 0, 0, 0, 0, 0, 0, 0, 'Zürich', 1, 8000, 'Keiner', 800, 17, 2.5, '', 0, 'Per sofort', '17m&sup2 Zimmer in einer 2er-WG in Zürich für 800 CHF', '', '', 'undef', '', 0, 3, NULL),
(5, 'Im Rötel 3', '', 'Zug', '2014-12-05 11:38:21', NULL, 'Geräumiges Schloss mit allem was das Herz begehrt', 'Das Zimmer ist riesig, hat einen Balkon und sogar einen Kamin.', 'Ein Adelsgeschlecht aus Zug.', 0, 'dontcare', 1, 1, 1, 1, 1, 1, 1, 'Zug', 4, 6300, 'Keiner', 9000, 35, 21, 'dontcare', 1, 'Per sofort', '35m&sup2 Zimmer in einer 5er-WG in Zug für 9000 CHF', '', 'mixed', 'undef', 'Einen wohlhabenden Mitbewohner.', 1, 4, 11),
(6, 'Murtenstrasse 13', '', 'Bern', '2014-12-05 11:39:44', NULL, '', '', '', 1, 'dontcare', 0, 0, 0, 0, 0, 0, 0, 'Bern', 2, 3000, 'Keiner', 800, 14, 3.5, '', 0, '02/01/2015', '14m&sup2 Zimmer in einer 3er-WG in Bern für 800 CHF', '', '', 'calm', '', 0, 5, 14),
(7, 'Kramgasse 1', '', 'Bern', '2014-12-07 13:43:51', NULL, 'Geräumige wg. Zimmer wird über Semesterferien vermietet.', 'Normales Zimmer', '', 0, 'dontcare', 0, 0, 1, 1, 1, 0, 0, 'Bern', 2, 3000, 'Keiner', 350, 15, 3, '', 1, '01/01/2015', '15m&sup2 Zimmer in einer 3er-WG in Bern für 350 CHF', '02/01/2015', '', 'calm', '', 1, 1, 18),
(8, 'Marktgasse 12', '', 'Bern', '2014-12-07 13:51:00', NULL, '', '', '', 0, 'dontcare', 0, 0, 0, 0, 0, 0, 0, 'Bern', 3, 3001, 'Keiner', 650, 17, 5.5, '', 0, 'Per sofort', '17m&sup2 Zimmer in einer 4er-WG in Bern für 650 CHF', '', '', 'undef', '', 0, 3, 22),
(9, 'Bahnhofstrasse 3', '18-29', 'Zürich', '2014-12-07 14:04:05', NULL, 'Kleine aber feine Wohnung im Herzen von Zürich. Wir haben eine kleine Küche. In der Nähe findest du alle möglichen Geschäfte und du bist innerhalb von einer Minute an einer Tram Haltestelle. Die ideale Wohnung für Jedermann.', 'Das Zimmer ist klein aber fein. Es hat einen Parkettboden und alle Kabelanschlüsse ( Internet, tv etc.) Es ist weiter gegen den Innenhof gerichtet und daher sehr ruhig.', 'Wir sind ein Informatik Student, 23 und eine berufstätige Kindergärtnerin 25. Wir sind beide aufgestellt und immer für einen Spass zu haben.', 0, 'dontcare', 1, 0, 1, 1, 1, 0, 0, 'Zürich', 2, 8000, 'Keiner', 823, 15, 4, 'dontcare', 0, 'Per sofort', '15m&sup2 Zimmer in einer 3er-WG in Zürich für 823 CHF', '', 'mixed', 'undef', 'Dich, freundlich, umgänglich und aufgestellt.', 1, 7, 26);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `advertisement_appointments`
--

CREATE TABLE IF NOT EXISTS `advertisement_appointments` (
  `Advertisement_id` bigint(20) NOT NULL,
  `appointments` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `advertisement_appointments`
--

INSERT INTO `advertisement_appointments` (`Advertisement_id`, `appointments`) VALUES
(3, 1),
(5, 2),
(2, 3),
(9, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `advertisement_bookmarks`
--

CREATE TABLE IF NOT EXISTS `advertisement_bookmarks` (
  `Advertisement_id` bigint(20) NOT NULL,
  `bookmarks` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(2, 6),
(3, 8),
(3, 9),
(3, 10),
(5, 12),
(5, 13),
(6, 15),
(6, 16),
(6, 17),
(7, 19),
(7, 20),
(7, 21),
(8, 23),
(8, 24),
(8, 25),
(9, 27),
(9, 28),
(9, 29);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `appointment`
--

CREATE TABLE IF NOT EXISTS `appointment` (
`id` bigint(20) NOT NULL,
  `ad` bigint(20) DEFAULT NULL,
  `additionalInfosForTheVisitors` varchar(255) DEFAULT NULL,
  `blockLength` varchar(255) DEFAULT NULL,
  `appointmentDate_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `appointment`
--

INSERT INTO `appointment` (`id`, `ad`, `additionalInfosForTheVisitors`, `blockLength`, `appointmentDate_id`) VALUES
(1, 3, 'Komm mit dem Zug, hat keine Parkplätze', NULL, 1),
(2, 5, 'Okay, es wird etwas zu Essen geben. Bring Wein!', NULL, 2),
(3, 2, 'Hallo, kannst du um diese Zeit kommen?', NULL, 3),
(8, 9, 'Hey, please come with the Train. There are no parking slots!', NULL, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `appointmentaccepted`
--

CREATE TABLE IF NOT EXISTS `appointmentaccepted` (
`id` bigint(20) NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `rejected` tinyint(1) NOT NULL,
  `appointment_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `appointmentdate`
--

CREATE TABLE IF NOT EXISTS `appointmentdate` (
`id` bigint(20) NOT NULL,
  `day` varchar(255) DEFAULT NULL,
  `endHour` varchar(255) DEFAULT NULL,
  `startHour` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `appointmentdate`
--

INSERT INTO `appointmentdate` (`id`, `day`, `endHour`, `startHour`) VALUES
(1, '05/12/2014', '', '11:50'),
(2, '26/12/2014', '22:52', '11:52'),
(3, '07/12/2014', '', '12:43'),
(8, '31/12/2014', '', '10:55');

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
(1, 6),
(2, 1),
(2, 3),
(3, 2),
(8, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bookmark`
--

CREATE TABLE IF NOT EXISTS `bookmark` (
`id` bigint(20) NOT NULL,
  `ad` bigint(20) DEFAULT NULL,
  `bookmarker_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Daten für Tabelle `bookmark`
--

INSERT INTO `bookmark` (`id`, `ad`, `bookmarker_id`) VALUES
(1, 1, 6),
(2, 3, 6),
(4, 5, 1),
(5, 1, 3),
(6, 3, 3),
(7, 5, 3),
(8, 6, 3),
(11, 8, 8),
(12, 9, 11);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Daten für Tabelle `message`
--

INSERT INTO `message` (`id`, `accepted`, `appointedAppointment`, `messageText`, `readMessage`, `recipientDeleted`, `rejected`, `senderDeleted`, `title`, `appointmentInvitations_id`, `notifications_id`, `recipient_id`, `sender_id`) VALUES
(1, 0, NULL, 'Hey, MrA, du hast einen neuen Interessenten für dein Ad mit dem Titel 17m&sup2 Zimmer in einer 3er-WG in Chur für 400 CHFclicke <a href="interessentDetails?applicationId=1">HIER </a> um die Bewerbung anzusehen.', 0, 0, 0, 0, 'Neuen Interessenten für, 17m&sup2 Zimmer in einer 3er-WG in Chur für 400 CHF', NULL, 1, NULL, NULL),
(2, 0, NULL, 'Hey, MrB, du hast einen neuen Interessenten für dein Ad mit dem Titel 15m&sup2 Zimmer in einer 3er-WG in Solothurn für 600 CHFclicke <a href="interessentDetails?applicationId=2">HIER </a> um die Bewerbung anzusehen.', 0, 0, 0, 0, 'Neuen Interessenten für, 15m&sup2 Zimmer in einer 3er-WG in Solothurn für 600 CHF', NULL, 2, NULL, NULL),
(3, 0, NULL, 'Ich habe eine Frage bezüglich des Ads <a href="adprofile?adId=3">15m&sup2 Zimmer in einer 3er-WG in Solothurn für 600 CHF</a> :  <br>Hey, hat es einen Parkplatz?', 0, 0, 0, 0, 'Parkplatz', NULL, NULL, 2, 6),
(4, 0, NULL, 'Hey, MrD, du hast einen neuen Interessenten für dein Ad mit dem Titel 35m&sup2 Zimmer in einer 5er-WG in Zug für 9000 CHFclicke <a href="interessentDetails?applicationId=3">HIER </a> um die Bewerbung anzusehen.', 0, 0, 0, 0, 'Neuen Interessenten für, 35m&sup2 Zimmer in einer 5er-WG in Zug für 9000 CHF', NULL, 4, NULL, NULL),
(5, 0, NULL, 'Hey, MrA, du hast einen neuen Interessenten für dein Ad mit dem Titel 8m&sup2 Zimmer in einer 2er-WG in Bern für 200 CHFclicke <a href="interessentDetails?applicationId=4">HIER </a> um die Bewerbung anzusehen.', 0, 0, 0, 0, 'Neuen Interessenten für, 8m&sup2 Zimmer in einer 2er-WG in Bern für 200 CHF', NULL, 1, NULL, NULL),
(6, 0, NULL, 'Ich habe eine Frage bezüglich des Ads <a href="adprofile?adId=2">8m&sup2 Zimmer in einer 2er-WG in Bern für 200 CHF</a> :  <br>Hat es eine Badewanne? Ich bade gerne!', 0, 0, 0, 0, 'Badewanne', NULL, NULL, 1, 2),
(7, 1, 1, 'Hallo, du wurdest von MrB MrB zur besichtigung des Ads: <a href="adprofile?adId=3">15m&sup2 Zimmer in einer 3er-WG in Solothurn für 600 CHF</a> eingeladen<br> der Termin wäre am 05/12/2014 um 11:50 Einladungsnachricht des Zimmerbesitzers: <br> Komm mit dem Zug, hat keine Parkplätze', 0, 0, 0, 0, 'Einladung zu einer Wohnungbesichtigung', 6, NULL, NULL, NULL),
(8, 0, NULL, 'Hey, MrA, du hast einen neuen Interessenten für dein Ad mit dem Titel 17m&sup2 Zimmer in einer 3er-WG in Chur für 400 CHFclicke <a href="interessentDetails?applicationId=5">HIER </a> um die Bewerbung anzusehen.', 0, 0, 0, 0, 'Neuen Interessenten für, 17m&sup2 Zimmer in einer 3er-WG in Chur für 400 CHF', NULL, 1, NULL, NULL),
(9, 0, NULL, 'Hey, MrB, du hast einen neuen Interessenten für dein Ad mit dem Titel 15m&sup2 Zimmer in einer 3er-WG in Solothurn für 600 CHFclicke <a href="interessentDetails?applicationId=6">HIER </a> um die Bewerbung anzusehen.', 0, 0, 0, 0, 'Neuen Interessenten für, 15m&sup2 Zimmer in einer 3er-WG in Solothurn für 600 CHF', NULL, 2, NULL, NULL),
(10, 0, NULL, 'Hey, MrD, du hast einen neuen Interessenten für dein Ad mit dem Titel 35m&sup2 Zimmer in einer 5er-WG in Zug für 9000 CHFclicke <a href="interessentDetails?applicationId=7">HIER </a> um die Bewerbung anzusehen.', 0, 0, 0, 0, 'Neuen Interessenten für, 35m&sup2 Zimmer in einer 5er-WG in Zug für 9000 CHF', NULL, 4, NULL, NULL),
(11, 0, NULL, 'Hey, MrE, du hast einen neuen Interessenten für dein Ad mit dem Titel 14m&sup2 Zimmer in einer 3er-WG in Bern für 800 CHFclicke <a href="interessentDetails?applicationId=8">HIER </a> um die Bewerbung anzusehen.', 0, 0, 0, 0, 'Neuen Interessenten für, 14m&sup2 Zimmer in einer 3er-WG in Bern für 800 CHF', NULL, 5, NULL, NULL),
(12, 0, 2, 'Hallo, du wurdest von MrD MrD zur besichtigung des Ads: <a href="adprofile?adId=5">35m&sup2 Zimmer in einer 5er-WG in Zug für 9000 CHF</a> eingeladen<br> der Termin wäre am 26/12/2014 um 11:52 Einladungsnachricht des Zimmerbesitzers: <br> Okay, es wird etwas zu Essen geben. Bring Wein!', 0, 0, 0, 0, 'Einladung zu einer Wohnungbesichtigung', 1, NULL, NULL, NULL),
(13, 0, 2, 'Hallo, du wurdest von MrD MrD zur besichtigung des Ads: <a href="adprofile?adId=5">35m&sup2 Zimmer in einer 5er-WG in Zug für 9000 CHF</a> eingeladen<br> der Termin wäre am 26/12/2014 um 11:52 Einladungsnachricht des Zimmerbesitzers: <br> Okay, es wird etwas zu Essen geben. Bring Wein!', 0, 0, 0, 0, 'Einladung zu einer Wohnungbesichtigung', 3, NULL, NULL, NULL),
(14, 0, NULL, 'Jaja', 0, 0, 0, 0, 'Gut', NULL, NULL, 1, 4),
(15, 0, NULL, 'Hey \ntest test hat deine Einladung angenommen\ner wird zum gegebenen Termin am05/12/2014 zwischen 11:50 underscheinen', 0, 0, 0, 0, 'test test hat die Einladung angenommen', NULL, 2, NULL, NULL),
(16, 0, 3, 'Hallo, du wurdest von MrA MrA zur besichtigung des Ads: <a href="adprofile?adId=2">8m&sup2 Zimmer in einer 2er-WG in Bern für 200 CHF</a> eingeladen<br> der Termin wäre am 07/12/2014 um 12:43 Einladungsnachricht des Zimmerbesitzers: <br> Hallo, kannst du um diese Zeit kommen?', 0, 0, 0, 0, 'Einladung zu einer Wohnungbesichtigung', 2, NULL, NULL, NULL),
(17, 0, 4, 'Hallo, du wurdest von MrA MrA zur besichtigung des Ads: <a href="adprofile?adId=1">17m&sup2 Zimmer in einer 3er-WG in Chur für 400 CHF</a> eingeladen<br> der Termin wäre am 07/12/2014 um 12:44 Einladungsnachricht des Zimmerbesitzers: <br> Kannst du in diesen 15 Minuten?', 0, 0, 0, 0, 'Einladung zu einer Wohnungbesichtigung', 6, NULL, NULL, NULL),
(18, 0, 5, 'Hallo, du wurdest von MrA MrA zur besichtigung des Ads: <a href="adprofile?adId=1">17m&sup2 Zimmer in einer 3er-WG in Chur für 400 CHF</a> eingeladen<br> der Termin wäre am 07/12/2014 um 12:44 Einladungsnachricht des Zimmerbesitzers: <br> Und du?', 0, 0, 0, 0, 'Einladung zu einer Wohnungbesichtigung', 6, NULL, NULL, NULL),
(19, 0, 6, 'Hallo, du wurdest von MrA MrA zur besichtigung des Ads: <a href="adprofile?adId=1">17m&sup2 Zimmer in einer 3er-WG in Chur für 400 CHF</a> eingeladen<br> der Termin wäre am 07/12/2014 um 12:48 Einladungsnachricht des Zimmerbesitzers: <br> Test test', 0, 0, 0, 0, 'Einladung zu einer Wohnungbesichtigung', 3, NULL, NULL, NULL),
(20, 0, 7, 'Hallo, du wurdest von MrA MrA zur besichtigung des Ads: <a href="adprofile?adId=1">17m&sup2 Zimmer in einer 3er-WG in Chur für 400 CHF</a> eingeladen<br> der Termin wäre am 07/12/2014 um 12:49 Einladungsnachricht des Zimmerbesitzers: <br> Hallo velo', 0, 0, 0, 0, 'Einladung zu einer Wohnungbesichtigung', 6, NULL, NULL, NULL),
(21, 0, 7, 'Hallo, du wurdest von MrA MrA zur besichtigung des Ads: <a href="adprofile?adId=1">17m&sup2 Zimmer in einer 3er-WG in Chur für 400 CHF</a> eingeladen<br> der Termin wäre am 07/12/2014 um 12:49 Einladungsnachricht des Zimmerbesitzers: <br> Hallo velo', 0, 0, 0, 0, 'Einladung zu einer Wohnungbesichtigung', 3, NULL, NULL, NULL),
(22, 0, NULL, 'Hey, Markus, du hast einen neuen Interessenten für dein Ad mit dem Titel 15m&sup2 Zimmer in einer 3er-WG in Zürich für 823 CHFclicke <a href="interessentDetails?applicationId=9">HIER </a> um die Bewerbung anzusehen.', 1, 0, 0, 0, 'Neuen Interessenten für, 15m&sup2 Zimmer in einer 3er-WG in Zürich für 823 CHF', NULL, 7, NULL, NULL),
(23, 0, NULL, 'Ich habe eine Frage bezüglich des Ads <a href="adprofile?adId=9">15m&sup2 Zimmer in einer 3er-WG in Zürich für 823 CHF</a> :  <br>Hello, do you have it?', 1, 0, 0, 0, 'Wlan', NULL, NULL, 7, 8),
(24, 0, NULL, 'Hey, das Zimmer 14m&sup2 Zimmer in einer 3er-WG in Bern für 800 CHF ist leider bereits vergeben. Viel glück noch bei deiner Suche!', 0, 0, 0, 0, 'Zimmer leider vergeben', NULL, 3, NULL, NULL),
(25, 0, NULL, 'Hey, das Zimmer 15m&sup2 Zimmer in einer 3er-WG in Zürich für 823 CHF ist leider bereits vergeben. Viel glück noch bei deiner Suche!', 1, 0, 0, 0, 'Zimmer leider vergeben', NULL, 8, NULL, NULL),
(26, 0, NULL, 'Hey, Markus, du hast einen neuen Interessenten für dein Ad mit dem Titel 15m&sup2 Zimmer in einer 3er-WG in Zürich für 823 CHFclicke <a href="interessentDetails?applicationId=10">HIER </a> um die Bewerbung anzusehen.', 1, 0, 0, 0, 'Neuen Interessenten für, 15m&sup2 Zimmer in einer 3er-WG in Zürich für 823 CHF', NULL, 7, NULL, NULL),
(27, 0, 8, 'Hallo, du wurdest von Markus Muster zur besichtigung des Ads: <a href="adprofile?adId=9">15m&sup2 Zimmer in einer 3er-WG in Zürich für 823 CHF</a> eingeladen<br> der Termin wäre am 31/12/2014 um 10:55 Einladungsnachricht des Zimmerbesitzers: <br> Hey, please come with the Train. There are no parking slots!', 1, 0, 0, 0, 'Einladung zu einer Wohnungbesichtigung', 8, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `note`
--

CREATE TABLE IF NOT EXISTS `note` (
`id` bigint(20) NOT NULL,
  `text` longtext,
  `applicant_id` bigint(20) DEFAULT NULL,
  `appointment_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Daten für Tabelle `note`
--

INSERT INTO `note` (`id`, `text`, `applicant_id`, `appointment_id`) VALUES
(1, 'Er scheint okay', 1, 2),
(3, 'Test B', 2, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Daten für Tabelle `picture`
--

INSERT INTO `picture` (`id`, `absoluteFilePath`, `isMainPic`, `relativeFilePath`, `ad_id`) VALUES
(5, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\a@a.ch\\200Kramgasse 20BernAbstellkammer-199x300.jpg', 1, '/img/adPictures/a@a.ch/200Kramgasse 20BernAbstellkammer-199x300.jpg', NULL),
(6, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\a@a.ch\\200Kramgasse 20Bernabstellkammer_voll.jpg', 0, '/img/adPictures/a@a.ch/200Kramgasse 20Bernabstellkammer_voll.jpg', NULL),
(7, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\b@b.ch\\600gurzelngasse 5Solothurn600Monbijoustrasse 71Bernimg1-ad1.jpg', 1, '/img/adPictures/b@b.ch/600gurzelngasse 5Solothurn600Monbijoustrasse 71Bernimg1-ad1.jpg', NULL),
(8, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\b@b.ch\\600gurzelngasse 5Solothurn600Monbijoustrasse 71Bernimg2-ad1.jpg', 0, '/img/adPictures/b@b.ch/600gurzelngasse 5Solothurn600Monbijoustrasse 71Bernimg2-ad1.jpg', NULL),
(9, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\b@b.ch\\600gurzelngasse 5Solothurn1000Bahnhofstrasse 2Baselimg3Ad4.jpg', 0, '/img/adPictures/b@b.ch/600gurzelngasse 5Solothurn1000Bahnhofstrasse 2Baselimg3Ad4.jpg', NULL),
(10, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\b@b.ch\\600gurzelngasse 5Solothurn600Monbijoustrasse 71Bernimg3-ad1.jpg', 0, '/img/adPictures/b@b.ch/600gurzelngasse 5Solothurn600Monbijoustrasse 71Bernimg3-ad1.jpg', NULL),
(11, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\d@d.ch\\9000Im Rötel 3ZugSchloss1.png', 1, '/img/adPictures/d@d.ch/9000Im Rötel 3ZugSchloss1.png', NULL),
(12, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\d@d.ch\\9000Im Rötel 3ZugSchlossROom.jpg', 0, '/img/adPictures/d@d.ch/9000Im Rötel 3ZugSchlossROom.jpg', NULL),
(13, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\d@d.ch\\9000Im Rötel 3ZugSchlossRoom2.jpg', 0, '/img/adPictures/d@d.ch/9000Im Rötel 3ZugSchlossRoom2.jpg', NULL),
(14, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\e@e.ch\\800Murtenstrasse 13Bern900Murtenstrasse 99Bernimg2Ad3.jpg', 1, '/img/adPictures/e@e.ch/800Murtenstrasse 13Bern900Murtenstrasse 99Bernimg2Ad3.jpg', NULL),
(15, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\e@e.ch\\800Murtenstrasse 13Bern900Murtenstrasse 99Bernimg1Ad3.jpg', 0, '/img/adPictures/e@e.ch/800Murtenstrasse 13Bern900Murtenstrasse 99Bernimg1Ad3.jpg', NULL),
(16, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\e@e.ch\\800Murtenstrasse 13Bern900Murtenstrasse 99Bernimg4Ad3.jpg', 0, '/img/adPictures/e@e.ch/800Murtenstrasse 13Bern900Murtenstrasse 99Bernimg4Ad3.jpg', NULL),
(17, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\e@e.ch\\800Murtenstrasse 13Bern1000Bahnhofstrasse 2Baselimg2Ad4.jpg', 0, '/img/adPictures/e@e.ch/800Murtenstrasse 13Bern1000Bahnhofstrasse 2Baselimg2Ad4.jpg', NULL),
(18, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\a@a.ch\\350Kramgasse 1Bern850Bizusstrasse 12Zürichimg1Ad2.jpg', 1, '/img/adPictures/a@a.ch/350Kramgasse 1Bern850Bizusstrasse 12Zürichimg1Ad2.jpg', NULL),
(19, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\a@a.ch\\350Kramgasse 1Bern1000Bahnhofstrasse 2Baselimg4Ad4.jpg', 0, '/img/adPictures/a@a.ch/350Kramgasse 1Bern1000Bahnhofstrasse 2Baselimg4Ad4.jpg', NULL),
(20, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\a@a.ch\\350Kramgasse 1Bern1000Bahnhofstrasse 2Baselimg2Ad4.jpg', 0, '/img/adPictures/a@a.ch/350Kramgasse 1Bern1000Bahnhofstrasse 2Baselimg2Ad4.jpg', NULL),
(21, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\a@a.ch\\350Kramgasse 1Bern900Murtenstrasse 99Bernimg4Ad3.jpg', 0, '/img/adPictures/a@a.ch/350Kramgasse 1Bern900Murtenstrasse 99Bernimg4Ad3.jpg', NULL),
(22, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\c@c.ch\\650Marktgasse 12Bern900Murtenstrasse 99Bernimg2Ad3.jpg', 1, '/img/adPictures/c@c.ch/650Marktgasse 12Bern900Murtenstrasse 99Bernimg2Ad3.jpg', NULL),
(23, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\c@c.ch\\650Marktgasse 12Bern900Murtenstrasse 99Bernimg3Ad3.jpg', 0, '/img/adPictures/c@c.ch/650Marktgasse 12Bern900Murtenstrasse 99Bernimg3Ad3.jpg', NULL),
(24, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\c@c.ch\\650Marktgasse 12Bern900Murtenstrasse 99Bernimg4Ad3.jpg', 0, '/img/adPictures/c@c.ch/650Marktgasse 12Bern900Murtenstrasse 99Bernimg4Ad3.jpg', NULL),
(25, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\c@c.ch\\650Marktgasse 12Bern1000Bahnhofstrasse 2Baselimg4Ad4.jpg', 0, '/img/adPictures/c@c.ch/650Marktgasse 12Bern1000Bahnhofstrasse 2Baselimg4Ad4.jpg', NULL),
(26, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\markus.muster@gmail.com\\823Bahnhofstrasse 3ZürichWohnungAussen.jpg', 1, '/img/adPictures/markus.muster@gmail.com/823Bahnhofstrasse 3ZürichWohnungAussen.jpg', NULL),
(27, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\markus.muster@gmail.com\\823Bahnhofstrasse 3ZürichWohnung1.jpg', 0, '/img/adPictures/markus.muster@gmail.com/823Bahnhofstrasse 3ZürichWohnung1.jpg', NULL),
(28, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\markus.muster@gmail.com\\823Bahnhofstrasse 3ZürichWohnung2.jpg', 0, '/img/adPictures/markus.muster@gmail.com/823Bahnhofstrasse 3ZürichWohnung2.jpg', NULL),
(29, 'C:\\Users\\Ice\\eseunibe\\ese2014-team2\\Skeleton\\src\\main\\webapp\\img\\adPictures\\markus.muster@gmail.com\\823Bahnhofstrasse 3ZürichWohnung3.jpg', 0, '/img/adPictures/markus.muster@gmail.com/823Bahnhofstrasse 3ZürichWohnung3.jpg', NULL);

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
  `exampleAd_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `EMAIL`, `enabled`, `firstName`, `lastName`, `password`, `exampleAd_id`) VALUES
(1, 'a@a.ch', 1, 'MrA', 'MrA', '$2a$10$Vy18I1Nh/iYIDdx4qpEiaudMT1Mu090Ly8fWMhoWCzNnL3jeQ9pme', NULL),
(2, 'b@b.ch', 1, 'MrB', 'MrB', '$2a$10$nlDDMUakD2wQl4TfKRQ0NuD4XNqe1nFMn6/IFvvyRDNiYToi75iEe', NULL),
(3, 'c@c.ch', 1, 'MrC', 'MrC', '$2a$10$E70b0EUpe3jnO.iY7.Rbbu4tHL95jH7O2jL85c0dkn7I0QZcF4ih2', NULL),
(4, 'd@d.ch', 1, 'MrD', 'MrD', '$2a$10$XnFGBobCGzKqzqejjhuwtettGaef4w9brDUXPQMsGKiBEsc9yvpLm', NULL),
(5, 'e@e.ch', 1, 'MrE', 'MrE', '$2a$10$rCdFAUW/fpHaDTsR4VO.1OZ0mLfUfIdmWmDn1Mp0qrqgLndlnpwKW', NULL),
(6, 'test@test.ch', 1, 'test', 'test', '$2a$10$JqudVIPTJYjW2pD0OAyqMOrNwF0vCmPPzB45jzCVXHKKOJDqMlVF2', NULL),
(7, 'markus.muster@gmail.com', 1, 'Markus', 'Muster', '$2a$10$quOL8NZ1ii4CSFz2kTSXYOHVRm8Tx74sSwVFyRfbceumbAAGswb4W', NULL),
(8, 'ese@ese.ch', 1, 'MrEse', 'EseMan', '$2a$10$hTTFEX.zedjMVKmzb9GbEOi06NI4zJQnOott920yiR/3dSnWhmcw2', NULL),
(9, 'ese@test.ch', 1, 'tes', 'stes', '$2a$10$ayIfT8ffDTKOPrX3AO.BpOXErFM8qx5kExNB2cFPAto58yKUOSiai', NULL),
(11, 'mrshowcase@test.ch', 1, 'mrShow', 'Case', '$2a$10$t0BXyyJr3SF0qPkYcKOo6eKdOvI7/Tu37KGArUDSAN8R/SuKZfhQ6', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
`id` bigint(20) NOT NULL,
  `role` varchar(45) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Daten für Tabelle `user_roles`
--

INSERT INTO `user_roles` (`id`, `role`, `user_id`) VALUES
(1, 'ROLE_USER', 1),
(2, 'ROLE_USER', 2),
(3, 'ROLE_USER', 3),
(4, 'ROLE_USER', 4),
(5, 'ROLE_USER', 5),
(6, 'ROLE_USER', 6),
(7, 'ROLE_USER', 7),
(8, 'ROLE_USER', 8),
(9, 'ROLE_USER', 9),
(11, 'ROLE_USER', 11);

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
-- Indexes for table `advertisement_appointments`
--
ALTER TABLE `advertisement_appointments`
 ADD KEY `FK41877CCE7248788F` (`Advertisement_id`);

--
-- Indexes for table `advertisement_bookmarks`
--
ALTER TABLE `advertisement_bookmarks`
 ADD KEY `FK45B1A4237248788F` (`Advertisement_id`);

--
-- Indexes for table `advertisement_picture`
--
ALTER TABLE `advertisement_picture`
 ADD PRIMARY KEY (`Advertisement_id`,`pictures_id`), ADD UNIQUE KEY `pictures_id` (`pictures_id`), ADD KEY `FK8DFBE884E4AEE018` (`pictures_id`), ADD KEY `FK8DFBE8847248788F` (`Advertisement_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
 ADD PRIMARY KEY (`id`), ADD KEY `FKB7F037F1562CE6F` (`appointmentDate_id`);

--
-- Indexes for table `appointmentaccepted`
--
ALTER TABLE `appointmentaccepted`
 ADD PRIMARY KEY (`id`), ADD KEY `FKFBA818462F7B938F` (`appointment_id`), ADD KEY `FKFBA8184656720145` (`user_id`);

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
 ADD PRIMARY KEY (`id`), ADD KEY `FK7B6209567598C9AD` (`bookmarker_id`);

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
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `EMAIL` (`EMAIL`), ADD UNIQUE KEY `EMAIL_2` (`EMAIL`), ADD KEY `FK285FEBD985F184` (`exampleAd_id`);

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
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `appointmentaccepted`
--
ALTER TABLE `appointmentaccepted`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `appointmentdate`
--
ALTER TABLE `appointmentdate`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `bookmark`
--
ALTER TABLE `bookmark`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `customfilterad`
--
ALTER TABLE `customfilterad`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `note`
--
ALTER TABLE `note`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `picture`
--
ALTER TABLE `picture`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
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
-- Constraints der Tabelle `advertisement_appointments`
--
ALTER TABLE `advertisement_appointments`
ADD CONSTRAINT `FK41877CCE7248788F` FOREIGN KEY (`Advertisement_id`) REFERENCES `advertisement` (`id`);

--
-- Constraints der Tabelle `advertisement_bookmarks`
--
ALTER TABLE `advertisement_bookmarks`
ADD CONSTRAINT `FK45B1A4237248788F` FOREIGN KEY (`Advertisement_id`) REFERENCES `advertisement` (`id`);

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
ADD CONSTRAINT `FKB7F037F1562CE6F` FOREIGN KEY (`appointmentDate_id`) REFERENCES `appointmentdate` (`id`);

--
-- Constraints der Tabelle `appointmentaccepted`
--
ALTER TABLE `appointmentaccepted`
ADD CONSTRAINT `FKFBA818462F7B938F` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`),
ADD CONSTRAINT `FKFBA8184656720145` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

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
ADD CONSTRAINT `FK7B6209567598C9AD` FOREIGN KEY (`bookmarker_id`) REFERENCES `user` (`id`);

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
-- Constraints der Tabelle `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `FK285FEBD985F184` FOREIGN KEY (`exampleAd_id`) REFERENCES `customfilterad` (`id`);

--
-- Constraints der Tabelle `user_roles`
--
ALTER TABLE `user_roles`
ADD CONSTRAINT `FK7342994956720145` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
