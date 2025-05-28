INSERT INTO type (type_kbn, type_name) VALUES
('board', '이용문의'),
('board', '결제문의'),
('board', '기타문의'),
('service', '시설'),
('service', '식음료'),
('service', '사무용품'),
('service', '기타'),
('notice', '이용공지'),
('notice', '결제공지'),
('notice', '공지');

INSERT INTO service (type_no, service_id, location) VALUES
(4 , '스터디룸', '1층 101호'),
(4 , '회의실', '2층 202호'),
(5 , '커피머신', '1층 입구'),
(6 , '프린터', '2층 복도'),
(7 , '기타비품보관함', '3층 구석진 공간');

insert into ticket values
('1',	'1시간', '2000'	,'1'),
('2',	'2시간', '4000'	,'2'),
('3',	'4시간', '7000'	,'4'),
('4',	'6시간', '9000'	,'6'),
('5',	'8시간', '10000'	,'8'),
('6',	'10시간', '12000','10');

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

insert into users values
('admin'	,'123456'	, '관리자', 'test@nate.com'		, true	,	CURRENT_TIMESTAMP),
('admin01'	,'admin'	, '주자영', 'admin01@test.com'	, true	,	CURRENT_TIMESTAMP),
('admin02'	,'admin'	, '장예지', 'admin02@test.com'	, true	,	CURRENT_TIMESTAMP),
('admin03'	,'admin'	, '이윤태', 'admin03@test.com'	, true	,	CURRENT_TIMESTAMP),
('test'		,'123456'	, '테스터', 'test@nate.com'		, false	,	CURRENT_TIMESTAMP);


insert into reservation (user_id, seat_id, ticket_id, order_time, start_time, end_time)
values ('admin'	,'1'	,'1'	,'2025-05-23 10:05:10',	'2025-05-23 10:23:00',	'2025-08-23 11:30:00')


INSERT INTO notice (admin_id, type_no, title, content) VALUES
('admin01', 8, '시설 점검 안내', '1층 스터디룸은 6월 1일 오전 9시부터 오후 1시까지 점검 예정입니다.'),
('admin02', 9, '결제 수단 변경 안내', '6월 10일부터 카카오페이 결제가 지원됩니다.'),
('admin03', 10, '6월 이벤트 공지 🎉', '6월 한달 간 좌석 예약 고객 대상 추첨 이벤트가 진행됩니다. 자세한 내용은 홈페이지 참조!'),
('admin01', 8, '이용시간 연장 안내', '스터디카페 운영 시간이 기존 밤 10시 → 자정 12시까지로 연장되었습니다.'),
('admin02', 9, '결제 오류 복구 안내', '5월 28일 발생한 카드 결제 오류가 복구되었습니다. 불편을 드려 죄송합니다.'),
('admin03', 10, '신규 좌석 A구역 오픈 안내', 'A-05 ~ A-08 좌석이 새롭게 추가되었습니다. 많은 이용 바랍니다.');
