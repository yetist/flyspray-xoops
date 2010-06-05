
CREATE TABLE `flyspray_admin_requests` (
  `request_id` int(5) NOT NULL AUTO_INCREMENT,
  `project_id` int(5) NOT NULL DEFAULT '0',
  `task_id` int(5) NOT NULL DEFAULT '0',
  `submitted_by` int(5) NOT NULL DEFAULT '0',
  `request_type` int(2) NOT NULL DEFAULT '0',
  `reason_given` text,
  `time_submitted` int(11) NOT NULL DEFAULT '0',
  `resolved_by` int(5) NOT NULL DEFAULT '0',
  `time_resolved` int(11) NOT NULL DEFAULT '0',
  `deny_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




CREATE TABLE `flyspray_assigned` (
  `assigned_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`assigned_id`),
  UNIQUE KEY `flyspray_task_user` (`task_id`,`user_id`),
  KEY `flyspray_task_id_assigned` (`task_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




CREATE TABLE `flyspray_attachments` (
  `attachment_id` int(5) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `comment_id` int(10) NOT NULL DEFAULT '0',
  `orig_name` varchar(255) NOT NULL,
  `file_name` varchar(30) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `file_size` int(20) NOT NULL DEFAULT '0',
  `added_by` int(3) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attachment_id`),
  KEY `flyspray_task_id_attachments` (`task_id`,`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




CREATE TABLE `flyspray_cache` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `type` varchar(4) NOT NULL,
  `content` longtext NOT NULL,
  `topic` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `max_items` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flyspray_cache_type` (`type`,`topic`,`project_id`,`max_items`),
  KEY `flyspray_cache_type_topic` (`type`,`topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




CREATE TABLE `flyspray_comments` (
  `comment_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `user_id` int(3) NOT NULL DEFAULT '0',
  `comment_text` text,
  `last_edited_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `flyspray_task_id_comments` (`task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




CREATE TABLE `flyspray_dependencies` (
  `depend_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `dep_task_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`depend_id`),
  UNIQUE KEY `flyspray_task_id_deps` (`task_id`,`dep_task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




CREATE TABLE `flyspray_groups` (
  `group_id` int(3) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(20) NOT NULL,
  `group_desc` varchar(150) NOT NULL,
  `project_id` int(3) NOT NULL DEFAULT '0',
  `is_admin` int(1) NOT NULL DEFAULT '0',
  `manage_project` int(1) NOT NULL DEFAULT '0',
  `view_tasks` int(1) NOT NULL DEFAULT '0',
  `open_new_tasks` int(1) NOT NULL DEFAULT '0',
  `modify_own_tasks` int(1) NOT NULL DEFAULT '0',
  `modify_all_tasks` int(1) NOT NULL DEFAULT '0',
  `view_comments` int(1) NOT NULL DEFAULT '0',
  `add_comments` int(1) NOT NULL DEFAULT '0',
  `edit_comments` int(1) NOT NULL DEFAULT '0',
  `edit_own_comments` int(1) NOT NULL DEFAULT '0',
  `delete_comments` int(1) NOT NULL DEFAULT '0',
  `create_attachments` int(1) NOT NULL DEFAULT '0',
  `delete_attachments` int(1) NOT NULL DEFAULT '0',
  `view_history` int(1) NOT NULL DEFAULT '0',
  `close_own_tasks` int(1) NOT NULL DEFAULT '0',
  `close_other_tasks` int(1) NOT NULL DEFAULT '0',
  `assign_to_self` int(1) NOT NULL DEFAULT '0',
  `assign_others_to_self` int(1) NOT NULL DEFAULT '0',
  `add_to_assignees` int(1) NOT NULL DEFAULT '0',
  `view_reports` int(1) NOT NULL DEFAULT '0',
  `add_votes` int(1) NOT NULL DEFAULT '0',
  `edit_assignments` int(1) NOT NULL DEFAULT '0',
  `show_as_assignees` int(1) NOT NULL DEFAULT '0',
  `group_open` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `flyspray_group_name` (`group_name`,`project_id`),
  KEY `flyspray_belongs_to_project` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


INSERT INTO `flyspray_groups` VALUES (1,'Admin','Members have unlimited access to all functionality.',0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1),(2,'Developers','Global Developers for all projects',0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1),(3,'Reporters','Open new tasks / add comments in all projects',0,0,0,1,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1),(4,'Basic','Members can login, relying upon Project permissions only',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1),(5,'Pending','Users who are awaiting approval of their accounts.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(6,'Project Managers','Permission to do anything related to the Default Project.',1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1);


CREATE TABLE `flyspray_history` (
  `history_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(3) NOT NULL DEFAULT '0',
  `event_date` int(11) NOT NULL DEFAULT '0',
  `event_type` int(2) NOT NULL DEFAULT '0',
  `field_changed` varchar(50) NOT NULL,
  `old_value` text,
  `new_value` text,
  PRIMARY KEY (`history_id`),
  KEY `flyspray_idx_task_id` (`task_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO `flyspray_history` VALUES (1,1,1,1130024797,1,'','','');


CREATE TABLE `flyspray_list_category` (
  `category_id` int(3) NOT NULL AUTO_INCREMENT,
  `project_id` int(3) NOT NULL DEFAULT '0',
  `category_name` varchar(30) NOT NULL,
  `show_in_list` int(1) NOT NULL DEFAULT '0',
  `category_owner` int(3) NOT NULL DEFAULT '0',
  `lft` int(10) unsigned NOT NULL DEFAULT '0',
  `rgt` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`),
  KEY `flyspray_project_id_cat` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


INSERT INTO `flyspray_list_category` VALUES (1,1,'Backend / Core',1,0,2,3),(2,0,'root',0,0,1,2),(3,1,'root',0,0,1,4);


CREATE TABLE `flyspray_list_os` (
  `os_id` int(3) NOT NULL AUTO_INCREMENT,
  `project_id` int(3) NOT NULL DEFAULT '0',
  `os_name` varchar(40) NOT NULL,
  `list_position` int(3) NOT NULL DEFAULT '0',
  `show_in_list` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`os_id`),
  KEY `flyspray_project_id_os` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


INSERT INTO `flyspray_list_os` VALUES (1,1,'All',1,1),(2,1,'Windows',2,1),(3,1,'Linux',3,1),(4,1,'Mac OS',4,1);


CREATE TABLE `flyspray_list_resolution` (
  `resolution_id` int(3) NOT NULL AUTO_INCREMENT,
  `resolution_name` varchar(30) NOT NULL,
  `list_position` int(3) NOT NULL DEFAULT '0',
  `show_in_list` int(1) NOT NULL DEFAULT '0',
  `project_id` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resolution_id`),
  KEY `flyspray_project_id_res` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


INSERT INTO `flyspray_list_resolution` VALUES (1,'Not a bug',1,1,0),(2,'Won\'t fix',2,1,0),(3,'Won\'t implement',3,1,0),(4,'Works for me',4,1,0),(5,'Deferred',5,1,0),(6,'Duplicate',6,1,0),(7,'Fixed',7,1,0),(8,'Implemented',8,1,0);


CREATE TABLE `flyspray_list_status` (
  `status_id` int(3) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(40) NOT NULL,
  `list_position` int(3) NOT NULL DEFAULT '0',
  `show_in_list` int(1) NOT NULL DEFAULT '0',
  `project_id` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`status_id`),
  KEY `flyspray_project_id_status` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


INSERT INTO `flyspray_list_status` VALUES (1,'Unconfirmed',1,1,0),(2,'New',2,1,0),(3,'Assigned',3,1,0),(4,'Researching',4,1,0),(5,'Waiting on Customer',5,1,0),(6,'Requires testing',6,1,0);


CREATE TABLE `flyspray_list_tasktype` (
  `tasktype_id` int(3) NOT NULL AUTO_INCREMENT,
  `tasktype_name` varchar(40) NOT NULL,
  `list_position` int(3) NOT NULL DEFAULT '0',
  `show_in_list` int(1) NOT NULL DEFAULT '0',
  `project_id` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tasktype_id`),
  KEY `flyspray_project_id_tt` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


INSERT INTO `flyspray_list_tasktype` VALUES (1,'Bug Report',1,1,0),(2,'Feature Request',2,1,0);


CREATE TABLE `flyspray_list_version` (
  `version_id` int(3) NOT NULL AUTO_INCREMENT,
  `project_id` int(3) NOT NULL DEFAULT '0',
  `version_name` varchar(40) NOT NULL,
  `list_position` int(3) NOT NULL DEFAULT '0',
  `show_in_list` int(1) NOT NULL DEFAULT '0',
  `version_tense` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version_id`),
  KEY `flyspray_project_id_version` (`project_id`,`version_tense`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO `flyspray_list_version` VALUES (1,1,'Development',1,1,2);


CREATE TABLE `flyspray_notification_messages` (
  `message_id` int(10) NOT NULL AUTO_INCREMENT,
  `message_subject` text,
  `message_body` text,
  `time_created` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




CREATE TABLE `flyspray_notification_recipients` (
  `recipient_id` int(10) NOT NULL AUTO_INCREMENT,
  `message_id` int(10) NOT NULL DEFAULT '0',
  `notify_method` varchar(1) NOT NULL,
  `notify_address` varchar(100) NOT NULL,
  PRIMARY KEY (`recipient_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




CREATE TABLE `flyspray_notifications` (
  `notify_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notify_id`),
  UNIQUE KEY `flyspray_task_id_notifs` (`task_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




CREATE TABLE `flyspray_prefs` (
  `pref_id` int(1) NOT NULL AUTO_INCREMENT,
  `pref_name` varchar(20) NOT NULL,
  `pref_value` varchar(250) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pref_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;


INSERT INTO `flyspray_prefs` VALUES (1,'fs_ver','0.9.9.6'),(2,'jabber_server',''),(3,'jabber_port','5222'),(4,'jabber_username',''),(5,'jabber_password',''),(6,'anon_group','4'),(7,'user_notify','1'),(8,'admin_email','flyspray@example.com'),(9,'lang_code','en'),(10,'spam_proof','1'),(11,'default_project','1'),(12,'dateformat',''),(13,'dateformat_extended',''),(14,'anon_reg','1'),(15,'global_theme','Bluey'),(16,'visible_columns','id project category tasktype severity summary status progress'),(17,'smtp_server',''),(18,'smtp_user',''),(19,'smtp_pass',''),(20,'page_title','Flyspray::'),(21,'notify_registration','0'),(22,'jabber_ssl','0'),(23,'last_update_check','0'),(24,'cache_feeds','1'),(25,'lock_for','5'),(26,'email_ssl','0'),(27,'email_tls','0');


CREATE TABLE `flyspray_projects` (
  `project_id` int(3) NOT NULL AUTO_INCREMENT,
  `project_title` varchar(100) NOT NULL,
  `theme_style` varchar(20) NOT NULL DEFAULT '0',
  `default_cat_owner` int(3) NOT NULL DEFAULT '0',
  `intro_message` text,
  `project_is_active` int(1) NOT NULL DEFAULT '0',
  `visible_columns` varchar(255) NOT NULL,
  `others_view` int(1) NOT NULL DEFAULT '0',
  `anon_open` int(1) NOT NULL DEFAULT '0',
  `notify_email` text,
  `notify_jabber` text,
  `notify_reply` text,
  `notify_types` varchar(100) NOT NULL DEFAULT '0',
  `feed_img_url` text,
  `feed_description` text,
  `notify_subject` varchar(100) NOT NULL DEFAULT '',
  `lang_code` varchar(10) NOT NULL,
  `comment_closed` int(1) NOT NULL DEFAULT '0',
  `auto_assign` int(1) NOT NULL DEFAULT '0',
  `last_updated` int(11) NOT NULL DEFAULT '0',
  `default_task` text,
  `default_entry` varchar(8) NOT NULL DEFAULT 'index',
  PRIMARY KEY (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO `flyspray_projects` VALUES (1,'Default Project','Bluey',0,'Welcome to your first Flyspray project!  We hope that Flyspray provides you with many hours of increased productivity.  If you have any issues, go to http://flyspray.org/support.                   You can customise this message by clicking the **Manage Project** link in the menu above...',1,'id category tasktype severity summary status progress',1,0,'','',NULL,'0',NULL,NULL,'','en',0,0,0,NULL,'index');


CREATE TABLE `flyspray_registrations` (
  `reg_id` int(10) NOT NULL AUTO_INCREMENT,
  `reg_time` int(11) NOT NULL DEFAULT '0',
  `confirm_code` varchar(20) NOT NULL,
  `user_name` varchar(32) NOT NULL,
  `real_name` varchar(100) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `jabber_id` varchar(100) NOT NULL,
  `notify_type` int(1) NOT NULL DEFAULT '0',
  `magic_url` varchar(40) NOT NULL,
  `time_zone` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




CREATE TABLE `flyspray_related` (
  `related_id` int(10) NOT NULL AUTO_INCREMENT,
  `this_task` int(10) NOT NULL DEFAULT '0',
  `related_task` int(10) NOT NULL DEFAULT '0',
  `is_duplicate` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`related_id`),
  UNIQUE KEY `flyspray_this_task` (`this_task`,`related_task`,`is_duplicate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




CREATE TABLE `flyspray_reminders` (
  `reminder_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL DEFAULT '0',
  `to_user_id` int(3) NOT NULL DEFAULT '0',
  `from_user_id` int(3) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `how_often` int(12) NOT NULL DEFAULT '0',
  `last_sent` int(11) NOT NULL DEFAULT '0',
  `reminder_message` text,
  PRIMARY KEY (`reminder_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




CREATE TABLE `flyspray_searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `search_string` text,
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




CREATE TABLE `flyspray_tasks` (
  `task_id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(3) NOT NULL DEFAULT '0',
  `task_type` int(3) NOT NULL DEFAULT '0',
  `date_opened` int(11) NOT NULL DEFAULT '0',
  `opened_by` int(3) NOT NULL DEFAULT '0',
  `is_closed` int(1) NOT NULL DEFAULT '0',
  `date_closed` int(11) NOT NULL DEFAULT '0',
  `closed_by` int(3) NOT NULL DEFAULT '0',
  `closure_comment` text,
  `item_summary` varchar(100) NOT NULL,
  `detailed_desc` text,
  `item_status` int(3) NOT NULL DEFAULT '0',
  `resolution_reason` int(3) NOT NULL DEFAULT '1',
  `product_category` int(3) NOT NULL DEFAULT '0',
  `product_version` int(3) NOT NULL DEFAULT '0',
  `closedby_version` int(3) NOT NULL DEFAULT '0',
  `operating_system` int(3) NOT NULL DEFAULT '0',
  `task_severity` int(3) NOT NULL DEFAULT '0',
  `task_priority` int(3) NOT NULL DEFAULT '0',
  `last_edited_by` int(3) NOT NULL DEFAULT '0',
  `last_edited_time` int(11) NOT NULL DEFAULT '0',
  `percent_complete` int(3) NOT NULL DEFAULT '0',
  `mark_private` int(1) NOT NULL DEFAULT '0',
  `due_date` int(11) NOT NULL DEFAULT '0',
  `anon_email` varchar(100) NOT NULL DEFAULT '',
  `task_token` varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`task_id`),
  KEY `flyspray_attached_to_project` (`project_id`),
  KEY `flyspray_task_severity` (`task_severity`),
  KEY `flyspray_task_type` (`task_type`),
  KEY `flyspray_product_category` (`product_category`),
  KEY `flyspray_item_status` (`item_status`),
  KEY `flyspray_is_closed` (`is_closed`),
  KEY `flyspray_closedby_version` (`closedby_version`),
  KEY `flyspray_due_date` (`due_date`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO `flyspray_tasks` VALUES (1,1,1,1130024797,1,0,0,0,' ','Sample Task','This isn\'t a real task.  You should close it and start opening some real tasks.',2,1,1,1,0,1,1,2,0,0,0,0,0,'','0');


CREATE TABLE `flyspray_users` (
  `user_id` int(3) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) NOT NULL,
  `user_pass` varchar(40) DEFAULT NULL,
  `real_name` varchar(100) NOT NULL,
  `jabber_id` varchar(100) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `notify_type` int(1) NOT NULL DEFAULT '0',
  `notify_own` int(6) NOT NULL DEFAULT '0',
  `account_enabled` int(1) NOT NULL DEFAULT '0',
  `dateformat` varchar(30) NOT NULL DEFAULT '',
  `dateformat_extended` varchar(30) NOT NULL DEFAULT '',
  `magic_url` varchar(40) NOT NULL DEFAULT '',
  `tasks_perpage` int(3) NOT NULL DEFAULT '0',
  `register_date` int(11) NOT NULL DEFAULT '0',
  `time_zone` int(6) NOT NULL DEFAULT '0',
  `login_attempts` int(11) NOT NULL DEFAULT '0',
  `lock_until` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `flyspray_user_name` (`user_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO `flyspray_users` VALUES (1,'super','1b3231655cebb7a1f783eddf27d254ca','Mr Super User','super@example.com','super@example.com',0,1,1,'','','25',0,0,0,0,0);


CREATE TABLE `flyspray_users_in_groups` (
  `record_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL DEFAULT '0',
  `group_id` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `flyspray_group_id_uig` (`group_id`,`user_id`),
  KEY `flyspray_user_id_uig` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO `flyspray_users_in_groups` VALUES (1,1,1);


CREATE TABLE `flyspray_votes` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `task_id` int(11) NOT NULL DEFAULT '0',
  `date_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`),
  KEY `flyspray_task_id_votes` (`task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



