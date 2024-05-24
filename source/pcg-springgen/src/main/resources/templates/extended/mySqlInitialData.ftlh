INSERT INTO `mst_user_type` (`user_type`, `description`,`created_by`,`created_on`)
VALUES 
  ('Admin', 'Administrators have the highest level of access to an account','admin',current_timestamp()),
  ('Power User', 'Power Users know how Application actually performing','admin',current_timestamp()),
  ('End User', 'End User will have limited access to the account','admin',current_timestamp());
 
 INSERT INTO xpm_menu (id,parent, name, code, display_order, created_by, created_on) 
values
(1,null,'Home','home',1,'admin',current_timestamp()),
(2,null,'Administration','Administration',2,'admin',current_timestamp()),
(3,2, 'User Management', 'userMgmt', 1, 'admin', current_timestamp()),
(4,3, 'Users', 'admin/userManagement', 1, 'admin', current_timestamp()),
(5,3, 'Groups', 'admin/groups', 2, 'admin', current_timestamp()),
(6,null, 'Application', 'application', 1, 'admin', current_timestamp());


INSERT INTO `xpm_user` (display_name,login_name, email, gender, dob, first_name, last_name, user_type, phone_number, address, home_menu, random, salt, created_by, created_on, last_upd_by, last_upd_on) VALUES
    ('Admin', 'admin@gmail.com','admin@gmail.com', 'M', '2023-09-04', 'Admin', 'A', 1,'000002345','0/001,West Street,Chennai - 001', 1, NULL, 'ad', 'raja', current_timestamp(), NULL, NULL);
   
   
INSERT INTO xpm_group (name,description, active, created_by, created_on) 
values
('admin','admin',1,'admin',current_timestamp());

INSERT INTO xpm_acl_user (group_id,user_id, active, created_by, created_on) 
values
(1,1,1,'admin',current_timestamp());

INSERT INTO xpm_acl_menu (group_id,menu_id, mask, created_by, created_on) 
values
(1,1,2,'admin',current_timestamp()),
(1,2,2,'admin',current_timestamp()),
(1,3,2,'admin',current_timestamp()),
(1,4,2,'admin',current_timestamp()),
(1,5,2,'admin',current_timestamp()),
(1,6,2,'admin',current_timestamp());