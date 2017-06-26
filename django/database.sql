BEGIN;
--
-- Create model Permission
--
CREATE TABLE `auth_permission` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(50) NOT NULL, `content_type_id` integer NOT NULL, `codename` varchar(100) NOT NULL);
--
-- Create model Group
--
CREATE TABLE `auth_group` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(80) NOT NULL UNIQUE);
CREATE TABLE `auth_group_permissions` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `group_id` integer NOT NULL, `permission_id` integer NOT NULL);
--
-- Create model User
--
ALTER TABLE `auth_permission` ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);
ALTER TABLE `auth_permission` ADD CONSTRAINT `auth_permission_content_type_id_codename_01ab375a_uniq` UNIQUE (`content_type_id`, `codename`);
ALTER TABLE `auth_group_permissions` ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);
ALTER TABLE `auth_group_permissions` ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);
ALTER TABLE `auth_group_permissions` ADD CONSTRAINT `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` UNIQUE (`group_id`, `permission_id`);
COMMIT;
BEGIN;
--
-- Create model LogEntry
--
CREATE TABLE `django_admin_log` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `action_time` datetime(6) NOT NULL, `object_id` longtext NULL, `object_repr` varchar(200) NOT NULL, `action_flag` smallint UNSIGNED NOT NULL, `change_message` longtext NOT NULL, `content_type_id` integer NULL, `user_id` integer NOT NULL);
ALTER TABLE `django_admin_log` ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);
ALTER TABLE `django_admin_log` ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_farmapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `farmapp_user` (`id`);
COMMIT;
BEGIN;
--
-- Create model ContentType
--
CREATE TABLE `django_content_type` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `name` varchar(100) NOT NULL, `app_label` varchar(100) NOT NULL, `model` varchar(100) NOT NULL);
--
-- Alter unique_together for contenttype (1 constraint(s))
--
ALTER TABLE `django_content_type` ADD CONSTRAINT `django_content_type_app_label_model_76bd3d3b_uniq` UNIQUE (`app_label`, `model`);
COMMIT;
BEGIN;
--
-- Create model User
--
CREATE TABLE `farmapp_user` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `password` varchar(128) NOT NULL, `last_login` datetime(6) NULL, `email` varchar(254) NOT NULL UNIQUE, `first_name` varchar(100) NULL, `last_name` varchar(100) NULL, `address_line1` varchar(100) NULL, `address_line2` varchar(100) NULL, `state` varchar(100) NULL, `country` varchar(100) NULL, `pin_code` varchar(20) NULL, `user_type` varchar(20) NOT NULL, `contact` longtext NOT NULL, `is_active` bool NOT NULL, `is_admin` bool NOT NULL);
--
-- Create model Alert
--
CREATE TABLE `farmapp_alert` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `message` longtext NOT NULL, `timestamp` datetime(6) NOT NULL, `user_id_id` integer NOT NULL);
--
-- Create model Cart
--
CREATE TABLE `farmapp_cart` (`cart_id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY);
--
-- Create model Cart_session
--
CREATE TABLE `farmapp_cart_session` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `cart_id_id` integer NOT NULL);
--
-- Create model Crop
--
CREATE TABLE `farmapp_crop` (`crop_id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `local_name` varchar(100) NULL, `english_name` varchar(100) NULL, `short_name` varchar(11) NOT NULL, `scientific_name` varchar(100) NULL, `shelf_life` integer NOT NULL, `imagepath` varchar(100) NULL, `availability` double precision NOT NULL, `price` double precision NOT NULL);
--
-- Create model Inventory
--
CREATE TABLE `farmapp_inventory` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `weight` double precision NOT NULL, `sold` double precision NOT NULL, `wasted` double precision NOT NULL, `minimum` double precision NOT NULL, `maximum` double precision NOT NULL, `price` double precision NOT NULL, `shelf_life` integer NOT NULL, `crop_id_id` integer NOT NULL, `user_id_id` integer NOT NULL);
--
-- Create model Machine
--
CREATE TABLE `farmapp_machine` (`machine_id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `password` varchar(20) NOT NULL, `location` varchar(255) NOT NULL, `date_of_manufacture` datetime(6) NOT NULL, `version` varchar(20) NOT NULL, `last_login` datetime(6) NOT NULL, `user_id_id` integer NULL);
--
-- Create model Order
--
CREATE TABLE `farmapp_order` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `weight` double precision NOT NULL, `time` datetime(6) NOT NULL, `delivery_date` datetime(6) NULL, `status` varchar(20) NOT NULL, `cart_id_id` integer NOT NULL, `crop_id_id` integer NOT NULL, `seller_id` integer NOT NULL, `user_id_id` integer NOT NULL);
--
-- Create model Produce
--
CREATE TABLE `farmapp_produce` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `image` varchar(255) NOT NULL, `weight` double precision NOT NULL, `timestamp` datetime(6) NOT NULL, `date_of_produce` datetime(6) NOT NULL, `date_of_expiry` datetime(6) NOT NULL, `sold` double precision NOT NULL, `wasted` double precision NOT NULL, `crop_id_id` integer NOT NULL, `machine_id_id` integer NOT NULL);
--
-- Create model Trough
--
CREATE TABLE `farmapp_trough` (`trough_id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `machine_id_id` integer NOT NULL);
--
-- Add field trough_id to produce
--
ALTER TABLE `farmapp_produce` ADD COLUMN `trough_id_id` integer NOT NULL;
--
-- Add field crop_id to cart_session
--
ALTER TABLE `farmapp_cart_session` ADD COLUMN `crop_id_id` integer NOT NULL;
--
-- Add field last_cart to user
--
ALTER TABLE `farmapp_user` ADD COLUMN `last_cart_id` integer NULL;
ALTER TABLE `farmapp_alert` ADD CONSTRAINT `farmapp_alert_user_id_id_67c2a510_fk_farmapp_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`id`);
ALTER TABLE `farmapp_cart_session` ADD CONSTRAINT `farmapp_cart_session_cart_id_id_4dabe9fb_fk_farmapp_cart_cart_id` FOREIGN KEY (`cart_id_id`) REFERENCES `farmapp_cart` (`cart_id`);
ALTER TABLE `farmapp_inventory` ADD CONSTRAINT `farmapp_inventory_crop_id_id_796a261e_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`);
ALTER TABLE `farmapp_inventory` ADD CONSTRAINT `farmapp_inventory_user_id_id_bda51212_fk_farmapp_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`id`);
ALTER TABLE `farmapp_machine` ADD CONSTRAINT `farmapp_machine_user_id_id_3e6c5fdf_fk_farmapp_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`id`);
ALTER TABLE `farmapp_order` ADD CONSTRAINT `farmapp_order_cart_id_id_cb534eca_fk_farmapp_cart_cart_id` FOREIGN KEY (`cart_id_id`) REFERENCES `farmapp_cart` (`cart_id`);
ALTER TABLE `farmapp_order` ADD CONSTRAINT `farmapp_order_crop_id_id_81eaee8e_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`);
ALTER TABLE `farmapp_order` ADD CONSTRAINT `farmapp_order_seller_id_5b7e2bce_fk_farmapp_user_id` FOREIGN KEY (`seller_id`) REFERENCES `farmapp_user` (`id`);
ALTER TABLE `farmapp_order` ADD CONSTRAINT `farmapp_order_user_id_id_8205f9ff_fk_farmapp_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `farmapp_user` (`id`);
ALTER TABLE `farmapp_produce` ADD CONSTRAINT `farmapp_produce_crop_id_id_d170d24e_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`);
ALTER TABLE `farmapp_produce` ADD CONSTRAINT `farmapp_produce_machine_id_id_b2525ee0_fk_farmapp_m` FOREIGN KEY (`machine_id_id`) REFERENCES `farmapp_machine` (`machine_id`);
ALTER TABLE `farmapp_trough` ADD CONSTRAINT `farmapp_trough_machine_id_id_e0fc7ec1_fk_farmapp_m` FOREIGN KEY (`machine_id_id`) REFERENCES `farmapp_machine` (`machine_id`);
ALTER TABLE `farmapp_produce` ADD CONSTRAINT `farmapp_produce_trough_id_id_a8e49ad8_fk_farmapp_t` FOREIGN KEY (`trough_id_id`) REFERENCES `farmapp_trough` (`trough_id`);
ALTER TABLE `farmapp_cart_session` ADD CONSTRAINT `farmapp_cart_session_crop_id_id_e003bfe0_fk_farmapp_crop_crop_id` FOREIGN KEY (`crop_id_id`) REFERENCES `farmapp_crop` (`crop_id`);
ALTER TABLE `farmapp_user` ADD CONSTRAINT `farmapp_user_last_cart_id_e22636f5_fk_farmapp_cart_cart_id` FOREIGN KEY (`last_cart_id`) REFERENCES `farmapp_cart` (`cart_id`);
COMMIT;
BEGIN;
--
-- Create model Session
--
CREATE TABLE `django_session` (`session_key` varchar(40) NOT NULL PRIMARY KEY, `session_data` longtext NOT NULL, `expire_date` datetime(6) NOT NULL);
CREATE INDEX `django_session_expire_date_a5c62663` ON `django_session` (`expire_date`);
COMMIT;
