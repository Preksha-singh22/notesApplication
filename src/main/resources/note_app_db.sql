
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


CREATE TABLE `login_details` (
  `login_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(15) DEFAULT NULL,
  `login_ind` tinyint(4) NOT NULL,
  `login_crdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login_sessionid` varchar(50) NOT NULL,
  `login_log` varchar(250) DEFAULT NULL,
  `login_act_userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `note_img` (
  `img_id` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  `img_name` varchar(50) DEFAULT NULL,
  `img_content` longblob NOT NULL,
  `img_url` varchar(100) NOT NULL,
  `img_crdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `img_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `img_ind` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `note_info` (
  `note_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_id` int(11) DEFAULT NULL,
  `note_ind` tinyint(4) NOT NULL,
  `note_title` varchar(150) NOT NULL,
  `note_description` longtext NOT NULL,
  `note_remainder` datetime DEFAULT NULL,
  `note_color` varchar(10) DEFAULT NULL,
  `note_crdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `note_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note_deldate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `note_resdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




CREATE TABLE `tag_details` (
  `tag_id` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tag_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `token_details` (
  `token_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(15) DEFAULT NULL,
  `token_ind` tinyint(4) NOT NULL,
  `token_crdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `token_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token_enddate` date DEFAULT NULL,
  `token_hash` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user_details` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `user_firstname` varchar(30) DEFAULT NULL,
  `user_lastname` varchar(30) DEFAULT NULL,
  `user_displayname` varchar(30) DEFAULT NULL,
  `user_mail` varchar(50) NOT NULL,
  `user_role` varchar(10) DEFAULT NULL,
  `user_gender` varchar(10) DEFAULT NULL,
  `user_dob` date DEFAULT NULL,
  `user_ind` tinyint(4) NOT NULL,
  `user_crdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `login_details`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `idx_login_id` (`login_id`),
  ADD KEY `fk_lg_usr_id` (`user_id`);

ALTER TABLE `note_img`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `idx_img_id` (`img_id`),
  ADD KEY `fk_img_note_id` (`note_id`);

ALTER TABLE `note_info`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `idx_note_id` (`note_id`),
  ADD KEY `fk_nt_usr_id` (`user_id`),
  ADD KEY `fk_nt_lgn_id` (`login_id`);


ALTER TABLE `tag_details`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `idx_tag_id` (`tag_id`),
  ADD KEY `fk_tag_usr_id` (`user_id`),
  ADD KEY `fk_tag_note_id` (`note_id`);


ALTER TABLE `token_details`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `idx_token_id` (`token_id`),
  ADD KEY `fk_tkn_usr_id` (`user_id`),
  ADD KEY `fk_tkn_usr_nm` (`user_name`);


ALTER TABLE `user_details`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_mail` (`user_mail`),
  ADD UNIQUE KEY `user_displayname` (`user_displayname`),
  ADD KEY `idx_user_id` (`user_id`);


ALTER TABLE `login_details`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1042;

ALTER TABLE `note_img`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

ALTER TABLE `note_info`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

ALTER TABLE `tag_details`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

ALTER TABLE `token_details`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

ALTER TABLE `user_details`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

ALTER TABLE `login_details`
  ADD CONSTRAINT `fk_lg_usr_id` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`);


ALTER TABLE `note_img`
  ADD CONSTRAINT `fk_img_note_id` FOREIGN KEY (`note_id`) REFERENCES `note_info` (`note_id`);


ALTER TABLE `note_info`
  ADD CONSTRAINT `fk_nt_lgn_id` FOREIGN KEY (`login_id`) REFERENCES `login_details` (`login_id`),
  ADD CONSTRAINT `fk_nt_usr_id` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`);


ALTER TABLE `tag_details`
  ADD CONSTRAINT `fk_tag_note_id` FOREIGN KEY (`note_id`) REFERENCES `note_info` (`note_id`),
  ADD CONSTRAINT `fk_tag_usr_id` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`);


ALTER TABLE `token_details`
  ADD CONSTRAINT `fk_tkn_usr_id` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`);
