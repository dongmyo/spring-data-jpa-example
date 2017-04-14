INSERT INTO `Members`
(`user_code`,`name`,`email`,`phone`)
VALUES
('dongmyo','dongmyo','dongmyo@nhnent.com','010-1234-5678'),
('comtin','comtin','kyounghwan.lee@nhnent.com','010-1234-5679'),
('franky','franky','franky@nhnent.com','010-5678-0909'),
('buleung','buleung','byungboo.kim@nhnent.com','010-9999-9882');

INSERT INTO `Projects`
(`code`,`created_at`,`description`)
VALUES
('dooray','2017-04-11 12:25:21','dooray project'),
('nhnent','2017-04-11 12:25:37','nhnent project');

INSERT INTO `Posts`
(`project_id`,`post_number`,`subject`,`created_at`,`updated_at`,`due_at`)
VALUES
(1,1,'dooray open','2017-04-11 12:27:33','2017-04-11 12:27:33','2017-04-23 14:00:00'),
(2,1,'nhnent careers','2017-04-11 12:28:07','2017-04-11 12:28:07','2017-12-31 23:59:59'),
(1,2,'dooray 2','2017-04-11 12:28:32','2017-04-11 12:28:32','2017-09-30 18:30:00');

INSERT INTO `PostDetails`
VALUES
( 1, 'text/html', 1000, 0 ),
( 2, 'text/html', 2000, 11 ),
( 3, 'text/html', 3000, 13 );

INSERT INTO `ProjectMembers` VALUES
(1,1,1),
(1,3,3),
(2,1,1),
(2,2,2);

INSERT INTO `PostUsers`
(`post_id`,`project_id`,`member_id`,`post_user_type`,`status`)
VALUES
(1,1,1,4,NULL),
(1,1,3,1,1),
(2,2,1,4,NULL),
(2,2,2,1,2),
(2,2,1,2,NULL);

INSERT INTO `Events`
(`post_id`,`created_at`,`modified_at`,`content`,`mime_type`,`create_member_id`)
VALUES
(1,now(),now(),'comment #1','text/html',3),
(1,now(),now(),'comment #2','text/html',4),
(3,now(),now(),'dooray~!!!','text/html',1);
