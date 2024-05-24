INSERT INTO `mst_user_type` (`user_type`, `description`,`created_by`,`created_on`)
VALUES 
  ('Admin', 'Administrators have the highest level of access to an account','admin',current_timestamp()),
  ('Power User', 'Power Users know how Application actually performing','admin',current_timestamp()),
  ('End User', 'End User will have limited access to the account','admin',current_timestamp());


INSERT INTO `xpm_user` (display_name,login_name, email, gender, dob, first_name, last_name, user_type, phone_number, address, random, salt, created_by, created_on, last_upd_by, last_upd_on) VALUES
    ('Admin', 'admin@gmail.com','admin@gmail.com', 'M', '2023-09-04', 'Admin', 'A', 1,'000002345','0/001,West Street,Chennai - 001', NULL, 'ad', 'raja', current_timestamp(), NULL, NULL);
   