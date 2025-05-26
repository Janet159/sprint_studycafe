
-- ✅ board용 타입 삽입
INSERT INTO type (type_kbn, type_name) VALUES
('board', '이용문의'),
('board', '결제문의'),
('board', '기타문의');

-- ✅ service용 타입 삽입
INSERT INTO type (type_kbn, type_name) VALUES
('service', '시설'),
('service', '식음료'),
('service', '사무용품'),
('service', '기타');

INSERT INTO service (type_no, service_id, location) VALUES
(4, '스터디룸', '1층 101호'),
(4, '회의실', '2층 202호'),
(5, '커피머신', '1층 입구'),
(6, '프린터', '2층 복도'),
(7, '기타비품보관함', '3층 구석진 공간');

insert into ticket values
('1',	'1시간', '2000'	,'1'),
('2',	'2시간', '4000'	,'2'),
('3',	'4시간', '7000'	,'4'),
('4',	'6시간', '9000'	,'6');

insert into users values
('admin',	'123456',	'관리자',	'test@nate.com',	'1',	'2025-05-23 10:03:23'),
('test	','123456',	'테스터',	'test@nate.com',	'0',	'2025-05-23 10:04:02');

insert into seats VALUES
(1, 'A-01', 1),
(2, 'A-02', 1),
(3, 'A-03', 1),
(4, 'A-04', 1),
(5, 'B-01', 1),
(6, 'B-02', 1),
(7, 'B-03', 1),
(8, 'B-04', 1),
(9, 'C-01', 1),
(10, 'C-02', 1),
(11, 'C-03', 1),
(12, 'C-04', 1),
(13, 'D-01', 1),
(14, 'D-02', 1),
(15, 'D-03', 1),
(16, 'D-04', 1),
(17, 'D-05', 0);

insert into reservation (user_id, seat_id, ticket_id, order_time, start_time, end_time)
values ('admin'	,'1'	,'1'	,'2025-05-23 10:05:10',	'2025-05-23 10:23:00',	'2025-08-23 11:30:00')
