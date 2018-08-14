-- --------------------------------------------------------
-- Host:                         az-serwer1837181.online.pro
-- Wersja serwera:               5.7.22-22-log - MySQL Community Server (GPL)
-- Serwer OS:                    Linux
-- HeidiSQL Wersja:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Zrzut struktury tabela 00153346_monitoring.monitoring
DROP TABLE IF EXISTS `monitoring`;
CREATE TABLE IF NOT EXISTS `monitoring` (
  `data` int(11) NOT NULL,
  `cpu1` float NOT NULL,
  `cpu2` float NOT NULL,
  `cpu3` float NOT NULL,
  `mtot` int(8) NOT NULL,
  `mfree` int(8) NOT NULL,
  `mava` int(8) NOT NULL,
  `msw` int(8) NOT NULL,
  `mca` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `temp0` int(3) NOT NULL,
  `temp1` int(3) NOT NULL,
  `pmin` float NOT NULL,
  `pavg` float NOT NULL,
  `pmax` float NOT NULL,
  `pmdev` float NOT NULL,
  `pminl` float DEFAULT NULL,
  `pavgl` float DEFAULT NULL,
  `pmaxl` float DEFAULT NULL,
  `pmdevl` float DEFAULT NULL,
  `mtu` smallint(6) DEFAULT NULL,
  `met` tinyint(4) DEFAULT NULL,
  `rxok` bigint(20) DEFAULT NULL,
  `rxerr` int(11) DEFAULT NULL,
  `rxdrp` int(11) DEFAULT NULL,
  `rxovr` int(11) DEFAULT NULL,
  `txok` bigint(20) DEFAULT NULL,
  `txerr` int(11) DEFAULT NULL,
  `txdrp` int(11) DEFAULT NULL,
  `txovr` int(11) DEFAULT NULL,
  `eth0speed` smallint(6) DEFAULT NULL,
  UNIQUE KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
