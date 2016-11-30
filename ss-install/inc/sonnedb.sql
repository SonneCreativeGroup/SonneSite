/*

MySQL Data Transfer

Source Host: 173.201.33.198

Source Database: lmg_site_template

Target Host: 173.201.33.198

Target Database: lmg_site_template

Date: 3/29/2013 12:00:05 PM

*/



SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------

-- Table structure for lmg_administrators

-- ----------------------------

DROP TABLE IF EXISTS `lmg_administrators`;

CREATE TABLE `lmg_administrators` (

  `aid` int(11) NOT NULL AUTO_INCREMENT,
		
  `adm_active` enum('1','0') DEFAULT '1',
	
  `adm_access` varchar(25) DEFAULT NULL,
	
  `adm_firstname` varchar(50) NOT NULL,
	
  `adm_lastname` varchar(50) NOT NULL,
	
  `adm_email` varchar(250) DEFAULT NULL,
	
  `adm_username` varchar(50) NOT NULL,
	
  `adm_password` varchar(50) NOT NULL,

  PRIMARY KEY (`aid`)

) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_boxes

-- ----------------------------

DROP TABLE IF EXISTS `lmg_boxes`;

CREATE TABLE `lmg_boxes` (

  `bid` int(11) NOT NULL AUTO_INCREMENT,

  `box_title` varchar(255) DEFAULT NULL,

  `box_contents` text,

  `sort` int(11) DEFAULT NULL,

  PRIMARY KEY (`bid`)

) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_calendar

-- ----------------------------

DROP TABLE IF EXISTS `lmg_calendar`;

CREATE TABLE `lmg_calendar` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `cal_title` varchar(255) DEFAULT NULL,

  `cal_description` longtext,

  `cal_startdate` varchar(10) DEFAULT NULL,

  `cal_starttime` varchar(10) DEFAULT NULL,

  `cal_enddate` varchar(10) DEFAULT NULL,

  `cal_endtime` varchar(10) DEFAULT NULL,

  `cal_pdf` varchar(255) DEFAULT NULL,

  `cal_featured` enum('no','yes') DEFAULT 'no',

  `cal_registration` enum('no','yes') DEFAULT 'no',

  `cal_memberprice` double(9,2) NOT NULL DEFAULT '0.00',

  `cal_nonmemberprice` double(9,2) NOT NULL DEFAULT '0.00',

  PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_calendar_options

-- ----------------------------

DROP TABLE IF EXISTS `lmg_calendar_options`;

CREATE TABLE `lmg_calendar_options` (

  `oid` int(11) NOT NULL AUTO_INCREMENT,

  `cid` int(11) DEFAULT NULL,

  `cal_opt_type` varchar(10) DEFAULT NULL,

  `cal_opt_name` varchar(255) DEFAULT NULL,

  `cal_opt_values` text,

  `cal_opt_pricedifference` double(9,2) DEFAULT NULL,

  PRIMARY KEY (`oid`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_cart_categories

-- ----------------------------

DROP TABLE IF EXISTS `lmg_cart_categories`;

CREATE TABLE `lmg_cart_categories` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `category_parent` int(11) DEFAULT '0',

  `category_name` varchar(255) DEFAULT NULL,

  `category_description` text,

  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_cart_orders

-- ----------------------------

DROP TABLE IF EXISTS `lmg_cart_orders`;

CREATE TABLE `lmg_cart_orders` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `oid` varchar(255) DEFAULT NULL,

  `mid` int(11) DEFAULT NULL,

  `customer_name` varchar(255) DEFAULT NULL,

  `email` varchar(255) DEFAULT NULL,

  `phone` varchar(20) DEFAULT NULL,

  `customer_company` varchar(255) DEFAULT NULL,

  `billing_address` text,

  `shipping_address` text,

  `products` text,

  `subtotal` double(9,2) DEFAULT NULL,

  `tax` double(9,2) DEFAULT NULL,

  `discounts` double(9,2) DEFAULT NULL,

  `total` double(9,2) DEFAULT NULL,

  `order_date` varchar(20) DEFAULT NULL,

  PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_cart_product_options

-- ----------------------------

DROP TABLE IF EXISTS `lmg_cart_product_options`;

CREATE TABLE `lmg_cart_product_options` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `pid` int(11) DEFAULT NULL,

  `option_name` varchar(255) DEFAULT NULL,

  `option_value` varchar(255) DEFAULT NULL,

  `option_price` double(9,2) DEFAULT '0.00',

  PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_cart_products

-- ----------------------------

DROP TABLE IF EXISTS `lmg_cart_products`;

CREATE TABLE `lmg_cart_products` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `cid` int(11) DEFAULT NULL,

  `product_name` varchar(255) DEFAULT NULL,

  `product_description` text,

  `product_price` double(9,2) DEFAULT NULL,

  `product_image` varchar(255) DEFAULT NULL,

  `taxable` enum('no','yes') DEFAULT 'yes',

  `stock` int(11) DEFAULT NULL,

  PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_condolences

-- ----------------------------

DROP TABLE IF EXISTS `lmg_condolences`;

CREATE TABLE `lmg_condolences` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `publish` enum('no','yes') DEFAULT 'no',

  `obit` int(11) DEFAULT NULL,

  `name` varchar(255) DEFAULT NULL,

  `condolence` text,

  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_configuration

-- ----------------------------

DROP TABLE IF EXISTS `lmg_configuration`;

CREATE TABLE `lmg_configuration` (

  `cid` int(11) NOT NULL AUTO_INCREMENT,

  `conf_key` varchar(255) DEFAULT NULL,

  `conf_value` text,

  PRIMARY KEY (`cid`)

) ENGINE=InnoDB AUTO_INCREMENT=1061 DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_galleries

-- ----------------------------

DROP TABLE IF EXISTS `lmg_galleries`;

CREATE TABLE `lmg_galleries` (

  `gid` int(11) NOT NULL AUTO_INCREMENT,

  `gallery_name` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`gid`)

) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_gallery_photos

-- ----------------------------

DROP TABLE IF EXISTS `lmg_gallery_photos`;

CREATE TABLE `lmg_gallery_photos` (

  `pid` int(11) NOT NULL AUTO_INCREMENT,

  `gid` int(11) DEFAULT NULL,

  `gallery_photo` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`pid`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_members

-- ----------------------------

DROP TABLE IF EXISTS `lmg_members`;

CREATE TABLE `lmg_members` (

  `mid` int(11) NOT NULL AUTO_INCREMENT,

  `mbr_type` enum('Industry Partner','Member Firm') DEFAULT NULL,

  `date_joined` varchar(20) DEFAULT NULL,

  `date_expires` varchar(20) DEFAULT NULL,

  `mbr_active` int(1) DEFAULT '1',

  `mbr_dues` double(9,2) DEFAULT NULL,

  `mbr_firstname` varchar(50) DEFAULT NULL,

  `mbr_lastname` varchar(50) DEFAULT NULL,

  `mbr_company` varchar(255) DEFAULT NULL,

  `mbr_email` varchar(100) DEFAULT NULL,

  `mbr_phone` varchar(20) DEFAULT NULL,

  `mbr_address` varchar(100) DEFAULT NULL,

  `mbr_city` varchar(50) DEFAULT NULL,

  `mbr_state` varchar(50) DEFAULT NULL,

  `mbr_zip` varchar(20) DEFAULT NULL,

  `mbr_username` varchar(50) DEFAULT NULL,

  `mbr_password` varchar(50) DEFAULT NULL,

  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (`mid`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_navigation

-- ----------------------------

DROP TABLE IF EXISTS `lmg_navigation`;

CREATE TABLE `lmg_navigation` (

  `nid` int(11) NOT NULL AUTO_INCREMENT,

  `parent` int(11) DEFAULT NULL,

  `name` varchar(50) DEFAULT NULL,

  `link` text,

  `target` varchar(20) DEFAULT NULL,

  `sort` int(11) DEFAULT NULL,

  PRIMARY KEY (`nid`)

) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_obituaries

-- ----------------------------

DROP TABLE IF EXISTS `lmg_obituaries`;

CREATE TABLE `lmg_obituaries` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `publish` enum('no','yes') DEFAULT 'no',

  `comments` enum('yes','no') DEFAULT 'no',

  `firstname` varchar(100) DEFAULT NULL,

  `lastname` varchar(100) DEFAULT NULL,

  `birthdate` varchar(20) DEFAULT NULL,

  `deathdate` varchar(20) DEFAULT NULL,

  `visitationdate` varchar(20) DEFAULT NULL,

  `visitationtime` varchar(20) DEFAULT NULL,

  `visitationlocation` varchar(255) DEFAULT NULL,

  `visitationdescription` text,

  `memorialdate` varchar(20) DEFAULT NULL,

  `memorialtime` varchar(20) DEFAULT NULL,

  `memoriallocation` varchar(255) DEFAULT NULL,

  `memorialdescription` text,

  `funeraldate` varchar(20) DEFAULT NULL,

  `funeraltime` varchar(20) DEFAULT NULL,

  `funerallocation` varchar(255) DEFAULT NULL,

  `funeraldescription` text,

  `photo` varchar(100) DEFAULT NULL,

  `specialtyicon` varchar(100) DEFAULT NULL,

  `description` text,

  `dateadded` timestamp NULL DEFAULT NULL,

  `lastupdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_pages

-- ----------------------------

DROP TABLE IF EXISTS `lmg_pages`;

CREATE TABLE `lmg_pages` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `page_secured` int(11) DEFAULT '0',

  `page_name` varchar(255) DEFAULT NULL,

  `page_title` varchar(255) DEFAULT NULL,

  `page_keywords` text,

  `page_description` text,

  `page_heading` varchar(255) DEFAULT NULL,

  `page_body` text,

  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_prospects

-- ----------------------------

DROP TABLE IF EXISTS `lmg_prospects`;

CREATE TABLE `lmg_prospects` (

  `mid` int(11) NOT NULL AUTO_INCREMENT,

  `mbr_firstname` varchar(50) NOT NULL,

  `mbr_lastname` varchar(50) NOT NULL,

  `mbr_company` varchar(255) DEFAULT NULL,

  `mbr_email` varchar(100) DEFAULT NULL,

  `mbr_phone` varchar(20) DEFAULT NULL,

  `mbr_address` varchar(100) DEFAULT NULL,

  `mbr_city` varchar(50) DEFAULT NULL,

  `mbr_state` varchar(50) DEFAULT NULL,

  `mbr_zip` varchar(20) DEFAULT NULL,

  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (`mid`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_registrations

-- ----------------------------

DROP TABLE IF EXISTS `lmg_registrations`;

CREATE TABLE `lmg_registrations` (

  `rid` int(11) NOT NULL AUTO_INCREMENT,

  `eid` int(11) DEFAULT NULL,

  `reg_firstname` varchar(255) DEFAULT NULL,

  `reg_lastname` varchar(255) DEFAULT NULL,

  `reg_company` varchar(255) DEFAULT NULL,

  `reg_email` varchar(255) DEFAULT NULL,

  `reg_phone` varchar(255) DEFAULT NULL,

  `reg_attendees` text,

  PRIMARY KEY (`rid`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_slideshow

-- ----------------------------

DROP TABLE IF EXISTS `lmg_slideshow`;

CREATE TABLE `lmg_slideshow` (

  `sid` int(11) NOT NULL AUTO_INCREMENT,

  `file` varchar(255) DEFAULT NULL,

  `alt_text` text,

  `sort` int(11) DEFAULT NULL,

  PRIMARY KEY (`sid`)

) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for lmg_users

-- ----------------------------

DROP TABLE IF EXISTS `lmg_users`;

CREATE TABLE `lmg_users` (

  `mid` int(11) NOT NULL AUTO_INCREMENT,

  `date_joined` varchar(20) DEFAULT NULL,

  `date_expires` varchar(20) DEFAULT NULL,

  `mbr_active` int(1) DEFAULT '1',

  `mbr_dues` double(9,2) DEFAULT NULL,

  `mbr_firstname` varchar(50) DEFAULT NULL,

  `mbr_lastname` varchar(50) DEFAULT NULL,

  `mbr_company` varchar(255) DEFAULT NULL,

  `mbr_email` varchar(100) DEFAULT NULL,

  `mbr_phone` varchar(20) DEFAULT NULL,

  `mbr_address` varchar(100) DEFAULT NULL,

  `mbr_city` varchar(50) DEFAULT NULL,

  `mbr_state` varchar(50) DEFAULT NULL,

  `mbr_zip` varchar(20) DEFAULT NULL,

  `mbr_username` varchar(50) DEFAULT NULL,

  `mbr_password` varchar(50) DEFAULT NULL,

  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (`mid`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for lmg_scheduler_appointments
-- ----------------------------
DROP TABLE IF EXISTS `lmg_scheduler_appointments`;
CREATE TABLE `lmg_scheduler_appointments` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `app_date` varchar(255) NOT NULL,
  `app_time` varchar(255) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `app_email` varchar(255) NOT NULL,
  `app_phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `app_comments` text NOT NULL,
  `notes` text NOT NULL,
  `created_on` varchar(255) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for lmg_scheduler_hours
-- ----------------------------
DROP TABLE IF EXISTS `lmg_scheduler_hours`;
CREATE TABLE `lmg_scheduler_hours` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
	
  `scheduler_sunday` varchar(10) DEFAULT NULL,
	
  `scheduler_sunday_start_time` varchar(10) DEFAULT NULL,
	
  `scheduler_sunday_end_time` varchar(10) DEFAULT NULL,
	
  `scheduler_monday` varchar(10) DEFAULT NULL,
	
  `scheduler_monday_start_time` varchar(10) DEFAULT NULL,
	
  `scheduler_monday_end_time` varchar(10) DEFAULT NULL,
	
  `scheduler_tuesday` varchar(10) DEFAULT NULL,
	
  `scheduler_tuesday_start_time` varchar(10) DEFAULT NULL,
	
  `scheduler_tuesday_end_time` varchar(10) DEFAULT NULL,
	
  `scheduler_wednesday` varchar(10) DEFAULT NULL,
	
  `scheduler_wednesday_start_time` varchar(10) DEFAULT NULL,
	
  `scheduler_wednesday_end_time` varchar(10) DEFAULT NULL,
	
  `scheduler_thursday` varchar(10) DEFAULT NULL,
	
  `scheduler_thursday_start_time` varchar(10) DEFAULT NULL,
	
  `scheduler_thursday_end_time` varchar(10) DEFAULT NULL,
	
  `scheduler_friday` varchar(10) DEFAULT NULL,
	
  `scheduler_friday_start_time` varchar(10) DEFAULT NULL,
	
  `scheduler_friday_end_time` varchar(10) DEFAULT NULL,
	
  `scheduler_saturday` varchar(10) DEFAULT NULL,
	
  `scheduler_saturday_start_time` varchar(10) DEFAULT NULL,
	
  `scheduler_saturday_end_time` varchar(10) DEFAULT NULL,
	
  PRIMARY KEY (`hid`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for lmg_scheduler_services
-- ----------------------------
DROP TABLE IF EXISTS `lmg_scheduler_services`;
CREATE TABLE `lmg_scheduler_services` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
	
  `active` int(11) DEFAULT NULL,
	
  `service_name` varchar(255) DEFAULT NULL,
	
  `service_description` text,
	
  `service_length` int(11) DEFAULT NULL,
	
  PRIMARY KEY (`sid`)
	
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for lmg_scheduler_settings
-- ----------------------------
DROP TABLE IF EXISTS `lmg_scheduler_settings`;
CREATE TABLE `lmg_scheduler_settings` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
	
  `start_time` varchar(255) NOT NULL,
	
  `end_time` varchar(255) NOT NULL,
	
  `buffer_time` varchar(255) NOT NULL,
	
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for lmg_coupons
-- ----------------------------
DROP TABLE IF EXISTS `lmg_coupons`;
CREATE TABLE `lmg_coupons` (
  `couponHeading` varchar(255) DEFAULT '',
    
  `couponText` varchar(255) DEFAULT NULL,
    
  `couponExp` varchar(255) DEFAULT NULL,
    
  `bid` tinyint(11) NOT NULL AUTO_INCREMENT,
    
  `featured` enum('true','false') DEFAULT NULL,
    
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------

-- Records 

-- ----------------------------

INSERT INTO `lmg_administrators` VALUES ('1', '1', 'Administrator', 'Webmaster', 'Admin', '', 'admin', '167d8a5aa9ad40f7cf36357fc7b8dac82f7d490e');

INSERT INTO `lmg_administrators` VALUES ('2', '1', 'Basic', 'Andrew', 'Becker', 'ajbecker73@gmail.com', 'andrew', 'ed618cc03868348708f1bc765a3d5b4ce60315b1');

INSERT INTO `lmg_boxes` VALUES ('1', 'Quick Links', '<a href=\"http://www.lmgnow.com\" target=\"_blank\">Lifestyles Media Group</a><br />', '1');

INSERT INTO `lmg_cart_categories` VALUES ('1', '0', 'test', null);

INSERT INTO `lmg_configuration` VALUES ('1040', 'OFFLINE', 'false');

INSERT INTO `lmg_configuration` VALUES ('1041', 'COMPANY', 'My Company');

INSERT INTO `lmg_configuration` VALUES ('1042', 'COMPANY_ADDRESS', '123 My Way<br />My Town, USA 12345');

INSERT INTO `lmg_configuration` VALUES ('1043', 'COMPANY_PHONE', '(555) 555-5555');

INSERT INTO `lmg_configuration` VALUES ('1044', 'COMPANY_EMAIL', 'webmaster@lmgnow.com');

INSERT INTO `lmg_configuration` VALUES ('1045', 'SLIDESHOW', 'true');

INSERT INTO `lmg_configuration` VALUES ('1046', 'MEMBERS', 'false');

INSERT INTO `lmg_configuration` VALUES ('1047', 'CALENDAR', 'false');

INSERT INTO `lmg_configuration` VALUES ('1048', 'GALLERY', 'false');

INSERT INTO `lmg_configuration` VALUES ('1049', 'CART', 'false');

INSERT INTO `lmg_configuration` VALUES ('1050', 'OBITUARIES', 'false');

INSERT INTO `lmg_configuration` VALUES ('1051', 'GOOGLE', '');

INSERT INTO `lmg_configuration` VALUES ('1052', 'YAHOO', '');

INSERT INTO `lmg_configuration` VALUES ('1053', 'BING', '');

INSERT INTO `lmg_configuration` VALUES ('1054', 'MERCHANT', '');

INSERT INTO `lmg_configuration` VALUES ('1055', 'PP_UserName', '');

INSERT INTO `lmg_configuration` VALUES ('1056', 'PP_Password', '');

INSERT INTO `lmg_configuration` VALUES ('1057', 'PP_Signature', '');

INSERT INTO `lmg_configuration` VALUES ('1058', 'AN_TransactionKey', '');

INSERT INTO `lmg_configuration` VALUES ('1059', 'AN_Password', '');

INSERT INTO `lmg_configuration` VALUES ('1060', 'THEME', 'default');

INSERT INTO `lmg_navigation` VALUES ('1', '0', 'Home', '', '_self', '1');

INSERT INTO `lmg_navigation` VALUES ('3', '0', 'Contact', 'contact', '_self', '3');

INSERT INTO `lmg_navigation` VALUES ('39', '0', 'About Us', 'about-us', '_self', '2');

INSERT INTO `lmg_pages` VALUES ('1', '0', '', '', 'Page Keywords, Go, Here', 'Page Description Goes Here', 'Welcome', '<h1>Welcome</h1>\r\n\r\n<p>Coming Soon</p>\r\n\r\n<p>j hrjfhl fjk fkj kfjvb kdfjbv kdfvdfwvfdv&nbsp;</p>\r\n\r\n<p><a href=\\\"http://lmgnow.com\\\"><img alt=\\\"\\\" src=\\\"http://www.weblmg.com/andrew_template/uploads/4c13e43f4ece936e9ba1f7b78b97f638Chrysanthemum.jpg\\\" style=\\\"width: 300px; height: 225px; float: right;\\\" /></a>&nbsp;glbkmgbmlgb fgbfg b</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;fgb</p>\r\n\r\n<p>b&nbsp;</p>\r\n\r\n<p>fg bfg bfg bfg b</p>\r\n', '2013-03-28 10:07:16');

INSERT INTO `lmg_pages` VALUES ('2', '0', 'about-us', '', 'Page Keywords, Go, Here', 'Page Description Goes Here', 'About Us', '<h1>About Us</h1>\r\n<p>Coming Soon</p>', '2012-09-11 08:12:17');

INSERT INTO `lmg_pages` VALUES ('3', '0', 'contact', '', 'Page Keywords, Go, Here', 'Page Description Goes Here', 'Contact Us', '<h1>Contact Us</h1>\r\n<p>Fill out the form below to send us a message</p>', '2012-09-11 08:13:04');

