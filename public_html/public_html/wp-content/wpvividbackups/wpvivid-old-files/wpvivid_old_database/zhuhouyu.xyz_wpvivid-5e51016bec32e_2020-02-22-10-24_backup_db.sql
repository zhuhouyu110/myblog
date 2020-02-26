-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: localhost	Database: myblog
-- ------------------------------------------------------
-- Date: Sat, 22 Feb 2020 10:24:44 +0000

/* # site_url: http://zhuhouyu.xyz */;
/* # home_url: http://zhuhouyu.xyz */;
/* # content_url: http://zhuhouyu.xyz/wp-content */;
/* # upload_url: http://zhuhouyu.xyz/wp-content/uploads */;
/* # table_prefix: wp_ */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
INSERT INTO `wp_commentmeta` VALUES (21,7,'akismet_result','false');
INSERT INTO `wp_commentmeta` VALUES (22,7,'akismet_history','a:2:{s:4:"time";d:1582341854.229505;s:5:"event";s:9:"check-ham";}');
INSERT INTO `wp_commentmeta` VALUES (23,7,'akismet_as_submitted','a:11:{s:14:"comment_author";s:0:"";s:20:"comment_author_email";s:0:"";s:18:"comment_author_url";s:0:"";s:15:"comment_content";s:2:"dd";s:12:"comment_type";s:0:"";s:7:"user_ip";s:14:"139.189.220.88";s:10:"user_agent";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";s:4:"blog";s:19:"http://zhuhouyu.xyz";s:9:"blog_lang";s:5:"zh_CN";s:12:"blog_charset";s:5:"UTF-8";s:9:"permalink";s:30:"http://zhuhouyu.xyz/guestbook/";}');
INSERT INTO `wp_commentmeta` VALUES (24,7,'akismet_history','a:3:{s:4:"time";d:1582341980.28652;s:5:"event";s:12:"status-trash";s:4:"user";s:5:"admin";}');
INSERT INTO `wp_commentmeta` VALUES (25,7,'_wp_trash_meta_status','1');
INSERT INTO `wp_commentmeta` VALUES (26,7,'_wp_trash_meta_time','1582341980');
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '1999-01-01 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '1999-01-01 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (7,88,'','','','139.189.220.88','2020-02-22 11:24:14','2020-02-22 03:24:14','dd',0,'trash','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36','',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '1999-01-01 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=MyISAM AUTO_INCREMENT=746 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://zhuhouyu.xyz','yes');
INSERT INTO `wp_options` VALUES (2,'home','http://zhuhouyu.xyz/','yes');
INSERT INTO `wp_options` VALUES (3,'blogname','宇后人生','yes');
INSERT INTO `wp_options` VALUES (4,'blogdescription','那些回不去的日子叫青春~','yes');
INSERT INTO `wp_options` VALUES (5,'users_can_register','1','yes');
INSERT INTO `wp_options` VALUES (6,'admin_email','971667935@qq.com','yes');
INSERT INTO `wp_options` VALUES (7,'start_of_week','1','yes');
INSERT INTO `wp_options` VALUES (8,'use_balanceTags','0','yes');
INSERT INTO `wp_options` VALUES (9,'use_smilies','1','yes');
INSERT INTO `wp_options` VALUES (10,'require_name_email','','yes');
INSERT INTO `wp_options` VALUES (11,'comments_notify','','yes');
INSERT INTO `wp_options` VALUES (12,'posts_per_rss','10','yes');
INSERT INTO `wp_options` VALUES (13,'rss_use_excerpt','0','yes');
INSERT INTO `wp_options` VALUES (14,'mailserver_url','mail.example.com','yes');
INSERT INTO `wp_options` VALUES (15,'mailserver_login','login@example.com','yes');
INSERT INTO `wp_options` VALUES (16,'mailserver_pass','password','yes');
INSERT INTO `wp_options` VALUES (17,'mailserver_port','110','yes');
INSERT INTO `wp_options` VALUES (18,'default_category','1','yes');
INSERT INTO `wp_options` VALUES (19,'default_comment_status','open','yes');
INSERT INTO `wp_options` VALUES (20,'default_ping_status','open','yes');
INSERT INTO `wp_options` VALUES (21,'default_pingback_flag','1','yes');
INSERT INTO `wp_options` VALUES (22,'posts_per_page','10','yes');
INSERT INTO `wp_options` VALUES (23,'date_format','Y年n月j日','yes');
INSERT INTO `wp_options` VALUES (24,'time_format','ag:i','yes');
INSERT INTO `wp_options` VALUES (25,'links_updated_date_format','Y年n月j日ag:i','yes');
INSERT INTO `wp_options` VALUES (26,'comment_moderation','','yes');
INSERT INTO `wp_options` VALUES (27,'moderation_notify','','yes');
INSERT INTO `wp_options` VALUES (28,'permalink_structure','/%postname%/','yes');
INSERT INTO `wp_options` VALUES (29,'rewrite_rules','a:88:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:39:"index.php?&page_id=93&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}','yes');
INSERT INTO `wp_options` VALUES (30,'hack_file','0','yes');
INSERT INTO `wp_options` VALUES (31,'blog_charset','UTF-8','yes');
INSERT INTO `wp_options` VALUES (32,'moderation_keys','','no');
INSERT INTO `wp_options` VALUES (33,'active_plugins','a:11:{i:0;s:19:"akismet/akismet.php";i:1;s:81:"auto-login-new-user-after-registration/auto-login-new-user-after-registration.php";i:2;s:45:"disable-google-fonts/disable-google-fonts.php";i:3;s:18:"kill-429/index.php";i:4;s:29:"nicetheme-jimu/nc-plugins.php";i:5;s:35:"wp-fastest-cache/wpFastestCache.php";i:6;s:19:"wp-smtp/wp-smtp.php";i:7;s:27:"wp-super-cache/wp-cache.php";i:8;s:33:"wp-user-avatar/wp-user-avatar.php";i:9;s:31:"wpsilo-update/wpsilo-update.php";i:10;s:47:"wpvivid-backuprestore/wpvivid-backuprestore.php";}','yes');
INSERT INTO `wp_options` VALUES (34,'category_base','','yes');
INSERT INTO `wp_options` VALUES (35,'ping_sites','http://rpc.pingomatic.com/','yes');
INSERT INTO `wp_options` VALUES (36,'comment_max_links','1','yes');
INSERT INTO `wp_options` VALUES (37,'gmt_offset','','yes');
INSERT INTO `wp_options` VALUES (38,'default_email_category','1','yes');
INSERT INTO `wp_options` VALUES (39,'recently_edited','a:5:{i:0;s:67:"/www/web/zhuhouyu_xyz/public_html/wp-content/themes/minty/style.css";i:1;s:68:"/www/web/zhuhouyu_xyz/public_html/wp-content/themes/minty/footer.php";i:2;s:72:"/www/web/zhuhouyu_xyz/public_html/wp-content/themes/minty/page-index.php";i:3;s:72:"/www/web/zhuhouyu_xyz/public_html/wp-content/themes/minty/page-links.php";i:5;s:66:"/www/web/zhuhouyu_xyz/public_html/wp-content/themes/minty/page.php";}','no');
INSERT INTO `wp_options` VALUES (40,'template','minty','yes');
INSERT INTO `wp_options` VALUES (41,'stylesheet','minty','yes');
INSERT INTO `wp_options` VALUES (42,'comment_whitelist','','yes');
INSERT INTO `wp_options` VALUES (43,'blacklist_keys','','no');
INSERT INTO `wp_options` VALUES (44,'comment_registration','','yes');
INSERT INTO `wp_options` VALUES (45,'html_type','text/html','yes');
INSERT INTO `wp_options` VALUES (46,'use_trackback','0','yes');
INSERT INTO `wp_options` VALUES (47,'default_role','subscriber','yes');
INSERT INTO `wp_options` VALUES (48,'db_version','45805','yes');
INSERT INTO `wp_options` VALUES (49,'uploads_use_yearmonth_folders','1','yes');
INSERT INTO `wp_options` VALUES (50,'upload_path','','yes');
INSERT INTO `wp_options` VALUES (51,'blog_public','1','yes');
INSERT INTO `wp_options` VALUES (52,'default_link_category','0','yes');
INSERT INTO `wp_options` VALUES (53,'show_on_front','page','yes');
INSERT INTO `wp_options` VALUES (54,'tag_base','','yes');
INSERT INTO `wp_options` VALUES (55,'show_avatars','1','yes');
INSERT INTO `wp_options` VALUES (56,'avatar_rating','G','yes');
INSERT INTO `wp_options` VALUES (57,'upload_url_path','','yes');
INSERT INTO `wp_options` VALUES (58,'thumbnail_size_w','150','yes');
INSERT INTO `wp_options` VALUES (59,'thumbnail_size_h','150','yes');
INSERT INTO `wp_options` VALUES (60,'thumbnail_crop','1','yes');
INSERT INTO `wp_options` VALUES (61,'medium_size_w','300','yes');
INSERT INTO `wp_options` VALUES (62,'medium_size_h','300','yes');
INSERT INTO `wp_options` VALUES (63,'avatar_default','mystery','yes');
INSERT INTO `wp_options` VALUES (64,'large_size_w','1024','yes');
INSERT INTO `wp_options` VALUES (65,'large_size_h','1024','yes');
INSERT INTO `wp_options` VALUES (66,'image_default_link_type','none','yes');
INSERT INTO `wp_options` VALUES (67,'image_default_size','','yes');
INSERT INTO `wp_options` VALUES (68,'image_default_align','','yes');
INSERT INTO `wp_options` VALUES (69,'close_comments_for_old_posts','','yes');
INSERT INTO `wp_options` VALUES (70,'close_comments_days_old','14','yes');
INSERT INTO `wp_options` VALUES (71,'thread_comments','1','yes');
INSERT INTO `wp_options` VALUES (72,'thread_comments_depth','5','yes');
INSERT INTO `wp_options` VALUES (73,'page_comments','1','yes');
INSERT INTO `wp_options` VALUES (74,'comments_per_page','50','yes');
INSERT INTO `wp_options` VALUES (75,'default_comments_page','newest','yes');
INSERT INTO `wp_options` VALUES (76,'comment_order','desc','yes');
INSERT INTO `wp_options` VALUES (77,'sticky_posts','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (78,'widget_categories','a:4:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;i:4;a:4:{s:5:"title";s:6:"随笔";s:5:"count";i:0;s:12:"hierarchical";i:1;s:8:"dropdown";i:0;}i:5;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:1;s:8:"dropdown";i:0;}}','yes');
INSERT INTO `wp_options` VALUES (79,'widget_text','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (80,'widget_rss','a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (81,'uninstall_plugins','a:1:{s:27:"wp-super-cache/wp-cache.php";s:22:"wpsupercache_uninstall";}','no');
INSERT INTO `wp_options` VALUES (82,'timezone_string','Asia/Shanghai','yes');
INSERT INTO `wp_options` VALUES (83,'page_for_posts','95','yes');
INSERT INTO `wp_options` VALUES (84,'page_on_front','93','yes');
INSERT INTO `wp_options` VALUES (85,'default_post_format','0','yes');
INSERT INTO `wp_options` VALUES (86,'link_manager_enabled','0','yes');
INSERT INTO `wp_options` VALUES (87,'finished_splitting_shared_terms','1','yes');
INSERT INTO `wp_options` VALUES (88,'site_icon','22','yes');
INSERT INTO `wp_options` VALUES (89,'medium_large_size_w','768','yes');
INSERT INTO `wp_options` VALUES (90,'medium_large_size_h','0','yes');
INSERT INTO `wp_options` VALUES (91,'wp_page_for_privacy_policy','3','yes');
INSERT INTO `wp_options` VALUES (92,'show_comments_cookies_opt_in','1','yes');
INSERT INTO `wp_options` VALUES (93,'admin_email_lifespan','1597720089','yes');
INSERT INTO `wp_options` VALUES (94,'initial_db_version','45805','yes');
INSERT INTO `wp_options` VALUES (95,'wp_user_roles','a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}','yes');
INSERT INTO `wp_options` VALUES (96,'fresh_site','0','yes');
INSERT INTO `wp_options` VALUES (97,'WPLANG','zh_CN','yes');
INSERT INTO `wp_options` VALUES (98,'widget_search','a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (99,'widget_recent-posts','a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (100,'widget_recent-comments','a:3:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;i:4;a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (101,'widget_archives','a:4:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;i:4;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}i:5;a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (102,'widget_meta','a:3:{i:2;a:1:{s:5:"title";s:0:"";}i:7;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (103,'sidebars_widgets','a:4:{s:19:"wp_inactive_widgets";a:0:{}s:7:"sidebar";a:6:{i:0;s:19:"minty_recentposts-3";i:1;s:12:"categories-5";i:2;s:17:"recent-comments-4";i:3;s:10:"archives-4";i:4;s:10:"calendar-3";i:5;s:6:"meta-7";}s:14:"sidebar-bottom";a:0:{}s:13:"array_version";i:3;}','yes');
INSERT INTO `wp_options` VALUES (104,'cron','a:10:{i:1582367103;a:1:{s:11:"wp_cache_gc";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1582367143;a:1:{s:33:"wpvivid_clean_backup_record_event";a:1:{s:32:"a8cf63fecab3eb3edf6760bc02f258a6";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;b:0;}}}}i:1582367204;a:1:{s:26:"wpvivid_task_monitor_event";a:1:{s:32:"cf7fc26643066874f5f648a1c7cac352";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;s:21:"wpvivid-5e51016bec32e";}}}}i:1582369689;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1582384089;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1582388249;a:1:{s:24:"akismet_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1582427289;a:1:{s:32:"recovery_mode_clean_expired_keys";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1582427322;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1582427324;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}','yes');
INSERT INTO `wp_options` VALUES (105,'widget_pages','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (106,'widget_calendar','a:2:{s:12:"_multiwidget";i:1;i:3;a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (107,'widget_media_audio','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (108,'widget_media_image','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (109,'widget_media_gallery','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (110,'widget_media_video','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (111,'widget_tag_cloud','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (112,'widget_nav_menu','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (113,'widget_custom_html','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (115,'theme_mods_twentytwenty','a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1582168821;s:4:"data";a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:3:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";}s:9:"sidebar-2";a:3:{i:0;s:10:"archives-2";i:1;s:12:"categories-2";i:2;s:6:"meta-2";}}}}','yes');
INSERT INTO `wp_options` VALUES (116,'recovery_keys','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (729,'_site_transient_update_core','O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:65:"https://downloads.wordpress.org/release/zh_CN/wordpress-5.3.2.zip";s:6:"locale";s:5:"zh_CN";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/zh_CN/wordpress-5.3.2.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"5.3.2";s:7:"version";s:5:"5.3.2";s:11:"php_version";s:6:"5.6.20";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"5.3";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1582366952;s:15:"version_checked";s:5:"5.3.2";s:12:"translations";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (126,'_site_transient_timeout_browser_bcf1814caa6afe84eeebef28ff236a7f','1582772923','no');
INSERT INTO `wp_options` VALUES (127,'_site_transient_browser_bcf1814caa6afe84eeebef28ff236a7f','a:10:{s:4:"name";s:6:"Chrome";s:7:"version";s:13:"75.0.3770.100";s:8:"platform";s:7:"Windows";s:10:"update_url";s:29:"https://www.google.com/chrome";s:7:"img_src";s:43:"http://s.w.org/images/browsers/chrome.png?1";s:11:"img_src_ssl";s:44:"https://s.w.org/images/browsers/chrome.png?1";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}','no');
INSERT INTO `wp_options` VALUES (128,'_site_transient_timeout_php_check_0cbcbda5109bcde6b94054595b5c2163','1582772924','no');
INSERT INTO `wp_options` VALUES (129,'_site_transient_php_check_0cbcbda5109bcde6b94054595b5c2163','a:5:{s:19:"recommended_version";s:3:"7.3";s:15:"minimum_version";s:6:"5.6.20";s:12:"is_supported";b:1;s:9:"is_secure";b:1;s:13:"is_acceptable";b:1;}','no');
INSERT INTO `wp_options` VALUES (131,'can_compress_scripts','1','no');
INSERT INTO `wp_options` VALUES (727,'_site_transient_timeout_theme_roots','1582368741','no');
INSERT INTO `wp_options` VALUES (728,'_site_transient_theme_roots','a:1:{s:5:"minty";s:7:"/themes";}','no');
INSERT INTO `wp_options` VALUES (658,'wpua_hash_gravatar','s:142:"a:2:{s:32:"ae6d4d1b59061b17ebad15c0779c7a3f";a:1:{s:10:"02-22-2020";b:0;}s:32:"ad516503a11cd5ca435acc9bb6523536";a:1:{s:10:"02-22-2020";b:1;}}";','yes');
INSERT INTO `wp_options` VALUES (659,'minty_sidebar_on_tablet','1','yes');
INSERT INTO `wp_options` VALUES (669,'_site_transient_community-events-02d557b6b4090b43b1494e7e717049c9','a:3:{s:9:"sandboxed";b:0;s:8:"location";a:1:{s:2:"ip";s:13:"139.189.221.0";}s:6:"events";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (668,'_site_transient_timeout_community-events-02d557b6b4090b43b1494e7e717049c9','1582398948','no');
INSERT INTO `wp_options` VALUES (276,'alnuar_add_last_name_field','','yes');
INSERT INTO `wp_options` VALUES (258,'swpsmtp_options','a:8:{s:16:"from_email_field";s:20:"zhuhouyulove@163.com";s:15:"from_name_field";s:12:"宇后人生";s:23:"force_from_name_replace";b:0;s:13:"smtp_settings";a:9:{s:4:"host";s:12:"smtp.163.com";s:15:"type_encryption";s:3:"ssl";s:4:"port";s:3:"465";s:13:"autentication";s:3:"yes";s:8:"username";s:20:"zhuhouyulove@163.com";s:8:"password";s:16:"emh1ODM2MDY2MzYz";s:12:"enable_debug";b:0;s:12:"insecure_ssl";b:0;s:12:"encrypt_pass";b:0;}s:15:"allowed_domains";s:16:"emh1aG91eXUueHl6";s:14:"reply_to_email";s:0:"";s:17:"email_ignore_list";s:0:"";s:19:"enable_domain_check";b:0;}','yes');
INSERT INTO `wp_options` VALUES (275,'alnuar_add_first_name_field','','yes');
INSERT INTO `wp_options` VALUES (405,'xh_social_plugins_installed','a:5:{i:0;s:103:"/www/web/zhuhouyu_xyz/public_html/wp-content/plugins/wechat-social-login/add-ons/social-wechat/init.php";i:1;s:99:"/www/web/zhuhouyu_xyz/public_html/wp-content/plugins/wechat-social-login/add-ons/social-qq/init.php";i:2;s:102:"/www/web/zhuhouyu_xyz/public_html/wp-content/plugins/wechat-social-login/add-ons/social-weibo/init.php";i:3;s:95:"/www/web/zhuhouyu_xyz/public_html/wp-content/plugins/wechat-social-login/add-ons/login/init.php";i:4;s:97:"/www/web/zhuhouyu_xyz/public_html/wp-content/plugins/wechat-social-login/add-ons/wp-open/init.php";}','yes');
INSERT INTO `wp_options` VALUES (319,'nicetheme_store_upgrade_check_time','1582822018','no');
INSERT INTO `wp_options` VALUES (329,'options_general_disable_xmlrpc','0','no');
INSERT INTO `wp_options` VALUES (330,'_options_general_disable_xmlrpc','field_5bead0612bdb7','no');
INSERT INTO `wp_options` VALUES (284,'WpFc_api_key','22a18ab2de2d49ea2f47004449550807','yes');
INSERT INTO `wp_options` VALUES (285,'WpFastestCache','{"wpFastestCacheStatus":"on","wpFastestCachePreload":"on","wpFastestCachePreload_homepage":"on","wpFastestCachePreload_number":"4","wpFastestCacheNewPost_type":"all","wpFastestCacheUpdatePost_type":"post","wpFastestCacheMinifyCss":"on","wpFastestCacheCombineCss":"on","wpFastestCacheCombineJs":"on","wpFastestCacheLBC":"on","wpFastestCacheLanguage":"cn"}','yes');
INSERT INTO `wp_options` VALUES (270,'alnuar_auto_login_new_user_after_registration_enabled','','yes');
INSERT INTO `wp_options` VALUES (271,'alnuar_auto_login_new_user_after_registration_redirect','','yes');
INSERT INTO `wp_options` VALUES (272,'alnuar_auto_login_new_user_after_registration_admin_email_enabled','','yes');
INSERT INTO `wp_options` VALUES (273,'alnuar_user_password_lost_changed_admin_email_enabled','','yes');
INSERT INTO `wp_options` VALUES (274,'alnuar_add_password_fields','on','yes');
INSERT INTO `wp_options` VALUES (136,'_transient_timeout_plugin_slugs','1582453437','no');
INSERT INTO `wp_options` VALUES (137,'_transient_plugin_slugs','a:12:{i:0;s:19:"akismet/akismet.php";i:1;s:81:"auto-login-new-user-after-registration/auto-login-new-user-after-registration.php";i:2;s:45:"disable-google-fonts/disable-google-fonts.php";i:3;s:18:"kill-429/index.php";i:4;s:27:"updraftplus/updraftplus.php";i:5;s:31:"wpsilo-update/wpsilo-update.php";i:6;s:35:"wp-fastest-cache/wpFastestCache.php";i:7;s:19:"wp-smtp/wp-smtp.php";i:8;s:27:"wp-super-cache/wp-cache.php";i:9;s:33:"wp-user-avatar/wp-user-avatar.php";i:10;s:47:"wpvivid-backuprestore/wpvivid-backuprestore.php";i:11;s:29:"nicetheme-jimu/nc-plugins.php";}','no');
INSERT INTO `wp_options` VALUES (138,'recently_activated','a:3:{s:27:"updraftplus/updraftplus.php";i:1582366883;s:28:"wechat-social-login/init.php";i:1582342459;s:29:"easy-wp-smtp/easy-wp-smtp.php";i:1582213032;}','yes');
INSERT INTO `wp_options` VALUES (743,'wpvivid_need_review','not','no');
INSERT INTO `wp_options` VALUES (326,'_options_general_post_revision','field_5bead0232bdb5','no');
INSERT INTO `wp_options` VALUES (327,'options_general_disable_trackbacks','0','no');
INSERT INTO `wp_options` VALUES (286,'wpfc-group','','yes');
INSERT INTO `wp_options` VALUES (738,'wpvivid_init','init','no');
INSERT INTO `wp_options` VALUES (739,'wpvivid_backup_list','a:0:{}','no');
INSERT INTO `wp_options` VALUES (571,'minty_header_userinfo','1','yes');
INSERT INTO `wp_options` VALUES (575,'_site_transient_browser_2f6a0a42b23284f22b476bca515bee61','a:10:{s:4:"name";s:14:"Microsoft Edge";s:7:"version";s:8:"18.18363";s:8:"platform";s:7:"Windows";s:10:"update_url";s:0:"";s:7:"img_src";s:0:"";s:11:"img_src_ssl";s:0:"";s:15:"current_version";s:8:"15.15063";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}','no');
INSERT INTO `wp_options` VALUES (685,'_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a','1582377166','no');
INSERT INTO `wp_options` VALUES (686,'_site_transient_poptags_40cd750bba9870f18aada2478b24840a','O:8:"stdClass":100:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";i:4664;}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";i:3916;}s:4:"post";a:3:{s:4:"name";s:4:"post";s:4:"slug";s:4:"post";s:5:"count";i:2665;}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";i:2542;}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";i:1956;}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";i:1795;}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";i:1773;}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";i:1481;}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";i:1466;}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";i:1463;}s:8:"facebook";a:3:{s:4:"name";s:8:"facebook";s:4:"slug";s:8:"facebook";s:5:"count";i:1447;}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";i:1410;}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";i:1392;}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";i:1297;}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";i:1177;}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";i:1165;}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";i:1120;}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";i:1095;}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";i:1085;}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";i:981;}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";i:867;}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";i:866;}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";i:860;}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";i:842;}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";i:783;}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";i:760;}s:10:"e-commerce";a:3:{s:4:"name";s:10:"e-commerce";s:4:"slug";s:10:"e-commerce";s:5:"count";i:760;}s:6:"slider";a:3:{s:4:"name";s:6:"slider";s:4:"slug";s:6:"slider";s:5:"count";i:751;}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";i:740;}s:9:"analytics";a:3:{s:4:"name";s:9:"analytics";s:4:"slug";s:9:"analytics";s:5:"count";i:736;}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";i:711;}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";i:698;}s:4:"form";a:3:{s:4:"name";s:4:"form";s:4:"slug";s:4:"form";s:5:"count";i:697;}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";i:694;}s:6:"search";a:3:{s:4:"name";s:6:"search";s:4:"slug";s:6:"search";s:5:"count";i:675;}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";i:659;}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";i:643;}s:4:"menu";a:3:{s:4:"name";s:4:"menu";s:4:"slug";s:4:"menu";s:5:"count";i:641;}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";i:632;}s:6:"editor";a:3:{s:4:"name";s:6:"editor";s:4:"slug";s:6:"editor";s:5:"count";i:629;}s:4:"ajax";a:3:{s:4:"name";s:4:"ajax";s:4:"slug";s:4:"ajax";s:5:"count";i:625;}s:5:"embed";a:3:{s:4:"name";s:5:"embed";s:4:"slug";s:5:"embed";s:5:"count";i:614;}s:3:"css";a:3:{s:4:"name";s:3:"css";s:4:"slug";s:3:"css";s:5:"count";i:582;}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";i:576;}s:12:"contact-form";a:3:{s:4:"name";s:12:"contact form";s:4:"slug";s:12:"contact-form";s:5:"count";i:572;}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";i:571;}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";i:569;}s:5:"share";a:3:{s:4:"name";s:5:"share";s:4:"slug";s:5:"share";s:5:"count";i:550;}s:7:"payment";a:3:{s:4:"name";s:7:"payment";s:4:"slug";s:7:"payment";s:5:"count";i:547;}s:5:"theme";a:3:{s:4:"name";s:5:"theme";s:4:"slug";s:5:"theme";s:5:"count";i:543;}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";i:541;}s:10:"responsive";a:3:{s:4:"name";s:10:"responsive";s:4:"slug";s:10:"responsive";s:5:"count";i:534;}s:9:"affiliate";a:3:{s:4:"name";s:9:"affiliate";s:4:"slug";s:9:"affiliate";s:5:"count";i:531;}s:9:"dashboard";a:3:{s:4:"name";s:9:"dashboard";s:4:"slug";s:9:"dashboard";s:5:"count";i:529;}s:6:"custom";a:3:{s:4:"name";s:6:"custom";s:4:"slug";s:6:"custom";s:5:"count";i:527;}s:3:"ads";a:3:{s:4:"name";s:3:"ads";s:4:"slug";s:3:"ads";s:5:"count";i:516;}s:10:"categories";a:3:{s:4:"name";s:10:"categories";s:4:"slug";s:10:"categories";s:5:"count";i:509;}s:3:"api";a:3:{s:4:"name";s:3:"api";s:4:"slug";s:3:"api";s:5:"count";i:497;}s:7:"contact";a:3:{s:4:"name";s:7:"contact";s:4:"slug";s:7:"contact";s:5:"count";i:495;}s:4:"user";a:3:{s:4:"name";s:4:"user";s:4:"slug";s:4:"user";s:5:"count";i:495;}s:4:"tags";a:3:{s:4:"name";s:4:"tags";s:4:"slug";s:4:"tags";s:5:"count";i:487;}s:6:"button";a:3:{s:4:"name";s:6:"button";s:4:"slug";s:6:"button";s:5:"count";i:484;}s:15:"payment-gateway";a:3:{s:4:"name";s:15:"payment gateway";s:4:"slug";s:15:"payment-gateway";s:5:"count";i:480;}s:5:"users";a:3:{s:4:"name";s:5:"users";s:4:"slug";s:5:"users";s:5:"count";i:471;}s:6:"mobile";a:3:{s:4:"name";s:6:"mobile";s:4:"slug";s:6:"mobile";s:5:"count";i:466;}s:6:"events";a:3:{s:4:"name";s:6:"events";s:4:"slug";s:6:"events";s:5:"count";i:459;}s:9:"gutenberg";a:3:{s:4:"name";s:9:"gutenberg";s:4:"slug";s:9:"gutenberg";s:5:"count";i:441;}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";i:436;}s:9:"marketing";a:3:{s:4:"name";s:9:"marketing";s:4:"slug";s:9:"marketing";s:5:"count";i:428;}s:9:"slideshow";a:3:{s:4:"name";s:9:"slideshow";s:4:"slug";s:9:"slideshow";s:5:"count";i:428;}s:4:"chat";a:3:{s:4:"name";s:4:"chat";s:4:"slug";s:4:"chat";s:5:"count";i:424;}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";i:420;}s:10:"navigation";a:3:{s:4:"name";s:10:"navigation";s:4:"slug";s:10:"navigation";s:5:"count";i:420;}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";i:419;}s:8:"calendar";a:3:{s:4:"name";s:8:"calendar";s:4:"slug";s:8:"calendar";s:5:"count";i:415;}s:5:"popup";a:3:{s:4:"name";s:5:"popup";s:4:"slug";s:5:"popup";s:5:"count";i:413;}s:10:"statistics";a:3:{s:4:"name";s:10:"statistics";s:4:"slug";s:10:"statistics";s:5:"count";i:408;}s:10:"newsletter";a:3:{s:4:"name";s:10:"newsletter";s:4:"slug";s:10:"newsletter";s:5:"count";i:401;}s:5:"forms";a:3:{s:4:"name";s:5:"forms";s:4:"slug";s:5:"forms";s:5:"count";i:393;}s:10:"shortcodes";a:3:{s:4:"name";s:10:"shortcodes";s:4:"slug";s:10:"shortcodes";s:5:"count";i:393;}s:4:"news";a:3:{s:4:"name";s:4:"news";s:4:"slug";s:4:"news";s:5:"count";i:390;}s:12:"social-media";a:3:{s:4:"name";s:12:"social media";s:4:"slug";s:12:"social-media";s:5:"count";i:383;}s:14:"contact-form-7";a:3:{s:4:"name";s:14:"contact form 7";s:4:"slug";s:14:"contact-form-7";s:5:"count";i:379;}s:4:"code";a:3:{s:4:"name";s:4:"code";s:4:"slug";s:4:"code";s:5:"count";i:378;}s:8:"redirect";a:3:{s:4:"name";s:8:"redirect";s:4:"slug";s:8:"redirect";s:5:"count";i:375;}s:7:"plugins";a:3:{s:4:"name";s:7:"plugins";s:4:"slug";s:7:"plugins";s:5:"count";i:374;}s:9:"multisite";a:3:{s:4:"name";s:9:"multisite";s:4:"slug";s:9:"multisite";s:5:"count";i:368;}s:11:"performance";a:3:{s:4:"name";s:11:"performance";s:4:"slug";s:11:"performance";s:5:"count";i:366;}s:3:"url";a:3:{s:4:"name";s:3:"url";s:4:"slug";s:3:"url";s:5:"count";i:364;}s:4:"meta";a:3:{s:4:"name";s:4:"meta";s:4:"slug";s:4:"meta";s:5:"count";i:357;}s:4:"list";a:3:{s:4:"name";s:4:"list";s:4:"slug";s:4:"list";s:5:"count";i:350;}s:12:"notification";a:3:{s:4:"name";s:12:"notification";s:4:"slug";s:12:"notification";s:5:"count";i:348;}s:8:"tracking";a:3:{s:4:"name";s:8:"tracking";s:4:"slug";s:8:"tracking";s:5:"count";i:336;}s:16:"custom-post-type";a:3:{s:4:"name";s:16:"custom post type";s:4:"slug";s:16:"custom-post-type";s:5:"count";i:333;}s:16:"google-analytics";a:3:{s:4:"name";s:16:"google analytics";s:4:"slug";s:16:"google-analytics";s:5:"count";i:331;}s:11:"advertising";a:3:{s:4:"name";s:11:"advertising";s:4:"slug";s:11:"advertising";s:5:"count";i:330;}s:5:"block";a:3:{s:4:"name";s:5:"block";s:4:"slug";s:5:"block";s:5:"count";i:330;}s:5:"cache";a:3:{s:4:"name";s:5:"cache";s:4:"slug";s:5:"cache";s:5:"count";i:326;}s:8:"shipping";a:3:{s:4:"name";s:8:"shipping";s:4:"slug";s:8:"shipping";s:5:"count";i:326;}s:6:"simple";a:3:{s:4:"name";s:6:"simple";s:4:"slug";s:6:"simple";s:5:"count";i:323;}}','no');
INSERT INTO `wp_options` VALUES (720,'updraft_jobdata_5e50ff8a0d77','a:5:{s:8:"job_type";s:8:"download";s:11:"job_time_ms";d:1582366776.843748;s:25:"dlmessage_1582366602_db_0";s:90:"The file was found locally and matched the recorded size from the backup history (45.1 KB)";s:7:"service";a:1:{i:0;s:4:"none";}s:22:"dlfile_1582366602_db_0";s:124:"downloading:46146:/www/web/zhuhouyu_xyz/public_html/wp-content/updraft/backup_2020-02-22-1816_zhuhouyuxyz_2327e23dfe04-db.gz";}','no');
INSERT INTO `wp_options` VALUES (723,'updraft_jobdata_06a6411647be','a:2:{s:8:"job_type";s:6:"delete";s:11:"job_time_ms";d:1582366804.476739;}','no');
INSERT INTO `wp_options` VALUES (722,'updraft_jobdata_5e50ff8a0fe0','a:5:{s:8:"job_type";s:8:"download";s:11:"job_time_ms";d:1582366782.590479;s:29:"dlmessage_1582366602_themes_0";s:91:"The file was found locally and matched the recorded size from the backup history (664.2 KB)";s:7:"service";a:1:{i:0;s:4:"none";}s:26:"dlfile_1582366602_themes_0";s:130:"downloading:680154:/www/web/zhuhouyu_xyz/public_html/wp-content/updraft/backup_2020-02-22-1816_zhuhouyuxyz_2327e23dfe04-themes.zip";}','no');
INSERT INTO `wp_options` VALUES (716,'updraft_backup_history','a:0:{}','no');
INSERT INTO `wp_options` VALUES (721,'updraft_jobdata_5e50ff8a063d','a:5:{s:8:"job_type";s:8:"download";s:11:"job_time_ms";d:1582366781.182826;s:30:"dlmessage_1582366602_plugins_0";s:93:"The file was found locally and matched the recorded size from the backup history (13017.3 KB)";s:7:"service";a:1:{i:0;s:4:"none";}s:27:"dlfile_1582366602_plugins_0";s:133:"downloading:13329757:/www/web/zhuhouyu_xyz/public_html/wp-content/updraft/backup_2020-02-22-1816_zhuhouyuxyz_2327e23dfe04-plugins.zip";}','no');
INSERT INTO `wp_options` VALUES (160,'akismet_strictness','0','yes');
INSERT INTO `wp_options` VALUES (159,'widget_akismet_widget','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (161,'akismet_show_user_comments_approved','0','yes');
INSERT INTO `wp_options` VALUES (162,'akismet_comment_form_privacy_notice','hide','yes');
INSERT INTO `wp_options` VALUES (163,'wordpress_api_key','51d611e1a52e','yes');
INSERT INTO `wp_options` VALUES (164,'akismet_spam_count','1','yes');
INSERT INTO `wp_options` VALUES (165,'current_theme','Minty','yes');
INSERT INTO `wp_options` VALUES (166,'theme_mods_twentysixteen','a:3:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1582168903;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:2:{i:0;s:6:"text-2";i:1;s:6:"text-3";}s:9:"sidebar-1";a:3:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";}s:9:"sidebar-2";a:3:{i:0;s:10:"archives-2";i:1;s:12:"categories-2";i:2;s:6:"meta-2";}s:9:"sidebar-3";a:0:{}}}}','yes');
INSERT INTO `wp_options` VALUES (167,'theme_switched','','yes');
INSERT INTO `wp_options` VALUES (297,'minty_rounded_avatars','1','yes');
INSERT INTO `wp_options` VALUES (704,'updraft_webdav','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-c52d06af3eeb152bcc8835d64ef9c51f";a:0:{}}}','yes');
INSERT INTO `wp_options` VALUES (705,'updraft_s3generic','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-2f6fa32b51593cd3e8019593e4098aad";a:4:{s:9:"accesskey";s:0:"";s:9:"secretkey";s:0:"";s:4:"path";s:0:"";s:8:"endpoint";s:0:"";}}}','yes');
INSERT INTO `wp_options` VALUES (706,'updraft_openstack','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-15e7ac330e4dc59c0379a10cade6b7f1";a:6:{s:4:"user";s:0:"";s:7:"authurl";s:0:"";s:8:"password";s:0:"";s:6:"tenant";s:0:"";s:4:"path";s:0:"";s:6:"region";s:0:"";}}}','yes');
INSERT INTO `wp_options` VALUES (707,'updraft_dreamobjects','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-398cee9f635fc238ac5aeb47b50c84f5";a:3:{s:9:"accesskey";s:0:"";s:9:"secretkey";s:0:"";s:4:"path";s:0:"";}}}','yes');
INSERT INTO `wp_options` VALUES (708,'updraftplus-addons_siteid','290a7350415966bde8c68832b5c8b943','no');
INSERT INTO `wp_options` VALUES (709,'updraftplus_tour_cancelled_on','backup_now','yes');
INSERT INTO `wp_options` VALUES (710,'updraft_lastmessage','Local files deleted: 4. Remote files deleted: 0 (2月 22 18:20:04)','yes');
INSERT INTO `wp_options` VALUES (277,'alnuar_new_user_email_text_change','','yes');
INSERT INTO `wp_options` VALUES (180,'minty_favicon','http://zhuhouyu.xyz/favicon.ico','yes');
INSERT INTO `wp_options` VALUES (296,'theme_mods_minty','a:5:{i:0;b:0;s:18:"nav_menu_locations";a:2:{s:7:"primary";i:2;s:6:"footer";i:2;}s:18:"custom_css_post_id";i:-1;s:16:"background_color";s:6:"ddc7c7";s:18:"minty_color_scheme";s:9:"turquoise";}','yes');
INSERT INTO `wp_options` VALUES (172,'theme_mods_wordpress清新Minty主题','a:4:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1582214187;s:4:"data";a:3:{s:19:"wp_inactive_widgets";a:2:{i:0;s:6:"text-2";i:1;s:6:"text-3";}s:7:"sidebar";a:3:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";}s:14:"sidebar-bottom";a:3:{i:0;s:10:"archives-2";i:1;s:12:"categories-2";i:2;s:6:"meta-2";}}}}','yes');
INSERT INTO `wp_options` VALUES (173,'widget_minty_popularposts','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (174,'widget_minty_randomlinks','a:2:{i:3;a:0:{}s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (175,'widget_minty_mailsubscription','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (176,'widget_minty_ad','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (177,'widget_minty_slideshow','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (178,'widget_minty_recentcomments','a:2:{s:12:"_multiwidget";i:1;i:3;a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (179,'widget_minty_recentposts','a:2:{s:12:"_multiwidget";i:1;i:3;a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (181,'minty_apple_touch_icon','http://zhuhouyu.xyz/apple-touch-icon-precomposed.png','yes');
INSERT INTO `wp_options` VALUES (182,'minty_meta_keywords','javascript,CSS,HTML,个人博客','yes');
INSERT INTO `wp_options` VALUES (183,'minty_meta_description','宇后人生博客，分享和记录生活以及各种心得','yes');
INSERT INTO `wp_options` VALUES (184,'minty_infinitescroll','2','yes');
INSERT INTO `wp_options` VALUES (185,'minty_search_placeholder','搜索…','yes');
INSERT INTO `wp_options` VALUES (186,'minty_404_title','有点尴尬诶。','yes');
INSERT INTO `wp_options` VALUES (187,'minty_404_tagline','这儿似乎什么都没有，试试搜索？','yes');
INSERT INTO `wp_options` VALUES (188,'minty_comment_placeholder','说点什么吧…','yes');
INSERT INTO `wp_options` VALUES (189,'minty_comment_sofatext','沙发空缺中，还不快抢~','yes');
INSERT INTO `wp_options` VALUES (190,'minty_post_thumbnail_size_h','220','yes');
INSERT INTO `wp_options` VALUES (191,'minty_custom_css','/* 代码示例：当浏览器宽度小于540px时，隐藏页脚导航，不需要可删除。*/\r\n@media only screen and (max-width: 540px) {\r\n    #footer .links { display: none; }\r\n}','yes');
INSERT INTO `wp_options` VALUES (192,'minty_slogan','宇后人生博客','yes');
INSERT INTO `wp_options` VALUES (193,'minty_rss_url','https://www.heishou.org/','yes');
INSERT INTO `wp_options` VALUES (194,'minty_newsletter_url','','yes');
INSERT INTO `wp_options` VALUES (195,'minty_weibo','','yes');
INSERT INTO `wp_options` VALUES (196,'minty_tqq','','yes');
INSERT INTO `wp_options` VALUES (197,'minty_twitter','','yes');
INSERT INTO `wp_options` VALUES (198,'minty_renren','','yes');
INSERT INTO `wp_options` VALUES (199,'minty_facebook','','yes');
INSERT INTO `wp_options` VALUES (200,'minty_googleplus','','yes');
INSERT INTO `wp_options` VALUES (201,'minty_linkedin','','yes');
INSERT INTO `wp_options` VALUES (202,'minty_flickr','','yes');
INSERT INTO `wp_options` VALUES (203,'minty_github','','yes');
INSERT INTO `wp_options` VALUES (204,'minty_header_code','','yes');
INSERT INTO `wp_options` VALUES (205,'minty_featured_content_timeout','4000','yes');
INSERT INTO `wp_options` VALUES (206,'minty_featured_content_data','','yes');
INSERT INTO `wp_options` VALUES (207,'minty_excerpt_length','160','yes');
INSERT INTO `wp_options` VALUES (208,'minty_postauthor_text','作者','yes');
INSERT INTO `wp_options` VALUES (209,'minty_copyright','','yes');
INSERT INTO `wp_options` VALUES (479,'minty_search_use_excerpt','0','yes');
INSERT INTO `wp_options` VALUES (210,'minty_share_code','','yes');
INSERT INTO `wp_options` VALUES (211,'minty_gcse_id','','yes');
INSERT INTO `wp_options` VALUES (212,'minty_template_links_tagline','我的网络邻居们，排名不分先后','yes');
INSERT INTO `wp_options` VALUES (213,'minty_template_readers_title','活跃评论者','yes');
INSERT INTO `wp_options` VALUES (214,'minty_template_readers_exclude_emails','','yes');
INSERT INTO `wp_options` VALUES (215,'minty_template_mblogshow','','yes');
INSERT INTO `wp_options` VALUES (216,'minty_ad_index','','yes');
INSERT INTO `wp_options` VALUES (217,'minty_ad_single_title','','yes');
INSERT INTO `wp_options` VALUES (218,'minty_ad_single_footer','','yes');
INSERT INTO `wp_options` VALUES (219,'minty_ad_single','','yes');
INSERT INTO `wp_options` VALUES (220,'minty_mobile_ad_index','','yes');
INSERT INTO `wp_options` VALUES (221,'minty_mobile_ad_single_title','','yes');
INSERT INTO `wp_options` VALUES (222,'minty_mobile_ad_single_footer','','yes');
INSERT INTO `wp_options` VALUES (223,'minty_mobile_ad_single','','yes');
INSERT INTO `wp_options` VALUES (224,'minty_footer_nav_separator','| ','yes');
INSERT INTO `wp_options` VALUES (225,'minty_footer_code',' · 备案号：<a href=\\"http://www.beian.miit.gov.cn\\" target=\\"_blank\\">琼ICP备20000417号</a>','yes');
INSERT INTO `wp_options` VALUES (226,'minty_stat_code','','yes');
INSERT INTO `wp_options` VALUES (227,'minty_options_setup','1','yes');
INSERT INTO `wp_options` VALUES (228,'minty_meta','1','yes');
INSERT INTO `wp_options` VALUES (229,'minty_nprogress','1','yes');
INSERT INTO `wp_options` VALUES (230,'minty_snowfall','site','yes');
INSERT INTO `wp_options` VALUES (526,'WpFastestCachePreLoad','{"homepage":-1,"number":"4"}','yes');
INSERT INTO `wp_options` VALUES (406,'xh_social_add_ons_login_settings','a:15:{s:10:"disable_wp";s:2:"no";s:13:"password_mode";s:9:"plaintext";s:4:"page";s:0:"";s:9:"tab_login";s:0:"";s:13:"page_login_id";s:2:"47";s:18:"login_with_captcha";s:2:"no";s:12:"tab_register";s:0:"";s:16:"page_register_id";s:2:"48";s:20:"enabled_mobile_login";s:2:"no";s:30:"register_terms_of_service_link";s:35:"http://zhuhouyu.xyz/privacy-policy/";s:21:"register_with_captcha";s:3:"yes";s:14:"register_email";s:2:"no";s:16:"tab_findpassword";s:0:"";s:20:"page_findpassword_id";s:2:"49";s:23:"findpassword_email_mode";s:4:"link";}','yes');
INSERT INTO `wp_options` VALUES (232,'new_admin_email','971667935@qq.com','yes');
INSERT INTO `wp_options` VALUES (283,'wp_smtp_options','a:9:{s:4:"from";s:20:"zhuhouyulove@163.com";s:8:"fromname";s:12:"宇后人生";s:4:"host";s:12:"smtp.163.com";s:10:"smtpsecure";s:3:"ssl";s:4:"port";s:3:"465";s:8:"smtpauth";s:3:"yes";s:8:"username";s:20:"zhuhouyulove@163.com";s:8:"password";s:12:"zhu836066363";s:10:"deactivate";s:0:"";}','yes');
INSERT INTO `wp_options` VALUES (302,'minty_template_readers','1','yes');
INSERT INTO `wp_options` VALUES (555,'category_children','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (407,'xh_social_addons_versions','a:4:{s:21:"add_ons_social_wechat";s:5:"1.0.5";s:17:"add_ons_social_qq";s:5:"1.0.3";s:20:"add_ons_social_weibo";s:5:"1.0.3";s:15:"add_ons_wp_open";s:5:"1.0.1";}','yes');
INSERT INTO `wp_options` VALUES (303,'nav_menu_options','a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (298,'minty_breadcrumb','disabled','yes');
INSERT INTO `wp_options` VALUES (299,'minty_sticky_widget','top','yes');
INSERT INTO `wp_options` VALUES (300,'minty_show_post_author','1','yes');
INSERT INTO `wp_options` VALUES (301,'minty_use_excerpt','1','yes');
INSERT INTO `wp_options` VALUES (316,'nc_option','a:22:{s:16:"admin_login_logo";s:0:"";s:7:"general";a:14:{s:16:"gravatar_speedup";s:1:"1";s:13:"post_revision";s:1:"0";s:18:"disable_trackbacks";s:1:"0";s:14:"disable_xmlrpc";s:1:"0";s:13:"disable_emoji";s:1:"0";s:9:"emoji_cdn";s:1:"0";s:18:"disable_wp_widgets";s:1:"0";s:22:"remove_wp_head_useless";s:1:"1";s:11:"core_update";s:1:"1";s:19:"disable_core_update";s:1:"0";s:20:"disable_theme_update";s:1:"0";s:21:"disable_plugin_update";s:1:"0";s:18:"improve_robots_txt";s:1:"0";s:18:"anti_spam_switcher";s:1:"0";}s:12:"seo_switcher";s:1:"0";s:11:"seo_divider";b:0;s:9:"index_seo";b:0;s:15:"seo_index_inner";a:3:{s:15:"seo_index_title";b:0;s:18:"seo_index_keywords";b:0;s:21:"seo_index_description";b:0;}s:12:"taxonomy_seo";b:0;s:24:"single_description_range";b:0;s:10:"others_seo";a:7:{s:12:"baidu_submit";s:1:"0";s:16:"baidu_submit_key";b:0;s:19:"noindex_author_page";b:0;s:13:"auto_nofollow";s:1:"0";s:22:"auto_tag_link_switcher";s:1:"0";s:28:"auto_tag_link_switcher_limit";b:0;s:11:"sitemap_xml";s:1:"0";}s:9:"usability";a:8:{s:15:"nc_lightgallery";s:1:"0";s:11:"nc_lazyload";s:1:"0";s:15:"friendly_images";s:1:"0";s:23:"auto_rename_media_files";s:1:"0";s:17:"disable_admin_bar";s:1:"1";s:12:"nc_highlight";s:1:"0";s:16:"no_category_base";s:1:"0";s:25:"hide_author_url_user_name";s:1:"0";}s:22:"wechat_qq_share_custom";s:1:"0";s:27:"wechat_qq_share_custom_conf";a:7:{s:11:"share_appid";b:0;s:9:"appsecret";b:0;s:9:"share_img";b:0;s:11:"share_title";b:0;s:21:"share_title_in_single";b:0;s:26:"share_title_in_single_line";b:0;s:13:"share_summary";b:0;}s:13:"smtp_switcher";s:1:"0";s:4:"smtp";a:7:{s:9:"smtp_host";b:0;s:9:"smtp_port";b:0;s:11:"smtp_secure";b:0;s:13:"smtp_fromname";b:0;s:13:"smtp_username";b:0;s:13:"smtp_password";b:0;s:17:"smtp_display_mail";b:0;}s:9:"smtp_test";b:0;s:17:"database_optimize";b:0;s:16:"open_cdn_replace";s:8:"disabled";s:23:"wp-admin-access-control";s:6:"enable";s:21:"wp-admin-access-group";s:0:"";s:20:"nice-security-access";s:8:"disabled";s:25:"nice-security-access-path";b:0;s:4:"site";a:2:{s:16:"custom_head_code";s:0:"";s:18:"custom_footer_code";s:0:"";}}','yes');
INSERT INTO `wp_options` VALUES (317,'acf_version','5.8.7','yes');
INSERT INTO `wp_options` VALUES (328,'_options_general_disable_trackbacks','field_5bead04d2bdb6','no');
INSERT INTO `wp_options` VALUES (331,'options_general_disable_emoji','0','no');
INSERT INTO `wp_options` VALUES (332,'_options_general_disable_emoji','field_5bead0802bdb9','no');
INSERT INTO `wp_options` VALUES (333,'options_general_emoji_cdn','0','no');
INSERT INTO `wp_options` VALUES (334,'_options_general_emoji_cdn','field_5ceb74f8f87ff','no');
INSERT INTO `wp_options` VALUES (280,'smtp_test_mail','a:3:{s:10:"swpsmtp_to";s:16:"971667935@qq.com";s:15:"swpsmtp_subject";s:14:"this is a test";s:15:"swpsmtp_message";s:12:"哈哈哈哈";}','yes');
INSERT INTO `wp_options` VALUES (408,'widget_xh_social_login_wide','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (409,'widget_xh_social_login_short','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (410,'widget_xh_social_share_bar','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (411,'widget_xh_social_login_bar','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (412,'xh_install_plugins','a:1:{s:28:"wechat-social-login/init.php";a:3:{s:7:"version";s:5:"1.3.0";s:9:"installed";b:1;s:7:"license";s:0:"";}}','yes');
INSERT INTO `wp_options` VALUES (414,'xh_social_social_weibo_settings','a:6:{s:7:"enabled";s:2:"no";s:5:"appid";s:0:"";s:9:"appsecret";s:0:"";s:9:"subtitle2";s:0:"";s:20:"enabled_cross_domain";s:21:"cross_domain_disabled";s:16:"cross_domain_url";s:0:"";}','yes');
INSERT INTO `wp_options` VALUES (415,'xh_social_social_qq_settings','a:6:{s:7:"enabled";s:2:"no";s:5:"appid";s:0:"";s:9:"appsecret";s:0:"";s:9:"subtitle2";s:0:"";s:20:"enabled_cross_domain";s:21:"cross_domain_disabled";s:16:"cross_domain_url";s:0:"";}','yes');
INSERT INTO `wp_options` VALUES (416,'xh_social_social_wechat_settings','a:14:{s:7:"enabled";s:2:"no";s:6:"client";s:0:"";s:9:"fieldset1";s:0:"";s:5:"mp_id";s:0:"";s:9:"mp_secret";s:0:"";s:9:"subtitle2";s:0:"";s:23:"mp_enabled_cross_domain";s:24:"mp_cross_domain_disabled";s:19:"mp_cross_domain_url";s:0:"";s:9:"fieldset2";s:0:"";s:5:"op_id";s:0:"";s:9:"op_secret";s:0:"";s:9:"subtitle3";s:0:"";s:23:"op_enabled_cross_domain";s:24:"op_cross_domain_disabled";s:19:"op_cross_domain_url";s:0:"";}','yes');
INSERT INTO `wp_options` VALUES (426,'gs_sim_last_object_id','32','yes');
INSERT INTO `wp_options` VALUES (321,'options_admin_login_logo','','no');
INSERT INTO `wp_options` VALUES (322,'_options_admin_login_logo','field_5c403df6a1e09','no');
INSERT INTO `wp_options` VALUES (323,'options_general_gravatar_speedup','1','no');
INSERT INTO `wp_options` VALUES (324,'_options_general_gravatar_speedup','field_5bead00f2bdb4','no');
INSERT INTO `wp_options` VALUES (325,'options_general_post_revision','0','no');
INSERT INTO `wp_options` VALUES (711,'updraftplus_unlocked_fd','1','no');
INSERT INTO `wp_options` VALUES (712,'updraftplus_last_lock_time_fd','2020-02-22 10:16:42','no');
INSERT INTO `wp_options` VALUES (713,'updraftplus_semaphore_fd','0','no');
INSERT INTO `wp_options` VALUES (714,'updraft_last_scheduled_fd','1582366602','yes');
INSERT INTO `wp_options` VALUES (335,'options_general_disable_wp_widgets','0','no');
INSERT INTO `wp_options` VALUES (336,'_options_general_disable_wp_widgets','field_5bead0992bdba','no');
INSERT INTO `wp_options` VALUES (337,'options_general_remove_wp_head_useless','1','no');
INSERT INTO `wp_options` VALUES (338,'_options_general_remove_wp_head_useless','field_5bead1d886236','no');
INSERT INTO `wp_options` VALUES (339,'options_general_core_update','1','no');
INSERT INTO `wp_options` VALUES (340,'_options_general_core_update','field_5e022a4c488e7','no');
INSERT INTO `wp_options` VALUES (341,'options_general_disable_core_update','0','no');
INSERT INTO `wp_options` VALUES (342,'_options_general_disable_core_update','field_5c025fdefd935','no');
INSERT INTO `wp_options` VALUES (343,'options_general_disable_theme_update','0','no');
INSERT INTO `wp_options` VALUES (344,'_options_general_disable_theme_update','field_5c025ff0fd936','no');
INSERT INTO `wp_options` VALUES (345,'options_general_disable_plugin_update','0','no');
INSERT INTO `wp_options` VALUES (346,'_options_general_disable_plugin_update','field_5c025ffffd937','no');
INSERT INTO `wp_options` VALUES (347,'options_general_improve_robots_txt','0','no');
INSERT INTO `wp_options` VALUES (348,'_options_general_improve_robots_txt','field_5c0260ecf3739','no');
INSERT INTO `wp_options` VALUES (349,'options_general_anti_spam_switcher','0','no');
INSERT INTO `wp_options` VALUES (350,'_options_general_anti_spam_switcher','field_5c027ce1c43fd','no');
INSERT INTO `wp_options` VALUES (351,'options_general','','no');
INSERT INTO `wp_options` VALUES (352,'_options_general','field_5beacff12bdb3','no');
INSERT INTO `wp_options` VALUES (353,'options_seo_switcher','0','no');
INSERT INTO `wp_options` VALUES (354,'_options_seo_switcher','field_5c00e594ac0f0','no');
INSERT INTO `wp_options` VALUES (355,'options_others_seo_baidu_submit','0','no');
INSERT INTO `wp_options` VALUES (356,'_options_others_seo_baidu_submit','field_5d74a2c5d9580','no');
INSERT INTO `wp_options` VALUES (357,'options_others_seo_auto_nofollow','0','no');
INSERT INTO `wp_options` VALUES (358,'_options_others_seo_auto_nofollow','field_5c025ce7a7b16','no');
INSERT INTO `wp_options` VALUES (359,'options_others_seo_auto_tag_link_switcher','0','no');
INSERT INTO `wp_options` VALUES (360,'_options_others_seo_auto_tag_link_switcher','field_5c037521256b5','no');
INSERT INTO `wp_options` VALUES (361,'options_others_seo_sitemap_xml','0','no');
INSERT INTO `wp_options` VALUES (362,'_options_others_seo_sitemap_xml','field_5c0618f861a9c','no');
INSERT INTO `wp_options` VALUES (363,'options_others_seo','','no');
INSERT INTO `wp_options` VALUES (364,'_options_others_seo','field_5ce663c500869','no');
INSERT INTO `wp_options` VALUES (365,'options_usability_nc_lightgallery','0','no');
INSERT INTO `wp_options` VALUES (366,'_options_usability_nc_lightgallery','field_5c7cdff08ec12','no');
INSERT INTO `wp_options` VALUES (367,'options_usability_nc_lazyload','0','no');
INSERT INTO `wp_options` VALUES (368,'_options_usability_nc_lazyload','field_5c7a9316fe459','no');
INSERT INTO `wp_options` VALUES (369,'options_usability_friendly_images','0','no');
INSERT INTO `wp_options` VALUES (370,'_options_usability_friendly_images','field_5bee1a8458111','no');
INSERT INTO `wp_options` VALUES (371,'options_usability_auto_rename_media_files','0','no');
INSERT INTO `wp_options` VALUES (372,'_options_usability_auto_rename_media_files','field_5c2354e3837a5','no');
INSERT INTO `wp_options` VALUES (373,'options_usability_disable_admin_bar','1','no');
INSERT INTO `wp_options` VALUES (374,'_options_usability_disable_admin_bar','field_5c4afa64650f5','no');
INSERT INTO `wp_options` VALUES (375,'options_usability_nc_highlight','0','no');
INSERT INTO `wp_options` VALUES (376,'_options_usability_nc_highlight','field_5c7a9303fe458','no');
INSERT INTO `wp_options` VALUES (377,'options_usability_no_category_base','0','no');
INSERT INTO `wp_options` VALUES (378,'_options_usability_no_category_base','field_5bfa119e06b93','no');
INSERT INTO `wp_options` VALUES (379,'options_usability_hide_author_url_user_name','0','no');
INSERT INTO `wp_options` VALUES (380,'_options_usability_hide_author_url_user_name','field_5d356a055db69','no');
INSERT INTO `wp_options` VALUES (381,'options_usability','','no');
INSERT INTO `wp_options` VALUES (382,'_options_usability','field_5bee1ae6ab3fb','no');
INSERT INTO `wp_options` VALUES (383,'options_wechat_qq_share_custom','0','no');
INSERT INTO `wp_options` VALUES (384,'_options_wechat_qq_share_custom','field_5c923bb58a47b','no');
INSERT INTO `wp_options` VALUES (385,'options_smtp_switcher','0','no');
INSERT INTO `wp_options` VALUES (386,'_options_smtp_switcher','field_5c0284ae94a43','no');
INSERT INTO `wp_options` VALUES (387,'options_open_cdn_replace','disabled','no');
INSERT INTO `wp_options` VALUES (388,'_options_open_cdn_replace','field_5e075b73d6985','no');
INSERT INTO `wp_options` VALUES (389,'options_wp-admin-access-control','enable','no');
INSERT INTO `wp_options` VALUES (390,'_options_wp-admin-access-control','field_5e0818611b77c','no');
INSERT INTO `wp_options` VALUES (391,'options_wp-admin-access-group','','no');
INSERT INTO `wp_options` VALUES (392,'_options_wp-admin-access-group','field_5e0816c91b77b','no');
INSERT INTO `wp_options` VALUES (393,'options_nice-security-access','disabled','no');
INSERT INTO `wp_options` VALUES (394,'_options_nice-security-access','field_5e08ad006953d','no');
INSERT INTO `wp_options` VALUES (395,'options_site_custom_head_code','','no');
INSERT INTO `wp_options` VALUES (396,'_options_site_custom_head_code','field_5c23847d82ef8','no');
INSERT INTO `wp_options` VALUES (397,'options_site_custom_footer_code','','no');
INSERT INTO `wp_options` VALUES (398,'_options_site_custom_footer_code','field_5c2384cd82ef9','no');
INSERT INTO `wp_options` VALUES (399,'options_site','','no');
INSERT INTO `wp_options` VALUES (400,'_options_site','field_5c23843882ef7','no');
INSERT INTO `wp_options` VALUES (543,'wpsupercache_gc_time','1582366503','yes');
INSERT INTO `wp_options` VALUES (551,'_site_transient_timeout_community-events-fc8c51b44b1b76bcbd0a66cf16521c1e','1582385812','no');
INSERT INTO `wp_options` VALUES (552,'_site_transient_community-events-fc8c51b44b1b76bcbd0a66cf16521c1e','a:3:{s:9:"sandboxed";b:0;s:8:"location";a:1:{s:2:"ip";s:13:"139.189.220.0";}s:6:"events";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (553,'wpsc_feed_list','a:2:{i:0;s:134:"/www/web/zhuhouyu_xyz/public_html/wp-content/cache/supercache/zhuhouyu.xyz/comments/feed/wp-cache-fd55e3efad0c1defcebc37fe740dca68.php";i:1;s:125:"/www/web/zhuhouyu_xyz/public_html/wp-content/cache/supercache/zhuhouyu.xyz/feed/wp-cache-53edfb6049c692278e019a6dd1fb25b4.php";}','yes');
INSERT INTO `wp_options` VALUES (724,'_site_transient_timeout_available_translations','1582377688','no');
INSERT INTO `wp_options` VALUES (725,'_site_transient_available_translations','a:121:{s:2:"af";a:8:{s:8:"language";s:2:"af";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-05 08:33:42";s:12:"english_name";s:9:"Afrikaans";s:11:"native_name";s:9:"Afrikaans";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.3.2/af.zip";s:3:"iso";a:2:{i:1;s:2:"af";i:2;s:3:"afr";}s:7:"strings";a:1:{s:8:"continue";s:10:"Gaan voort";}}s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-16 12:53:23";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.3.2/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:3:"ary";a:8:{s:8:"language";s:3:"ary";s:7:"version";s:5:"4.7.7";s:7:"updated";s:19:"2017-01-26 15:42:35";s:12:"english_name";s:15:"Moroccan Arabic";s:11:"native_name";s:31:"العربية المغربية";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.7/ary.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:3;s:3:"ary";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"as";a:8:{s:8:"language";s:2:"as";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-22 18:59:07";s:12:"english_name";s:8:"Assamese";s:11:"native_name";s:21:"অসমীয়া";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/as.zip";s:3:"iso";a:3:{i:1;s:2:"as";i:2;s:3:"asm";i:3;s:3:"asm";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-06 00:09:27";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:3:"azb";a:8:{s:8:"language";s:3:"azb";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-12 20:34:31";s:12:"english_name";s:17:"South Azerbaijani";s:11:"native_name";s:29:"گؤنئی آذربایجان";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/azb.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:3;s:3:"azb";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:3:"bel";a:8:{s:8:"language";s:3:"bel";s:7:"version";s:6:"4.9.13";s:7:"updated";s:19:"2019-10-29 07:54:22";s:12:"english_name";s:10:"Belarusian";s:11:"native_name";s:29:"Беларуская мова";s:7:"package";s:63:"https://downloads.wordpress.org/translation/core/4.9.13/bel.zip";s:3:"iso";a:2:{i:1;s:2:"be";i:2;s:3:"bel";}s:7:"strings";a:1:{s:8:"continue";s:20:"Працягнуць";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-22 10:57:09";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bn_BD";a:8:{s:8:"language";s:5:"bn_BD";s:7:"version";s:6:"4.8.12";s:7:"updated";s:19:"2017-10-01 12:57:10";s:12:"english_name";s:20:"Bengali (Bangladesh)";s:11:"native_name";s:15:"বাংলা";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.8.12/bn_BD.zip";s:3:"iso";a:1:{i:1;s:2:"bn";}s:7:"strings";a:1:{s:8:"continue";s:23:"এগিয়ে চল.";}}s:2:"bo";a:8:{s:8:"language";s:2:"bo";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-20 05:00:26";s:12:"english_name";s:7:"Tibetan";s:11:"native_name";s:21:"བོད་ཡིག";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.3.2/bo.zip";s:3:"iso";a:2:{i:1;s:2:"bo";i:2;s:3:"tib";}s:7:"strings";a:1:{s:8:"continue";s:24:"མུ་མཐུད།";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-18 19:20:00";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-15 19:05:13";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.3.2/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:3:"ceb";a:8:{s:8:"language";s:3:"ceb";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-03-02 17:25:51";s:12:"english_name";s:7:"Cebuano";s:11:"native_name";s:7:"Cebuano";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip";s:3:"iso";a:2:{i:2;s:3:"ceb";i:3;s:3:"ceb";}s:7:"strings";a:1:{s:8:"continue";s:7:"Padayun";}}s:5:"cs_CZ";a:8:{s:8:"language";s:5:"cs_CZ";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-27 14:39:02";s:12:"english_name";s:5:"Czech";s:11:"native_name";s:9:"Čeština";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/cs_CZ.zip";s:3:"iso";a:2:{i:1;s:2:"cs";i:2;s:3:"ces";}s:7:"strings";a:1:{s:8:"continue";s:11:"Pokračovat";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-13 11:39:25";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.3.2/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-15 20:45:17";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:12:"de_DE_formal";a:8:{s:8:"language";s:12:"de_DE_formal";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-24 17:26:42";s:12:"english_name";s:15:"German (Formal)";s:11:"native_name";s:13:"Deutsch (Sie)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/5.3.2/de_DE_formal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-12 08:02:09";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:14:"de_CH_informal";a:8:{s:8:"language";s:14:"de_CH_informal";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-12 08:02:56";s:12:"english_name";s:30:"German (Switzerland, Informal)";s:11:"native_name";s:21:"Deutsch (Schweiz, Du)";s:7:"package";s:73:"https://downloads.wordpress.org/translation/core/5.3.2/de_CH_informal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:6:"Weiter";}}s:5:"de_AT";a:8:{s:8:"language";s:5:"de_AT";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-16 07:58:55";s:12:"english_name";s:16:"German (Austria)";s:11:"native_name";s:21:"Deutsch (Österreich)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/de_AT.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:6:"Weiter";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-24 17:29:56";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:3:"dzo";a:8:{s:8:"language";s:3:"dzo";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-06-29 08:59:03";s:12:"english_name";s:8:"Dzongkha";s:11:"native_name";s:18:"རྫོང་ཁ";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip";s:3:"iso";a:2:{i:1;s:2:"dz";i:2;s:3:"dzo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-10 10:14:21";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.3.2/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-11-28 17:31:58";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-11-28 17:04:17";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-14 09:42:12";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_NZ";a:8:{s:8:"language";s:5:"en_NZ";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-14 09:40:29";s:12:"english_name";s:21:"English (New Zealand)";s:11:"native_name";s:21:"English (New Zealand)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/en_NZ.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_ZA";a:8:{s:8:"language";s:5:"en_ZA";s:7:"version";s:5:"5.1.4";s:7:"updated";s:19:"2019-06-06 15:48:01";s:12:"english_name";s:22:"English (South Africa)";s:11:"native_name";s:22:"English (South Africa)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.1.4/en_ZA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-14 12:06:57";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.3.2/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_VE";a:8:{s:8:"language";s:5:"es_VE";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-11 03:56:06";s:12:"english_name";s:19:"Spanish (Venezuela)";s:11:"native_name";s:21:"Español de Venezuela";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/es_VE.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_AR";a:8:{s:8:"language";s:5:"es_AR";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-06 05:52:53";s:12:"english_name";s:19:"Spanish (Argentina)";s:11:"native_name";s:21:"Español de Argentina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/es_AR.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CR";a:8:{s:8:"language";s:5:"es_CR";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-10 15:47:49";s:12:"english_name";s:20:"Spanish (Costa Rica)";s:11:"native_name";s:22:"Español de Costa Rica";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/es_CR.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-04 17:46:33";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/es_MX.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-18 08:39:25";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/es_ES.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_UY";a:8:{s:8:"language";s:5:"es_UY";s:7:"version";s:3:"5.3";s:7:"updated";s:19:"2019-11-12 04:43:11";s:12:"english_name";s:17:"Spanish (Uruguay)";s:11:"native_name";s:19:"Español de Uruguay";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.3/es_UY.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:5:"5.2.5";s:7:"updated";s:19:"2019-12-07 04:01:34";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.2.5/es_CL.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_GT";a:8:{s:8:"language";s:5:"es_GT";s:7:"version";s:3:"5.1";s:7:"updated";s:19:"2019-03-02 06:35:01";s:12:"english_name";s:19:"Spanish (Guatemala)";s:11:"native_name";s:21:"Español de Guatemala";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.1/es_GT.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-09 09:36:22";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/es_PE.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CO";a:8:{s:8:"language";s:5:"es_CO";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-23 23:02:03";s:12:"english_name";s:18:"Spanish (Colombia)";s:11:"native_name";s:20:"Español de Colombia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/es_CO.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"et";a:8:{s:8:"language";s:2:"et";s:7:"version";s:9:"5.0-beta3";s:7:"updated";s:19:"2018-11-28 16:04:33";s:12:"english_name";s:8:"Estonian";s:11:"native_name";s:5:"Eesti";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/5.0-beta3/et.zip";s:3:"iso";a:2:{i:1;s:2:"et";i:2;s:3:"est";}s:7:"strings";a:1:{s:8:"continue";s:6:"Jätka";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-08 17:55:03";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.3.2/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-17 10:20:02";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-02 09:08:55";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.3.2/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-07 15:53:24";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:5:"fr_CA";a:8:{s:8:"language";s:5:"fr_CA";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-02 12:30:18";s:12:"english_name";s:15:"French (Canada)";s:11:"native_name";s:19:"Français du Canada";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/fr_CA.zip";s:3:"iso";a:2:{i:1;s:2:"fr";i:2;s:3:"fra";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:5:"fr_BE";a:8:{s:8:"language";s:5:"fr_BE";s:7:"version";s:5:"4.9.5";s:7:"updated";s:19:"2018-01-31 11:16:06";s:12:"english_name";s:16:"French (Belgium)";s:11:"native_name";s:21:"Français de Belgique";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.5/fr_BE.zip";s:3:"iso";a:2:{i:1;s:2:"fr";i:2;s:3:"fra";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:3:"fur";a:8:{s:8:"language";s:3:"fur";s:7:"version";s:5:"4.8.6";s:7:"updated";s:19:"2018-01-29 17:32:35";s:12:"english_name";s:8:"Friulian";s:11:"native_name";s:8:"Friulian";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.8.6/fur.zip";s:3:"iso";a:2:{i:2;s:3:"fur";i:3;s:3:"fur";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-08-23 17:41:37";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-01 17:58:42";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"gu";a:8:{s:8:"language";s:2:"gu";s:7:"version";s:5:"4.9.8";s:7:"updated";s:19:"2018-09-14 12:33:48";s:12:"english_name";s:8:"Gujarati";s:11:"native_name";s:21:"ગુજરાતી";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.8/gu.zip";s:3:"iso";a:2:{i:1;s:2:"gu";i:2;s:3:"guj";}s:7:"strings";a:1:{s:8:"continue";s:31:"ચાલુ રાખવું";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-05 00:59:09";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.4.2/haz.zip";s:3:"iso";a:1:{i:3;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-20 16:09:08";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:5:"hi_IN";a:8:{s:8:"language";s:5:"hi_IN";s:7:"version";s:5:"4.9.7";s:7:"updated";s:19:"2018-06-17 09:33:44";s:12:"english_name";s:5:"Hindi";s:11:"native_name";s:18:"हिन्दी";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.7/hi_IN.zip";s:3:"iso";a:2:{i:1;s:2:"hi";i:2;s:3:"hin";}s:7:"strings";a:1:{s:8:"continue";s:12:"जारी";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-17 16:22:28";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.3.2/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:3:"hsb";a:8:{s:8:"language";s:3:"hsb";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-11-28 17:22:10";s:12:"english_name";s:13:"Upper Sorbian";s:11:"native_name";s:17:"Hornjoserbšćina";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.3.2/hsb.zip";s:3:"iso";a:2:{i:2;s:3:"hsb";i:3;s:3:"hsb";}s:7:"strings";a:1:{s:8:"continue";s:4:"Dale";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:5:"5.1.1";s:7:"updated";s:19:"2019-03-19 14:36:40";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.1.1/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:2:"hy";a:8:{s:8:"language";s:2:"hy";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-12-03 16:21:10";s:12:"english_name";s:8:"Armenian";s:11:"native_name";s:14:"Հայերեն";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip";s:3:"iso";a:2:{i:1;s:2:"hy";i:2;s:3:"hye";}s:7:"strings";a:1:{s:8:"continue";s:20:"Շարունակել";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-04 22:54:51";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:6:"4.7.11";s:7:"updated";s:19:"2018-09-20 11:13:37";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.7.11/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-20 17:02:39";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-02 04:22:13";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.3.2/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"jv_ID";a:8:{s:8:"language";s:5:"jv_ID";s:7:"version";s:5:"4.9.5";s:7:"updated";s:19:"2018-03-24 13:53:29";s:12:"english_name";s:8:"Javanese";s:11:"native_name";s:9:"Basa Jawa";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.5/jv_ID.zip";s:3:"iso";a:2:{i:1;s:2:"jv";i:2;s:3:"jav";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nutugne";}}s:5:"ka_GE";a:8:{s:8:"language";s:5:"ka_GE";s:7:"version";s:5:"5.1.4";s:7:"updated";s:19:"2019-11-04 08:57:25";s:12:"english_name";s:8:"Georgian";s:11:"native_name";s:21:"ქართული";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.1.4/ka_GE.zip";s:3:"iso";a:2:{i:1;s:2:"ka";i:2;s:3:"kat";}s:7:"strings";a:1:{s:8:"continue";s:30:"გაგრძელება";}}s:3:"kab";a:8:{s:8:"language";s:3:"kab";s:7:"version";s:5:"4.9.8";s:7:"updated";s:19:"2018-09-21 14:15:57";s:12:"english_name";s:6:"Kabyle";s:11:"native_name";s:9:"Taqbaylit";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.9.8/kab.zip";s:3:"iso";a:2:{i:2;s:3:"kab";i:3;s:3:"kab";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"kk";a:8:{s:8:"language";s:2:"kk";s:7:"version";s:5:"4.9.5";s:7:"updated";s:19:"2018-03-12 08:08:32";s:12:"english_name";s:6:"Kazakh";s:11:"native_name";s:19:"Қазақ тілі";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.5/kk.zip";s:3:"iso";a:2:{i:1;s:2:"kk";i:2;s:3:"kaz";}s:7:"strings";a:1:{s:8:"continue";s:20:"Жалғастыру";}}s:2:"km";a:8:{s:8:"language";s:2:"km";s:7:"version";s:5:"5.0.3";s:7:"updated";s:19:"2019-01-09 07:34:10";s:12:"english_name";s:5:"Khmer";s:11:"native_name";s:27:"ភាសាខ្មែរ";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.0.3/km.zip";s:3:"iso";a:2:{i:1;s:2:"km";i:2;s:3:"khm";}s:7:"strings";a:1:{s:8:"continue";s:12:"បន្ត";}}s:2:"kn";a:8:{s:8:"language";s:2:"kn";s:7:"version";s:6:"4.9.13";s:7:"updated";s:19:"2019-12-04 12:22:34";s:12:"english_name";s:7:"Kannada";s:11:"native_name";s:15:"ಕನ್ನಡ";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.9.13/kn.zip";s:3:"iso";a:2:{i:1;s:2:"kn";i:2;s:3:"kan";}s:7:"strings";a:1:{s:8:"continue";s:30:"ಮುಂದುವರೆಸಿ";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:5:"5.2.5";s:7:"updated";s:19:"2019-11-05 01:54:57";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.2.5/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:3:"ckb";a:8:{s:8:"language";s:3:"ckb";s:7:"version";s:5:"4.9.9";s:7:"updated";s:19:"2018-12-18 14:32:44";s:12:"english_name";s:16:"Kurdish (Sorani)";s:11:"native_name";s:13:"كوردی‎";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.9.9/ckb.zip";s:3:"iso";a:2:{i:1;s:2:"ku";i:3;s:3:"ckb";}s:7:"strings";a:1:{s:8:"continue";s:30:"به‌رده‌وام به‌";}}s:2:"lo";a:8:{s:8:"language";s:2:"lo";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-12 09:59:23";s:12:"english_name";s:3:"Lao";s:11:"native_name";s:21:"ພາສາລາວ";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip";s:3:"iso";a:2:{i:1;s:2:"lo";i:2;s:3:"lao";}s:7:"strings";a:1:{s:8:"continue";s:9:"ຕໍ່";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:5:"5.2.5";s:7:"updated";s:19:"2019-10-19 19:23:46";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.2.5/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:2:"lv";a:8:{s:8:"language";s:2:"lv";s:7:"version";s:6:"4.7.15";s:7:"updated";s:19:"2019-05-10 10:24:08";s:12:"english_name";s:7:"Latvian";s:11:"native_name";s:16:"Latviešu valoda";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.15/lv.zip";s:3:"iso";a:2:{i:1;s:2:"lv";i:2;s:3:"lav";}s:7:"strings";a:1:{s:8:"continue";s:9:"Turpināt";}}s:5:"mk_MK";a:8:{s:8:"language";s:5:"mk_MK";s:7:"version";s:5:"5.2.3";s:7:"updated";s:19:"2019-09-08 12:57:25";s:12:"english_name";s:10:"Macedonian";s:11:"native_name";s:31:"Македонски јазик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.2.3/mk_MK.zip";s:3:"iso";a:2:{i:1;s:2:"mk";i:2;s:3:"mkd";}s:7:"strings";a:1:{s:8:"continue";s:16:"Продолжи";}}s:5:"ml_IN";a:8:{s:8:"language";s:5:"ml_IN";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-27 03:43:32";s:12:"english_name";s:9:"Malayalam";s:11:"native_name";s:18:"മലയാളം";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip";s:3:"iso";a:2:{i:1;s:2:"ml";i:2;s:3:"mal";}s:7:"strings";a:1:{s:8:"continue";s:18:"തുടരുക";}}s:2:"mn";a:8:{s:8:"language";s:2:"mn";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-12 07:29:35";s:12:"english_name";s:9:"Mongolian";s:11:"native_name";s:12:"Монгол";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/mn.zip";s:3:"iso";a:2:{i:1;s:2:"mn";i:2;s:3:"mon";}s:7:"strings";a:1:{s:8:"continue";s:24:"Үргэлжлүүлэх";}}s:2:"mr";a:8:{s:8:"language";s:2:"mr";s:7:"version";s:6:"4.8.11";s:7:"updated";s:19:"2018-02-13 07:38:55";s:12:"english_name";s:7:"Marathi";s:11:"native_name";s:15:"मराठी";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.8.11/mr.zip";s:3:"iso";a:2:{i:1;s:2:"mr";i:2;s:3:"mar";}s:7:"strings";a:1:{s:8:"continue";s:25:"सुरु ठेवा";}}s:5:"ms_MY";a:8:{s:8:"language";s:5:"ms_MY";s:7:"version";s:5:"4.9.8";s:7:"updated";s:19:"2018-08-30 20:27:25";s:12:"english_name";s:5:"Malay";s:11:"native_name";s:13:"Bahasa Melayu";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.8/ms_MY.zip";s:3:"iso";a:2:{i:1;s:2:"ms";i:2;s:3:"msa";}s:7:"strings";a:1:{s:8:"continue";s:8:"Teruskan";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:6:"4.1.20";s:7:"updated";s:19:"2015-03-26 15:57:42";s:12:"english_name";s:17:"Myanmar (Burmese)";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.1.20/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-10 15:54:44";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"ne_NP";a:8:{s:8:"language";s:5:"ne_NP";s:7:"version";s:5:"4.9.5";s:7:"updated";s:19:"2018-03-27 10:30:26";s:12:"english_name";s:6:"Nepali";s:11:"native_name";s:18:"नेपाली";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.5/ne_NP.zip";s:3:"iso";a:2:{i:1;s:2:"ne";i:2;s:3:"nep";}s:7:"strings";a:1:{s:8:"continue";s:31:"जारीराख्नु ";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-12 09:57:15";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nl_BE";a:8:{s:8:"language";s:5:"nl_BE";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-17 19:42:41";s:12:"english_name";s:15:"Dutch (Belgium)";s:11:"native_name";s:20:"Nederlands (België)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/nl_BE.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:12:"nl_NL_formal";a:8:{s:8:"language";s:12:"nl_NL_formal";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-15 20:22:22";s:12:"english_name";s:14:"Dutch (Formal)";s:11:"native_name";s:20:"Nederlands (Formeel)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/5.3.2/nl_NL_formal.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-01 08:53:00";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:3:"oci";a:8:{s:8:"language";s:3:"oci";s:7:"version";s:5:"4.8.3";s:7:"updated";s:19:"2017-08-25 10:03:08";s:12:"english_name";s:7:"Occitan";s:11:"native_name";s:7:"Occitan";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.8.3/oci.zip";s:3:"iso";a:2:{i:1;s:2:"oc";i:2;s:3:"oci";}s:7:"strings";a:1:{s:8:"continue";s:9:"Contunhar";}}s:5:"pa_IN";a:8:{s:8:"language";s:5:"pa_IN";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-16 05:19:43";s:12:"english_name";s:7:"Punjabi";s:11:"native_name";s:18:"ਪੰਜਾਬੀ";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip";s:3:"iso";a:2:{i:1;s:2:"pa";i:2;s:3:"pan";}s:7:"strings";a:1:{s:8:"continue";s:25:"ਜਾਰੀ ਰੱਖੋ";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-18 18:30:50";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:6:"4.1.20";s:7:"updated";s:19:"2015-03-29 22:19:48";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1.20/ps.zip";s:3:"iso";a:2:{i:1;s:2:"ps";i:2;s:3:"pus";}s:7:"strings";a:1:{s:8:"continue";s:8:"دوام";}}s:10:"pt_PT_ao90";a:8:{s:8:"language";s:10:"pt_PT_ao90";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-08 13:01:50";s:12:"english_name";s:27:"Portuguese (Portugal, AO90)";s:11:"native_name";s:17:"Português (AO90)";s:7:"package";s:69:"https://downloads.wordpress.org/translation/core/5.3.2/pt_PT_ao90.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-22 00:32:52";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-04 11:20:43";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_AO";a:8:{s:8:"language";s:5:"pt_AO";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-14 08:20:00";s:12:"english_name";s:19:"Portuguese (Angola)";s:11:"native_name";s:20:"Português de Angola";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/pt_AO.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"rhg";a:8:{s:8:"language";s:3:"rhg";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-03-16 13:03:18";s:12:"english_name";s:8:"Rohingya";s:11:"native_name";s:8:"Ruáinga";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip";s:3:"iso";a:1:{i:3;s:3:"rhg";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-21 13:50:04";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-17 16:11:46";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:3:"sah";a:8:{s:8:"language";s:3:"sah";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-21 02:06:41";s:12:"english_name";s:5:"Sakha";s:11:"native_name";s:14:"Сахалыы";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip";s:3:"iso";a:2:{i:2;s:3:"sah";i:3;s:3:"sah";}s:7:"strings";a:1:{s:8:"continue";s:12:"Салҕаа";}}s:3:"snd";a:8:{s:8:"language";s:3:"snd";s:7:"version";s:3:"5.3";s:7:"updated";s:19:"2019-11-12 04:37:38";s:12:"english_name";s:6:"Sindhi";s:11:"native_name";s:8:"سنڌي";s:7:"package";s:60:"https://downloads.wordpress.org/translation/core/5.3/snd.zip";s:3:"iso";a:3:{i:1;s:2:"sd";i:2;s:2:"sd";i:3;s:3:"snd";}s:7:"strings";a:1:{s:8:"continue";s:15:"اڳتي هلو";}}s:5:"si_LK";a:8:{s:8:"language";s:5:"si_LK";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-12 06:00:52";s:12:"english_name";s:7:"Sinhala";s:11:"native_name";s:15:"සිංහල";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip";s:3:"iso";a:2:{i:1;s:2:"si";i:2;s:3:"sin";}s:7:"strings";a:1:{s:8:"continue";s:44:"දිගටම කරගෙන යන්න";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-02 07:46:23";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:3:"skr";a:8:{s:8:"language";s:3:"skr";s:7:"version";s:5:"5.2.3";s:7:"updated";s:19:"2019-06-26 11:40:37";s:12:"english_name";s:7:"Saraiki";s:11:"native_name";s:14:"سرائیکی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/5.2.3/skr.zip";s:3:"iso";a:1:{i:3;s:3:"skr";}s:7:"strings";a:1:{s:8:"continue";s:17:"جاری رکھو";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-04 13:33:13";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:2:"sq";a:8:{s:8:"language";s:2:"sq";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-14 22:44:44";s:12:"english_name";s:8:"Albanian";s:11:"native_name";s:5:"Shqip";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.3.2/sq.zip";s:3:"iso";a:2:{i:1;s:2:"sq";i:2;s:3:"sqi";}s:7:"strings";a:1:{s:8:"continue";s:6:"Vazhdo";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-15 22:50:02";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-12 07:05:13";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"sw";a:8:{s:8:"language";s:2:"sw";s:7:"version";s:5:"5.2.5";s:7:"updated";s:19:"2019-10-22 00:19:41";s:12:"english_name";s:7:"Swahili";s:11:"native_name";s:9:"Kiswahili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.2.5/sw.zip";s:3:"iso";a:2:{i:1;s:2:"sw";i:2;s:3:"swa";}s:7:"strings";a:1:{s:8:"continue";s:7:"Endelea";}}s:3:"szl";a:8:{s:8:"language";s:3:"szl";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-24 19:58:14";s:12:"english_name";s:8:"Silesian";s:11:"native_name";s:17:"Ślōnskŏ gŏdka";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip";s:3:"iso";a:1:{i:3;s:3:"szl";}s:7:"strings";a:1:{s:8:"continue";s:13:"Kōntynuować";}}s:5:"ta_IN";a:8:{s:8:"language";s:5:"ta_IN";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-27 03:22:47";s:12:"english_name";s:5:"Tamil";s:11:"native_name";s:15:"தமிழ்";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip";s:3:"iso";a:2:{i:1;s:2:"ta";i:2;s:3:"tam";}s:7:"strings";a:1:{s:8:"continue";s:24:"தொடரவும்";}}s:2:"te";a:8:{s:8:"language";s:2:"te";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-26 15:47:39";s:12:"english_name";s:6:"Telugu";s:11:"native_name";s:18:"తెలుగు";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/te.zip";s:3:"iso";a:2:{i:1;s:2:"te";i:2;s:3:"tel";}s:7:"strings";a:1:{s:8:"continue";s:30:"కొనసాగించు";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:5:"5.2.4";s:7:"updated";s:19:"2019-10-19 08:19:37";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.2.4/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:2:"tl";a:8:{s:8:"language";s:2:"tl";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-12-30 02:38:08";s:12:"english_name";s:7:"Tagalog";s:11:"native_name";s:7:"Tagalog";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/tl.zip";s:3:"iso";a:2:{i:1;s:2:"tl";i:2;s:3:"tgl";}s:7:"strings";a:1:{s:8:"continue";s:10:"Magpatuloy";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-21 13:52:32";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"tt_RU";a:8:{s:8:"language";s:5:"tt_RU";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-20 20:20:50";s:12:"english_name";s:5:"Tatar";s:11:"native_name";s:19:"Татар теле";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip";s:3:"iso";a:2:{i:1;s:2:"tt";i:2;s:3:"tat";}s:7:"strings";a:1:{s:8:"continue";s:17:"дәвам итү";}}s:3:"tah";a:8:{s:8:"language";s:3:"tah";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-03-06 18:39:39";s:12:"english_name";s:8:"Tahitian";s:11:"native_name";s:10:"Reo Tahiti";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip";s:3:"iso";a:3:{i:1;s:2:"ty";i:2;s:3:"tah";i:3;s:3:"tah";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:5:"4.9.5";s:7:"updated";s:19:"2018-04-12 12:31:53";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:16:"ئۇيغۇرچە";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.5/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-02-03 23:36:03";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.3.2/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:2:"ur";a:8:{s:8:"language";s:2:"ur";s:7:"version";s:5:"5.1.4";s:7:"updated";s:19:"2019-03-31 10:39:40";s:12:"english_name";s:4:"Urdu";s:11:"native_name";s:8:"اردو";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.1.4/ur.zip";s:3:"iso";a:2:{i:1;s:2:"ur";i:2;s:3:"urd";}s:7:"strings";a:1:{s:8:"continue";s:19:"جاری رکھیں";}}s:5:"uz_UZ";a:8:{s:8:"language";s:5:"uz_UZ";s:7:"version";s:5:"5.0.3";s:7:"updated";s:19:"2019-01-23 12:32:40";s:12:"english_name";s:5:"Uzbek";s:11:"native_name";s:11:"O‘zbekcha";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.0.3/uz_UZ.zip";s:3:"iso";a:2:{i:1;s:2:"uz";i:2;s:3:"uzb";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:2:"vi";a:8:{s:8:"language";s:2:"vi";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-07 15:52:24";s:12:"english_name";s:10:"Vietnamese";s:11:"native_name";s:14:"Tiếng Việt";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/5.3.2/vi.zip";s:3:"iso";a:2:{i:1;s:2:"vi";i:2;s:3:"vie";}s:7:"strings";a:1:{s:8:"continue";s:12:"Tiếp tục";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2020-01-16 03:03:10";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-08 21:26:25";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}s:5:"zh_HK";a:8:{s:8:"language";s:5:"zh_HK";s:7:"version";s:5:"5.3.2";s:7:"updated";s:19:"2019-12-29 17:33:44";s:12:"english_name";s:19:"Chinese (Hong Kong)";s:11:"native_name";s:16:"香港中文版	";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/5.3.2/zh_HK.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}}','no');
INSERT INTO `wp_options` VALUES (538,'ossdl_off_cdn_url','http://zhuhouyu.xyz','yes');
INSERT INTO `wp_options` VALUES (539,'ossdl_off_include_dirs','wp-content,wp-includes','yes');
INSERT INTO `wp_options` VALUES (574,'_site_transient_timeout_browser_2f6a0a42b23284f22b476bca515bee61','1582947408','no');
INSERT INTO `wp_options` VALUES (537,'ossdl_off_blog_url','http://zhuhouyu.xyz','yes');
INSERT INTO `wp_options` VALUES (535,'wpsupercache_start','1582309537','yes');
INSERT INTO `wp_options` VALUES (536,'wpsupercache_count','0','yes');
INSERT INTO `wp_options` VALUES (540,'ossdl_off_exclude','.php','yes');
INSERT INTO `wp_options` VALUES (541,'ossdl_cname','','yes');
INSERT INTO `wp_options` VALUES (542,'supercache_stats','a:3:{s:9:"generated";i:1582309589;s:10:"supercache";a:5:{s:7:"expired";i:0;s:6:"cached";i:0;s:5:"fsize";i:0;s:11:"cached_list";a:0:{}s:12:"expired_list";a:0:{}}s:7:"wpcache";a:5:{s:7:"expired";i:0;s:6:"cached";i:0;s:5:"fsize";i:0;s:11:"cached_list";a:0:{}s:12:"expired_list";a:0:{}}}','yes');
INSERT INTO `wp_options` VALUES (719,'updraft_jobdata_5e50ff8a05e2','a:5:{s:8:"job_type";s:8:"download";s:11:"job_time_ms";d:1582366785.337823;s:29:"dlmessage_1582366602_others_0";s:79:"This file does not exist locally, and there is no remote storage for this file.";s:7:"service";a:1:{i:0;s:4:"none";}s:26:"dlfile_1582366602_others_0";s:130:"downloading:895097:/www/web/zhuhouyu_xyz/public_html/wp-content/updraft/backup_2020-02-22-1816_zhuhouyuxyz_2327e23dfe04-others.zip";}','no');
INSERT INTO `wp_options` VALUES (717,'updraft_last_backup','a:5:{s:11:"backup_time";i:1582366602;s:12:"backup_array";a:11:{s:7:"plugins";a:1:{i:0;s:59:"backup_2020-02-22-1816_zhuhouyuxyz_2327e23dfe04-plugins.zip";}s:12:"plugins-size";i:13329757;s:6:"themes";a:1:{i:0;s:58:"backup_2020-02-22-1816_zhuhouyuxyz_2327e23dfe04-themes.zip";}s:11:"themes-size";i:680154;s:7:"uploads";a:1:{i:0;s:59:"backup_2020-02-22-1816_zhuhouyuxyz_2327e23dfe04-uploads.zip";}s:12:"uploads-size";i:418600;s:6:"others";a:1:{i:0;s:58:"backup_2020-02-22-1816_zhuhouyuxyz_2327e23dfe04-others.zip";}s:11:"others-size";i:895097;s:2:"db";s:53:"backup_2020-02-22-1816_zhuhouyuxyz_2327e23dfe04-db.gz";s:7:"db-size";i:46146;s:9:"checksums";a:2:{s:4:"sha1";a:5:{s:8:"plugins0";s:40:"9228db51e62d24f7b8b119a8b157c40b065fb987";s:7:"themes0";s:40:"2854758c8eaac31eb9a4ea134867d33fe19719e4";s:8:"uploads0";s:40:"1ffa0e7ac5f5962981c80b628d1a0dbdbb75e707";s:7:"others0";s:40:"38d8bc37e975ec2fb95e29901a8d3f039210dd30";s:3:"db0";s:40:"a0a632d332296b7009b393cb64c7133795030ad0";}s:6:"sha256";a:5:{s:8:"plugins0";s:64:"377d5cfba08e7cdaeb5b863816b09415583694d3bd441b1c92625977bf8db1a8";s:7:"themes0";s:64:"818cde71b2e862ce45fdc88b00c026f8885d0555bde8854a0b98f93dc059a3f4";s:8:"uploads0";s:64:"853ef51a6fb97754d41a8aeef1dc2a718a4a0f2357bc4e60194592cab1638f78";s:7:"others0";s:64:"c788bc90a220a922290d57db19d08484f20aab62cc7131428292b36c619ed400";s:3:"db0";s:64:"c29a7f476d73723ed03cb0fce5981d38352a6f3358be47488a83c2cbc3f387ea";}}}s:7:"success";i:1;s:6:"errors";a:0:{}s:12:"backup_nonce";s:12:"2327e23dfe04";}','yes');
INSERT INTO `wp_options` VALUES (718,'updraft_jobdata_5e50ff8a0512','a:5:{s:8:"job_type";s:8:"download";s:11:"job_time_ms";d:1582366783.870928;s:30:"dlmessage_1582366602_uploads_0";s:79:"This file does not exist locally, and there is no remote storage for this file.";s:7:"service";a:1:{i:0;s:4:"none";}s:27:"dlfile_1582366602_uploads_0";s:131:"downloading:418600:/www/web/zhuhouyu_xyz/public_html/wp-content/updraft/backup_2020-02-22-1816_zhuhouyuxyz_2327e23dfe04-uploads.zip";}','no');
INSERT INTO `wp_options` VALUES (651,'_transient_timeout_dash_v2_5438fb5baf31c513fff2b9a1067656a6','1582397158','no');
INSERT INTO `wp_options` VALUES (652,'_transient_dash_v2_5438fb5baf31c513fff2b9a1067656a6','<div class="rss-widget"><p><strong>RSS错误：</strong> A feed could not be found at https://wordpress.org/news/feed/. A feed with an invalid mime type may fall victim to this error, or SimplePie was unable to auto-discover it.. Use force_feed() if you are certain this URL is a real feed.</p></div><div class="rss-widget"><p><strong>RSS错误：</strong> A feed could not be found at https://planet.wordpress.org/feed/. A feed with an invalid mime type may fall victim to this error, or SimplePie was unable to auto-discover it.. Use force_feed() if you are certain this URL is a real feed.</p></div>','no');
INSERT INTO `wp_options` VALUES (656,'_transient_timeout_settings_errors','1582354897','no');
INSERT INTO `wp_options` VALUES (657,'_transient_settings_errors','a:1:{i:0;a:4:{s:7:"setting";s:7:"general";s:4:"code";s:16:"settings_updated";s:7:"message";s:18:"设置已保存。";s:4:"type";s:7:"success";}}','no');
INSERT INTO `wp_options` VALUES (740,'wpvivid_remote_init','init','no');
INSERT INTO `wp_options` VALUES (496,'_site_transient_timeout_browser_77b20fce964930bb1a62d1f513afd58d','1582907794','no');
INSERT INTO `wp_options` VALUES (497,'_site_transient_browser_77b20fce964930bb1a62d1f513afd58d','a:10:{s:4:"name";s:6:"Chrome";s:7:"version";s:12:"77.0.3865.92";s:8:"platform";s:7:"Android";s:10:"update_url";s:0:"";s:7:"img_src";s:0:"";s:11:"img_src_ssl";s:0:"";s:15:"current_version";s:0:"";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:1;}','no');
INSERT INTO `wp_options` VALUES (498,'_site_transient_timeout_community-events-ca2a77f684069d4020a542f9c0091b41','1582346201','no');
INSERT INTO `wp_options` VALUES (499,'_site_transient_community-events-ca2a77f684069d4020a542f9c0091b41','a:3:{s:9:"sandboxed";b:0;s:8:"location";a:1:{s:2:"ip";s:12:"112.67.105.0";}s:6:"events";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (502,'minty_mblog','none','yes');
INSERT INTO `wp_options` VALUES (745,'clean_task','a:1:{i:0;b:0;}','no');
INSERT INTO `wp_options` VALUES (692,'updraftplus_version','1.16.22','yes');
INSERT INTO `wp_options` VALUES (693,'updraft_updraftvault','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-ed63c3d1dad8a27861424ced94060394";a:3:{s:5:"token";s:0:"";s:5:"email";s:0:"";s:5:"quota";i:-1;}}}','yes');
INSERT INTO `wp_options` VALUES (694,'updraft_dropbox','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-87725e37f234f5ee67d6b1f9cc13f144";a:4:{s:6:"appkey";s:0:"";s:6:"secret";s:0:"";s:6:"folder";s:0:"";s:15:"tk_access_token";s:0:"";}}}','yes');
INSERT INTO `wp_options` VALUES (695,'updraft_s3','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-4c69393b3e2f53c46acf253278f03a86";a:5:{s:9:"accesskey";s:0:"";s:9:"secretkey";s:0:"";s:4:"path";s:0:"";s:3:"rrs";s:0:"";s:22:"server_side_encryption";s:0:"";}}}','yes');
INSERT INTO `wp_options` VALUES (696,'updraft_cloudfiles','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-15311b872a35f3e6fae653ecff6ddc76";a:5:{s:4:"user";s:0:"";s:7:"authurl";s:35:"https://auth.api.rackspacecloud.com";s:6:"apikey";s:0:"";s:4:"path";s:0:"";s:6:"region";N;}}}','yes');
INSERT INTO `wp_options` VALUES (697,'updraft_googledrive','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-afb433a33d0b01eb59b36b18cbd44026";a:3:{s:8:"clientid";s:0:"";s:6:"secret";s:0:"";s:5:"token";s:0:"";}}}','yes');
INSERT INTO `wp_options` VALUES (698,'updraft_onedrive','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-c11a87cb7474fd805561e31f168fb56b";a:0:{}}}','yes');
INSERT INTO `wp_options` VALUES (699,'updraft_ftp','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-c17df8c95a5c261da1952227ebb01c78";a:5:{s:4:"host";s:0:"";s:4:"user";s:0:"";s:4:"pass";s:0:"";s:4:"path";s:0:"";s:7:"passive";i:1;}}}','yes');
INSERT INTO `wp_options` VALUES (700,'updraft_azure','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-166b4e122676ea7d1f3f3db558a2771c";a:0:{}}}','yes');
INSERT INTO `wp_options` VALUES (701,'updraft_sftp','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-dfa10c955ee96d3b854d82e528bd8b33";a:0:{}}}','yes');
INSERT INTO `wp_options` VALUES (702,'updraft_googlecloud','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-9779135405893ecb6bda8a42be012ebe";a:0:{}}}','yes');
INSERT INTO `wp_options` VALUES (703,'updraft_backblaze','a:2:{s:7:"version";i:1;s:8:"settings";a:1:{s:34:"s-ac1bfc5d937745cf2faff68c9ec10471";a:0:{}}}','yes');
INSERT INTO `wp_options` VALUES (733,'wpvivid_email_setting','a:3:{s:7:"send_to";a:0:{}s:6:"always";b:1;s:12:"email_enable";b:0;}','no');
INSERT INTO `wp_options` VALUES (734,'wpvivid_compress_setting','a:7:{s:13:"compress_type";s:3:"zip";s:13:"max_file_size";i:200;s:11:"no_compress";b:1;s:13:"use_temp_file";i:1;s:13:"use_temp_size";i:16;s:17:"exclude_file_size";i:0;s:24:"subpackage_plugin_upload";b:0;}','no');
INSERT INTO `wp_options` VALUES (735,'wpvivid_local_setting','a:2:{s:4:"path";s:14:"wpvividbackups";s:10:"save_local";i:1;}','no');
INSERT INTO `wp_options` VALUES (736,'wpvivid_upload_setting','a:1:{s:15:"remote_selected";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (737,'wpvivid_common_setting','a:11:{s:18:"max_execution_time";i:900;s:17:"log_save_location";s:26:"wpvividbackups/wpvivid_log";s:16:"max_backup_count";i:3;s:14:"show_admin_bar";b:1;s:13:"show_tab_menu";b:1;s:14:"domain_include";b:1;s:15:"estimate_backup";b:1;s:16:"max_resume_count";i:6;s:12:"memory_limit";s:4:"256M";s:20:"restore_memory_limit";s:4:"256M";s:12:"migrate_size";s:4:"2048";}','no');
INSERT INTO `wp_options` VALUES (588,'widget_wp_user_avatar_profile','a:1:{s:12:"_multiwidget";i:1;}','yes');
INSERT INTO `wp_options` VALUES (589,'avatar_default_wp_user_avatar','127','yes');
INSERT INTO `wp_options` VALUES (590,'wp_user_avatar_allow_upload','0','yes');
INSERT INTO `wp_options` VALUES (591,'wp_user_avatar_disable_gravatar','0','yes');
INSERT INTO `wp_options` VALUES (592,'wp_user_avatar_edit_avatar','1','yes');
INSERT INTO `wp_options` VALUES (593,'wp_user_avatar_resize_crop','0','yes');
INSERT INTO `wp_options` VALUES (594,'wp_user_avatar_resize_h','96','yes');
INSERT INTO `wp_options` VALUES (595,'wp_user_avatar_resize_upload','0','yes');
INSERT INTO `wp_options` VALUES (596,'wp_user_avatar_resize_w','96','yes');
INSERT INTO `wp_options` VALUES (597,'wp_user_avatar_tinymce','1','yes');
INSERT INTO `wp_options` VALUES (598,'wp_user_avatar_upload_size_limit','31457280','yes');
INSERT INTO `wp_options` VALUES (599,'wp_user_avatar_default_avatar_updated','1','yes');
INSERT INTO `wp_options` VALUES (600,'wp_user_avatar_users_updated','1','yes');
INSERT INTO `wp_options` VALUES (601,'wp_user_avatar_media_updated','1','yes');
INSERT INTO `wp_options` VALUES (731,'_site_transient_update_themes','O:8:"stdClass":4:{s:12:"last_checked";i:1582366956;s:7:"checked";a:1:{s:5:"minty";s:3:"2.1";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (742,'_site_transient_update_plugins','O:8:"stdClass":5:{s:12:"last_checked";i:1582366968;s:7:"checked";a:16:{s:19:"akismet/akismet.php";s:5:"4.1.3";s:81:"auto-login-new-user-after-registration/auto-login-new-user-after-registration.php";s:5:"1.7.1";s:21:"backwpup/backwpup.php";s:5:"3.7.0";s:45:"disable-google-fonts/disable-google-fonts.php";s:3:"2.0";s:29:"easy-wp-smtp/easy-wp-smtp.php";s:7:"1.3.9.2";s:9:"hello.php";s:5:"1.7.2";s:18:"kill-429/index.php";s:5:"1.0.0";s:27:"updraftplus/updraftplus.php";s:7:"1.16.22";s:28:"wechat-social-login/init.php";s:5:"1.3.0";s:31:"wpsilo-update/wpsilo-update.php";s:3:"1.0";s:35:"wp-fastest-cache/wpFastestCache.php";s:7:"0.9.0.3";s:19:"wp-smtp/wp-smtp.php";s:6:"1.1.10";s:27:"wp-super-cache/wp-cache.php";s:5:"1.7.1";s:33:"wp-user-avatar/wp-user-avatar.php";s:5:"2.2.5";s:47:"wpvivid-backuprestore/wpvivid-backuprestore.php";s:6:"0.9.34";s:29:"nicetheme-jimu/nc-plugins.php";s:5:"0.3.6";}s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:14:{s:19:"akismet/akismet.php";O:8:"stdClass":9:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"4.1.3";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.4.1.3.zip";s:5:"icons";a:2:{s:2:"2x";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";s:2:"1x";s:59:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272";}s:7:"banners";a:1:{s:2:"1x";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";}s:11:"banners_rtl";a:0:{}}s:81:"auto-login-new-user-after-registration/auto-login-new-user-after-registration.php";O:8:"stdClass":9:{s:2:"id";s:52:"w.org/plugins/auto-login-new-user-after-registration";s:4:"slug";s:38:"auto-login-new-user-after-registration";s:6:"plugin";s:81:"auto-login-new-user-after-registration/auto-login-new-user-after-registration.php";s:11:"new_version";s:5:"1.7.1";s:3:"url";s:69:"https://wordpress.org/plugins/auto-login-new-user-after-registration/";s:7:"package";s:87:"https://downloads.wordpress.org/plugin/auto-login-new-user-after-registration.1.7.1.zip";s:5:"icons";a:2:{s:2:"2x";s:91:"https://ps.w.org/auto-login-new-user-after-registration/assets/icon-256x256.png?rev=1427227";s:2:"1x";s:91:"https://ps.w.org/auto-login-new-user-after-registration/assets/icon-128x128.png?rev=1427227";}s:7:"banners";a:2:{s:2:"2x";s:94:"https://ps.w.org/auto-login-new-user-after-registration/assets/banner-1544x500.png?rev=1427222";s:2:"1x";s:93:"https://ps.w.org/auto-login-new-user-after-registration/assets/banner-772x250.png?rev=1427222";}s:11:"banners_rtl";a:0:{}}s:21:"backwpup/backwpup.php";O:8:"stdClass":9:{s:2:"id";s:22:"w.org/plugins/backwpup";s:4:"slug";s:8:"backwpup";s:6:"plugin";s:21:"backwpup/backwpup.php";s:11:"new_version";s:5:"3.7.0";s:3:"url";s:39:"https://wordpress.org/plugins/backwpup/";s:7:"package";s:57:"https://downloads.wordpress.org/plugin/backwpup.3.7.0.zip";s:5:"icons";a:2:{s:2:"2x";s:61:"https://ps.w.org/backwpup/assets/icon-256x256.png?rev=1422084";s:2:"1x";s:61:"https://ps.w.org/backwpup/assets/icon-128x128.png?rev=1422084";}s:7:"banners";a:2:{s:2:"2x";s:64:"https://ps.w.org/backwpup/assets/banner-1544x500.png?rev=2153988";s:2:"1x";s:63:"https://ps.w.org/backwpup/assets/banner-772x250.png?rev=2153988";}s:11:"banners_rtl";a:0:{}}s:45:"disable-google-fonts/disable-google-fonts.php";O:8:"stdClass":9:{s:2:"id";s:34:"w.org/plugins/disable-google-fonts";s:4:"slug";s:20:"disable-google-fonts";s:6:"plugin";s:45:"disable-google-fonts/disable-google-fonts.php";s:11:"new_version";s:3:"2.0";s:3:"url";s:51:"https://wordpress.org/plugins/disable-google-fonts/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/disable-google-fonts.2.0.zip";s:5:"icons";a:1:{s:7:"default";s:64:"https://s.w.org/plugins/geopattern-icon/disable-google-fonts.svg";}s:7:"banners";a:0:{}s:11:"banners_rtl";a:0:{}}s:29:"easy-wp-smtp/easy-wp-smtp.php";O:8:"stdClass":9:{s:2:"id";s:26:"w.org/plugins/easy-wp-smtp";s:4:"slug";s:12:"easy-wp-smtp";s:6:"plugin";s:29:"easy-wp-smtp/easy-wp-smtp.php";s:11:"new_version";s:7:"1.3.9.2";s:3:"url";s:43:"https://wordpress.org/plugins/easy-wp-smtp/";s:7:"package";s:55:"https://downloads.wordpress.org/plugin/easy-wp-smtp.zip";s:5:"icons";a:1:{s:2:"1x";s:65:"https://ps.w.org/easy-wp-smtp/assets/icon-128x128.png?rev=1242044";}s:7:"banners";a:1:{s:2:"1x";s:67:"https://ps.w.org/easy-wp-smtp/assets/banner-772x250.png?rev=1650323";}s:11:"banners_rtl";a:0:{}}s:9:"hello.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/hello-dolly";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:5:"1.7.2";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip";s:5:"icons";a:2:{s:2:"2x";s:64:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855";s:2:"1x";s:64:"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855";}s:7:"banners";a:1:{s:2:"1x";s:66:"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855";}s:11:"banners_rtl";a:0:{}}s:18:"kill-429/index.php";O:8:"stdClass":9:{s:2:"id";s:22:"w.org/plugins/kill-429";s:4:"slug";s:8:"kill-429";s:6:"plugin";s:18:"kill-429/index.php";s:11:"new_version";s:5:"1.0.0";s:3:"url";s:39:"https://wordpress.org/plugins/kill-429/";s:7:"package";s:57:"https://downloads.wordpress.org/plugin/kill-429.1.0.0.zip";s:5:"icons";a:2:{s:2:"2x";s:61:"https://ps.w.org/kill-429/assets/icon-256x256.png?rev=2213440";s:2:"1x";s:61:"https://ps.w.org/kill-429/assets/icon-128x128.png?rev=2213440";}s:7:"banners";a:2:{s:2:"2x";s:64:"https://ps.w.org/kill-429/assets/banner-1544x500.png?rev=2213440";s:2:"1x";s:63:"https://ps.w.org/kill-429/assets/banner-772x250.png?rev=2213440";}s:11:"banners_rtl";a:0:{}}s:27:"updraftplus/updraftplus.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/updraftplus";s:4:"slug";s:11:"updraftplus";s:6:"plugin";s:27:"updraftplus/updraftplus.php";s:11:"new_version";s:7:"1.16.22";s:3:"url";s:42:"https://wordpress.org/plugins/updraftplus/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/updraftplus.1.16.22.zip";s:5:"icons";a:2:{s:2:"2x";s:64:"https://ps.w.org/updraftplus/assets/icon-256x256.jpg?rev=1686200";s:2:"1x";s:64:"https://ps.w.org/updraftplus/assets/icon-128x128.jpg?rev=1686200";}s:7:"banners";a:2:{s:2:"2x";s:67:"https://ps.w.org/updraftplus/assets/banner-1544x500.png?rev=1686200";s:2:"1x";s:66:"https://ps.w.org/updraftplus/assets/banner-772x250.png?rev=1686200";}s:11:"banners_rtl";a:0:{}}s:28:"wechat-social-login/init.php";O:8:"stdClass":9:{s:2:"id";s:33:"w.org/plugins/wechat-social-login";s:4:"slug";s:19:"wechat-social-login";s:6:"plugin";s:28:"wechat-social-login/init.php";s:11:"new_version";s:5:"1.3.0";s:3:"url";s:50:"https://wordpress.org/plugins/wechat-social-login/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/wechat-social-login.zip";s:5:"icons";a:1:{s:2:"1x";s:72:"https://ps.w.org/wechat-social-login/assets/icon-128x128.png?rev=1625605";}s:7:"banners";a:1:{s:2:"1x";s:74:"https://ps.w.org/wechat-social-login/assets/banner-772x250.png?rev=1625605";}s:11:"banners_rtl";a:0:{}}s:35:"wp-fastest-cache/wpFastestCache.php";O:8:"stdClass":9:{s:2:"id";s:30:"w.org/plugins/wp-fastest-cache";s:4:"slug";s:16:"wp-fastest-cache";s:6:"plugin";s:35:"wp-fastest-cache/wpFastestCache.php";s:11:"new_version";s:7:"0.9.0.3";s:3:"url";s:47:"https://wordpress.org/plugins/wp-fastest-cache/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/wp-fastest-cache.0.9.0.3.zip";s:5:"icons";a:2:{s:2:"2x";s:69:"https://ps.w.org/wp-fastest-cache/assets/icon-256x256.png?rev=2064586";s:2:"1x";s:69:"https://ps.w.org/wp-fastest-cache/assets/icon-128x128.png?rev=1068904";}s:7:"banners";a:1:{s:2:"1x";s:71:"https://ps.w.org/wp-fastest-cache/assets/banner-772x250.jpg?rev=1064099";}s:11:"banners_rtl";a:0:{}}s:19:"wp-smtp/wp-smtp.php";O:8:"stdClass":9:{s:2:"id";s:21:"w.org/plugins/wp-smtp";s:4:"slug";s:7:"wp-smtp";s:6:"plugin";s:19:"wp-smtp/wp-smtp.php";s:11:"new_version";s:6:"1.1.10";s:3:"url";s:38:"https://wordpress.org/plugins/wp-smtp/";s:7:"package";s:57:"https://downloads.wordpress.org/plugin/wp-smtp.1.1.10.zip";s:5:"icons";a:1:{s:7:"default";s:51:"https://s.w.org/plugins/geopattern-icon/wp-smtp.svg";}s:7:"banners";a:0:{}s:11:"banners_rtl";a:0:{}}s:27:"wp-super-cache/wp-cache.php";O:8:"stdClass":9:{s:2:"id";s:28:"w.org/plugins/wp-super-cache";s:4:"slug";s:14:"wp-super-cache";s:6:"plugin";s:27:"wp-super-cache/wp-cache.php";s:11:"new_version";s:5:"1.7.1";s:3:"url";s:45:"https://wordpress.org/plugins/wp-super-cache/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/wp-super-cache.1.7.1.zip";s:5:"icons";a:2:{s:2:"2x";s:67:"https://ps.w.org/wp-super-cache/assets/icon-256x256.png?rev=1095422";s:2:"1x";s:67:"https://ps.w.org/wp-super-cache/assets/icon-128x128.png?rev=1095422";}s:7:"banners";a:2:{s:2:"2x";s:70:"https://ps.w.org/wp-super-cache/assets/banner-1544x500.png?rev=1082414";s:2:"1x";s:69:"https://ps.w.org/wp-super-cache/assets/banner-772x250.png?rev=1082414";}s:11:"banners_rtl";a:0:{}}s:33:"wp-user-avatar/wp-user-avatar.php";O:8:"stdClass":9:{s:2:"id";s:28:"w.org/plugins/wp-user-avatar";s:4:"slug";s:14:"wp-user-avatar";s:6:"plugin";s:33:"wp-user-avatar/wp-user-avatar.php";s:11:"new_version";s:5:"2.2.5";s:3:"url";s:45:"https://wordpress.org/plugins/wp-user-avatar/";s:7:"package";s:57:"https://downloads.wordpress.org/plugin/wp-user-avatar.zip";s:5:"icons";a:2:{s:2:"2x";s:67:"https://ps.w.org/wp-user-avatar/assets/icon-256x256.png?rev=1755722";s:2:"1x";s:67:"https://ps.w.org/wp-user-avatar/assets/icon-128x128.png?rev=1755722";}s:7:"banners";a:1:{s:2:"1x";s:68:"https://ps.w.org/wp-user-avatar/assets/banner-772x250.png?rev=882713";}s:11:"banners_rtl";a:0:{}}s:47:"wpvivid-backuprestore/wpvivid-backuprestore.php";O:8:"stdClass":9:{s:2:"id";s:35:"w.org/plugins/wpvivid-backuprestore";s:4:"slug";s:21:"wpvivid-backuprestore";s:6:"plugin";s:47:"wpvivid-backuprestore/wpvivid-backuprestore.php";s:11:"new_version";s:6:"0.9.34";s:3:"url";s:52:"https://wordpress.org/plugins/wpvivid-backuprestore/";s:7:"package";s:71:"https://downloads.wordpress.org/plugin/wpvivid-backuprestore.0.9.34.zip";s:5:"icons";a:2:{s:2:"2x";s:74:"https://ps.w.org/wpvivid-backuprestore/assets/icon-256x256.png?rev=2086438";s:2:"1x";s:74:"https://ps.w.org/wpvivid-backuprestore/assets/icon-128x128.png?rev=2086438";}s:7:"banners";a:2:{s:2:"2x";s:77:"https://ps.w.org/wpvivid-backuprestore/assets/banner-1544x500.png?rev=2086438";s:2:"1x";s:76:"https://ps.w.org/wpvivid-backuprestore/assets/banner-772x250.png?rev=2086438";}s:11:"banners_rtl";a:0:{}}}}','no');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=557 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (2,3,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (3,5,'_wp_attached_file','2020/02/2020-landscape-1.png');
INSERT INTO `wp_postmeta` VALUES (4,5,'_starter_content_theme','twentytwenty');
INSERT INTO `wp_postmeta` VALUES (5,5,'_customize_draft_post_name','the-new-umoma-opens-its-doors');
INSERT INTO `wp_postmeta` VALUES (6,6,'_thumbnail_id','5');
INSERT INTO `wp_postmeta` VALUES (7,6,'_customize_draft_post_name','the-new-umoma-opens-its-doors');
INSERT INTO `wp_postmeta` VALUES (8,6,'_customize_changeset_uuid','9f9a10e5-66b8-487f-aeaa-4abee5e27bc8');
INSERT INTO `wp_postmeta` VALUES (9,7,'_customize_draft_post_name','%e5%85%b3%e4%ba%8e');
INSERT INTO `wp_postmeta` VALUES (10,7,'_customize_changeset_uuid','9f9a10e5-66b8-487f-aeaa-4abee5e27bc8');
INSERT INTO `wp_postmeta` VALUES (11,8,'_customize_draft_post_name','%e8%81%94%e7%b3%bb');
INSERT INTO `wp_postmeta` VALUES (12,8,'_customize_changeset_uuid','9f9a10e5-66b8-487f-aeaa-4abee5e27bc8');
INSERT INTO `wp_postmeta` VALUES (13,9,'_customize_draft_post_name','%e5%8d%9a%e5%ae%a2');
INSERT INTO `wp_postmeta` VALUES (14,9,'_customize_changeset_uuid','9f9a10e5-66b8-487f-aeaa-4abee5e27bc8');
INSERT INTO `wp_postmeta` VALUES (21,10,'_customize_restore_dismissed','1');
INSERT INTO `wp_postmeta` VALUES (27,14,'_customize_restore_dismissed','1');
INSERT INTO `wp_postmeta` VALUES (497,118,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (496,118,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (33,20,'_edit_lock','1582214259:1');
INSERT INTO `wp_postmeta` VALUES (34,20,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (35,20,'_wp_trash_meta_time','1582214294');
INSERT INTO `wp_postmeta` VALUES (36,21,'_wp_attached_file','2020/02/favicon.png');
INSERT INTO `wp_postmeta` VALUES (37,21,'_wp_attachment_metadata','a:5:{s:5:"width";i:100;s:6:"height";i:100;s:4:"file";s:19:"2020/02/favicon.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (38,22,'_wp_attached_file','2020/02/cropped-favicon.png');
INSERT INTO `wp_postmeta` VALUES (39,22,'_wp_attachment_context','site-icon');
INSERT INTO `wp_postmeta` VALUES (40,22,'_wp_attachment_metadata','a:5:{s:5:"width";i:512;s:6:"height";i:512;s:4:"file";s:27:"2020/02/cropped-favicon.png";s:5:"sizes";a:7:{s:6:"medium";a:4:{s:4:"file";s:27:"cropped-favicon-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:9:"thumbnail";a:4:{s:4:"file";s:27:"cropped-favicon-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:27:"cropped-favicon-512x220.png";s:5:"width";i:512;s:6:"height";i:220;s:9:"mime-type";s:9:"image/png";}s:13:"site_icon-270";a:4:{s:4:"file";s:27:"cropped-favicon-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:13:"site_icon-192";a:4:{s:4:"file";s:27:"cropped-favicon-192x192.png";s:5:"width";i:192;s:6:"height";i:192;s:9:"mime-type";s:9:"image/png";}s:13:"site_icon-180";a:4:{s:4:"file";s:27:"cropped-favicon-180x180.png";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:9:"image/png";}s:12:"site_icon-32";a:4:{s:4:"file";s:25:"cropped-favicon-32x32.png";s:5:"width";i:32;s:6:"height";i:32;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (41,23,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (42,23,'_wp_trash_meta_time','1582214467');
INSERT INTO `wp_postmeta` VALUES (43,2,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (44,2,'_wp_trash_meta_time','1582214553');
INSERT INTO `wp_postmeta` VALUES (45,2,'_wp_desired_post_slug','sample-page');
INSERT INTO `wp_postmeta` VALUES (46,25,'_edit_lock','1582214443:1');
INSERT INTO `wp_postmeta` VALUES (47,26,'_edit_lock','1582214761:1');
INSERT INTO `wp_postmeta` VALUES (407,100,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (406,100,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (405,100,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (404,100,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (403,100,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (402,3,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (394,99,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (393,99,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (391,99,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (392,99,'_menu_item_classes','a:1:{i:0;s:0:"";}');
INSERT INTO `wp_postmeta` VALUES (390,99,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (389,99,'_menu_item_object_id','53');
INSERT INTO `wp_postmeta` VALUES (64,26,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (65,26,'_wp_trash_meta_time','1582214765');
INSERT INTO `wp_postmeta` VALUES (66,29,'_edit_lock','1582214868:1');
INSERT INTO `wp_postmeta` VALUES (67,29,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (68,29,'_wp_trash_meta_time','1582214880');
INSERT INTO `wp_postmeta` VALUES (69,30,'_edit_lock','1582215300:1');
INSERT INTO `wp_postmeta` VALUES (82,30,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (491,117,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (388,99,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (387,99,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (84,34,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (83,30,'_wp_trash_meta_time','1582215344');
INSERT INTO `wp_postmeta` VALUES (85,34,'_wp_trash_meta_time','1582215376');
INSERT INTO `wp_postmeta` VALUES (401,3,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (400,3,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (399,3,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (398,3,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (396,3,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (397,3,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (346,93,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (344,93,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (345,93,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (342,93,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (343,93,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (102,35,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (103,35,'_wp_trash_meta_time','1582215459');
INSERT INTO `wp_postmeta` VALUES (482,48,'_wp_desired_post_slug','register');
INSERT INTO `wp_postmeta` VALUES (481,48,'_wp_trash_meta_time','1582342347');
INSERT INTO `wp_postmeta` VALUES (135,47,'_wp_page_template','account/login.php');
INSERT INTO `wp_postmeta` VALUES (132,45,'_wp_trash_meta_time','1582216588');
INSERT INTO `wp_postmeta` VALUES (117,41,'_wp_trash_meta_time','1582216313');
INSERT INTO `wp_postmeta` VALUES (116,41,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (131,45,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (130,44,'_wp_trash_meta_time','1582216460');
INSERT INTO `wp_postmeta` VALUES (129,44,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (126,42,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (127,42,'_wp_trash_meta_time','1582216369');
INSERT INTO `wp_postmeta` VALUES (128,44,'_edit_lock','1582216438:1');
INSERT INTO `wp_postmeta` VALUES (136,48,'_wp_page_template','account/register.php');
INSERT INTO `wp_postmeta` VALUES (137,49,'_wp_page_template','account/findpassword.php');
INSERT INTO `wp_postmeta` VALUES (138,3,'_edit_lock','1582303849:1');
INSERT INTO `wp_postmeta` VALUES (139,50,'_edit_lock','1582256408:1');
INSERT INTO `wp_postmeta` VALUES (140,47,'_edit_lock','1582256456:1');
INSERT INTO `wp_postmeta` VALUES (141,51,'_edit_lock','1582256458:1');
INSERT INTO `wp_postmeta` VALUES (142,48,'_edit_lock','1582300949:1');
INSERT INTO `wp_postmeta` VALUES (143,53,'_edit_lock','1582341808:1');
INSERT INTO `wp_postmeta` VALUES (144,53,'_wp_page_template','page-about.php');
INSERT INTO `wp_postmeta` VALUES (145,53,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (146,53,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (147,53,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (148,53,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (149,53,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (150,53,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (151,53,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (152,54,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (153,54,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (154,54,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (155,54,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (156,54,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (157,54,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (158,55,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (159,55,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (160,55,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (161,55,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (162,55,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (163,55,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (339,93,'_edit_lock','1582344973:1');
INSERT INTO `wp_postmeta` VALUES (164,56,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (165,56,'_wp_trash_meta_time','1582258043');
INSERT INTO `wp_postmeta` VALUES (166,57,'_edit_lock','1582259588:1');
INSERT INTO `wp_postmeta` VALUES (167,57,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (168,57,'_wp_trash_meta_time','1582259608');
INSERT INTO `wp_postmeta` VALUES (169,58,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (170,58,'_wp_trash_meta_time','1582259625');
INSERT INTO `wp_postmeta` VALUES (171,59,'_menu_item_type','taxonomy');
INSERT INTO `wp_postmeta` VALUES (172,59,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (173,59,'_menu_item_object_id','1');
INSERT INTO `wp_postmeta` VALUES (174,59,'_menu_item_object','category');
INSERT INTO `wp_postmeta` VALUES (175,59,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (176,59,'_menu_item_classes','a:1:{i:0;s:0:"";}');
INSERT INTO `wp_postmeta` VALUES (177,59,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (178,59,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (179,59,'_menu_item_orphaned','1582259722');
INSERT INTO `wp_postmeta` VALUES (180,60,'_edit_lock','1582263793:1');
INSERT INTO `wp_postmeta` VALUES (181,61,'_edit_lock','1582278749:1');
INSERT INTO `wp_postmeta` VALUES (182,62,'_edit_lock','1582279492:1');
INSERT INTO `wp_postmeta` VALUES (183,62,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (184,62,'_wp_trash_meta_time','1582279510');
INSERT INTO `wp_postmeta` VALUES (185,63,'_edit_lock','1582279508:1');
INSERT INTO `wp_postmeta` VALUES (186,64,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (187,64,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (188,64,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (189,64,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (190,64,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (191,64,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (192,65,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (193,65,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (194,65,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (195,65,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (196,65,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (197,65,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (198,66,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (199,66,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (200,66,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (201,66,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (202,66,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (203,66,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (204,67,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (205,67,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (206,67,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (207,67,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (208,67,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (209,67,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (210,68,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (211,68,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (212,68,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (213,68,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (214,68,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (215,68,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (216,69,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (217,69,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (218,69,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (219,69,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (220,69,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (221,69,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (222,70,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (223,70,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (224,70,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (225,70,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (226,70,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (227,70,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (228,72,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (229,72,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (230,72,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (231,72,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (232,72,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (233,72,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (234,73,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (235,73,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (236,73,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (237,73,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (238,73,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (239,73,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (240,74,'_edit_lock','1582281993:1');
INSERT INTO `wp_postmeta` VALUES (490,117,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (242,75,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (243,75,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (244,75,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (245,75,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (246,75,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (247,75,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (248,76,'_edit_lock','1582286829:1');
INSERT INTO `wp_postmeta` VALUES (249,77,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (250,77,'_wp_trash_meta_time','1582287052');
INSERT INTO `wp_postmeta` VALUES (251,78,'_edit_lock','1582287140:1');
INSERT INTO `wp_postmeta` VALUES (272,82,'_edit_lock','1582290213:1');
INSERT INTO `wp_postmeta` VALUES (252,79,'_edit_lock','1582290445:1');
INSERT INTO `wp_postmeta` VALUES (253,79,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (254,79,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (255,79,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (256,79,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (257,79,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (258,79,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (259,79,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (260,80,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (261,80,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (262,80,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (263,80,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (264,80,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (265,80,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (266,81,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (267,81,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (268,81,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (269,81,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (270,81,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (271,81,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (273,79,'_wp_trash_meta_status','draft');
INSERT INTO `wp_postmeta` VALUES (274,79,'_wp_trash_meta_time','1582290593');
INSERT INTO `wp_postmeta` VALUES (275,79,'_wp_desired_post_slug','');
INSERT INTO `wp_postmeta` VALUES (276,83,'_edit_lock','1582292303:1');
INSERT INTO `wp_postmeta` VALUES (277,84,'_edit_lock','1582292362:1');
INSERT INTO `wp_postmeta` VALUES (278,85,'_edit_lock','1582292964:1');
INSERT INTO `wp_postmeta` VALUES (308,89,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (307,89,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (306,89,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (305,88,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (304,88,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (303,88,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (302,88,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (301,88,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (300,88,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (299,88,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (298,88,'_wp_page_template','page-guestbook.php');
INSERT INTO `wp_postmeta` VALUES (297,88,'_edit_lock','1582299261:1');
INSERT INTO `wp_postmeta` VALUES (309,89,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (310,89,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (311,89,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (335,92,'_menu_item_classes','a:1:{i:0;s:0:"";}');
INSERT INTO `wp_postmeta` VALUES (334,92,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (333,92,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (332,92,'_menu_item_object_id','88');
INSERT INTO `wp_postmeta` VALUES (331,92,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (330,92,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (341,93,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (340,93,'_wp_page_template','page-index.php');
INSERT INTO `wp_postmeta` VALUES (336,92,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (337,92,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (347,93,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (348,94,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (349,94,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (350,94,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (351,94,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (352,94,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (353,94,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (354,95,'_edit_lock','1582341960:1');
INSERT INTO `wp_postmeta` VALUES (355,95,'_wp_page_template','page-blog.php');
INSERT INTO `wp_postmeta` VALUES (356,95,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (357,95,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (358,95,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (359,95,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (360,95,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (361,95,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (362,95,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (363,96,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (364,96,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (365,96,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (366,96,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (367,96,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (368,96,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (369,97,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (370,97,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (371,97,'_menu_item_object_id','93');
INSERT INTO `wp_postmeta` VALUES (372,97,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (373,97,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (374,97,'_menu_item_classes','a:1:{i:0;s:0:"";}');
INSERT INTO `wp_postmeta` VALUES (375,97,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (376,97,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (378,98,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (379,98,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (380,98,'_menu_item_object_id','95');
INSERT INTO `wp_postmeta` VALUES (381,98,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (382,98,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (383,98,'_menu_item_classes','a:1:{i:0;s:0:"";}');
INSERT INTO `wp_postmeta` VALUES (384,98,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (385,98,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (408,100,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (409,102,'_wp_attached_file','2020/02/mmqrcode1582304645192.jpg');
INSERT INTO `wp_postmeta` VALUES (410,102,'_wp_attachment_metadata','a:5:{s:5:"width";i:430;s:6:"height";i:430;s:4:"file";s:33:"2020/02/mmqrcode1582304645192.jpg";s:5:"sizes";a:3:{s:6:"medium";a:4:{s:4:"file";s:33:"mmqrcode1582304645192-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:33:"mmqrcode1582304645192-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:33:"mmqrcode1582304645192-430x220.jpg";s:5:"width";i:430;s:6:"height";i:220;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (411,103,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (412,103,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (413,103,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (414,103,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (415,103,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (416,103,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (493,117,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (492,117,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (489,117,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (483,47,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (484,47,'_wp_trash_meta_time','1582342347');
INSERT INTO `wp_postmeta` VALUES (485,47,'_wp_desired_post_slug','login');
INSERT INTO `wp_postmeta` VALUES (495,118,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (494,118,'_edit_lock','1582354849:1');
INSERT INTO `wp_postmeta` VALUES (488,117,'seo_title','开通');
INSERT INTO `wp_postmeta` VALUES (425,106,'_edit_lock','1582364721:1');
INSERT INTO `wp_postmeta` VALUES (522,122,'_edit_lock','1582344171:1');
INSERT INTO `wp_postmeta` VALUES (517,121,'_edit_lock','1582344104:1');
INSERT INTO `wp_postmeta` VALUES (499,118,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (498,118,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (461,112,'seo_title','开通');
INSERT INTO `wp_postmeta` VALUES (462,112,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (463,112,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (464,112,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (465,112,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (466,112,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (469,113,'seo_title','开通');
INSERT INTO `wp_postmeta` VALUES (470,113,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (471,113,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (472,113,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (473,113,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (474,113,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (500,118,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (501,118,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (502,119,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (503,119,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (504,119,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (505,119,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (506,119,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (507,119,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (508,118,'cover','');
INSERT INTO `wp_postmeta` VALUES (431,106,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (432,106,'cover','');
INSERT INTO `wp_postmeta` VALUES (433,106,'seo_title','音乐播放器，更新日志，修复，bug，注册，登录，wordpress');
INSERT INTO `wp_postmeta` VALUES (434,106,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (435,106,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (436,106,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (437,106,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (438,106,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (439,109,'seo_title','开通');
INSERT INTO `wp_postmeta` VALUES (440,109,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (441,109,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (442,109,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (443,109,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (444,109,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (480,48,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (479,49,'_wp_desired_post_slug','findpassword');
INSERT INTO `wp_postmeta` VALUES (478,49,'_wp_trash_meta_time','1582342347');
INSERT INTO `wp_postmeta` VALUES (477,49,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (454,111,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (453,111,'seo_title','');
INSERT INTO `wp_postmeta` VALUES (455,111,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (456,111,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (457,111,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (458,111,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (511,120,'seo_title','音乐播放器');
INSERT INTO `wp_postmeta` VALUES (512,120,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (513,120,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (514,120,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (515,120,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (516,120,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (525,124,'seo_title','音乐播放器，更新日志，修复，bug，注册，登录，wordpress');
INSERT INTO `wp_postmeta` VALUES (526,124,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (527,124,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (528,124,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (529,124,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (530,124,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (535,126,'seo_title','音乐播放器，更新日志，修复，bug，注册，登录，wordpress');
INSERT INTO `wp_postmeta` VALUES (536,126,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (537,126,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (538,126,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (539,126,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (540,126,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (541,127,'_wp_attached_file','2020/02/267e0d8124f31b1a.jpg');
INSERT INTO `wp_postmeta` VALUES (542,127,'_wp_attachment_metadata','a:5:{s:5:"width";i:580;s:6:"height";i:579;s:4:"file";s:28:"2020/02/267e0d8124f31b1a.jpg";s:5:"sizes";a:3:{s:6:"medium";a:4:{s:4:"file";s:28:"267e0d8124f31b1a-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:28:"267e0d8124f31b1a-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:28:"267e0d8124f31b1a-580x220.jpg";s:5:"width";i:580;s:6:"height";i:220;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (543,127,'_wp_attachment_wp_user_avatar','1');
INSERT INTO `wp_postmeta` VALUES (544,128,'seo_title','音乐播放器，更新日志，修复，bug，注册，登录，wordpress');
INSERT INTO `wp_postmeta` VALUES (545,128,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (546,128,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (547,128,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (548,128,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (549,128,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (550,129,'seo_title','音乐播放器，更新日志，修复，bug，注册，登录，wordpress');
INSERT INTO `wp_postmeta` VALUES (551,129,'_seo_title','field_5bfa53958ae40');
INSERT INTO `wp_postmeta` VALUES (552,129,'seo_manual_keywords','0');
INSERT INTO `wp_postmeta` VALUES (553,129,'_seo_manual_keywords','field_5bfb81023e1d1');
INSERT INTO `wp_postmeta` VALUES (554,129,'seo_manual_des','0');
INSERT INTO `wp_postmeta` VALUES (555,129,'_seo_manual_des','field_5bfb81163e1d2');
INSERT INTO `wp_postmeta` VALUES (556,130,'_edit_lock','1582354826:1');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '1999-01-01 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '1999-01-01 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '1999-01-01 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '1999-01-01 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (120,1,'2020-02-22 11:58:34','2020-02-22 03:58:34','<!-- wp:paragraph -->\n<p>2020-02-20:宇后人生博客V1.0（试水版)上线,修复部分已知bug；</p>\n<!-- /wp:paragraph -->','更新日志','','inherit','closed','closed','','106-revision-v1','','','2020-02-22 11:58:34','2020-02-22 03:58:34','',106,'http://zhuhouyu.xyz/106-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (2,1,'2020-02-20 11:08:09','2020-02-20 03:08:09','<!-- wp:paragraph -->\n<p>这是示范页面。页面和博客文章不同，它的位置是固定的，通常会在站点导航栏显示。很多用户都创建一个“关于”页面，向访客介绍自己。例如：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>欢迎！我白天是个邮递员，晚上就是个有抱负的演员。这是我的网站。我住在天朝的帝都，有条叫做Jack的狗。</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>……或这个：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>XYZ Doohickey公司成立于1971年，自从建立以来，我们一直向社会贡献着优秀doohickies。我们的公司总部位于天朝魔都，有着超过两千名员工，对魔都政府税收有着巨大贡献。</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>而您，作为一个WordPress用户，我们建议您访问<a href="http://zhuhouyu.xyz/wp-admin/">控制板</a>，删除本页面，然后添加您自己的页面。祝您使用愉快！</p>\n<!-- /wp:paragraph -->','示例页面','','trash','closed','open','','sample-page__trashed','','','2020-02-21 00:02:33','2020-02-20 16:02:33','',0,'http://zhuhouyu.xyz/?page_id=2',0,'page','',0);
INSERT INTO `wp_posts` VALUES (3,1,'2020-02-20 11:08:09','2020-02-20 03:08:09','<!-- wp:heading -->\n<h2>我们是谁</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>我们的站点地址是：http://zhuhouyu.xyz/。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>我们收集何种及为何收集个人数据</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading {"level":3} -->\n<h3>评论</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>当访客留下评论时，我们会收集评论表单所显示的数据，和访客的IP地址及浏览器的user agent字符串来帮助检查垃圾评论。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>由您的电子邮件地址所生成的匿名化字符串（又称为哈希）可能会被提供给Gravatar服务确认您是否有使用该服务。Gravatar服务的隐私政策在此：https://automattic.com/privacy/。在您的评论获批准后，您的资料图片将在您的评论旁公开展示。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {"level":3} -->\n<h3>媒体</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>如果您向此网站上传图片，您应当避免上传那些有嵌入地理位置信息（EXIF GPS）的图片。此网站的访客将可以下载并提取此网站的图片中的位置信息。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {"level":3} -->\n<h3>联系表单</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {"level":3} -->\n<h3>Cookies</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>如果您在我们的站点上留下评论，您可以选择用cookies保存您的姓名、电子邮件地址和网站。这是通过让您可以不用在评论时再次填写相关内容而向您提供方便。这些cookies会保留一年。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>如果您访问我们的登录页，我们会设置一个临时的cookie来确认您的浏览器是否接受cookies。此cookie不包含个人数据，且会在您关闭浏览器时被丢弃。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>当您登录时，我们也会设置多个cookies来保存您的登录信息及屏幕显示选项。登录cookies会保留两天，而屏幕显示选项cookies会保留一年。如果您选择了“记住我”，您的登录会保留两周。如果您注销，登录cookies将被移除。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>如果您编辑或发布文章，我们会在您的浏览器中保存一个额外的cookie。这个cookie不包含个人数据而只记录了您刚才编辑的文章的ID。这个小甜饼会保留一天。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {"level":3} -->\n<h3>其他站点的嵌入内容</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>此站点上的文章可能会包含嵌入的内容（如视频、图像、文章等）。来自其他站点的嵌入内容的行为和您直接访问这些其他站点没有区别。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>这些站点可能会收集关于您的数据、使用cookies、嵌入额外的第三方跟踪程序及监视您与这些嵌入内容的交互，包括在您有这些站点的账户并登录了这些站点时，跟踪您与嵌入内容的交互。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {"level":3} -->\n<h3>统计</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>我们与谁共享您的信息</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>我们保留多久您的信息</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>如果您留下评论，评论和其元数据将被无限期保存。我们这样做以便能识别并自动批准任何后续评论，而不用将这些后续评论加入待审队列。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>对于本网站的注册用户，我们也会保存用户在个人资料中提供的个人信息。所有用户可以在任何时候查看、编辑或删除他们的个人信息（除了不能变更用户名外）、站点管理员也可以查看及编辑那些信息。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>您对您的信息有什么权利</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>如果您有此站点的账户，或曾经留下评论，您可以请求我们提供我们所拥有的您的个人数据的导出文件，这也包括了所有您提供给我们的数据。您也可以要求我们抹除所有关于您的个人数据。这不包括我们因管理、法规或安全需要而必须保留的数据。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>我们将您的信息发送到哪</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>访客评论可能会被自动垃圾评论监测服务检查。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>您的联系信息</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>其他信息</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading {"level":3} -->\n<h3>我们如何保护您的数据</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {"level":3} -->\n<h3>我们有何种数据泄露处理流程</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {"level":3} -->\n<h3>我们从哪些第三方接收数据</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {"level":3} -->\n<h3>我们通过用户数据进行何种自动决策及/或归纳</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {"level":3} -->\n<h3>行业监管披露要求</h3>\n<!-- /wp:heading -->','隐私政策','','publish','closed','open','','privacy-policy','','','2020-02-22 00:46:13','2020-02-21 16:46:13','',0,'http://zhuhouyu.xyz/?page_id=3',0,'page','',0);
INSERT INTO `wp_posts` VALUES (4,1,'2020-02-20 11:08:44','1999-01-01 00:00:00','','自动草稿','','auto-draft','open','open','','','','','2020-02-20 11:08:44','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?p=4',0,'post','',0);
INSERT INTO `wp_posts` VALUES (5,1,'2020-02-20 11:09:35','1999-01-01 00:00:00','','The New UMoMA Opens its Doors','','auto-draft','open','closed','','','','','2020-02-20 11:09:35','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/wp-content/uploads/2020/02/2020-landscape-1.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (6,1,'2020-02-20 11:09:35','1999-01-01 00:00:00','<!-- wp:group {"align":"wide"} --><div class="wp-block-group alignwide"><div class="wp-block-group__inner-container"><!-- wp:heading {"align":"center"} --><h2 class="has-text-align-center">The premier destination for modern art in Northern Sweden. Open from 10 AM to 6 PM every day during the summer months.</h2><!-- /wp:heading --></div></div><!-- /wp:group --><!-- wp:columns {"align":"wide"} --><div class="wp-block-columns alignwide"><!-- wp:column --><div class="wp-block-column"><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://zhuhouyu.xyz/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-1.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:heading {"level":3} --><h3>Works and Days</h3><!-- /wp:heading --><!-- wp:paragraph --><p>August 1 -- December 1</p><!-- /wp:paragraph --><!-- wp:button {"className":"is-style-outline"} --><div class="wp-block-button is-style-outline"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Read More</a></div><!-- /wp:button --></div></div><!-- /wp:group --><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://zhuhouyu.xyz/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-3.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:heading {"level":3} --><h3>Theatre of Operations</h3><!-- /wp:heading --><!-- wp:paragraph --><p>October 1 -- December 1</p><!-- /wp:paragraph --><!-- wp:button {"className":"is-style-outline"} --><div class="wp-block-button is-style-outline"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Read More</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div><!-- /wp:column --><!-- wp:column --><div class="wp-block-column"><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://zhuhouyu.xyz/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-2.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:heading {"level":3} --><h3>The Life I Deserve</h3><!-- /wp:heading --><!-- wp:paragraph --><p>August 1 -- December 1</p><!-- /wp:paragraph --><!-- wp:button {"className":"is-style-outline"} --><div class="wp-block-button is-style-outline"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Read More</a></div><!-- /wp:button --></div></div><!-- /wp:group --><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://zhuhouyu.xyz/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-4.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:heading {"level":3} --><h3>From Signac to Matisse</h3><!-- /wp:heading --><!-- wp:paragraph --><p>October 1 -- December 1</p><!-- /wp:paragraph --><!-- wp:button {"className":"is-style-outline"} --><div class="wp-block-button is-style-outline"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Read More</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div><!-- /wp:column --></div><!-- /wp:columns --><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://zhuhouyu.xyz/wp-content/themes/twentytwenty/assets/images/2020-landscape-2.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:group {"align":"wide"} --><div class="wp-block-group alignwide"><div class="wp-block-group__inner-container"><!-- wp:heading {"align":"center","textColor":"accent"} --><h2 class="has-accent-color has-text-align-center">”Cyborgs, as the philosopher Donna Haraway established, are not reverent. They do not remember the cosmos.”</h2><!-- /wp:heading --></div></div><!-- /wp:group --><!-- wp:paragraph {"dropCap":true} --><p class="has-drop-cap">With seven floors of striking architecture, UMoMA shows exhibitions of international contemporary art, sometimes along with art historical retrospectives. Existential, political and philosophical issues are intrinsic to our programme. As visitor you are invited to guided tours artist talks, lectures, film screenings and other events with free admission</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>The exhibitions are produced by UMoMA in collaboration with artists and museums around the world and they often attract international attention. UMoMA has received a Special Commendation from the European Museum of the Year, and was among the top candidates for the Swedish Museum of the Year Award as well as for the Council of Europe Museum Prize.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p></p><!-- /wp:paragraph --><!-- wp:group {"customBackgroundColor":"#ffffff","align":"wide"} --><div class="wp-block-group alignwide has-background" style="background-color:#ffffff"><div class="wp-block-group__inner-container"><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:heading {"align":"center"} --><h2 class="has-text-align-center">Become a Member and Get Exclusive Offers!</h2><!-- /wp:heading --><!-- wp:paragraph {"align":"center"} --><p class="has-text-align-center">Members get access to exclusive exhibits and sales. Our memberships cost $99.99 and are billed annually.</p><!-- /wp:paragraph --><!-- wp:button {"align":"center"} --><div class="wp-block-button aligncenter"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Join the Club</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div></div><!-- /wp:group --><!-- wp:gallery {"ids":[39,38],"align":"wide"} --><figure class="wp-block-gallery alignwide columns-2 is-cropped"><ul class="blocks-gallery-grid"><li class="blocks-gallery-item"><figure><img src="http://zhuhouyu.xyz/wp-content/themes/twentytwenty/assets/images/2020-square-2.png" alt="" data-id="39" data-full-url="http://zhuhouyu.xyz/wp-content/themes/twentytwenty/assets/images/2020-square-2.png" data-link="assets/images/2020-square-2/" class="wp-image-39"/></figure></li><li class="blocks-gallery-item"><figure><img src="http://zhuhouyu.xyz/wp-content/themes/twentytwenty/assets/images/2020-square-1.png" alt="" data-id="38" data-full-url="http://zhuhouyu.xyz/wp-content/themes/twentytwenty/assets/images/2020-square-1.png" data-link="http://zhuhouyu.xyz/wp-content/themes/twentytwenty/assets/images/2020-square-1/" class="wp-image-38"/></figure></li></ul></figure><!-- /wp:gallery -->','The New UMoMA Opens its Doors','','auto-draft','closed','closed','','','','','2020-02-20 11:09:35','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=6',0,'page','',0);
INSERT INTO `wp_posts` VALUES (7,1,'2020-02-20 11:09:35','1999-01-01 00:00:00','<!-- wp:paragraph -->\n<p>您也许是位创作者，想要在这里介绍自己和自己的作品；或者您是一位商务人士，想在这里谈谈您的业务。</p>\n<!-- /wp:paragraph -->','关于','','auto-draft','closed','closed','','','','','2020-02-20 11:09:35','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=7',0,'page','',0);
INSERT INTO `wp_posts` VALUES (8,1,'2020-02-20 11:09:35','1999-01-01 00:00:00','<!-- wp:paragraph -->\n<p>这个页面包含了一些基本的联系资料，像是地址和联系电话。您也可以尝试使用插件增加联系表单。</p>\n<!-- /wp:paragraph -->','联系','','auto-draft','closed','closed','','','','','2020-02-20 11:09:35','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=8',0,'page','',0);
INSERT INTO `wp_posts` VALUES (9,1,'2020-02-20 11:09:35','1999-01-01 00:00:00','','博客','','auto-draft','closed','closed','','','','','2020-02-20 11:09:35','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=9',0,'page','',0);
INSERT INTO `wp_posts` VALUES (10,1,'2020-02-20 11:09:35','1999-01-01 00:00:00','{\n    "widget_text[2]": {\n        "starter_content": true,\n        "value": {\n            "encoded_serialized_instance": "YTo0OntzOjU6InRpdGxlIjtzOjEyOiLlhbPkuo7mnKznq5kiO3M6NDoidGV4dCI7czoxMDg6Iui/memHjOS5n+iuuOaYr+S4quS7i+e7jeaCqOiHquW3seeahOWlveWcsOaWue+8jOS5n+iDveS7i+e7jeaCqOeahOe9keermeaIluaUvui/m+S4gOS6m+W3peS9nOS6uuWRmOWQjeWNleOAgiI7czo2OiJmaWx0ZXIiO2I6MTtzOjY6InZpc3VhbCI7YjoxO30=",\n            "title": "\\u5173\\u4e8e\\u672c\\u7ad9",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "f969544a43155a3be218b2d550477f6e"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "sidebars_widgets[sidebar-1]": {\n        "starter_content": true,\n        "value": [\n            "text-2"\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "widget_text[3]": {\n        "starter_content": true,\n        "value": {\n            "encoded_serialized_instance": "YTo0OntzOjU6InRpdGxlIjtzOjEyOiLogZTns7vmiJHku6wiO3M6NDoidGV4dCI7czoxNjg6IjxzdHJvbmc+5Zyw5Z2APC9zdHJvbmc+CjEyMyBNYWluIFN0cmVldApOZXcgWW9yaywgTlkgMTAwMDEKCjxzdHJvbmc+6JCl5Lia5pe26Ze0PC9zdHJvbmc+CuaYn+acn+S4gCZtZGFzaDvkupTvvJo5OjAwJm5kYXNoOzE3OjAwCuaYn+acn+WFrSZtZGFzaDvml6XvvJoxMTowMCZuZGFzaDsxNTowMCI7czo2OiJmaWx0ZXIiO2I6MTtzOjY6InZpc3VhbCI7YjoxO30=",\n            "title": "\\u8054\\u7cfb\\u6211\\u4eec",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "aee627ce2aa52a489c44fa7c44804bdf"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "sidebars_widgets[sidebar-2]": {\n        "starter_content": true,\n        "value": [\n            "text-3"\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menus_created_posts": {\n        "starter_content": true,\n        "value": [\n            5,\n            6,\n            7,\n            8,\n            9\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu[-1]": {\n        "starter_content": true,\n        "value": {\n            "name": "Primary"\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu_item[-1]": {\n        "starter_content": true,\n        "value": {\n            "type": "custom",\n            "title": "\\u9996\\u9875",\n            "url": "http://zhuhouyu.xyz/",\n            "position": 0,\n            "nav_menu_term_id": -1,\n            "object_id": 0\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu_item[-2]": {\n        "starter_content": true,\n        "value": {\n            "type": "post_type",\n            "object": "page",\n            "object_id": 7,\n            "position": 1,\n            "nav_menu_term_id": -1,\n            "title": "\\u5173\\u4e8e"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu_item[-3]": {\n        "starter_content": true,\n        "value": {\n            "type": "post_type",\n            "object": "page",\n            "object_id": 9,\n            "position": 2,\n            "nav_menu_term_id": -1,\n            "title": "\\u535a\\u5ba2"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu_item[-4]": {\n        "starter_content": true,\n        "value": {\n            "type": "post_type",\n            "object": "page",\n            "object_id": 8,\n            "position": 3,\n            "nav_menu_term_id": -1,\n            "title": "\\u8054\\u7cfb"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "twentytwenty::nav_menu_locations[primary]": {\n        "starter_content": true,\n        "value": -1,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu[-5]": {\n        "starter_content": true,\n        "value": {\n            "name": "Primary"\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu_item[-5]": {\n        "starter_content": true,\n        "value": {\n            "type": "custom",\n            "title": "\\u9996\\u9875",\n            "url": "http://zhuhouyu.xyz/",\n            "position": 0,\n            "nav_menu_term_id": -5,\n            "object_id": 0\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu_item[-6]": {\n        "starter_content": true,\n        "value": {\n            "type": "post_type",\n            "object": "page",\n            "object_id": 7,\n            "position": 1,\n            "nav_menu_term_id": -5,\n            "title": "\\u5173\\u4e8e"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu_item[-7]": {\n        "starter_content": true,\n        "value": {\n            "type": "post_type",\n            "object": "page",\n            "object_id": 9,\n            "position": 2,\n            "nav_menu_term_id": -5,\n            "title": "\\u535a\\u5ba2"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu_item[-8]": {\n        "starter_content": true,\n        "value": {\n            "type": "post_type",\n            "object": "page",\n            "object_id": 8,\n            "position": 3,\n            "nav_menu_term_id": -5,\n            "title": "\\u8054\\u7cfb"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "twentytwenty::nav_menu_locations[expanded]": {\n        "starter_content": true,\n        "value": -5,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu[-9]": {\n        "starter_content": true,\n        "value": {\n            "name": "Social Links Menu"\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu_item[-9]": {\n        "starter_content": true,\n        "value": {\n            "title": "Yelp",\n            "url": "https://www.yelp.com",\n            "position": 0,\n            "nav_menu_term_id": -9,\n            "object_id": 0\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu_item[-10]": {\n        "starter_content": true,\n        "value": {\n            "title": "Facebook",\n            "url": "https://www.facebook.com/wordpress",\n            "position": 1,\n            "nav_menu_term_id": -9,\n            "object_id": 0\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu_item[-11]": {\n        "starter_content": true,\n        "value": {\n            "title": "Twitter",\n            "url": "https://twitter.com/wordpress",\n            "position": 2,\n            "nav_menu_term_id": -9,\n            "object_id": 0\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu_item[-12]": {\n        "starter_content": true,\n        "value": {\n            "title": "Instagram",\n            "url": "https://www.instagram.com/explore/tags/wordcamp/",\n            "position": 3,\n            "nav_menu_term_id": -9,\n            "object_id": 0\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "nav_menu_item[-13]": {\n        "starter_content": true,\n        "value": {\n            "title": "\\u7535\\u90ae",\n            "url": "mailto:wordpress@example.com",\n            "position": 4,\n            "nav_menu_term_id": -9,\n            "object_id": 0\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "twentytwenty::nav_menu_locations[social]": {\n        "starter_content": true,\n        "value": -9,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "show_on_front": {\n        "starter_content": true,\n        "value": "page",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "page_on_front": {\n        "starter_content": true,\n        "value": 6,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    },\n    "page_for_posts": {\n        "starter_content": true,\n        "value": 9,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:09:35"\n    }\n}','','','auto-draft','closed','closed','','9f9a10e5-66b8-487f-aeaa-4abee5e27bc8','','','2020-02-20 11:09:35','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?p=10',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (119,1,'2020-02-22 11:56:53','2020-02-22 03:56:53','','如何给wordpress网站增加音乐播放器。','','inherit','closed','closed','','118-revision-v1','','','2020-02-22 11:56:53','2020-02-22 03:56:53','',118,'http://zhuhouyu.xyz/118-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (14,1,'2020-02-20 11:50:56','1999-01-01 00:00:00','{\n    "wordpress\\u6e05\\u65b0Minty\\u4e3b\\u9898::minty_color_scheme": {\n        "value": "turquoise",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 03:50:56"\n    }\n}','','','auto-draft','closed','closed','','002d2f4c-f351-408a-977e-7647bf9a4560','','','2020-02-20 11:50:56','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?p=14',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (118,1,'2020-02-22 11:57:32','1999-01-01 00:00:00','','如何给wordpress网站增加音乐播放器。','','draft','open','open','','','','','2020-02-22 11:57:32','2020-02-22 03:57:32','',0,'http://zhuhouyu.xyz/?p=118',0,'post','',0);
INSERT INTO `wp_posts` VALUES (20,1,'2020-02-20 23:58:14','2020-02-20 15:58:14','{\n    "sidebars_widgets[sidebar]": {\n        "value": [\n            "recent-posts-2",\n            "recent-comments-2",\n            "calendar-3"\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 15:57:37"\n    },\n    "sidebars_widgets[sidebar-bottom]": {\n        "value": [],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 15:57:37"\n    },\n    "widget_calendar[3]": {\n        "value": [],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 15:57:37"\n    }\n}','','','trash','closed','closed','','99efa71f-eec5-489d-bb77-e7fc01718f71','','','2020-02-20 23:58:14','2020-02-20 15:58:14','',0,'http://zhuhouyu.xyz/?p=20',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (21,1,'2020-02-21 00:00:45','2020-02-20 16:00:45','','favicon','','inherit','open','closed','','favicon','','','2020-02-21 00:00:45','2020-02-20 16:00:45','',0,'http://zhuhouyu.xyz/wp-content/uploads/2020/02/favicon.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (22,1,'2020-02-21 00:00:50','2020-02-20 16:00:50','http://zhuhouyu.xyz/wp-content/uploads/2020/02/cropped-favicon.png','cropped-favicon.png','','inherit','open','closed','','cropped-favicon-png','','','2020-02-21 00:00:50','2020-02-20 16:00:50','',0,'http://zhuhouyu.xyz/wp-content/uploads/2020/02/cropped-favicon.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (23,1,'2020-02-21 00:01:07','2020-02-20 16:01:07','{\n    "site_icon": {\n        "value": 22,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:01:07"\n    },\n    "show_on_front": {\n        "value": "page",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:01:07"\n    }\n}','','','trash','closed','closed','','456d6183-be28-470a-8732-1f2e14d07a72','','','2020-02-21 00:01:07','2020-02-20 16:01:07','',0,'http://zhuhouyu.xyz/2020/02/21/456d6183-be28-470a-8732-1f2e14d07a72/',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (24,1,'2020-02-21 00:02:33','2020-02-20 16:02:33','<!-- wp:paragraph -->\n<p>这是示范页面。页面和博客文章不同，它的位置是固定的，通常会在站点导航栏显示。很多用户都创建一个“关于”页面，向访客介绍自己。例如：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>欢迎！我白天是个邮递员，晚上就是个有抱负的演员。这是我的网站。我住在天朝的帝都，有条叫做Jack的狗。</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>……或这个：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>XYZ Doohickey公司成立于1971年，自从建立以来，我们一直向社会贡献着优秀doohickies。我们的公司总部位于天朝魔都，有着超过两千名员工，对魔都政府税收有着巨大贡献。</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>而您，作为一个WordPress用户，我们建议您访问<a href="http://zhuhouyu.xyz/wp-admin/">控制板</a>，删除本页面，然后添加您自己的页面。祝您使用愉快！</p>\n<!-- /wp:paragraph -->','示例页面','','inherit','closed','closed','','2-revision-v1','','','2020-02-21 00:02:33','2020-02-20 16:02:33','',2,'http://zhuhouyu.xyz/2020/02/21/2-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (25,1,'2020-02-21 00:02:37','1999-01-01 00:00:00','','自动草稿','','auto-draft','closed','closed','','','','','2020-02-21 00:02:37','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=25',0,'page','',0);
INSERT INTO `wp_posts` VALUES (26,1,'2020-02-21 00:06:05','2020-02-20 16:06:05','{\n    "minty::nav_menu_locations[footer]": {\n        "value": 2,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:06:01"\n    },\n    "nav_menu_item[-2566141863929526300]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 1,\n            "type": "custom",\n            "title": "\\u9996\\u9875",\n            "url": "http://zhuhouyu.xyz",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "\\u9996\\u9875",\n            "nav_menu_term_id": 2,\n            "_invalid": false,\n            "type_label": "\\u81ea\\u5b9a\\u4e49\\u94fe\\u63a5"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:06:01"\n    },\n    "nav_menu_item[-2700171780772835300]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:06:01"\n    },\n    "nav_menu_item[-4160489032255807500]": {\n        "value": {\n            "object_id": 1,\n            "object": "post",\n            "menu_item_parent": 0,\n            "position": 2,\n            "type": "post_type",\n            "title": "\\u535a\\u5ba2",\n            "url": "http://zhuhouyu.xyz/2020/02/20/hello-world/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "\\u4e16\\u754c\\uff0c\\u60a8\\u597d\\uff01",\n            "nav_menu_term_id": 2,\n            "_invalid": false,\n            "type_label": "\\u6587\\u7ae0"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:06:01"\n    }\n}','','','trash','closed','closed','','93ebc2bc-0bfc-4cab-8cc6-7aec27e5a8bc','','','2020-02-21 00:06:05','2020-02-20 16:06:05','',0,'http://zhuhouyu.xyz/?p=26',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (100,1,'2020-02-22 00:46:13','2020-02-21 16:46:13','<!-- wp:heading -->\n<h2>我们是谁</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>我们的站点地址是：http://zhuhouyu.xyz/。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>我们收集何种及为何收集个人数据</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading {"level":3} -->\n<h3>评论</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>当访客留下评论时，我们会收集评论表单所显示的数据，和访客的IP地址及浏览器的user agent字符串来帮助检查垃圾评论。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>由您的电子邮件地址所生成的匿名化字符串（又称为哈希）可能会被提供给Gravatar服务确认您是否有使用该服务。Gravatar服务的隐私政策在此：https://automattic.com/privacy/。在您的评论获批准后，您的资料图片将在您的评论旁公开展示。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {"level":3} -->\n<h3>媒体</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>如果您向此网站上传图片，您应当避免上传那些有嵌入地理位置信息（EXIF GPS）的图片。此网站的访客将可以下载并提取此网站的图片中的位置信息。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {"level":3} -->\n<h3>联系表单</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {"level":3} -->\n<h3>Cookies</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>如果您在我们的站点上留下评论，您可以选择用cookies保存您的姓名、电子邮件地址和网站。这是通过让您可以不用在评论时再次填写相关内容而向您提供方便。这些cookies会保留一年。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>如果您访问我们的登录页，我们会设置一个临时的cookie来确认您的浏览器是否接受cookies。此cookie不包含个人数据，且会在您关闭浏览器时被丢弃。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>当您登录时，我们也会设置多个cookies来保存您的登录信息及屏幕显示选项。登录cookies会保留两天，而屏幕显示选项cookies会保留一年。如果您选择了“记住我”，您的登录会保留两周。如果您注销，登录cookies将被移除。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>如果您编辑或发布文章，我们会在您的浏览器中保存一个额外的cookie。这个cookie不包含个人数据而只记录了您刚才编辑的文章的ID。这个小甜饼会保留一天。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {"level":3} -->\n<h3>其他站点的嵌入内容</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>此站点上的文章可能会包含嵌入的内容（如视频、图像、文章等）。来自其他站点的嵌入内容的行为和您直接访问这些其他站点没有区别。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>这些站点可能会收集关于您的数据、使用cookies、嵌入额外的第三方跟踪程序及监视您与这些嵌入内容的交互，包括在您有这些站点的账户并登录了这些站点时，跟踪您与嵌入内容的交互。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {"level":3} -->\n<h3>统计</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>我们与谁共享您的信息</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>我们保留多久您的信息</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>如果您留下评论，评论和其元数据将被无限期保存。我们这样做以便能识别并自动批准任何后续评论，而不用将这些后续评论加入待审队列。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>对于本网站的注册用户，我们也会保存用户在个人资料中提供的个人信息。所有用户可以在任何时候查看、编辑或删除他们的个人信息（除了不能变更用户名外）、站点管理员也可以查看及编辑那些信息。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>您对您的信息有什么权利</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>如果您有此站点的账户，或曾经留下评论，您可以请求我们提供我们所拥有的您的个人数据的导出文件，这也包括了所有您提供给我们的数据。您也可以要求我们抹除所有关于您的个人数据。这不包括我们因管理、法规或安全需要而必须保留的数据。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>我们将您的信息发送到哪</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>访客评论可能会被自动垃圾评论监测服务检查。</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>您的联系信息</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>其他信息</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading {"level":3} -->\n<h3>我们如何保护您的数据</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {"level":3} -->\n<h3>我们有何种数据泄露处理流程</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {"level":3} -->\n<h3>我们从哪些第三方接收数据</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {"level":3} -->\n<h3>我们通过用户数据进行何种自动决策及/或归纳</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {"level":3} -->\n<h3>行业监管披露要求</h3>\n<!-- /wp:heading -->','隐私政策','','inherit','closed','closed','','3-revision-v1','','','2020-02-22 00:46:13','2020-02-21 16:46:13','',3,'http://zhuhouyu.xyz/2020/02/22/3-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (99,1,'2020-02-22 00:03:15','2020-02-21 16:03:15',' ','','','publish','closed','closed','','99','','','2020-02-22 00:03:15','2020-02-21 16:03:15','',0,'http://zhuhouyu.xyz/?p=99',3,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (29,1,'2020-02-21 00:08:00','2020-02-20 16:08:00','{\n    "nav_menu_item[-9073957853052406000]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:08:00"\n    }\n}','','','trash','closed','closed','','4d61649a-4756-496a-805a-890aa762dba7','','','2020-02-21 00:08:00','2020-02-20 16:08:00','',0,'http://zhuhouyu.xyz/?p=29',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (30,1,'2020-02-21 00:15:44','2020-02-20 16:15:44','{\n    "nav_menu_item[28]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:14:49"\n    },\n    "nav_menu_item[-5078648602117841000]": {\n        "value": {\n            "object_id": 0,\n            "object": "custom",\n            "menu_item_parent": 0,\n            "position": 2,\n            "type": "custom",\n            "title": "\\u535a\\u5ba2",\n            "url": "http://zhuhouyu.xyz/customize.php",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "\\u535a\\u5ba2",\n            "nav_menu_term_id": 2,\n            "_invalid": false,\n            "type_label": "\\u81ea\\u5b9a\\u4e49\\u94fe\\u63a5"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:14:49"\n    },\n    "nav_menu_item[-4335723904540440600]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:14:49"\n    },\n    "nav_menu_item[-5567521537564643000]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:14:49"\n    },\n    "nav_menu_item[27]": {\n        "value": {\n            "menu_item_parent": 0,\n            "object_id": 27,\n            "object": "custom",\n            "type": "custom",\n            "type_label": "\\u81ea\\u5b9a\\u4e49\\u94fe\\u63a5",\n            "title": "\\u9996\\u9875",\n            "url": "",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "nav_menu_term_id": 2,\n            "position": 1,\n            "status": "publish",\n            "original_title": "",\n            "_invalid": false\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:15:44"\n    },\n    "nav_menus_created_posts": {\n        "value": [\n            31\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:15:44"\n    },\n    "nav_menu_item[-1630386419959834600]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:15:44"\n    },\n    "nav_menu_item[-7195609584523045000]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:15:44"\n    },\n    "nav_menu_item[-8189406585253968000]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:15:44"\n    }\n}','','','trash','closed','closed','','f2d72601-d6d4-475f-8a34-3ccbab0173d7','','','2020-02-21 00:15:44','2020-02-20 16:15:44','',0,'http://zhuhouyu.xyz/?p=30',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (34,1,'2020-02-21 00:16:16','2020-02-20 16:16:16','{\n    "nav_menu_item[32]": {\n        "value": {\n            "object_id": 0,\n            "object": "custom",\n            "menu_item_parent": 0,\n            "position": 2,\n            "type": "custom",\n            "title": "\\u535a\\u5ba2",\n            "url": "http://zhuhouyu.xyz",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "\\u535a\\u5ba2",\n            "nav_menu_term_id": 2,\n            "_invalid": false,\n            "type_label": "\\u81ea\\u5b9a\\u4e49\\u94fe\\u63a5"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:16:16"\n    }\n}','','','trash','closed','closed','','9d44e7f3-95c3-4ef8-9f45-32c416dbdd08','','','2020-02-21 00:16:16','2020-02-20 16:16:16','',0,'http://zhuhouyu.xyz/2020/02/21/9d44e7f3-95c3-4ef8-9f45-32c416dbdd08/',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (117,1,'2020-02-22 11:54:54','2020-02-22 03:54:54','<!-- wp:paragraph -->\n<p>2020-02-20:宇后人生博客V1.0（试水版)上线,修复部分已知bug；</p>\n<!-- /wp:paragraph -->','更新日志','','inherit','closed','closed','','106-revision-v1','','','2020-02-22 11:54:54','2020-02-22 03:54:54','',106,'http://zhuhouyu.xyz/106-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (35,1,'2020-02-21 00:17:39','2020-02-20 16:17:39','{\n    "nav_menu_item[-875136442107953200]": {\n        "value": {\n            "object_id": 0,\n            "object": "custom",\n            "menu_item_parent": 0,\n            "position": 3,\n            "type": "custom",\n            "title": "\\u5173\\u4e8e",\n            "url": "#",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "\\u5173\\u4e8e",\n            "nav_menu_term_id": 2,\n            "_invalid": false,\n            "type_label": "\\u81ea\\u5b9a\\u4e49\\u94fe\\u63a5"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:17:39"\n    },\n    "nav_menu_item[-7077702015765744000]": {\n        "value": {\n            "object_id": 0,\n            "object": "custom",\n            "menu_item_parent": 0,\n            "position": 4,\n            "type": "custom",\n            "title": "\\u7559\\u8a00\\u677f",\n            "url": "#",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "\\u7559\\u8a00\\u677f",\n            "nav_menu_term_id": 2,\n            "_invalid": false,\n            "type_label": "\\u81ea\\u5b9a\\u4e49\\u94fe\\u63a5"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:17:39"\n    }\n}','','','trash','closed','closed','','06806970-fc35-4aa7-8e29-6b9912c16a5e','','','2020-02-21 00:17:39','2020-02-20 16:17:39','',0,'http://zhuhouyu.xyz/2020/02/21/06806970-fc35-4aa7-8e29-6b9912c16a5e/',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (93,1,'2020-02-21 23:41:45','2020-02-21 15:41:45','','首页','','publish','closed','closed','','index','','','2020-02-21 23:41:46','2020-02-21 15:41:46','',0,'http://zhuhouyu.xyz/?page_id=93',0,'page','',0);
INSERT INTO `wp_posts` VALUES (94,1,'2020-02-21 23:41:21','2020-02-21 15:41:21','','首页','','inherit','closed','closed','','93-revision-v1','','','2020-02-21 23:41:21','2020-02-21 15:41:21','',93,'http://zhuhouyu.xyz/2020/02/21/93-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (115,1,'2020-02-22 11:32:27','2020-02-22 03:32:27','[xh_social_page_register]','Social - 注册','','inherit','closed','closed','','48-revision-v1','','','2020-02-22 11:32:27','2020-02-22 03:32:27','',48,'http://zhuhouyu.xyz/48-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (42,1,'2020-02-21 00:32:49','2020-02-20 16:32:49','{\n    "nav_menu_item[-1456012946765201400]": {\n        "value": {\n            "object_id": 1,\n            "object": "category",\n            "menu_item_parent": 0,\n            "position": 5,\n            "type": "taxonomy",\n            "title": "\\u968f\\u7b14",\n            "url": "http://zhuhouyu.xyz/category/uncategorized/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "\\u672a\\u5206\\u7c7b",\n            "nav_menu_term_id": 2,\n            "_invalid": false,\n            "type_label": "\\u5206\\u7c7b\\u76ee\\u5f55"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:32:49"\n    }\n}','','','trash','closed','closed','','b0914f35-1b6c-49b5-9c33-a75679d32ff6','','','2020-02-21 00:32:49','2020-02-20 16:32:49','',0,'http://zhuhouyu.xyz/2020/02/21/b0914f35-1b6c-49b5-9c33-a75679d32ff6/',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (41,1,'2020-02-21 00:31:53','2020-02-20 16:31:53','{\n    "nav_menu_item[40]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:31:53"\n    }\n}','','','trash','closed','closed','','9c98fc68-1f5b-4477-bbb3-4f0e4de01306','','','2020-02-21 00:31:53','2020-02-20 16:31:53','',0,'http://zhuhouyu.xyz/2020/02/21/9c98fc68-1f5b-4477-bbb3-4f0e4de01306/',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (45,1,'2020-02-21 00:36:28','2020-02-20 16:36:28','{\n    "nav_menu_item[32]": {\n        "value": {\n            "menu_item_parent": 0,\n            "object_id": 32,\n            "object": "custom",\n            "type": "custom",\n            "type_label": "\\u81ea\\u5b9a\\u4e49\\u94fe\\u63a5",\n            "title": "\\u535a\\u5ba2",\n            "url": "http://zhuhouyu.xyz",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "nav_menu_term_id": 2,\n            "position": 2,\n            "status": "publish",\n            "original_title": "",\n            "_invalid": false\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:36:28"\n    }\n}','','','trash','closed','closed','','f053e22c-1e6b-4db9-ae6a-55cd57fb7dae','','','2020-02-21 00:36:28','2020-02-20 16:36:28','',0,'http://zhuhouyu.xyz/2020/02/21/f053e22c-1e6b-4db9-ae6a-55cd57fb7dae/',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (44,1,'2020-02-21 00:34:20','2020-02-20 16:34:20','{\n    "nav_menu_item[43]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:33:18"\n    },\n    "nav_menu_item[32]": {\n        "value": {\n            "menu_item_parent": 0,\n            "object_id": 32,\n            "object": "custom",\n            "type": "custom",\n            "type_label": "\\u81ea\\u5b9a\\u4e49\\u94fe\\u63a5",\n            "title": "\\u535a\\u5ba2",\n            "url": "http://zhuhouyu.xyz/customize.php",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "nav_menu_term_id": 2,\n            "position": 2,\n            "status": "publish",\n            "original_title": "",\n            "_invalid": false\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-20 16:34:20"\n    }\n}','','','trash','closed','closed','','05089d54-5fe3-4c9b-a42a-9276e7016ebc','','','2020-02-21 00:34:20','2020-02-20 16:34:20','',0,'http://zhuhouyu.xyz/?p=44',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (47,1,'2020-02-21 01:06:26','2020-02-20 17:06:26','[xh_social_page_login]','Social - 登录','','trash','closed','closed','','login__trashed','','','2020-02-22 11:32:27','2020-02-22 03:32:27','',0,'http://zhuhouyu.xyz/login/',0,'page','',0);
INSERT INTO `wp_posts` VALUES (48,1,'2020-02-21 01:06:26','2020-02-20 17:06:26','[xh_social_page_register]','Social - 注册','','trash','closed','closed','','register__trashed','','','2020-02-22 11:32:27','2020-02-22 03:32:27','',0,'http://zhuhouyu.xyz/register/',0,'page','',0);
INSERT INTO `wp_posts` VALUES (49,1,'2020-02-21 01:06:26','2020-02-20 17:06:26','[xh_social_page_findpassword]','Social - 找回密码','','trash','closed','closed','','findpassword__trashed','','','2020-02-22 11:32:27','2020-02-22 03:32:27','',0,'http://zhuhouyu.xyz/findpassword/',0,'page','',0);
INSERT INTO `wp_posts` VALUES (50,1,'2020-02-21 11:42:28','1999-01-01 00:00:00','','自动草稿','','auto-draft','closed','closed','','','','','2020-02-21 11:42:28','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=50',0,'page','',0);
INSERT INTO `wp_posts` VALUES (51,1,'2020-02-21 11:43:21','1999-01-01 00:00:00','','自动草稿','','auto-draft','closed','closed','','','','','2020-02-21 11:43:21','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=51',0,'page','',0);
INSERT INTO `wp_posts` VALUES (52,1,'2020-02-21 11:44:39','2020-02-21 03:44:39','<p>[xh_social_page_register]</p>\n\n<!-- wp:code -->\n<pre class="wp-block-code"><code>&lt;a href="">隐私政策&lt;/a></code></pre>\n<!-- /wp:code -->','Social - 注册','','inherit','closed','closed','','48-autosave-v1','','','2020-02-21 11:44:39','2020-02-21 03:44:39','',48,'http://zhuhouyu.xyz/2020/02/21/48-autosave-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (53,1,'2020-02-21 12:06:47','2020-02-21 04:06:47','<!-- wp:heading -->\n<h2> 关于本站 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p> 本站主要用于记录和分享生活和学习过程中点点滴滴以及收获的心得。 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\n网站结构：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>前 端 ： wordpress的minty主题 </li><li>后 端 ： PHP7.3 + MySQL5.8 </li><li>后台 ：wordpress的后台管理</li><li>服务器：阿里云</li></ul>\n<!-- /wp:list -->\n\n<p><!--EndFragment-->个人网站新手上路技术有限，望大佬给予指点~</p>\n\n<!-- wp:heading -->\n<h2> 关于我 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>本人大四即将毕业，作为物联网专业的一名小白，大一大二都在玩耍，现在苦学苦练前端开发，所以有很多地方可能不到位，如发现BUG及时联系我哟~ </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>可以通过以下方式联系我：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>邮箱：971667935@qq.com</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>微信联系：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"id":102,"width":288,"height":288,"sizeSlug":"large"} -->\n<figure class="wp-block-image size-large is-resized"><img src="http://zhuhouyu.xyz/wp-content/uploads/2020/02/mmqrcode1582304645192.jpg" alt="" class="wp-image-102" width="288" height="288"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading -->\n<h2>特别说明</h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul><li>本站所有内容仅代表个人观点，和任何组织或个人无关。</li><li>本站内容仅供学习交流，请勿用于任何形式商业行为。</li><li>对于本站原创文章，如需转载使用，请务必<code>注明</code>文章作者和来源.</li><li>本网站如无意中侵犯了某些组织或个人的知识产权，请来信或来电告之，本网站将立即予以删除。</li></ul>\n<!-- /wp:list -->','关于','','publish','closed','closed','','about','','','2020-02-22 11:23:28','2020-02-22 03:23:28','',0,'http://zhuhouyu.xyz/?page_id=53',0,'page','',0);
INSERT INTO `wp_posts` VALUES (54,1,'2020-02-21 12:05:33','2020-02-21 04:05:33','','关于','','inherit','closed','closed','','53-revision-v1','','','2020-02-21 12:05:33','2020-02-21 04:05:33','',53,'http://zhuhouyu.xyz/2020/02/21/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (55,1,'2020-02-21 12:06:47','2020-02-21 04:06:47','','关于本站','','inherit','closed','closed','','53-revision-v1','','','2020-02-21 12:06:47','2020-02-21 04:06:47','',53,'http://zhuhouyu.xyz/2020/02/21/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (56,1,'2020-02-21 12:07:23','2020-02-21 04:07:23','{\n    "nav_menu_item[36]": {\n        "value": {\n            "menu_item_parent": 0,\n            "object_id": 36,\n            "object": "custom",\n            "type": "custom",\n            "type_label": "\\u81ea\\u5b9a\\u4e49\\u94fe\\u63a5",\n            "title": "\\u5173\\u4e8e",\n            "url": "http://zhuhouyu.xyz/about/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "nav_menu_term_id": 2,\n            "position": 3,\n            "status": "publish",\n            "original_title": "",\n            "_invalid": false\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-21 04:07:23"\n    }\n}','','','trash','closed','closed','','d9e302f1-d49b-4407-be8b-e14da7a34df4','','','2020-02-21 12:07:23','2020-02-21 04:07:23','',0,'http://zhuhouyu.xyz/2020/02/21/d9e302f1-d49b-4407-be8b-e14da7a34df4/',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (57,1,'2020-02-21 12:33:28','2020-02-21 04:33:28','{\n    "minty::background_color": {\n        "value": "#dddddd",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-21 04:33:28"\n    },\n    "minty::minty_color_scheme": {\n        "value": "turquoise",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-21 04:33:08"\n    }\n}','','','trash','closed','closed','','d09aba8c-6964-43e1-830c-9aa3ae8db78b','','','2020-02-21 12:33:28','2020-02-21 04:33:28','',0,'http://zhuhouyu.xyz/?p=57',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (58,1,'2020-02-21 12:33:45','2020-02-21 04:33:45','{\n    "minty::background_color": {\n        "value": "#ddc7c7",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-21 04:33:45"\n    }\n}','','','trash','closed','closed','','554a7915-7934-43e4-97d4-b990a4481ba9','','','2020-02-21 12:33:45','2020-02-21 04:33:45','',0,'http://zhuhouyu.xyz/2020/02/21/554a7915-7934-43e4-97d4-b990a4481ba9/',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (59,1,'2020-02-21 12:35:22','1999-01-01 00:00:00',' ','','','draft','closed','closed','','','','','2020-02-21 12:35:22','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?p=59',1,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (60,1,'2020-02-21 13:45:33','1999-01-01 00:00:00','','自动草稿','','auto-draft','open','open','','','','','2020-02-21 13:45:33','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?p=60',0,'post','',0);
INSERT INTO `wp_posts` VALUES (61,1,'2020-02-21 17:54:51','1999-01-01 00:00:00','','自动草稿','','auto-draft','closed','closed','','','','','2020-02-21 17:54:51','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=61',0,'page','',0);
INSERT INTO `wp_posts` VALUES (62,1,'2020-02-21 18:05:10','2020-02-21 10:05:10','{\n    "sidebars_widgets[sidebar]": {\n        "value": [\n            "minty_recentposts-3",\n            "categories-5",\n            "minty_recentcomments-3",\n            "archives-4",\n            "calendar-3"\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-21 10:05:10"\n    },\n    "widget_minty_randomlinks[3]": {\n        "value": [],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-21 10:02:18"\n    },\n    "widget_minty_recentposts[3]": {\n        "value": [],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-21 10:02:18"\n    },\n    "widget_minty_recentcomments[3]": {\n        "value": [],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-21 10:02:18"\n    },\n    "widget_archives[4]": {\n        "value": {\n            "encoded_serialized_instance": "YTozOntzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJjb3VudCI7aTowO3M6ODoiZHJvcGRvd24iO2k6MDt9",\n            "title": "",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "813fc516209bd9d4a33dfdc36e18b494"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-21 10:03:18"\n    },\n    "widget_categories[4]": {\n        "value": {\n            "encoded_serialized_instance": "YTo0OntzOjU6InRpdGxlIjtzOjY6Iumaj+eslCI7czo1OiJjb3VudCI7aTowO3M6MTI6ImhpZXJhcmNoaWNhbCI7aToxO3M6ODoiZHJvcGRvd24iO2k6MDt9",\n            "title": "\\u968f\\u7b14",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "b019c8f5b4775bf4877f3082b8b63a31"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-21 10:04:18"\n    },\n    "widget_archives[5]": {\n        "value": [],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-21 10:04:18"\n    },\n    "widget_categories[5]": {\n        "value": {\n            "encoded_serialized_instance": "YTo0OntzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJjb3VudCI7aTowO3M6MTI6ImhpZXJhcmNoaWNhbCI7aToxO3M6ODoiZHJvcGRvd24iO2k6MDt9",\n            "title": "",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "51828ee5196b803513ec1438c3ec35df"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-21 10:05:10"\n    }\n}','','','trash','closed','closed','','d8a836bd-246e-4d02-a424-060682604367','','','2020-02-21 18:05:10','2020-02-21 10:05:10','',0,'http://zhuhouyu.xyz/?p=62',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (63,1,'2020-02-21 18:07:06','1999-01-01 00:00:00','','自动草稿','','auto-draft','open','open','','','','','2020-02-21 18:07:06','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?p=63',0,'post','',0);
INSERT INTO `wp_posts` VALUES (64,1,'2020-02-21 18:11:51','2020-02-21 10:11:51','<!-- wp:heading -->\n<h2> 关于本站 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {"backgroundColor":"pale-cyan-blue"} -->\n<p class="has-background has-pale-cyan-blue-background-color"> 本站主要用于记录和分享生活和学习过程中点点滴滴以及收获的心得。 </p>\n<!-- /wp:paragraph -->','关于','','inherit','closed','closed','','53-revision-v1','','','2020-02-21 18:11:51','2020-02-21 10:11:51','',53,'http://zhuhouyu.xyz/2020/02/21/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (65,1,'2020-02-21 18:13:00','2020-02-21 10:13:00','<!-- wp:heading {"textColor":"pale-cyan-blue"} -->\n<h2 class="has-pale-cyan-blue-color has-text-color"> 关于本站 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {"textColor":"pale-cyan-blue"} -->\n<p class="has-text-color has-pale-cyan-blue-color"> 本站主要用于记录和分享生活和学习过程中点点滴滴以及收获的心得。 </p>\n<!-- /wp:paragraph -->','关于','','inherit','closed','closed','','53-revision-v1','','','2020-02-21 18:13:00','2020-02-21 10:13:00','',53,'http://zhuhouyu.xyz/2020/02/21/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (67,1,'2020-02-21 18:13:41','2020-02-21 10:13:41','<!-- wp:heading -->\n<h2> 关于本站 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p> 本站主要用于记录和分享生活和学习过程中点点滴滴以及收获的心得。 </p>\n<!-- /wp:paragraph -->','关于','','inherit','closed','closed','','53-revision-v1','','','2020-02-21 18:13:41','2020-02-21 10:13:41','',53,'http://zhuhouyu.xyz/2020/02/21/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (66,1,'2020-02-21 18:13:24','2020-02-21 10:13:24','<!-- wp:heading {"textColor":"vivid-cyan-blue"} -->\n<h2 class="has-vivid-cyan-blue-color has-text-color"> 关于本站 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {"textColor":"vivid-cyan-blue"} -->\n<p class="has-text-color has-vivid-cyan-blue-color"> 本站主要用于记录和分享生活和学习过程中点点滴滴以及收获的心得。 </p>\n<!-- /wp:paragraph -->','关于','','inherit','closed','closed','','53-revision-v1','','','2020-02-21 18:13:24','2020-02-21 10:13:24','',53,'http://zhuhouyu.xyz/2020/02/21/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (103,1,'2020-02-22 01:04:49','2020-02-21 17:04:49','<!-- wp:heading -->\n<h2> 关于本站 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p> 本站主要用于记录和分享生活和学习过程中点点滴滴以及收获的心得。 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\n网站结构：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>前 端 ： wordpress的minty主题 </li><li>后 端 ： PHP7.3 + MySQL5.8 </li><li>后台 ：wordpress的后台管理</li><li>服务器：阿里云</li></ul>\n<!-- /wp:list -->\n\n<p><!--EndFragment-->个人网站新手上路技术有限，望大佬给予指点~</p>\n\n<!-- wp:heading -->\n<h2> 关于我 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>本人大四即将毕业，作为物联网专业的一名小白，大一大二都在玩耍，现在苦学苦练前端开发，所以有很多地方可能不到位，如发现BUG及时联系我哟~ </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>可以通过以下方式联系我：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>邮箱：971667935@qq.com</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>微信联系：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"id":102,"sizeSlug":"large"} -->\n<figure class="wp-block-image size-large"><img src="http://zhuhouyu.xyz/wp-content/uploads/2020/02/mmqrcode1582304645192.jpg" alt="" class="wp-image-102"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading -->\n<h2>特别说明</h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul><li>本站所有内容仅代表个人观点，和任何组织或个人无关。</li><li>本站内容仅供学习交流，请勿用于任何形式商业行为。</li><li>对于本站原创文章，如需转载使用，请务必<code>注明</code>文章作者和来源.</li><li>本网站如无意中侵犯了某些组织或个人的知识产权，请来信或来电告之，本网站将立即予以删除。</li></ul>\n<!-- /wp:list -->','关于','','inherit','closed','closed','','53-revision-v1','','','2020-02-22 01:04:49','2020-02-21 17:04:49','',53,'http://zhuhouyu.xyz/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (68,1,'2020-02-21 18:16:19','2020-02-21 10:16:19','<!-- wp:heading -->\n<h2> 关于本站 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p> 本站主要用于记录和分享生活和学习过程中点点滴滴以及收获的心得。 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\n网站结构：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>前 端 ： wordpress的minty主题 </li><li>后 端 ： PHP7.3 + MySQL5.8 </li><li>后台 ：wordpress的后台管理</li><li>服务器：阿里云</li></ul>\n<!-- /wp:list -->\n\n<p><!--EndFragment-->个人网站新手上路技术有限，望大佬给予指点~</p>\n\n<!-- wp:heading -->\n<h2> 关于我 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>本人大四即将毕业，作为物联网专业的一名小白，大一大二都在玩耍，现在苦学苦练前端开发，所以有很多地方可能不到位，如发现BUG及时联系我哟~ </p>\n<!-- /wp:paragraph -->\n\n<p><br>\n<br>\n<!--StartFragment--></p>\n\n<!-- wp:paragraph -->\n<p>可以通过以下方式联系我：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>邮箱：971667935@qq.com</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"id":59,"width":124,"height":124,"sizeSlug":"large"} -->\n<figure class="wp-block-image size-large is-resized"><img src="http://localhost/myblog/wp-content/uploads/2020/02/weixin-1.jpg" alt="" class="wp-image-59" width="124" height="124"/><figcaption>微信联系</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading -->\n<h2>鼓励我</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>您的鼓励是我进步的源泉~</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"id":89,"width":132,"height":182,"sizeSlug":"large"} -->\n<figure class="wp-block-image size-large is-resized"><img src="http://localhost/myblog/wp-content/uploads/2020/02/Wpay-746x1024.png" alt="" class="wp-image-89" width="132" height="182"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading -->\n<h2>特别说明</h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul><li>本站所有内容仅代表个人观点，和任何组织或个人无关。</li><li>本站内容仅供学习交流，请勿用于任何形式商业行为。</li><li>对于本站原创文章，如需转载使用，请务必<code>注明</code>文章作者和来源.</li><li>本网站如无意中侵犯了某些组织或个人的知识产权，请来信或来电告之，本网站将立即予以删除。</li></ul>\n<!-- /wp:list -->','关于','','inherit','closed','closed','','53-revision-v1','','','2020-02-21 18:16:19','2020-02-21 10:16:19','',53,'http://zhuhouyu.xyz/2020/02/21/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (69,1,'2020-02-21 18:16:47','2020-02-21 10:16:47','<!-- wp:heading -->\n<h2> 关于本站 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p> 本站主要用于记录和分享生活和学习过程中点点滴滴以及收获的心得。 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\n网站结构：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>前 端 ： wordpress的minty主题 </li><li>后 端 ： PHP7.3 + MySQL5.8 </li><li>后台 ：wordpress的后台管理</li><li>服务器：阿里云</li></ul>\n<!-- /wp:list -->\n\n<p><!--EndFragment-->个人网站新手上路技术有限，望大佬给予指点~</p>\n\n<!-- wp:heading -->\n<h2> 关于我 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>本人大四即将毕业，作为物联网专业的一名小白，大一大二都在玩耍，现在苦学苦练前端开发，所以有很多地方可能不到位，如发现BUG及时联系我哟~ </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>可以通过以下方式联系我：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>邮箱：971667935@qq.com</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"id":59,"width":124,"height":124,"sizeSlug":"large"} -->\n<figure class="wp-block-image size-large is-resized"><img src="http://localhost/myblog/wp-content/uploads/2020/02/weixin-1.jpg" alt="" class="wp-image-59" width="124" height="124"/><figcaption>微信联系</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading -->\n<h2>鼓励我</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>您的鼓励是我进步的源泉~</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"id":89,"width":132,"height":182,"sizeSlug":"large"} -->\n<figure class="wp-block-image size-large is-resized"><img src="http://localhost/myblog/wp-content/uploads/2020/02/Wpay-746x1024.png" alt="" class="wp-image-89" width="132" height="182"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading -->\n<h2>特别说明</h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul><li>本站所有内容仅代表个人观点，和任何组织或个人无关。</li><li>本站内容仅供学习交流，请勿用于任何形式商业行为。</li><li>对于本站原创文章，如需转载使用，请务必<code>注明</code>文章作者和来源.</li><li>本网站如无意中侵犯了某些组织或个人的知识产权，请来信或来电告之，本网站将立即予以删除。</li></ul>\n<!-- /wp:list -->','关于','','inherit','closed','closed','','53-revision-v1','','','2020-02-21 18:16:47','2020-02-21 10:16:47','',53,'http://zhuhouyu.xyz/2020/02/21/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (70,1,'2020-02-21 18:17:28','2020-02-21 10:17:28','<!-- wp:heading -->\n<h2> 关于本站 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p> 本站主要用于记录和分享生活和学习过程中点点滴滴以及收获的心得。 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\n网站结构：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>前 端 ： wordpress的minty主题 </li><li>后 端 ： PHP7.3 + MySQL5.8 </li><li>后台 ：wordpress的后台管理</li><li>服务器：阿里云</li></ul>\n<!-- /wp:list -->\n\n<p><!--EndFragment-->个人网站新手上路技术有限，望大佬给予指点~</p>\n\n<!-- wp:heading -->\n<h2> 关于我 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>本人大四即将毕业，作为物联网专业的一名小白，大一大二都在玩耍，现在苦学苦练前端开发，所以有很多地方可能不到位，如发现BUG及时联系我哟~ </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>可以通过以下方式联系我：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>邮箱：971667935@qq.com</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>微信联系</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"width":171,"height":170} -->\n<figure class="wp-block-image is-resized"><img src="http://localhost/myblog/wp-content/uploads/2020/02/weixin-1.jpg" alt="æ­¤å¾åçaltå±æ§ä¸ºç©ºï¼æä»¶åä¸ºweixin-1.jpg" width="171" height="170"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading -->\n<h2>鼓励我</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>您的鼓励是我进步的源泉~</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"id":89,"width":132,"height":182,"sizeSlug":"large"} -->\n<figure class="wp-block-image size-large is-resized"><img src="http://localhost/myblog/wp-content/uploads/2020/02/Wpay-746x1024.png" alt="" class="wp-image-89" width="132" height="182"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading -->\n<h2>特别说明</h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul><li>本站所有内容仅代表个人观点，和任何组织或个人无关。</li><li>本站内容仅供学习交流，请勿用于任何形式商业行为。</li><li>对于本站原创文章，如需转载使用，请务必<code>注明</code>文章作者和来源.</li><li>本网站如无意中侵犯了某些组织或个人的知识产权，请来信或来电告之，本网站将立即予以删除。</li></ul>\n<!-- /wp:list -->','关于','','inherit','closed','closed','','53-revision-v1','','','2020-02-21 18:17:28','2020-02-21 10:17:28','',53,'http://zhuhouyu.xyz/2020/02/21/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (75,1,'2020-02-21 20:09:14','2020-02-21 12:09:14','<!-- wp:heading -->\n<h2> 关于本站 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p> 本站主要用于记录和分享生活和学习过程中点点滴滴以及收获的心得。 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\n网站结构：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>前 端 ： wordpress的minty主题 </li><li>后 端 ： PHP7.3 + MySQL5.8 </li><li>后台 ：wordpress的后台管理</li><li>服务器：阿里云</li></ul>\n<!-- /wp:list -->\n\n<p><!--EndFragment-->个人网站新手上路技术有限，望大佬给予指点~</p>\n\n<!-- wp:heading -->\n<h2> 关于我 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>本人大四即将毕业，作为物联网专业的一名小白，大一大二都在玩耍，现在苦学苦练前端开发，所以有很多地方可能不到位，如发现BUG及时联系我哟~ </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>可以通过以下方式联系我：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>邮箱：971667935@qq.com</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>微信联系：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"width":200,"height":199,"className":"is-style-default"} -->\n<figure class="wp-block-image is-resized is-style-default"><img src="http://localhost/myblog/wp-content/uploads/2020/02/weixin-1.jpg" alt="æ­¤å¾åçaltå±æ§ä¸ºç©ºï¼æä»¶åä¸ºweixin-1.jpg" width="200" height="199"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading -->\n<h2>特别说明</h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul><li>本站所有内容仅代表个人观点，和任何组织或个人无关。</li><li>本站内容仅供学习交流，请勿用于任何形式商业行为。</li><li>对于本站原创文章，如需转载使用，请务必<code>注明</code>文章作者和来源.</li><li>本网站如无意中侵犯了某些组织或个人的知识产权，请来信或来电告之，本网站将立即予以删除。</li></ul>\n<!-- /wp:list -->','关于','','inherit','closed','closed','','53-revision-v1','','','2020-02-21 20:09:14','2020-02-21 12:09:14','',53,'http://zhuhouyu.xyz/2020/02/21/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (73,1,'2020-02-21 18:22:04','2020-02-21 10:22:04','<!-- wp:heading -->\n<h2> 关于本站 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p> 本站主要用于记录和分享生活和学习过程中点点滴滴以及收获的心得。 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\n网站结构：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>前 端 ： wordpress的minty主题 </li><li>后 端 ： PHP7.3 + MySQL5.8 </li><li>后台 ：wordpress的后台管理</li><li>服务器：阿里云</li></ul>\n<!-- /wp:list -->\n\n<p><!--EndFragment-->个人网站新手上路技术有限，望大佬给予指点~</p>\n\n<!-- wp:heading -->\n<h2> 关于我 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>本人大四即将毕业，作为物联网专业的一名小白，大一大二都在玩耍，现在苦学苦练前端开发，所以有很多地方可能不到位，如发现BUG及时联系我哟~ </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>可以通过以下方式联系我：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>邮箱：971667935@qq.com</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>微信联系：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"width":200,"height":199,"className":"is-style-default"} -->\n<figure class="wp-block-image is-resized is-style-default"><img src="http://localhost/myblog/wp-content/uploads/2020/02/weixin-1.jpg" alt="æ­¤å¾åçaltå±æ§ä¸ºç©ºï¼æä»¶åä¸ºweixin-1.jpg" width="200" height="199"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading -->\n<h2>鼓励我</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>您的鼓励是我进步的源泉~</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"id":89,"width":132,"height":182,"sizeSlug":"large"} -->\n<figure class="wp-block-image size-large is-resized"><img src="http://localhost/myblog/wp-content/uploads/2020/02/Wpay-746x1024.png" alt="" class="wp-image-89" width="132" height="182"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading -->\n<h2>特别说明</h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul><li>本站所有内容仅代表个人观点，和任何组织或个人无关。</li><li>本站内容仅供学习交流，请勿用于任何形式商业行为。</li><li>对于本站原创文章，如需转载使用，请务必<code>注明</code>文章作者和来源.</li><li>本网站如无意中侵犯了某些组织或个人的知识产权，请来信或来电告之，本网站将立即予以删除。</li></ul>\n<!-- /wp:list -->','关于','','inherit','closed','closed','','53-revision-v1','','','2020-02-21 18:22:04','2020-02-21 10:22:04','',53,'http://zhuhouyu.xyz/2020/02/21/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (72,1,'2020-02-21 18:21:05','2020-02-21 10:21:05','<!-- wp:heading -->\n<h2> 关于本站 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p> 本站主要用于记录和分享生活和学习过程中点点滴滴以及收获的心得。 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\n网站结构：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>前 端 ： wordpress的minty主题 </li><li>后 端 ： PHP7.3 + MySQL5.8 </li><li>后台 ：wordpress的后台管理</li><li>服务器：阿里云</li></ul>\n<!-- /wp:list -->\n\n<p><!--EndFragment-->个人网站新手上路技术有限，望大佬给予指点~</p>\n\n<!-- wp:heading -->\n<h2> 关于我 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>本人大四即将毕业，作为物联网专业的一名小白，大一大二都在玩耍，现在苦学苦练前端开发，所以有很多地方可能不到位，如发现BUG及时联系我哟~ </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>可以通过以下方式联系我：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>邮箱：971667935@qq.com</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>微信联系</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"width":200,"height":199,"className":"is-style-default"} -->\n<figure class="wp-block-image is-resized is-style-default"><img src="http://localhost/myblog/wp-content/uploads/2020/02/weixin-1.jpg" alt="æ­¤å¾åçaltå±æ§ä¸ºç©ºï¼æä»¶åä¸ºweixin-1.jpg" width="200" height="199"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading -->\n<h2>鼓励我</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>您的鼓励是我进步的源泉~</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"id":89,"width":132,"height":182,"sizeSlug":"large"} -->\n<figure class="wp-block-image size-large is-resized"><img src="http://localhost/myblog/wp-content/uploads/2020/02/Wpay-746x1024.png" alt="" class="wp-image-89" width="132" height="182"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading -->\n<h2>特别说明</h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul><li>本站所有内容仅代表个人观点，和任何组织或个人无关。</li><li>本站内容仅供学习交流，请勿用于任何形式商业行为。</li><li>对于本站原创文章，如需转载使用，请务必<code>注明</code>文章作者和来源.</li><li>本网站如无意中侵犯了某些组织或个人的知识产权，请来信或来电告之，本网站将立即予以删除。</li></ul>\n<!-- /wp:list -->','关于','','inherit','closed','closed','','53-revision-v1','','','2020-02-21 18:21:05','2020-02-21 10:21:05','',53,'http://zhuhouyu.xyz/2020/02/21/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (74,1,'2020-02-21 18:48:53','1999-01-01 00:00:00','','自动草稿','','auto-draft','closed','closed','','','','','2020-02-21 18:48:53','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=74',0,'page','',0);
INSERT INTO `wp_posts` VALUES (76,1,'2020-02-21 20:09:33','1999-01-01 00:00:00','','自动草稿','','auto-draft','closed','closed','','','','','2020-02-21 20:09:33','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=76',0,'page','',0);
INSERT INTO `wp_posts` VALUES (77,1,'2020-02-21 20:10:52','2020-02-21 12:10:52','{\n    "sidebars_widgets[sidebar]": {\n        "value": [\n            "minty_recentposts-3",\n            "categories-5",\n            "recent-comments-4",\n            "archives-4",\n            "calendar-3"\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-21 12:10:52"\n    },\n    "widget_recent-comments[4]": {\n        "value": [],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2020-02-21 12:10:52"\n    }\n}','','','trash','closed','closed','','6bd40cb2-88f0-438f-979c-d322cc4c3725','','','2020-02-21 20:10:52','2020-02-21 12:10:52','',0,'http://zhuhouyu.xyz/2020/02/21/6bd40cb2-88f0-438f-979c-d322cc4c3725/',0,'customize_changeset','',0);
INSERT INTO `wp_posts` VALUES (78,1,'2020-02-21 20:13:56','1999-01-01 00:00:00','','自动草稿','','auto-draft','closed','closed','','','','','2020-02-21 20:13:56','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=78',0,'page','',0);
INSERT INTO `wp_posts` VALUES (79,1,'2020-02-21 21:09:53','2020-02-21 13:09:53','<!-- wp:html -->\n<!DOCTYPE>\n<html>\n  <head>\n    <title>宇后人生</title>\n    <meta charset="utf-8" />\n    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable = no" />\n    <meta name="keywords" content="宇后人生" />\n    <meta name="description" content="宇后人生博客" />\n    <link rel="stylesheet" href="main.css" />\n    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">\n    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">\n    <style>#lzxLrc{height:150px!important;}#lzxPlayer{bottom:160px!important;}.status{color: rgb(255, 255, 255)!important;}\n		  a{color:black;font-weight:bold;}</style>\n    <link rel="icon" href="favicon.png">\n  </head>\n  <body class="is-preload">\n    <div id="wrapper">\n      <div id="bg"></div>\n      <div id="overlay"></div>\n      <div id="main">\n        <!-- Header -->\n        <header id="header">\n          <h1 style="font-family: STXingkai;">宇后人生博客</h1>\n          <p style="font-size:large;font-weight:100; font-family: \'STXingkai\'">那些回不去的日子叫青春</p>\n          <nav>\n            <ul class="mom">\n              <li>\n                <a href="#" title="首页">首页</a></li>\n              <li>\n                <a href="" title="博客">博客</a></li>\n              <li>\n                <a href="http://zhuhouyu.xyz/about/" title="关于">关于</a></li>\n              <li>\n                <a href="#" title="留言板">留言板</a></li>\n            </ul>\n          </nav>\n          <br></header>\n        <!-- Footer -->\n        <footer id="footer">\n          </footer>\n      </div>\n    </div>\n    <script>window.onload = function() {\n      document.body.classList.remove(\'is-preload\');\n    }\n    window.ontouchmove = function() {\n      return fals\n    }\n    window.onorientationchange = function() {\n      document.body.scrollTop = 0;\n    }</script>\n    <!--音乐https://player.hexiongbiao.cn/-->\n    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>\n    <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>\n    <script id="ilt" src="https://player.hexiongbiao.cn/player/js/player.js" key="26f843af891f420ea99201a8a2ce2ec9"></script>\n  </body>\n\n</html>\n<!-- /wp:html -->','','','trash','closed','closed','','__trashed','','','2020-02-21 21:09:53','2020-02-21 13:09:53','',0,'http://zhuhouyu.xyz/?page_id=79',0,'page','',0);
INSERT INTO `wp_posts` VALUES (81,1,'2020-02-21 20:53:02','2020-02-21 12:53:02','<!-- wp:html -->\n<!DOCTYPE>\n<html>\n  <head>\n    <title>宇后人生</title>\n    <meta charset="utf-8" />\n    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable = no" />\n    <meta name="keywords" content="宇后人生" />\n    <meta name="description" content="宇后人生博客" />\n    <link rel="stylesheet" href="main.css" />\n    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">\n    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">\n    <style>#lzxLrc{height:150px!important;}#lzxPlayer{bottom:160px!important;}.status{color: rgb(255, 255, 255)!important;}\n		  a{color:black;font-weight:bold;}</style>\n    <link rel="icon" href="favicon.png">\n  </head>\n  <body class="is-preload">\n    <div id="wrapper">\n      <div id="bg"></div>\n      <div id="overlay"></div>\n      <div id="main">\n        <!-- Header -->\n        <header id="header">\n          <h1 style="font-family: STXingkai;">宇后人生博客</h1>\n          <p style="font-size:large;font-weight:100; font-family: \'STXingkai\'">那些回不去的日子叫青春</p>\n          <nav>\n            <ul class="mom">\n              <li>\n                <a href="#" title="首页">首页</a></li>\n              <li>\n                <a href="" title="博客">博客</a></li>\n              <li>\n                <a href="http://zhuhouyu.xyz/about/" title="关于">关于</a></li>\n              <li>\n                <a href="#" title="留言板">留言板</a></li>\n            </ul>\n          </nav>\n          <br></header>\n        <!-- Footer -->\n        <footer id="footer">\n          </footer>\n      </div>\n    </div>\n    <script>window.onload = function() {\n      document.body.classList.remove(\'is-preload\');\n    }\n    window.ontouchmove = function() {\n      return fals\n    }\n    window.onorientationchange = function() {\n      document.body.scrollTop = 0;\n    }</script>\n    <!--音乐https://player.hexiongbiao.cn/-->\n    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>\n    <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>\n    <script id="ilt" src="https://player.hexiongbiao.cn/player/js/player.js" key="26f843af891f420ea99201a8a2ce2ec9"></script>\n  </body>\n\n</html>\n<!-- /wp:html -->','','','inherit','closed','closed','','79-revision-v1','','','2020-02-21 20:53:02','2020-02-21 12:53:02','',79,'http://zhuhouyu.xyz/2020/02/21/79-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (80,1,'2020-02-21 20:51:34','2020-02-21 12:51:34','<!-- wp:code -->\n<pre class="wp-block-code"><code>&lt;!DOCTYPE>\n&lt;html>\n  &lt;head>\n    &lt;title>宇后人生&lt;/title>\n    &lt;meta charset="utf-8" />\n    &lt;meta name="viewport" content="width=device-width, initial-scale=1,user-scalable = no" />\n    &lt;meta name="keywords" content="宇后人生" />\n    &lt;meta name="description" content="宇后人生博客" />\n    &lt;link rel="stylesheet" href="main.css" />\n    &lt;link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">\n    &lt;link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">\n    &lt;style>#lzxLrc{height:150px!important;}#lzxPlayer{bottom:160px!important;}.status{color: rgb(255, 255, 255)!important;}\n		  a{color:black;font-weight:bold;}&lt;/style>\n    &lt;link rel="icon" href="favicon.png">\n  &lt;/head>\n  &lt;body class="is-preload">\n    &lt;div id="wrapper">\n      &lt;div id="bg">&lt;/div>\n      &lt;div id="overlay">&lt;/div>\n      &lt;div id="main">\n        &lt;!-- Header -->\n        &lt;header id="header">\n          &lt;h1 style="font-family: STXingkai;">宇后人生博客&lt;/h1>\n          &lt;p style="font-size:large;font-weight:100; font-family: \'STXingkai\'">那些回不去的日子叫青春&lt;/p>\n          &lt;nav>\n            &lt;ul class="mom">\n              &lt;li>\n                &lt;a href="#" title="首页">首页&lt;/a>&lt;/li>\n              &lt;li>\n                &lt;a href="" title="博客">博客&lt;/a>&lt;/li>\n              &lt;li>\n                &lt;a href="http://zhuhouyu.xyz/about/" title="关于">关于&lt;/a>&lt;/li>\n              &lt;li>\n                &lt;a href="#" title="留言板">留言板&lt;/a>&lt;/li>\n            &lt;/ul>\n          &lt;/nav>\n          &lt;br>&lt;/header>\n        &lt;!-- Footer -->\n        &lt;footer id="footer">\n          &lt;/footer>\n      &lt;/div>\n    &lt;/div>\n    &lt;script>window.onload = function() {\n      document.body.classList.remove(\'is-preload\');\n    }\n    window.ontouchmove = function() {\n      return fals\n    }\n    window.onorientationchange = function() {\n      document.body.scrollTop = 0;\n    }&lt;/script>\n    &lt;!--音乐https://player.hexiongbiao.cn/-->\n    &lt;script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js">&lt;/script>\n    &lt;script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js">&lt;/script>\n    &lt;script id="ilt" src="https://player.hexiongbiao.cn/player/js/player.js" key="26f843af891f420ea99201a8a2ce2ec9">&lt;/script>\n  &lt;/body>\n\n&lt;/html></code></pre>\n<!-- /wp:code -->','','','inherit','closed','closed','','79-revision-v1','','','2020-02-21 20:51:34','2020-02-21 12:51:34','',79,'http://zhuhouyu.xyz/2020/02/21/79-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (82,1,'2020-02-21 21:05:56','1999-01-01 00:00:00','','自动草稿','','auto-draft','closed','closed','','','','','2020-02-21 21:05:56','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=82',0,'page','',0);
INSERT INTO `wp_posts` VALUES (83,1,'2020-02-21 21:40:46','1999-01-01 00:00:00','','自动草稿','','auto-draft','closed','closed','','','','','2020-02-21 21:40:46','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=83',0,'page','',0);
INSERT INTO `wp_posts` VALUES (84,1,'2020-02-21 21:41:34','1999-01-01 00:00:00','','自动草稿','','auto-draft','closed','closed','','','','','2020-02-21 21:41:34','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=84',0,'page','',0);
INSERT INTO `wp_posts` VALUES (85,1,'2020-02-21 21:51:30','1999-01-01 00:00:00','','自动草稿','','auto-draft','closed','closed','','','','','2020-02-21 21:51:30','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?page_id=85',0,'page','',0);
INSERT INTO `wp_posts` VALUES (89,1,'2020-02-21 23:30:55','2020-02-21 15:30:55','','留言板','','inherit','closed','closed','','88-revision-v1','','','2020-02-21 23:30:55','2020-02-21 15:30:55','',88,'http://zhuhouyu.xyz/2020/02/21/88-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (88,1,'2020-02-21 23:31:07','2020-02-21 15:31:07','','留言板','','publish','open','closed','','guestbook','','','2020-02-21 23:34:21','2020-02-21 15:34:21','',0,'http://zhuhouyu.xyz/?page_id=88',0,'page','',0);
INSERT INTO `wp_posts` VALUES (92,1,'2020-02-21 23:34:37','2020-02-21 15:34:37',' ','','','publish','closed','closed','','92','','','2020-02-22 00:03:15','2020-02-21 16:03:15','',0,'http://zhuhouyu.xyz/?p=92',4,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (95,1,'2020-02-21 23:42:32','2020-02-21 15:42:32','','博客','','publish','closed','closed','','blog','','','2020-02-21 23:42:56','2020-02-21 15:42:56','',0,'http://zhuhouyu.xyz/?page_id=95',0,'page','',0);
INSERT INTO `wp_posts` VALUES (96,1,'2020-02-21 23:42:32','2020-02-21 15:42:32','','博客','','inherit','closed','closed','','95-revision-v1','','','2020-02-21 23:42:32','2020-02-21 15:42:32','',95,'http://zhuhouyu.xyz/2020/02/21/95-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (97,1,'2020-02-22 00:02:34','2020-02-21 16:02:34',' ','','','publish','closed','closed','','97','','','2020-02-22 00:03:15','2020-02-21 16:03:15','',0,'http://zhuhouyu.xyz/?p=97',1,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (98,1,'2020-02-22 00:02:34','2020-02-21 16:02:34',' ','','','publish','closed','closed','','98','','','2020-02-22 00:03:15','2020-02-21 16:03:15','',0,'http://zhuhouyu.xyz/?p=98',2,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (121,1,'2020-02-22 11:58:36','1999-01-01 00:00:00','','自动草稿','','auto-draft','open','open','','','','','2020-02-22 11:58:36','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?p=121',0,'post','',0);
INSERT INTO `wp_posts` VALUES (122,1,'2020-02-22 12:05:08','1999-01-01 00:00:00','','自动草稿','','auto-draft','open','open','','','','','2020-02-22 12:05:08','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?p=122',0,'post','',0);
INSERT INTO `wp_posts` VALUES (123,1,'2020-02-22 12:07:11','2020-02-22 04:07:11','<!-- wp:paragraph -->\n<p>2020-02-20:宇后人生博客V1.0（试水版)上线,修复部分已知bug；</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>2020-02-22:增加优化音乐播放器;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>2020-02-23:优化wordpress默认登陆注册模式；</p>\n<!-- /wp:paragraph -->','更新日志','','inherit','closed','closed','','106-revision-v1','','','2020-02-22 12:07:11','2020-02-22 04:07:11','',106,'http://zhuhouyu.xyz/106-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (124,1,'2020-02-22 12:07:11','2020-02-22 04:07:11','<!-- wp:paragraph -->\n<p>2020-02-20:宇后人生博客V1.0（试水版)上线,修复部分已知bug；</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>2020-02-22:增加优化音乐播放器;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>2020-02-23:优化wordpress默认登陆注册模式；</p>\n<!-- /wp:paragraph -->','更新日志','','inherit','closed','closed','','106-revision-v1','','','2020-02-22 12:07:11','2020-02-22 04:07:11','',106,'http://zhuhouyu.xyz/106-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (128,1,'2020-02-22 15:02:15','2020-02-22 07:02:15','<!-- wp:paragraph -->\n<p><strong>网站更新修复日志</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>2020-02-20:宇后人生博客V1.0（试水版)上线,修复部分已知bug；</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul><li>2020-02-22:增加音乐播放器功能,优化注册表单;</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul><li></li></ul>\n<!-- /wp:list -->','更新日志','网站更新修复日志','inherit','closed','closed','','106-revision-v1','','','2020-02-22 15:02:15','2020-02-22 07:02:15','',106,'http://zhuhouyu.xyz/106-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (125,1,'2020-02-22 12:10:06','2020-02-22 04:10:06','<!-- wp:paragraph -->\n<p><strong>网站更新修复日志</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>2020-02-20:宇后人生博客V1.0（试水版)上线,修复部分已知bug；</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul><li>2020-02-22:增加优化音乐播放器;</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul><li>2020-02-23:优化wordpress默认登陆注册模式；</li></ul>\n<!-- /wp:list -->','更新日志','网站更新修复日志','inherit','closed','closed','','106-revision-v1','','','2020-02-22 12:10:06','2020-02-22 04:10:06','',106,'http://zhuhouyu.xyz/106-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (102,1,'2020-02-22 01:04:35','2020-02-21 17:04:35','','mmqrcode1582304645192','','inherit','open','closed','','mmqrcode1582304645192','','','2020-02-22 01:04:35','2020-02-21 17:04:35','',53,'http://zhuhouyu.xyz/wp-content/uploads/2020/02/mmqrcode1582304645192.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (113,1,'2020-02-22 11:25:30','2020-02-22 03:25:30','<!-- wp:paragraph -->\n<p>宇后人生博客V1.0（试水版)上线啦~</p>\n<!-- /wp:paragraph -->','更新日志','','inherit','closed','closed','','106-revision-v1','','','2020-02-22 11:25:30','2020-02-22 03:25:30','',106,'http://zhuhouyu.xyz/106-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (116,1,'2020-02-22 11:32:27','2020-02-22 03:32:27','[xh_social_page_login]','Social - 登录','','inherit','closed','closed','','47-revision-v1','','','2020-02-22 11:32:27','2020-02-22 03:32:27','',47,'http://zhuhouyu.xyz/47-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (106,1,'2020-02-22 11:18:37','2020-02-22 03:18:37','<!-- wp:paragraph -->\n<p><strong>网站更新修复日志</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>2020-02-20:宇后人生博客V1.0（试水版)上线,修复部分已知bug；</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul><li>2020-02-22:增加音乐播放器功能,优化注册表单;</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul><li>2020-02-23:</li></ul>\n<!-- /wp:list -->','更新日志','网站更新修复日志','publish','open','open','','2020-02-22','','','2020-02-22 15:02:36','2020-02-22 07:02:36','',0,'http://zhuhouyu.xyz/?p=106',0,'post','',0);
INSERT INTO `wp_posts` VALUES (112,1,'2020-02-22 11:25:26','2020-02-22 03:25:26','<!-- wp:paragraph -->\n<p>宇后人生博客V1.0（试水版)上线啦~</p>\n<!-- /wp:paragraph -->','更新','','inherit','closed','closed','','106-revision-v1','','','2020-02-22 11:25:26','2020-02-22 03:25:26','',106,'http://zhuhouyu.xyz/106-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (108,1,'2020-02-22 11:18:37','2020-02-22 03:18:37','<!-- wp:paragraph -->\n<p>宇后人生博客V1.0（试水版)上线啦~</p>\n<!-- /wp:paragraph -->','2020-02-22','','inherit','closed','closed','','106-revision-v1','','','2020-02-22 11:18:37','2020-02-22 03:18:37','',106,'http://zhuhouyu.xyz/106-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (109,1,'2020-02-22 11:18:38','2020-02-22 03:18:38','<!-- wp:paragraph -->\n<p>宇后人生博客V1.0（试水版)上线啦~</p>\n<!-- /wp:paragraph -->','2020-02-22','','inherit','closed','closed','','106-revision-v1','','','2020-02-22 11:18:38','2020-02-22 03:18:38','',106,'http://zhuhouyu.xyz/106-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (114,1,'2020-02-22 11:32:27','2020-02-22 03:32:27','[xh_social_page_findpassword]','Social - 找回密码','','inherit','closed','closed','','49-revision-v1','','','2020-02-22 11:32:27','2020-02-22 03:32:27','',49,'http://zhuhouyu.xyz/49-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (111,1,'2020-02-22 11:23:27','2020-02-22 03:23:27','<!-- wp:heading -->\n<h2> 关于本站 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p> 本站主要用于记录和分享生活和学习过程中点点滴滴以及收获的心得。 </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>\n\n网站结构：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>前 端 ： wordpress的minty主题 </li><li>后 端 ： PHP7.3 + MySQL5.8 </li><li>后台 ：wordpress的后台管理</li><li>服务器：阿里云</li></ul>\n<!-- /wp:list -->\n\n<p><!--EndFragment-->个人网站新手上路技术有限，望大佬给予指点~</p>\n\n<!-- wp:heading -->\n<h2> 关于我 </h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>本人大四即将毕业，作为物联网专业的一名小白，大一大二都在玩耍，现在苦学苦练前端开发，所以有很多地方可能不到位，如发现BUG及时联系我哟~ </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>可以通过以下方式联系我：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>邮箱：971667935@qq.com</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>微信联系：</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"id":102,"width":288,"height":288,"sizeSlug":"large"} -->\n<figure class="wp-block-image size-large is-resized"><img src="http://zhuhouyu.xyz/wp-content/uploads/2020/02/mmqrcode1582304645192.jpg" alt="" class="wp-image-102" width="288" height="288"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading -->\n<h2>特别说明</h2>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul><li>本站所有内容仅代表个人观点，和任何组织或个人无关。</li><li>本站内容仅供学习交流，请勿用于任何形式商业行为。</li><li>对于本站原创文章，如需转载使用，请务必<code>注明</code>文章作者和来源.</li><li>本网站如无意中侵犯了某些组织或个人的知识产权，请来信或来电告之，本网站将立即予以删除。</li></ul>\n<!-- /wp:list -->','关于','','inherit','closed','closed','','53-revision-v1','','','2020-02-22 11:23:27','2020-02-22 03:23:27','',53,'http://zhuhouyu.xyz/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (126,1,'2020-02-22 12:10:06','2020-02-22 04:10:06','<!-- wp:paragraph -->\n<p><strong>网站更新修复日志</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>2020-02-20:宇后人生博客V1.0（试水版)上线,修复部分已知bug；</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul><li>2020-02-22:增加优化音乐播放器;</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul><li>2020-02-23:优化wordpress默认登陆注册模式；</li></ul>\n<!-- /wp:list -->','更新日志','网站更新修复日志','inherit','closed','closed','','106-revision-v1','','','2020-02-22 12:10:06','2020-02-22 04:10:06','',106,'http://zhuhouyu.xyz/106-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (127,1,'2020-02-22 14:54:39','2020-02-22 06:54:39','','267e0d8124f31b1a','','inherit','open','closed','','267e0d8124f31b1a','','','2020-02-22 14:54:39','2020-02-22 06:54:39','',0,'http://zhuhouyu.xyz/wp-content/uploads/2020/02/267e0d8124f31b1a.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (129,1,'2020-02-22 15:02:36','2020-02-22 07:02:36','<!-- wp:paragraph -->\n<p><strong>网站更新修复日志</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>2020-02-20:宇后人生博客V1.0（试水版)上线,修复部分已知bug；</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul><li>2020-02-22:增加音乐播放器功能,优化注册表单;</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul><li>2020-02-23:</li></ul>\n<!-- /wp:list -->','更新日志','网站更新修复日志','inherit','closed','closed','','106-revision-v1','','','2020-02-22 15:02:36','2020-02-22 07:02:36','',106,'http://zhuhouyu.xyz/106-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (130,1,'2020-02-22 15:02:47','1999-01-01 00:00:00','','自动草稿','','auto-draft','open','open','','','','','2020-02-22 15:02:47','1999-01-01 00:00:00','',0,'http://zhuhouyu.xyz/?p=130',0,'post','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (106,4,0);
INSERT INTO `wp_term_relationships` VALUES (99,2,0);
INSERT INTO `wp_term_relationships` VALUES (97,2,0);
INSERT INTO `wp_term_relationships` VALUES (118,1,0);
INSERT INTO `wp_term_relationships` VALUES (98,2,0);
INSERT INTO `wp_term_relationships` VALUES (92,2,0);
INSERT INTO `wp_term_relationships` VALUES (106,3,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (2,2,'nav_menu','',0,4);
INSERT INTO `wp_term_taxonomy` VALUES (3,3,'category','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (4,4,'post_format','',0,1);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
INSERT INTO `wp_termmeta` VALUES (1,1,'taxonomy_title','');
INSERT INTO `wp_termmeta` VALUES (2,1,'_taxonomy_title','field_5c00e9b1c9698');
INSERT INTO `wp_termmeta` VALUES (3,1,'taxonomy_keywords','');
INSERT INTO `wp_termmeta` VALUES (4,1,'_taxonomy_keywords','field_5c00eab1c9699');
INSERT INTO `wp_termmeta` VALUES (5,1,'taxonomy_desc','');
INSERT INTO `wp_termmeta` VALUES (6,1,'_taxonomy_desc','field_5c00eac1c969a');
INSERT INTO `wp_termmeta` VALUES (7,3,'taxonomy_title','更新日志');
INSERT INTO `wp_termmeta` VALUES (8,3,'_taxonomy_title','field_5c00e9b1c9698');
INSERT INTO `wp_termmeta` VALUES (9,3,'taxonomy_keywords','修复，更新');
INSERT INTO `wp_termmeta` VALUES (10,3,'_taxonomy_keywords','field_5c00eab1c9699');
INSERT INTO `wp_termmeta` VALUES (11,3,'taxonomy_desc','本页面主要是撰写更新修复日志');
INSERT INTO `wp_termmeta` VALUES (12,3,'_taxonomy_desc','field_5c00eac1c969a');
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'随笔','essay',0);
INSERT INTO `wp_terms` VALUES (2,'顶部菜单','%e9%a1%b6%e9%83%a8%e8%8f%9c%e5%8d%95',0);
INSERT INTO `wp_terms` VALUES (3,'更新日志','update',0);
INSERT INTO `wp_terms` VALUES (4,'post-format-aside','post-format-aside',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','admin');
INSERT INTO `wp_usermeta` VALUES (2,1,'first_name','');
INSERT INTO `wp_usermeta` VALUES (3,1,'last_name','');
INSERT INTO `wp_usermeta` VALUES (4,1,'description','');
INSERT INTO `wp_usermeta` VALUES (5,1,'rich_editing','true');
INSERT INTO `wp_usermeta` VALUES (6,1,'syntax_highlighting','true');
INSERT INTO `wp_usermeta` VALUES (7,1,'comment_shortcuts','false');
INSERT INTO `wp_usermeta` VALUES (8,1,'admin_color','fresh');
INSERT INTO `wp_usermeta` VALUES (9,1,'use_ssl','0');
INSERT INTO `wp_usermeta` VALUES (10,1,'show_admin_bar_front','true');
INSERT INTO `wp_usermeta` VALUES (11,1,'locale','');
INSERT INTO `wp_usermeta` VALUES (12,1,'wp_capabilities','a:1:{s:13:"administrator";b:1;}');
INSERT INTO `wp_usermeta` VALUES (13,1,'wp_user_level','10');
INSERT INTO `wp_usermeta` VALUES (14,1,'dismissed_wp_pointers','minty_options_pointer,theme_editor_notice,plugin_editor_notice');
INSERT INTO `wp_usermeta` VALUES (15,1,'show_welcome_panel','1');
INSERT INTO `wp_usermeta` VALUES (182,11,'use_ssl','0');
INSERT INTO `wp_usermeta` VALUES (90,1,'nav_menu_recently_edited','2');
INSERT INTO `wp_usermeta` VALUES (166,10,'comment_shortcuts','false');
INSERT INTO `wp_usermeta` VALUES (17,1,'wp_dashboard_quick_press_last_post_id','4');
INSERT INTO `wp_usermeta` VALUES (18,1,'community-events-location','a:1:{s:2:"ip";s:13:"139.189.221.0";}');
INSERT INTO `wp_usermeta` VALUES (21,1,'meta-box-order_dashboard','a:4:{s:6:"normal";s:38:"dashboard_right_now,dashboard_activity";s:4:"side";s:21:"dashboard_quick_press";s:7:"column3";s:17:"dashboard_primary";s:7:"column4";s:0:"";}');
INSERT INTO `wp_usermeta` VALUES (22,1,'wp_user-settings','mfold=o&libraryContent=browse');
INSERT INTO `wp_usermeta` VALUES (23,1,'wp_user-settings-time','1582214465');
INSERT INTO `wp_usermeta` VALUES (24,1,'managenav-menuscolumnshidden','a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}');
INSERT INTO `wp_usermeta` VALUES (25,1,'metaboxhidden_nav-menus','a:2:{i:0;s:12:"add-post_tag";i:1;s:15:"add-post_format";}');
INSERT INTO `wp_usermeta` VALUES (174,11,'nickname','zhuhouyu22');
INSERT INTO `wp_usermeta` VALUES (175,11,'first_name','');
INSERT INTO `wp_usermeta` VALUES (176,11,'last_name','');
INSERT INTO `wp_usermeta` VALUES (177,11,'description','');
INSERT INTO `wp_usermeta` VALUES (178,11,'rich_editing','true');
INSERT INTO `wp_usermeta` VALUES (179,11,'syntax_highlighting','true');
INSERT INTO `wp_usermeta` VALUES (180,11,'comment_shortcuts','false');
INSERT INTO `wp_usermeta` VALUES (70,1,'session_tokens','a:5:{s:64:"df9ced0af94cbfea55ec279e1077cc24999702adab4f396184ef8e127a7674bd";a:4:{s:10:"expiration";i:1582384301;s:2:"ip";s:14:"139.189.220.88";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";s:5:"login";i:1582211501;}s:64:"520e06eceb9b7f9ec5ea3d6241632720c8d3991a83dcdbae2d504caa24c56a78";a:4:{s:10:"expiration";i:1582389414;s:2:"ip";s:14:"139.189.220.88";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";s:5:"login";i:1582216614;}s:64:"ea1e27d04905feeb0d89baa4109426b89c87815698add1615d461092011fd59c";a:4:{s:10:"expiration";i:1582391065;s:2:"ip";s:14:"139.189.220.88";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";s:5:"login";i:1582218265;}s:64:"4eda0e8f621f4c894b7aad8b5f5b9513dea3f85854c2c7e8ab8a8df056b8f45a";a:4:{s:10:"expiration";i:1582526755;s:2:"ip";s:14:"139.189.220.88";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";s:5:"login";i:1582353955;}s:64:"4dc6a3af56f3eb94c3cdf62b60a8973a1f8cb13b3087b273d826f4d6488fb6bc";a:4:{s:10:"expiration";i:1582528815;s:2:"ip";s:15:"139.189.221.119";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";s:5:"login";i:1582356015;}}');
INSERT INTO `wp_usermeta` VALUES (181,11,'admin_color','fresh');
INSERT INTO `wp_usermeta` VALUES (173,10,'session_tokens','a:3:{s:64:"3adfb370ec022cac08d74fd50befed6aeb349983c8ea53f4e3c09f29e474b529";a:4:{s:10:"expiration";i:1582390858;s:2:"ip";s:14:"139.189.220.88";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";s:5:"login";i:1582218058;}s:64:"c35e93f7787737bf0e7ed95016504d391bf61d1f954e475a4acd26ce37d39460";a:4:{s:10:"expiration";i:1582390862;s:2:"ip";s:14:"139.189.220.88";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";s:5:"login";i:1582218062;}s:64:"d4ec95c1a71e16d9005537fe854f4f9c1738a25b78afe6388db17da362826208";a:4:{s:10:"expiration";i:1582390949;s:2:"ip";s:14:"139.189.220.88";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";s:5:"login";i:1582218149;}}');
INSERT INTO `wp_usermeta` VALUES (167,10,'admin_color','fresh');
INSERT INTO `wp_usermeta` VALUES (168,10,'use_ssl','0');
INSERT INTO `wp_usermeta` VALUES (169,10,'show_admin_bar_front','true');
INSERT INTO `wp_usermeta` VALUES (170,10,'locale','');
INSERT INTO `wp_usermeta` VALUES (171,10,'wp_capabilities','a:1:{s:10:"subscriber";b:1;}');
INSERT INTO `wp_usermeta` VALUES (172,10,'wp_user_level','0');
INSERT INTO `wp_usermeta` VALUES (183,11,'show_admin_bar_front','true');
INSERT INTO `wp_usermeta` VALUES (184,11,'locale','');
INSERT INTO `wp_usermeta` VALUES (185,11,'wp_capabilities','a:1:{s:10:"subscriber";b:1;}');
INSERT INTO `wp_usermeta` VALUES (186,11,'wp_user_level','0');
INSERT INTO `wp_usermeta` VALUES (187,11,'session_tokens','a:1:{s:64:"b216043ceb70f0066a28344289c84bd09a7e359e85c5771e96b1577d74246860";a:4:{s:10:"expiration";i:1582391429;s:2:"ip";s:14:"139.189.220.88";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";s:5:"login";i:1582218629;}}');
INSERT INTO `wp_usermeta` VALUES (188,1,'meta-box-order_page','a:4:{s:6:"normal";s:23:"acf-group_5bfa538e2d540";s:15:"acf_after_title";s:0:"";s:4:"side";s:0:"";s:8:"advanced";s:0:"";}');
INSERT INTO `wp_usermeta` VALUES (160,10,'nickname','zhuhouyu');
INSERT INTO `wp_usermeta` VALUES (161,10,'first_name','');
INSERT INTO `wp_usermeta` VALUES (162,10,'last_name','');
INSERT INTO `wp_usermeta` VALUES (163,10,'description','');
INSERT INTO `wp_usermeta` VALUES (164,10,'rich_editing','true');
INSERT INTO `wp_usermeta` VALUES (165,10,'syntax_highlighting','true');
INSERT INTO `wp_usermeta` VALUES (189,1,'closedpostboxes_page','a:2:{i:0;s:12:"postimagediv";i:1;s:23:"acf-group_5bfa538e2d540";}');
INSERT INTO `wp_usermeta` VALUES (190,1,'metaboxhidden_page','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (252,1,'wp_user_avatar','127');
INSERT INTO `wp_usermeta` VALUES (234,1,'closedpostboxes_post','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (235,1,'metaboxhidden_post','a:0:{}');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '1999-01-01 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'admin','$P$B97RuZ6a/z9zivO4SPMWLfqNTifWeK1','admin','971667935@qq.com','','2020-02-20 03:08:09','1582214102:$P$BXu9oqkie.7/DQy/8GqXICwmXui0PW1',0,'admin');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_xh_sessions`
--

DROP TABLE IF EXISTS `wp_xh_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_xh_sessions` (
  `session_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_key` char(32) NOT NULL,
  `session_value` longtext NOT NULL,
  `session_expiry` bigint(20) NOT NULL,
  PRIMARY KEY (`session_key`),
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_xh_sessions`
--

LOCK TABLES `wp_xh_sessions` WRITE;
/*!40000 ALTER TABLE `wp_xh_sessions` DISABLE KEYS */;
INSERT INTO `wp_xh_sessions` VALUES (56,'5edd9ed7227292e33eb648538c0b30d1','a:1:{s:14:"social_captcha";s:4:"dhr4";}',1582472238);
INSERT INTO `wp_xh_sessions` VALUES (54,'4d21cb89ad6f61d068206abe4c475d09','a:1:{s:25:"social_login_location_uri";s:20:"http://zhuhouyu.xyz/";}',1582485841);
INSERT INTO `wp_xh_sessions` VALUES (58,'8c4c2b6ae9fd88fd687f72691ec7a9db','a:3:{s:39:"noticeadminformsettings_wp_open_default";s:10:"4815815221";s:28:"social_login_email_last_send";s:9:"11@qq.com";s:14:"social_captcha";s:4:"ndvr";}',1582391187);
/*!40000 ALTER TABLE `wp_xh_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_xh_social_channel_qq`
--

DROP TABLE IF EXISTS `wp_xh_social_channel_qq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_xh_social_channel_qq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `openid` varchar(64) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `nickname` varchar(512) DEFAULT NULL,
  `gender` varchar(16) DEFAULT NULL,
  `province` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `img` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid_unique` (`openid`),
  UNIQUE KEY `user_id_unique` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_xh_social_channel_qq`
--

LOCK TABLES `wp_xh_social_channel_qq` WRITE;
/*!40000 ALTER TABLE `wp_xh_social_channel_qq` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_xh_social_channel_qq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_xh_social_channel_wechat`
--

DROP TABLE IF EXISTS `wp_xh_social_channel_wechat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_xh_social_channel_wechat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `op_openid` varchar(128) DEFAULT NULL,
  `mp_openid` varchar(128) DEFAULT NULL,
  `sp_openid` varchar(128) DEFAULT NULL,
  `unionid` varchar(128) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `nickname` varchar(512) DEFAULT NULL,
  `sex` varchar(16) DEFAULT NULL,
  `province` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `img` text,
  `uid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_unique` (`user_id`),
  UNIQUE KEY `op_openid_unique` (`op_openid`),
  UNIQUE KEY `mp_openid_unique` (`mp_openid`),
  UNIQUE KEY `sp_openid_unique` (`sp_openid`),
  UNIQUE KEY `unionid_unique` (`unionid`),
  UNIQUE KEY `uid_unique` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_xh_social_channel_wechat`
--

LOCK TABLES `wp_xh_social_channel_wechat` WRITE;
/*!40000 ALTER TABLE `wp_xh_social_channel_wechat` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_xh_social_channel_wechat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_xh_social_channel_weibo`
--

DROP TABLE IF EXISTS `wp_xh_social_channel_weibo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_xh_social_channel_weibo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `uid` varchar(64) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `nickname` varchar(512) DEFAULT NULL,
  `gender` varchar(16) DEFAULT NULL,
  `description` text,
  `profile_url` text,
  `location` text,
  `province` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `img` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_unique` (`uid`),
  UNIQUE KEY `user_id_unique` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_xh_social_channel_weibo`
--

LOCK TABLES `wp_xh_social_channel_weibo` WRITE;
/*!40000 ALTER TABLE `wp_xh_social_channel_weibo` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_xh_social_channel_weibo` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Sat, 22 Feb 2020 10:24:44 +0000
