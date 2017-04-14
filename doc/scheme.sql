-- Members
CREATE TABLE `Members` (
  `member_id` INT NOT NULL AUTO_INCREMENT,
  `user_code` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `phone` VARCHAR(45) NULL,

  PRIMARY KEY (`member_id`)
)
ENGINE = InnoDB;

-- Projects
CREATE TABLE `Projects` (
  `project_id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `description` MEDIUMTEXT NULL,

  PRIMARY KEY (`project_id`)
)
ENGINE = InnoDB;


-- ProjectMembers
CREATE TABLE `ProjectMembers` (
  `project_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  `role_id` INT NOT NULL,

  PRIMARY KEY (`project_id`, `member_id`),

  CONSTRAINT `fk_ProjectMembers_Projects1`
    FOREIGN KEY (`project_id`)
    REFERENCES `Projects` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProjectMembers_Members1`
    FOREIGN KEY (`member_id`)
    REFERENCES `Members` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- Posts
CREATE TABLE `Posts` (
  `post_id` INT NOT NULL AUTO_INCREMENT,
  `project_id` INT NOT NULL,
  `post_number` INT NOT NULL,
  `subject` VARCHAR(300) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `due_at` DATETIME NULL,

  PRIMARY KEY (`post_id`),

  CONSTRAINT `fk_Posts_Project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `Projects` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- PostUsers
CREATE TABLE `PostUsers` (
  `post_user_id` INT NOT NULL AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `project_id` INT NULL,
  `member_id` INT NULL,
  `post_user_type` TINYINT NOT NULL,
  `status` INT NULL,

  PRIMARY KEY (`post_user_id`),

  CONSTRAINT `PostUsers_Post`
    FOREIGN KEY (`post_id`)
    REFERENCES `Posts` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PostUsers_ProjectMembers1`
    FOREIGN KEY (`project_id` , `member_id`)
    REFERENCES `ProjectMembers` (`project_id` , `member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- PostDetails
CREATE TABLE `PostDetails` (
  `post_id` INT NOT NULL,
  `mime_type` VARCHAR(256) NULL,
  `content_id` BIGINT NULL,
  `version` INT NULL,

  PRIMARY KEY (`post_id`),

  CONSTRAINT `fk_PostDetails_Posts1`
    FOREIGN KEY (`post_id`)
    REFERENCES `Posts` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- Events
CREATE TABLE `Events` (
  `event_id` INT NOT NULL AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `modified_at` DATETIME NULL,
  `content` MEDIUMTEXT NULL,
  `mime_type` VARCHAR(256) NULL,
  `create_member_id` INT NOT NULL,

  PRIMARY KEY (`event_id`),

  CONSTRAINT `fk_Events_Posts1`
    FOREIGN KEY (`post_id`)
    REFERENCES `Posts` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Events_OrganizationMembers1`
    FOREIGN KEY (`create_member_id`)
    REFERENCES `Members` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;
