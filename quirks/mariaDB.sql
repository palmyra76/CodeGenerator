ALTER TABLE `xpm_user`
ADD COLUMN `home_menu` int(11) unsigned NULL,
ADD COLUMN `home_custom` varchar(128) NULL,
ADD CONSTRAINT `FK_xpm_user_mst_display_page` FOREIGN KEY (`home_menu`) REFERENCES `xpm_menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;