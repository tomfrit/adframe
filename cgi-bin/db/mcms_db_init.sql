-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 08. November 2010 um 08:17
-- Server Version: 5.1.51
-- PHP-Version: 5.3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Datenbank: `spoke_utf8`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_BRAND`
--

CREATE TABLE `ADFRAME_BRAND` (
  `ADFRAME_BRAND_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_CHANNEL` varchar(64) NOT NULL DEFAULT '',
  `AREA` varchar(127) DEFAULT NULL,
  `BRAND` varchar(127) DEFAULT NULL,
  `STREET` varchar(127) DEFAULT NULL,
  `ZIPCODE` varchar(32) DEFAULT NULL,
  `CITY` varchar(127) DEFAULT NULL,
  `COUNTRY` varchar(127) DEFAULT NULL,
  `EMAIL` varchar(127) DEFAULT NULL,
  `FON` varchar(127) DEFAULT NULL,
  `FAX` varchar(127) DEFAULT NULL,
  `URL` varchar(127) DEFAULT NULL,
  `COMMENT` text,
  `CR_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(127) DEFAULT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ADFRAME_BRAND_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_COMPANY`
--

CREATE TABLE `ADFRAME_COMPANY` (
  `ADFRAME_COMPANY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_CHANNEL` varchar(64) NOT NULL DEFAULT '',
  `AREA` varchar(127) DEFAULT NULL,
  `ACCOUNT_NO` varchar(127) DEFAULT NULL,
  `COMPANY` varchar(127) DEFAULT NULL,
  `BRANCH` varchar(127) DEFAULT NULL,
  `STREET` varchar(127) DEFAULT NULL,
  `ZIPCODE` varchar(32) DEFAULT NULL,
  `CITY` varchar(127) DEFAULT NULL,
  `COUNTRY` varchar(127) DEFAULT NULL,
  `EMAIL` varchar(127) DEFAULT NULL,
  `FON` varchar(127) DEFAULT NULL,
  `FAX` varchar(127) DEFAULT NULL,
  `URL` varchar(127) DEFAULT NULL,
  `BANK_ACCOUNTNAME` varchar(127) DEFAULT NULL,
  `BANK_ACCOUNTNUMBER` varchar(127) DEFAULT NULL,
  `BANK_INSTITUTE` varchar(127) DEFAULT NULL,
  `BANK_CODE` varchar(127) DEFAULT NULL,
  `SALES_TAX_ID` varchar(127) DEFAULT NULL,
  `COMMENT` text,
  `CR_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(127) DEFAULT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ADFRAME_COMPANY_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_DATES`
--

CREATE TABLE `ADFRAME_DATES` (
  `ADFRAME_DATES_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_CHANNEL` varchar(64) NOT NULL DEFAULT '',
  `AREA` varchar(127) DEFAULT NULL,
  `ADFRAME_DATESCATEGORY_ID` int(11) NOT NULL DEFAULT '0',
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `START_TIME` varchar(127) DEFAULT NULL,
  `EVENT` varchar(127) DEFAULT NULL,
  `LOCATION` varchar(127) DEFAULT NULL,
  `CONTACT_PERSON` varchar(127) DEFAULT NULL,
  `STREET` varchar(127) DEFAULT NULL,
  `ZIPCODE` varchar(32) DEFAULT NULL,
  `CITY` varchar(127) DEFAULT NULL,
  `COUNTRY` varchar(127) DEFAULT NULL,
  `FON` varchar(127) DEFAULT NULL,
  `FAX` varchar(127) DEFAULT NULL,
  `URL` varchar(127) DEFAULT NULL,
  `EMAIL` varchar(127) DEFAULT NULL,
  `PRICE` varchar(127) DEFAULT NULL,
  `DESCR` text,
  `TEASERTEXT` text,
  `IMAGE_1` varchar(127) DEFAULT NULL,
  `IMAGE_2` varchar(127) DEFAULT NULL,
  `CR_DATE` datetime DEFAULT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ADFRAME_DATES_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_DATESCATEGORY`
--

CREATE TABLE `ADFRAME_DATESCATEGORY` (
  `ADFRAME_DATESCATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_CHANNEL` char(64) NOT NULL DEFAULT '',
  `AREA` char(127) DEFAULT NULL,
  `CATEGORY` char(127) DEFAULT NULL,
  `CR_DATE` datetime DEFAULT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ADFRAME_DATESCATEGORY_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_FORUM`
--

CREATE TABLE `ADFRAME_FORUM` (
  `ADFRAME_FORUM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_CHANNEL` char(64) NOT NULL,
  `AREA` char(127) NOT NULL,
  `ADFRAME_FORUMCATEGORY_ID` int(11) NOT NULL,
  `ADFRAME_USER_ID` int(11) NOT NULL,
  `REF_ADFRAME_FORUM_ID` int(11) NOT NULL,
  `SUBJECT` char(127) NOT NULL,
  `COMMENT` text NOT NULL,
  `URL` char(127) DEFAULT NULL,
  `NAME` varchar(120) DEFAULT NULL,
  `ITEM_0` char(100) DEFAULT NULL,
  `ITEM_1` varchar(120) DEFAULT NULL,
  `ITEM_2` varchar(120) DEFAULT NULL,
  `ITEM_3` varchar(120) DEFAULT NULL,
  `ITEM_4` varchar(120) DEFAULT NULL,
  `ITEM_5` varchar(120) DEFAULT NULL,
  `ITEM_6` varchar(120) DEFAULT NULL,
  `ITEM_7` varchar(120) DEFAULT NULL,
  `ITEM_8` varchar(120) DEFAULT NULL,
  `ITEM_9` varchar(120) DEFAULT NULL,
  `ITEM_10` varchar(100) DEFAULT NULL,
  `ITEM_11` varchar(100) DEFAULT NULL,
  `ITEM_12` varchar(100) DEFAULT NULL,
  `ITEM_13` varchar(100) DEFAULT NULL,
  `ITEM_14` varchar(100) DEFAULT NULL,
  `ITEM_15` varchar(100) DEFAULT NULL,
  `ITEM_16` varchar(100) DEFAULT NULL,
  `ITEM_17` varchar(100) DEFAULT NULL,
  `ITEM_18` varchar(100) DEFAULT NULL,
  `ITEM_19` varchar(100) DEFAULT NULL,
  `TEXT_0` text,
  `IMG_0` char(100) DEFAULT NULL,
  `IMG_1` char(100) DEFAULT NULL,
  `IMG_2` char(100) DEFAULT NULL,
  `UP_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime NOT NULL,
  `CR_DATE` datetime NOT NULL,
  `IS_ACTIVE` int(11) NOT NULL,
  PRIMARY KEY (`ADFRAME_FORUM_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_FORUMCATEGORY`
--

CREATE TABLE `ADFRAME_FORUMCATEGORY` (
  `ADFRAME_FORUMCATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_CHANNEL` varchar(64) NOT NULL DEFAULT '',
  `AREA` varchar(127) NOT NULL DEFAULT '',
  `CATEGORY` varchar(127) NOT NULL DEFAULT '',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `TEXT_0` text,
  `TEXT_1` text,
  `IMG_0` varchar(127) DEFAULT NULL,
  `IMG_1` varchar(127) DEFAULT NULL,
  `ITEM_1` varchar(255) DEFAULT NULL,
  `ITEM_2` varchar(255) DEFAULT NULL,
  `ITEM_3` varchar(255) DEFAULT NULL,
  `ITEM_4` varchar(255) DEFAULT NULL,
  `CR_DATE` datetime DEFAULT NULL,
  `IS_ACTIVE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ADFRAME_FORUMCATEGORY_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_FOTO_RATING`
--

CREATE TABLE `ADFRAME_FOTO_RATING` (
  `ADFRAME_FOTO_RATING_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_USER_ID` int(11) NOT NULL DEFAULT '0',
  `ADFRAME_USER_FOTO_ID` int(11) NOT NULL DEFAULT '0',
  `RATING` int(11) NOT NULL DEFAULT '0',
  `CR_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ADFRAME_FOTO_RATING_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_LINKS`
--

CREATE TABLE `ADFRAME_LINKS` (
  `ADFRAME_LINKS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_CHANNEL` varchar(255) NOT NULL DEFAULT '',
  `ADFRAME_LINKSCATEGORY_ID` int(20) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `URL` varchar(200) NOT NULL DEFAULT '',
  `DESCR` text,
  `IMAGE_0` varchar(255) DEFAULT NULL,
  `IMAGE_1` varchar(255) DEFAULT NULL,
  `ITEM_0` varchar(200) DEFAULT NULL,
  `ITEM_1` varchar(200) DEFAULT NULL,
  `IS_ACTIVE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ADFRAME_LINKS_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_LINKSCATEGORY`
--

CREATE TABLE `ADFRAME_LINKSCATEGORY` (
  `ADFRAME_LINKSCATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_CHANNEL` char(64) NOT NULL DEFAULT '',
  `AREA` char(127) DEFAULT NULL,
  `CATEGORY` char(127) DEFAULT NULL,
  `CR_DATE` datetime DEFAULT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ADFRAME_LINKSCATEGORY_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_MCMS`
--

CREATE TABLE `ADFRAME_MCMS` (
  `ADFRAME_MCMS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_CHANNEL` varchar(64) NOT NULL DEFAULT '',
  `AREA` varchar(64) NOT NULL DEFAULT '',
  `CATEGORY` varchar(64) DEFAULT NULL,
  `RANK_NO` int(11) NOT NULL DEFAULT '0',
  `PAGE_COUNT` int(11) DEFAULT NULL,
  `P_STATUS` int(11) DEFAULT NULL,
  `P_DATE` datetime DEFAULT NULL,
  `IS_ARCHIVE` int(11) DEFAULT NULL,
  `A_NAME` varchar(127) DEFAULT NULL,
  `A_EMAIL` varchar(127) DEFAULT NULL,
  `SEL` varchar(127) DEFAULT NULL,
  `SEL_2` varchar(127) DEFAULT NULL,
  `HEADLINE` varchar(127) DEFAULT NULL,
  `ITEM_1_1` varchar(127) DEFAULT NULL,
  `ITEM_1_2` varchar(127) DEFAULT NULL,
  `ITEM_1_3` varchar(127) DEFAULT NULL,
  `ITEM_1_4` varchar(127) DEFAULT NULL,
  `ITEM_2_1` varchar(127) DEFAULT NULL,
  `ITEM_2_2` varchar(127) DEFAULT NULL,
  `ITEM_2_3` varchar(127) DEFAULT NULL,
  `ITEM_2_4` varchar(127) DEFAULT NULL,
  `ITEM_3_1` varchar(127) DEFAULT NULL,
  `ITEM_3_2` varchar(127) DEFAULT NULL,
  `ITEM_3_3` varchar(127) DEFAULT NULL,
  `ITEM_3_4` varchar(127) DEFAULT NULL,
  `IMG_0_0` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_0_1` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_0_2` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_0_3` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_0_4` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_1_0` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_1_1` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_1_2` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_1_3` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_1_4` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_2_1` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_2_2` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_2_3` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_2_4` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_3_1` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_3_2` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_3_3` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_3_4` varchar(64) DEFAULT 'DEFIMG_0_1.gif',
  `TEXT_0` text,
  `TEXT_1_1` text,
  `TEXT_1_2` text,
  `TEXT_1_3` text,
  `TEXT_1_4` text,
  `TEXT_2_1` text,
  `TEXT_2_2` text,
  `TEXT_2_3` text,
  `TEXT_2_4` text,
  `TEXT_3_1` text,
  `TEXT_3_2` text,
  `TEXT_3_3` text,
  `TEXT_3_4` text,
  `PARENT_RANK_NO` int(11) DEFAULT NULL,
  `VIDEO_1_1` varchar(64) DEFAULT NULL,
  `PIC_VIDEO_1_1` varchar(64) DEFAULT NULL,
  `ITEM_1_5` varchar(127) DEFAULT NULL,
  `VIDEO_1_2` varchar(64) DEFAULT NULL,
  `PIC_VIDEO_1_2` varchar(64) DEFAULT NULL,
  `ITEM_1_6` varchar(127) DEFAULT NULL,
  `SAISON` varchar(127) DEFAULT NULL,
  `ETIKETT` varchar(127) DEFAULT NULL,
  `ITEM_2_5` varchar(127) DEFAULT NULL,
  `ITEM_2_6` varchar(127) DEFAULT NULL,
  `ITEM_2_7` varchar(127) DEFAULT NULL,
  `ITEM_2_8` varchar(127) DEFAULT NULL,
  `ITEM_2_9` varchar(127) DEFAULT NULL,
  `TEXT_4_0` text,
  `TEXT_4_1` text,
  `TEXT_4_2` text,
  `TEXT_4_3` text,
  `TEXT_4_4` text,
  `TEXT_5_0` text,
  `TEXT_5_1` text,
  `TEXT_5_2` text,
  `TEXT_5_3` text,
  `TEXT_5_4` text,
  `ITEM_4_0` varchar(127) DEFAULT NULL,
  `ITEM_4_1` varchar(127) DEFAULT NULL,
  `ITEM_4_2` varchar(127) DEFAULT NULL,
  `ITEM_4_3` varchar(127) DEFAULT NULL,
  `ITEM_4_4` varchar(127) DEFAULT NULL,
  `ITEM_5_0` varchar(127) DEFAULT NULL,
  `ITEM_5_1` varchar(127) DEFAULT NULL,
  `ITEM_5_2` varchar(127) DEFAULT NULL,
  `ITEM_5_3` varchar(127) DEFAULT NULL,
  `ITEM_5_4` varchar(127) DEFAULT NULL,
  `IMG_4_0` varchar(127) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_4_1` varchar(127) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_4_2` varchar(127) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_4_3` varchar(127) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_4_4` varchar(127) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_5_0` varchar(127) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_5_1` varchar(127) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_5_2` varchar(127) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_5_3` varchar(127) DEFAULT 'DEFIMG_0_1.gif',
  `IMG_5_4` varchar(127) DEFAULT 'DEFIMG_0_1.gif',
  `SEL_3` varchar(27) DEFAULT NULL,
  `SEL_4` varchar(27) DEFAULT NULL,
  `VIEW_COUNT` varchar(10) DEFAULT '0',
  `VIEW_COUNT_2` varchar(10) DEFAULT '0',
  `VIEW_COUNT_3` varchar(10) DEFAULT '0',
  `VIEW_COUNT_4` varchar(10) DEFAULT '0',
  `CR_DATE` datetime DEFAULT NULL,
  `IS_ACTIVE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ADFRAME_MCMS_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_MCMS_EXT`
--

CREATE TABLE `ADFRAME_MCMS_EXT` (
  `ADFRAME_MCMS_EXT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_MCMS_ID` int(11) NOT NULL DEFAULT '0',
  `RANK_NO` int(11) DEFAULT NULL,
  `ITEM_EXT_1` varchar(127) DEFAULT NULL,
  `ITEM_EXT_2` varchar(127) DEFAULT NULL,
  `IMG_EXT_1` varchar(64) DEFAULT NULL,
  `IMG_EXT_2` varchar(64) DEFAULT NULL,
  `TEXT_EXT` text,
  `CR_DATE` datetime DEFAULT NULL,
  `IS_ACTIVE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ADFRAME_MCMS_EXT_ID`),
  KEY `IDX_ADFRAME_MCMS_ID` (`ADFRAME_MCMS_ID`),
  KEY `IDX_IS_ACTIVE` (`IS_ACTIVE`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_MCMS_RATING`
--

CREATE TABLE `ADFRAME_MCMS_RATING` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` int(11) NOT NULL DEFAULT '0',
  `mcms_id` int(11) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0',
  `CR_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------


--
-- Tabellenstruktur für Tabelle `ADFRAME_USER`
--

CREATE TABLE `ADFRAME_USER` (
  `ADFRAME_USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_CHANNEL` varchar(64) NOT NULL DEFAULT '',
  `ACCOUNT_NO` varchar(127) DEFAULT NULL,
  `GENDER` varchar(32) DEFAULT NULL,
  `TITLE` varchar(127) DEFAULT NULL,
  `FIRSTNAME` varchar(127) DEFAULT NULL,
  `NAME` varchar(127) DEFAULT NULL,
  `STREET` varchar(127) DEFAULT NULL,
  `ZIPCODE` varchar(32) DEFAULT NULL,
  `CITY` varchar(127) DEFAULT NULL,
  `COUNTRY` varchar(127) DEFAULT NULL,
  `EMAIL` varchar(127) NOT NULL DEFAULT '',
  `FON` varchar(127) DEFAULT NULL,
  `FAX` varchar(127) DEFAULT NULL,
  `MOBIL` varchar(127) DEFAULT NULL,
  `BIRTHDAY` varchar(100) DEFAULT NULL,
  `PROFESSION` varchar(127) DEFAULT NULL,
  `COMPANY` varchar(127) DEFAULT NULL,
  `ADFRAME_COMPANY_ID` int(11) DEFAULT NULL,
  `POSITION` varchar(127) DEFAULT NULL,
  `FON_COMPANY` varchar(127) DEFAULT NULL,
  `HOBBY` varchar(127) DEFAULT NULL,
  `EXTENSION` varchar(127) DEFAULT NULL,
  `EXTENSION_ID` varchar(127) DEFAULT NULL,
  `LOGIN` varchar(32) DEFAULT NULL,
  `PASSWD` varchar(32) DEFAULT NULL,
  `LICENCEKEY` varchar(127) DEFAULT NULL,
  `ROLES` varchar(127) NOT NULL DEFAULT '',
  `CR_DATE` date DEFAULT NULL,
  `ADMIT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ADFRAME_USER_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_USERCOMPANYBRAND`
--

CREATE TABLE `ADFRAME_USERCOMPANYBRAND` (
  `ADFRAME_USERCOMPANYBRAND_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_CHANNEL` varchar(255) NOT NULL DEFAULT '',
  `AREA` varchar(255) DEFAULT NULL,
  `ADFRAME_USER_ID` int(11) NOT NULL DEFAULT '0',
  `ADFRAME_COMPANY_ID` int(11) NOT NULL DEFAULT '0',
  `ADFRAME_BRAND_ID` int(11) NOT NULL DEFAULT '0',
  `COMMENT` varchar(255) DEFAULT NULL,
  `CR_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `STATUS` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ADFRAME_USERCOMPANYBRAND_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_USERROLE`
--

CREATE TABLE `ADFRAME_USERROLE` (
  `ADFRAME_USERROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_CHANNEL` char(64) NOT NULL DEFAULT '',
  `ROLE` char(64) DEFAULT NULL,
  `DESCR` char(127) DEFAULT NULL,
  `CR_DATE` date DEFAULT NULL,
  `ADMIT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ADFRAME_USERROLE_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_USER_FOTOALBUM`
--

CREATE TABLE `ADFRAME_USER_FOTOALBUM` (
  `ADFRAME_USER_FOTOALBUM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_CHANNEL` varchar(200) NOT NULL DEFAULT '',
  `ADFRAME_USER_ID` varchar(200) NOT NULL DEFAULT '',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `TEXT` text,
  `COUNT` int(11) DEFAULT NULL,
  `VIEWCOUNT` int(11) DEFAULT NULL,
  `TITLE_IMG` varchar(10) DEFAULT NULL,
  `RANK` int(11) DEFAULT NULL,
  `UP_DATE` datetime DEFAULT NULL,
  `CR_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `IS_ACTIVE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ADFRAME_USER_FOTOALBUM_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ADFRAME_USER_FOTOS`
--

CREATE TABLE `ADFRAME_USER_FOTOS` (
  `ADFRAME_USER_FOTO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_CHANNEL` varchar(20) NOT NULL DEFAULT '',
  `ADFRAME_USER_ID` int(11) NOT NULL DEFAULT '0',
  `ADFRAME_USER_FOTOALBUM_ID` int(11) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `TEXT` text,
  `CREDIT` varchar(255) DEFAULT NULL,
  `RIDER` varchar(255) DEFAULT NULL,
  `SPOT` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(255) DEFAULT NULL,
  `ITEM_0` varchar(255) DEFAULT NULL,
  `ITEM_1` varchar(255) DEFAULT NULL,
  `ITEM_2` varchar(255) DEFAULT NULL,
  `ITEM_3` varchar(255) DEFAULT NULL,
  `URL` varchar(255) NOT NULL DEFAULT '',
  `VIEWCOUNT` int(11) DEFAULT NULL,
  `RANK` int(11) DEFAULT NULL,
  `ALLOW_RATE` varchar(10) DEFAULT NULL,
  `ALLOW_COMMENTS` varchar(10) DEFAULT NULL,
  `CR_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `IS_ACTIVE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ADFRAME_USER_FOTO_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `COM_POESIE_EMAIL`
--

CREATE TABLE `COM_POESIE_EMAIL` (
  `COM_POESIE_EMAIL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SENDER_ADFRAME_USER_ID` int(11) DEFAULT NULL,
  `SENDER_LOGIN` varchar(127) DEFAULT NULL,
  `RECIPIENT_ADFRAME_USER_ID` int(11) DEFAULT NULL,
  `RECIPIENT_LOGIN` varchar(127) DEFAULT NULL,
  `STATUS_SENDER` varchar(15) DEFAULT NULL,
  `STATUS_RECIPIENT` varchar(15) DEFAULT NULL,
  `EMAIL_SUBJECT` varchar(127) DEFAULT NULL,
  `EMAIL_COMMENT` text,
  `HIDDEN_FIELD` varchar(127) DEFAULT NULL,
  `CR_DATE` datetime DEFAULT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL,
  PRIMARY KEY (`COM_POESIE_EMAIL_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FORUM_USER`
--

CREATE TABLE `FORUM_USER` (
  `FORUM_USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADFRAME_USER_ID` int(11) NOT NULL DEFAULT '0',
  `FIRSTNAME` varchar(200) DEFAULT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `SHOW_NAME` varchar(10) NOT NULL DEFAULT '',
  `EMAIL` varchar(255) NOT NULL DEFAULT '',
  `AGE` varchar(255) DEFAULT NULL,
  `ITEM_0` varchar(255) DEFAULT NULL,
  `ITEM_1` varchar(255) DEFAULT NULL,
  `ITEM_2` varchar(255) DEFAULT NULL,
  `ITEM_3` varchar(255) DEFAULT NULL,
  `ITEM_4` varchar(255) DEFAULT NULL,
  `ITEM_5` varchar(255) DEFAULT NULL,
  `ITEM_6` varchar(255) DEFAULT NULL,
  `ITEM_7` varchar(255) DEFAULT NULL,
  `ITEM_8` varchar(255) DEFAULT NULL,
  `ITEM_9` varchar(255) DEFAULT NULL,
  `ITEM_10` varchar(255) DEFAULT NULL,
  `ITEM_11` varchar(255) DEFAULT NULL,
  `ITEM_12` varchar(255) DEFAULT NULL,
  `ITEM_13` varchar(255) DEFAULT NULL,
  `ITEM_14` varchar(255) DEFAULT NULL,
  `ITEM_15` varchar(255) DEFAULT NULL,
  `ITEM_16` varchar(255) DEFAULT NULL,
  `ITEM_17` varchar(255) DEFAULT NULL,
  `ITEM_18` varchar(255) DEFAULT NULL,
  `ITEM_19` varchar(255) DEFAULT NULL,
  `ITEM_20` varchar(255) DEFAULT NULL,
  `ITEM_21` varchar(255) DEFAULT NULL,
  `ITEM_22` varchar(255) DEFAULT NULL,
  `ITEM_23` varchar(255) DEFAULT NULL,
  `ITEM_24` varchar(255) DEFAULT NULL,
  `ITEM_25` varchar(255) DEFAULT NULL,
  `ITEM_26` varchar(255) DEFAULT NULL,
  `ITEM_27` varchar(255) DEFAULT NULL,
  `ITEM_28` varchar(255) DEFAULT NULL,
  `ITEM_29` varchar(255) DEFAULT NULL,
  `IMAGE` varchar(250) DEFAULT NULL,
  `IMAGE_1` varchar(127) DEFAULT NULL,
  `IMAGE_2` varchar(127) DEFAULT NULL,
  `IMAGE_3` varchar(127) DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `LOGIN_COUNT` int(11) DEFAULT NULL,
  `LAST_VIEW` datetime DEFAULT NULL,
  `VIEW_COUNT` int(11) DEFAULT NULL,
  `CR_DATE` datetime DEFAULT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL,
  PRIMARY KEY (`FORUM_USER_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
