create database if not exists aloha;
USE aloha;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS answer;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS notice;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS service;
DROP TABLE IF EXISTS ticket;
DROP TABLE IF EXISTS seats;
DROP TABLE IF EXISTS type;
DROP TABLE IF EXISTS users;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE IF NOT EXISTS `users` (
	`user_id`	VARCHAR(50)	NOT NULL	COMMENT '사용자아이디',
	`password`	VARCHAR(255)	NOT NULL	COMMENT '비밀번호',
	`name`	VARCHAR(100)	NOT NULL	COMMENT '이름',
	`email`	VARCHAR(100)	NOT NULL	COMMENT '이메일',
	`admin_kbn`	BOOLEAN	NOT NULL	DEFAULT FALSE	COMMENT '권한',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '가입날짜',
	PRIMARY KEY (`user_id`)
);


CREATE TABLE IF NOT EXISTS `seats` (
	`seat_id`	VARCHAR(10)	NOT NULL	COMMENT '좌석아이디',
	`seat_name`	VARCHAR(10)	NOT NULL	COMMENT '좌석명',
	`using_kbn`	BOOLEAN	NOT NULL	COMMENT '이용여부',
	PRIMARY KEY (`seat_id`)
);

CREATE TABLE IF NOT EXISTS `type` (
	`no`	BIGINT	NOT NULL	AUTO_INCREMENT	COMMENT '구분',
	`type_kbn`	VARCHAR(10)	NOT NULL	COMMENT '구분자',
	`type_name`	VARCHAR(100)	NOT NULL	COMMENT '구분명',
	PRIMARY KEY (`no`)
);

CREATE TABLE IF NOT EXISTS `ticket` (
	`ticket_id`	VARCHAR(10)	NOT NULL	COMMENT '티켓 아이디',
	`ticket_name`	VARCHAR(50)	NOT NULL	COMMENT '티켓 명',
	`price`	BIGINT	NOT NULL	COMMENT '가격',
	`ticket_time`	BIGINT	NOT NULL	COMMENT '이용권시간',
	PRIMARY KEY (`ticket_id`)
);

CREATE TABLE IF NOT EXISTS `notice` (
	`no`	BIGINT	NOT NULL	AUTO_INCREMENT	COMMENT '공지번호',
	`admin_id`	VARCHAR(50)	NOT NULL	COMMENT '사용자아이디',
	`type_no`	BIGINT	NOT NULL	COMMENT '구분',
	`title`	VARCHAR(100)	NOT NULL	COMMENT '제목',
	`content`	TEXT	NULL	COMMENT '내용',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '수정일자',
	PRIMARY KEY (`no`),
    FOREIGN KEY (`admin_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY (`type_no`) REFERENCES `type`(`no`)
);

CREATE TABLE IF NOT EXISTS `board` (
	`no`	BIGINT	NOT NULL	AUTO_INCREMENT	COMMENT '게시글번호',
	`user_id`	VARCHAR(50)	NOT NULL	COMMENT '사용자아이디',
	`type_no`	BIGINT	NOT NULL	COMMENT '구분',
	`title`	VARCHAR(100)	NOT NULL	COMMENT '제목',
	`content`	TEXT	NOT NULL	COMMENT '내용',
	`private_kbn`	BOOLEAN	NOT NULL	DEFAULT FALSE	COMMENT '공개여부',
	`phonenumber`	VARCHAR(11)	NOT NULL	COMMENT '전화번호',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '수정일자',
	`answered_kbn`	BOOLEAN	NOT NULL	DEFAULT FALSE	COMMENT '답변여부',
	PRIMARY KEY (`no`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY (`type_no`) REFERENCES `type`(`no`)
);

CREATE TABLE IF NOT EXISTS `answer` (
	`no`	BIGINT	NOT NULL	AUTO_INCREMENT	COMMENT '답변 번호',
	`board_no`	BIGINT	NOT NULL	COMMENT '게시글 번호',
	`admin_id`	VARCHAR(50)	NOT NULL	COMMENT '관리자아이디',
	`content`	TEXT	NULL	COMMENT '내용',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '수정일자',
	PRIMARY KEY (`no`),
    FOREIGN KEY (`board_no`) REFERENCES `board`(`no`),
    FOREIGN KEY (`admin_id`) REFERENCES `users`(`user_id`)
);


CREATE TABLE IF NOT EXISTS `reservation` (
	`no`	BIGINT	NOT NULL	AUTO_INCREMENT	COMMENT '내역 번호',
	`user_id`	VARCHAR(50)	NOT NULL	COMMENT '사용자아이디',
	`seat_id`	VARCHAR(10)	NOT NULL	COMMENT '좌석아이디',
	`ticket_id`	VARCHAR(50)	NOT NULL	COMMENT '티켓 아이디',
	`order_time`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '구매시간',
	`start_time`	TIMESTAMP	NOT NULL	COMMENT '시작시간',
	`end_time`	TIMESTAMP	NOT NULL	COMMENT '종료시간',
	PRIMARY KEY (`no`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY (`seat_id`) REFERENCES `seats`(`seat_id`),
	FOREIGN KEY (`ticket_id`) REFERENCES `ticket`(`ticket_id`)
);

CREATE TABLE IF NOT EXISTS `service` (
	`no`	BIGINT	NOT NULL	AUTO_INCREMENT	COMMENT '편의시설번호',
	`type_no`	BIGINT	NOT NULL	COMMENT '구분',
	`service_id`	VARCHAR(100)	NOT NULL	COMMENT '종류',
	`location`	VARCHAR(100)	NOT NULL	COMMENT '위치',
	PRIMARY KEY (`no`),
	FOREIGN KEY (`type_no`) REFERENCES `type`(`no`)
);

