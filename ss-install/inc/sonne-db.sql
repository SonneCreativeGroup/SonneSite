-- ----------------------------

-- Table structure for scgss_administrators

-- ----------------------------

DROP TABLE IF EXISTS `scgss_administrators`;

CREATE TABLE `scgss_administrators` (

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

-- Table structure for scgss_boxes

-- ----------------------------

DROP TABLE IF EXISTS `scgss_boxes`;

CREATE TABLE `scgss_boxes` (

  `bid` int(11) NOT NULL AUTO_INCREMENT,

  `box_title` varchar(255) DEFAULT NULL,

  `box_contents` text,

  `sort` int(11) DEFAULT NULL,

  PRIMARY KEY (`bid`)

) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for scgss_calendar

-- ----------------------------

DROP TABLE IF EXISTS `scgss_calendar`;

CREATE TABLE `scgss_calendar` (

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

-- Table structure for scgss_calendar_options

-- ----------------------------

DROP TABLE IF EXISTS `scgss_calendar_options`;

CREATE TABLE `scgss_calendar_options` (

  `oid` int(11) NOT NULL AUTO_INCREMENT,

  `cid` int(11) DEFAULT NULL,

  `cal_opt_type` varchar(10) DEFAULT NULL,

  `cal_opt_name` varchar(255) DEFAULT NULL,

  `cal_opt_values` text,

  `cal_opt_pricedifference` double(9,2) DEFAULT NULL,

  PRIMARY KEY (`oid`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for scgss_cart_categories

-- ----------------------------

DROP TABLE IF EXISTS `scgss_cart_categories`;

CREATE TABLE `scgss_cart_categories` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `category_parent` int(11) DEFAULT '0',

  `category_name` varchar(255) DEFAULT NULL,

  `category_description` text,

  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for scgss_cart_orders

-- ----------------------------

DROP TABLE IF EXISTS `scgss_cart_orders`;

CREATE TABLE `scgss_cart_orders` (

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

-- Table structure for scgss_cart_product_options

-- ----------------------------

DROP TABLE IF EXISTS `scgss_cart_product_options`;

CREATE TABLE `scgss_cart_product_options` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `pid` int(11) DEFAULT NULL,

  `option_name` varchar(255) DEFAULT NULL,

  `option_value` varchar(255) DEFAULT NULL,

  `option_price` double(9,2) DEFAULT '0.00',

  PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for scgss_cart_products

-- ----------------------------

DROP TABLE IF EXISTS `scgss_cart_products`;

CREATE TABLE `scgss_cart_products` (

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

-- Table structure for scgss_condolences

-- ----------------------------

DROP TABLE IF EXISTS `scgss_condolences`;

CREATE TABLE `scgss_condolences` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `publish` enum('no','yes') DEFAULT 'no',

  `obit` int(11) DEFAULT NULL,

  `name` varchar(255) DEFAULT NULL,

  `condolence` text,

  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for scgss_configuration

-- ----------------------------

DROP TABLE IF EXISTS `scgss_configuration`;

CREATE TABLE `scgss_configuration` (

  `cid` int(11) NOT NULL AUTO_INCREMENT,

  `conf_key` varchar(255) DEFAULT NULL,

  `conf_value` text,

  PRIMARY KEY (`cid`)

) ENGINE=InnoDB AUTO_INCREMENT=1061 DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for scgss_galleries

-- ----------------------------

DROP TABLE IF EXISTS `scgss_galleries`;

CREATE TABLE `scgss_galleries` (

  `gid` int(11) NOT NULL AUTO_INCREMENT,

  `gallery_name` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`gid`)

) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for scgss_gallery_photos

-- ----------------------------

DROP TABLE IF EXISTS `scgss_gallery_photos`;

CREATE TABLE `scgss_gallery_photos` (

  `pid` int(11) NOT NULL AUTO_INCREMENT,

  `gid` int(11) DEFAULT NULL,

  `gallery_photo` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`pid`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for scgss_members

-- ----------------------------

DROP TABLE IF EXISTS `scgss_members`;

CREATE TABLE `scgss_members` (

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

-- Table structure for scgss_navigation

-- ----------------------------

DROP TABLE IF EXISTS `scgss_navigation`;

CREATE TABLE `scgss_navigation` (

  `nid` int(11) NOT NULL AUTO_INCREMENT,

  `parent` int(11) DEFAULT NULL,

  `name` varchar(50) DEFAULT NULL,

  `link` text,

  `target` varchar(20) DEFAULT NULL,

  `sort` int(11) DEFAULT NULL,

  PRIMARY KEY (`nid`)

) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for scgss_obituaries

-- ----------------------------

DROP TABLE IF EXISTS `scgss_obituaries`;

CREATE TABLE `scgss_obituaries` (

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

-- Table structure for scgss_pages

-- ----------------------------

DROP TABLE IF EXISTS `scgss_pages`;

CREATE TABLE `scgss_pages` (

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

-- Table structure for scgss_prospects

-- ----------------------------

DROP TABLE IF EXISTS `scgss_prospects`;

CREATE TABLE `scgss_prospects` (

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

-- Table structure for scgss_registrations

-- ----------------------------

DROP TABLE IF EXISTS `scgss_registrations`;

CREATE TABLE `scgss_registrations` (

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

-- Table structure for scgss_slideshow

-- ----------------------------

DROP TABLE IF EXISTS `scgss_slideshow`;

CREATE TABLE `scgss_slideshow` (

  `sid` int(11) NOT NULL AUTO_INCREMENT,

  `file` varchar(255) DEFAULT NULL,

  `alt_text` text,

  `sort` int(11) DEFAULT NULL,

  PRIMARY KEY (`sid`)

) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;



-- ----------------------------

-- Table structure for scgss_users

-- ----------------------------

DROP TABLE IF EXISTS `scgss_users`;

CREATE TABLE `scgss_users` (

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
-- Table structure for scgss_scheduler_appointments
-- ----------------------------
DROP TABLE IF EXISTS `scgss_scheduler_appointments`;
CREATE TABLE `scgss_scheduler_appointments` (
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
-- Table structure for scgss_scheduler_hours
-- ----------------------------
DROP TABLE IF EXISTS `scgss_scheduler_hours`;
CREATE TABLE `scgss_scheduler_hours` (
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
-- Table structure for scgss_scheduler_services
-- ----------------------------
DROP TABLE IF EXISTS `scgss_scheduler_services`;
CREATE TABLE `scgss_scheduler_services` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
	
  `active` int(11) DEFAULT NULL,
	
  `service_name` varchar(255) DEFAULT NULL,
	
  `service_description` text,
	
  `service_length` int(11) DEFAULT NULL,
	
  PRIMARY KEY (`sid`)
	
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for scgss_scheduler_settings
-- ----------------------------
DROP TABLE IF EXISTS `scgss_scheduler_settings`;
CREATE TABLE `scgss_scheduler_settings` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
	
  `start_time` varchar(255) NOT NULL,
	
  `end_time` varchar(255) NOT NULL,
	
  `buffer_time` varchar(255) NOT NULL,
	
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;