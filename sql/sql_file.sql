-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 31. Mrz 2014 um 16:15
-- Server Version: 5.5.35
-- PHP-Version: 5.4.4-14+deb7u8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `mc`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `authme`
--

CREATE TABLE IF NOT EXISTS `authme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `lastlogin` bigint(20) DEFAULT NULL,
  `x` double NOT NULL DEFAULT '0',
  `y` double NOT NULL DEFAULT '0',
  `z` double NOT NULL DEFAULT '0',
  `world` varchar(255) DEFAULT 'world',
  `email` varchar(255) DEFAULT 'your@email.com',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fe_accounts`
--

CREATE TABLE IF NOT EXISTS `fe_accounts` (
  `name` varchar(64) NOT NULL,
  `money` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Highscores_highscores`
--

CREATE TABLE IF NOT EXISTS `Highscores_highscores` (
  `counter` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `goals` text NOT NULL,
  `rewards` text,
  `highscorePlayer` varchar(255) DEFAULT NULL,
  `highscoreValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`counter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Highscores_players`
--

CREATE TABLE IF NOT EXISTS `Highscores_players` (
  `counter` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(255) NOT NULL,
  `highscoreId` int(11) NOT NULL,
  `value` bigint(20) NOT NULL,
  `isHighscore` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`counter`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jobs_jobs`
--

CREATE TABLE IF NOT EXISTS `jobs_jobs` (
  `username` varchar(20) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `job` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `newsID` int(15) NOT NULL AUTO_INCREMENT,
  `author` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `timestamp` varchar(500) NOT NULL,
  PRIMARY KEY (`newsID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sg_gamestats`
--

CREATE TABLE IF NOT EXISTS `sg_gamestats` (
  `gameno` int(11) NOT NULL AUTO_INCREMENT,
  `arenaid` int(11) DEFAULT NULL,
  `players` int(11) DEFAULT NULL,
  `winner` text,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`gameno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sg_playerstats`
--

CREATE TABLE IF NOT EXISTS `sg_playerstats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gameno` int(11) DEFAULT NULL,
  `arenaid` int(11) DEFAULT NULL,
  `player` text,
  `points` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `death` int(11) DEFAULT NULL,
  `killed` text,
  `time` int(11) DEFAULT NULL,
  `ks1` int(11) DEFAULT NULL,
  `ks2` int(11) DEFAULT NULL,
  `ks3` int(11) DEFAULT NULL,
  `ks4` int(11) DEFAULT NULL,
  `ks5` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Stats_block`
--

CREATE TABLE IF NOT EXISTS `Stats_block` (
  `counter` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(255) NOT NULL,
  `blockID` int(11) NOT NULL,
  `blockData` blob NOT NULL,
  `amount` int(11) NOT NULL,
  `break` tinyint(1) NOT NULL,
  PRIMARY KEY (`counter`),
  UNIQUE KEY `no_duplicates` (`player`,`blockID`,`blockData`(4),`break`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Stats_death`
--

CREATE TABLE IF NOT EXISTS `Stats_death` (
  `counter` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(255) NOT NULL,
  `cause` varchar(32) NOT NULL,
  `amount` int(11) NOT NULL,
  `entity` tinyint(1) NOT NULL,
  PRIMARY KEY (`counter`),
  UNIQUE KEY `no_duplicates` (`player`,`cause`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Stats_kill`
--

CREATE TABLE IF NOT EXISTS `Stats_kill` (
  `counter` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`counter`),
  UNIQUE KEY `no_duplicates` (`player`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Stats_move`
--

CREATE TABLE IF NOT EXISTS `Stats_move` (
  `counter` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `distance` double NOT NULL,
  PRIMARY KEY (`counter`),
  UNIQUE KEY `no_duplicates` (`player`,`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Stats_player`
--

CREATE TABLE IF NOT EXISTS `Stats_player` (
  `counter` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(255) NOT NULL,
  `playtime` int(11) NOT NULL DEFAULT '0',
  `arrows` int(11) DEFAULT '0',
  `xpgained` int(11) DEFAULT '0',
  `joins` int(11) DEFAULT '0',
  `fishcatch` int(11) DEFAULT '0',
  `damagetaken` int(11) DEFAULT '0',
  `timeskicked` int(11) DEFAULT '0',
  `toolsbroken` int(11) DEFAULT '0',
  `eggsthrown` int(11) DEFAULT '0',
  `itemscrafted` int(11) DEFAULT '0',
  `omnomnom` int(11) DEFAULT '0',
  `onfire` int(11) DEFAULT '0',
  `wordssaid` int(11) DEFAULT '0',
  `commandsdone` int(11) DEFAULT '0',
  `votes` int(11) DEFAULT '0',
  `teleports` int(11) DEFAULT '0',
  `itempickups` int(11) DEFAULT '0',
  `bedenter` int(11) DEFAULT '0',
  `bucketfill` int(11) DEFAULT '0',
  `bucketempty` int(11) DEFAULT '0',
  `worldchange` int(11) DEFAULT '0',
  `itemdrops` int(11) DEFAULT '0',
  `shear` int(11) DEFAULT '0',
  `lastjoin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastleave` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`counter`),
  UNIQUE KEY `no_duplicates` (`player`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
