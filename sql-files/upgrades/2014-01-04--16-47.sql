#1388854043
ALTER TABLE `mapreg` ADD PRIMARY KEY (`varname`, `index`);
ALTER TABLE `mapreg` DROP INDEX `varname`;
ALTER TABLE `mapreg` DROP INDEX `index`;
ALTER TABLE `mapreg` MODIFY `varname` VARCHAR(32) BINARY NOT NULL;
CREATE TABLE IF NOT EXISTS `acc_reg_num_db` (
  `account_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `key` VARCHAR(32) BINARY NOT NULL DEFAULT '',
  `index` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `value` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`,`key`,`index`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM;
CREATE TABLE IF NOT EXISTS `acc_reg_str_db` (
  `account_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `key` VARCHAR(32) BINARY NOT NULL DEFAULT '',
  `index` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `value` VARCHAR(254) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`,`key`,`index`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM;
CREATE TABLE IF NOT EXISTS `char_reg_num_db` (
  `char_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `key` VARCHAR(32) BINARY NOT NULL DEFAULT '',
  `index` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `value` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_id`,`key`,`index`),
  KEY `char_id` (`char_id`)
) ENGINE=MyISAM;
CREATE TABLE IF NOT EXISTS `char_reg_str_db` (
  `char_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `key` VARCHAR(32) BINARY NOT NULL DEFAULT '',
  `index` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `value` VARCHAR(254) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_id`,`key`,`index`),
  KEY `char_id` (`char_id`)
) ENGINE=MyISAM;
CREATE TABLE IF NOT EXISTS `global_acc_reg_num_db` (
  `account_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `key` VARCHAR(32) BINARY NOT NULL DEFAULT '',
  `index` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `value` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`,`key`,`index`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM;
CREATE TABLE IF NOT EXISTS `global_acc_reg_str_db` (
  `account_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `key` VARCHAR(32) BINARY NOT NULL DEFAULT '',
  `index` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `value` VARCHAR(254) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`,`key`,`index`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM;
INSERT INTO `acc_reg_num_db` (`account_id`, `key`, `index`, `value`) SELECT `account_id`, `str`, 0, `value` FROM `global_reg_value` WHERE `type` = 2 AND `str` NOT LIKE '%$';
INSERT INTO `acc_reg_str_db` (`account_id`, `key`, `index`, `value`) SELECT `account_id`, `str`, 0, `value` FROM `global_reg_value` WHERE `type` = 2 AND `str` LIKE '%$';
INSERT INTO `char_reg_num_db` (`char_id`, `key`, `index`, `value`) SELECT `char_id`, `str`, 0, `value` FROM `global_reg_value` WHERE `type` = 3 AND `str` NOT LIKE '%$';
INSERT INTO `char_reg_str_db` (`char_id`, `key`, `index`, `value`) SELECT `char_id`, `str`, 0, `value` FROM `global_reg_value` WHERE `type` = 3 AND `str` LIKE '%$';
INSERT INTO `global_acc_reg_num_db` (`account_id`, `key`, `index`, `value`) SELECT `account_id`, `str`, 0, `value` FROM `global_reg_value` WHERE `type` = 1 AND `str` NOT LIKE '%$';
INSERT INTO `global_acc_reg_str_db` (`account_id`, `key`, `index`, `value`) SELECT `account_id`, `str`, 0, `value` FROM `global_reg_value` WHERE `type` = 1 AND `str` LIKE '%$';
# DROP TABLE `global_reg_value`;
INSERT INTO `sql_updates` (`timestamp`) VALUES (1388854043);
