SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE IF NOT EXISTS `alerts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `type` ENUM('stuck-transfer', 'poloniex-withdrawal-limit') NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `balances`
--

CREATE TABLE IF NOT EXISTS `balances` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `coin` char(5) NOT NULL,
  `value` varchar(18) NOT NULL,
  `raw` varchar(18) NOT NULL,
  `ID_exchange` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `coin` (`coin`),
  KEY `ID_exchange` (`ID_exchange`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exchange_trades`
--
CREATE TABLE `exchange_trades` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `ID_exchange` int(11) NOT NULL,
  `type` ENUM('buy', 'sell') NOT NULL,
  `coin` char(5) NOT NULL,
  `currency` char(5) NOT NULL,
  `raw_trade_ID` varchar(255) NOT NULL,
  `trade_ID` varchar(255) NOT NULL,
  `rate` varchar(18) NOT NULL,
  `amount` varchar(18) NOT NULL,
  `fee` varchar(18) NOT NULL,
  `total` varchar(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY (`ID_exchange`, `raw_trade_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `management`
--

CREATE TABLE IF NOT EXISTS `management` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `ID_exchange` int(11) NOT NULL,
  `coin` char(5) NOT NULL,
  `amount` varchar(18) NOT NULL,
  `rate` varchar(18) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
--
-- Table structure for table `profits`
--

CREATE TABLE IF NOT EXISTS `profits` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `currency` char(5) NOT NULL,
  `amount` varchar(18) NOT NULL,
  `cash_restock_percent` varchar(18) NOT NULL,
  `cash_restock_amount` varchar(18) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `profit_loss`
--
CREATE TABLE `profit_loss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `ID_exchange_source` int(11) NOT NULL,
  `ID_exchange_target` int(11) NOT NULL,
  `coin` char(5) NOT NULL,
  `currency` char(5) NOT NULL,
  `raw_trade_IDs_buy` varchar(4096) NOT NULL,
  `trade_IDs_buy` varchar(4096) NOT NULL,
  `raw_trade_IDs_sell` varchar(4096) NOT NULL,
  `trade_IDs_sell` varchar(4096) NOT NULL,
  `rate_buy` varchar(18) NOT NULL,
  `rate_sell` varchar(18) NOT NULL,
  `tradeable_bought` varchar(18) NOT NULL,
  `tradeable_sold` varchar(18) NOT NULL,
  `currency_bought` varchar(18) NOT NULL,
  `currency_sold` varchar(18) NOT NULL,
  `currency_revenue` varchar(18) NOT NULL,
  `currency_pl` varchar(18) NOT NULL,
  `tradeable_tx_fee` varchar(18) NOT NULL,
  `currency_tx_fee` varchar(18) NOT NULL,
  `buy_fee` varchar(18) NOT NULL,
  `sell_fee` varchar(18) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `snapshot`
--

CREATE TABLE IF NOT EXISTS `snapshot` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `coin` char(5) NOT NULL,
  `balance` varchar(18) NOT NULL,
  `desired_balance` varchar(18) DEFAULT NULL,
  `uses` int(11) NOT NULL,
  `trades` int(11) NOT NULL,
  `rate` varchar(18) NOT NULL,
  `ID_exchange` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `created` (`created`),
  KEY `coin` (`coin`),
  KEY `ID_exchange` (`ID_exchange`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE IF NOT EXISTS `stats` (
  `keyy` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`keyy`),
  KEY `key` (`keyy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE IF NOT EXISTS `track` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `coin` char(5) NOT NULL,
  `amount` varchar(18) NOT NULL,
  `profit` varchar(18) NOT NULL,
  `ID_exchange` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trade`
--

CREATE TABLE IF NOT EXISTS `trade` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `coin` char(5) NOT NULL,
  `currency` char(3) NOT NULL,
  `amount` varchar(18) NOT NULL,
  `ID_exchange_source` int(11) NOT NULL,
  `ID_exchange_target` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal`
--

CREATE TABLE IF NOT EXISTS `withdrawal` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `ID_exchange_source` int(11) NOT NULL,
  `ID_exchange_target` int(11) NOT NULL,
  `coin` char(5) NOT NULL,
  `amount` varchar(18) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
