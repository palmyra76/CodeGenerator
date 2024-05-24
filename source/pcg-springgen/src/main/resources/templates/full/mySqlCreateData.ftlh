
CREATE TABLE IF NOT EXISTS `mst_user_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(24) NOT NULL,
  `description` varchar(128) NULL,
  `created_by` varchar(128) NOT NULL,
  `created_on` datetime NOT NULL,
  `last_upd_by` varchar(128) DEFAULT NULL,
  `last_upd_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_mst_user_type_user_type` (`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `xpm_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `display_name` varchar(64) NOT NULL,
  `login_name` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `gender` CHAR(1) NULL,  
  `dob` DATE NULL,
  `first_name` varchar(64) NULL,
  `last_name` varchar(64) NULL,
  `user_type` int(11) unsigned NOT NULL,
  `phone_number` varchar(64) NULL,
  `address` varchar(255) NULL,
  `random` varchar(128) NULL,
  `salt` varchar(128) NULL,
  `created_by` varchar(128) NOT NULL,
  `created_on` datetime NOT NULL,
  `last_upd_by` varchar(128) DEFAULT NULL,
  `last_upd_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_xpm_user_user_name` (`login_name`),
  UNIQUE KEY `uq_xpm_user_email` (`email`),
  UNIQUE KEY `uq_first_name_last_name` (`first_name`, `last_name`),
  CONSTRAINT `FK_xpm_user_mst_user_type` FOREIGN KEY (`user_type`) REFERENCES `mst_user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
