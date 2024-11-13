ALTER TABLE `xpm_user`
ADD COLUMN `display_page` int(11) unsigned NULL,
ADD COLUMN `home_custom` varchar(128) NULL,
ADD CONSTRAINT `FK_xpm_user_mst_display_page` FOREIGN KEY (`display_page`) REFERENCES `xpm_menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;