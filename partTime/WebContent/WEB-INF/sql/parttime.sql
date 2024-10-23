ALTER TABLE commute
	DROP
		CONSTRAINT FK_register_TO_commute
		CASCADE;

ALTER TABLE commute
	DROP
		CONSTRAINT FK_employ_TO_commute
		CASCADE;

ALTER TABLE register
	DROP
		CONSTRAINT FK_positiontype_TO_register
		CASCADE;

ALTER TABLE schedule
	DROP
		CONSTRAINT FK_register_TO_schedule
		CASCADE;

ALTER TABLE schedule
	DROP
		CONSTRAINT FK_employ_TO_schedule
		CASCADE;

ALTER TABLE employ
	DROP
		CONSTRAINT FK_register_TO_employ
		CASCADE;

ALTER TABLE resume
	DROP
		CONSTRAINT FK_register_TO_resume
		CASCADE;

ALTER TABLE commute
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE register
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE company
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE schedule
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE positiontype
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE employ
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE resume
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* 출퇴근 */
DROP TABLE commute 
	CASCADE CONSTRAINTS;

/* 회원가입 */
DROP TABLE register 
	CASCADE CONSTRAINTS;

/* 기업 */
DROP TABLE company 
	CASCADE CONSTRAINTS;

/* 스케줄관리 */
DROP TABLE schedule 
	CASCADE CONSTRAINTS;

/* 직책유형 */
DROP TABLE positiontype 
	CASCADE CONSTRAINTS;

/* 고용 */
DROP TABLE employ 
	CASCADE CONSTRAINTS;

/* 알바 이력 */
DROP TABLE resume 
	CASCADE CONSTRAINTS;

/* 출퇴근 */
CREATE TABLE commute (
	commute_num NUMBER NOT NULL, /* 출퇴근번호 */
	ceo_id VARCHAR2(50) NOT NULL, /* 기업 아이디 */
	work_id VARCHAR2(50) NOT NULL, /* 고용자 아이디 */
	staff_number VARCHAR2(100) NOT NULL, /* 사원번호 */
	reg_num NUMBER NOT NULL, /* 번호 */
	type_num NUMBER NOT NULL, /* 분류 */
	workIn TIMESTAMP, /* 출근시간 */
	workOut TIMESTAMP, /* 퇴근시간 */
	restTime_start TIMESTAMP, /* 휴게시작시간 */
	restTime_end TIMESTAMP, /* 휴게끝시간 */
	workTime1 NUMBER, /* 1주차 근무시간 */
	workTime2 NUMBER, /* 2주차 근무시간 */
	workTime3 NUMBER, /* 3주차 근무시간 */
	workTime4 NUMBER, /* 4주차 근무시간 */
	workTime5 NUMBER, /* 5주차 근무시간 */
	workTime NUMBER, /* 총 근무시간 */
	holiday_pay NUMBER, /* 주휴수당 */
	etc NUMBER, /* 기타급여 */
	pay1 NUMBER, /* 1주차 급여 */
	pay2 NUMBER, /* 2주차 급여 */
	pay3 NUMBER, /* 3주차 급여 */
	pay4 NUMBER, /* 4주차 급여 */
	pay5 NUMBER, /* 5주차 급여 */
	pay NUMBER /* 총 급여 */
);

ALTER TABLE commute
	ADD
		CONSTRAINT PK_commute
		PRIMARY KEY (
			commute_num,
			ceo_id,
			work_id,
			staff_number,
			reg_num,
			type_num
		);

/* 회원가입 */
CREATE TABLE register (
	reg_num NUMBER NOT NULL, /* 번호 */
	type_num NUMBER NOT NULL, /* 분류 */
	name VARCHAR2(30), /* 이름/대표자이름 */
	id VARCHAR2(30), /* 아이디 */
	pwd VARCHAR2(50), /* 비밀번호 */
	jobNum VARCHAR2(50), /* 사업자등록번호 */
	email VARCHAR(50), /* 이메일 */
	tel VARCHAR2(30), /* 전화번호 */
	phoneNum VARCHAR2(30), /* 대표자 전화번호 */
	birth VARCHAR2(30), /* 생년월일 */
	birthNum VARCHAR2(30), /* 주민번호 */
	add1 VARCHAR2(100), /* 주소 */
	add2 VARCHAR2(100), /* 상세주소 */
	reg_date DATE /* 가입일 */
);

ALTER TABLE register
	ADD
		CONSTRAINT PK_register
		PRIMARY KEY (
			reg_num,
			type_num
		);

/* 기업 */
CREATE TABLE company (
	com_order NUMBER, /* 번호 */
	ceo_id VARCHAR2(50) NOT NULL, /* 기업 아이디 */
	ceo_qr varchar2(2000) /* QR코드 */
);

ALTER TABLE company
	ADD
		CONSTRAINT PK_company
		PRIMARY KEY (
			ceo_id
		);

/* 스케줄관리 */
CREATE TABLE schedule (
	schedule_num NUMBER NOT NULL, /* 스케줄 관리 번호 */
	ceo_id VARCHAR2(50) NOT NULL, /* 기업 아이디 */
	work_id VARCHAR2(50) NOT NULL, /* 고용자 아이디 */
	staff_number VARCHAR2(100) NOT NULL, /* 사원번호 */
	reg_num NUMBER NOT NULL, /* 번호 */
	type_num NUMBER NOT NULL, /* 분류 */
	name VARCHAR(20), /* 이름 */
	sch_workDate DATE, /* 근무날짜 */
	sch_workTime TIMESTAMP, /* 근무시간 */
	sch_workEndTime TIMESTAMP, /* 근무시간 끝 */
	sch_restTime VARCHAR2(50), /* 휴게시간 */
	color VARCHAR(20), /* 일정색상 */
	memo VARCHAR2(2000), /* 메모 */
	restDate NUMBER /* 휴무유무 */
);

ALTER TABLE schedule
	ADD
		CONSTRAINT PK_schedule
		PRIMARY KEY (
			schedule_num,
			ceo_id,
			work_id,
			staff_number,
			reg_num,
			type_num
		);

/* 직책유형 */
CREATE TABLE positiontype (
	type_num NUMBER NOT NULL, /* 분류 */
	type_name VARCHAR2(30) NOT NULL /* 분류이름 */
);

ALTER TABLE positiontype
	ADD
		CONSTRAINT PK_positiontype
		PRIMARY KEY (
			type_num
		);

/* 고용 */
CREATE TABLE employ (
	reg_num NUMBER NOT NULL, /* 번호 */
	em_num NUMBER, /* 순번 */
	type_num NUMBER NOT NULL, /* 분류 */
	staff_number VARCHAR2(100) NOT NULL, /* 사원번호 */
	ceo_id VARCHAR2(50) NOT NULL, /* 기업 아이디 */
	work_id VARCHAR2(50) NOT NULL, /* 고용자 아이디 */
	hourWage NUMBER, /* 시급 */
	employ_date DATE, /* 입사일 */
	insurance NUMBER, /* 4대보험유무 */
	exp_periodStart DATE, /* 수습기간 시작 */
	exp_periodEnd DATE /* 수습기간 끝 */
);

ALTER TABLE employ
	ADD
		CONSTRAINT PK_employ
		PRIMARY KEY (
			reg_num,
			type_num,
			staff_number,
			ceo_id,
			work_id
		);

/* 알바 이력 */
CREATE TABLE resume (
	history_num NUMBER NOT NULL, /* 이력 번호 */
	type_num NUMBER NOT NULL, /* 분류 */
	reg_num NUMBER NOT NULL, /* 번호 */
	comName varchar2(50), /* 직장명 */
	comAdd VARCHAR2(100), /* 직장주소 */
	todo VARCHAR(60), /* 직무 */
	past_join_date DATE, /* 입사일 */
	past_leaveDate DATE /* 퇴사일 */
);

ALTER TABLE resume
	ADD
		CONSTRAINT PK_resume
		PRIMARY KEY (
			history_num,
			type_num,
			reg_num
		);

ALTER TABLE commute
	ADD
		CONSTRAINT FK_register_TO_commute
		FOREIGN KEY (
			reg_num,
			type_num
		)
		REFERENCES register (
			reg_num,
			type_num
		);

ALTER TABLE commute
	ADD
		CONSTRAINT FK_employ_TO_commute
		FOREIGN KEY (
			reg_num,
			type_num,
			staff_number,
			ceo_id,
			work_id
		)
		REFERENCES employ (
			reg_num,
			type_num,
			staff_number,
			ceo_id,
			work_id
		);

ALTER TABLE register
	ADD
		CONSTRAINT FK_positiontype_TO_register
		FOREIGN KEY (
			type_num
		)
		REFERENCES positiontype (
			type_num
		);

ALTER TABLE schedule
	ADD
		CONSTRAINT FK_register_TO_schedule
		FOREIGN KEY (
			reg_num,
			type_num
		)
		REFERENCES register (
			reg_num,
			type_num
		);

ALTER TABLE schedule
	ADD
		CONSTRAINT FK_employ_TO_schedule
		FOREIGN KEY (
			reg_num,
			type_num,
			staff_number,
			ceo_id,
			work_id
		)
		REFERENCES employ (
			reg_num,
			type_num,
			staff_number,
			ceo_id,
			work_id
		);

ALTER TABLE employ
	ADD
		CONSTRAINT FK_register_TO_employ
		FOREIGN KEY (
			reg_num,
			type_num
		)
		REFERENCES register (
			reg_num,
			type_num
		);

ALTER TABLE resume
	ADD
		CONSTRAINT FK_register_TO_resume
		FOREIGN KEY (
			reg_num,
			type_num
		)
		REFERENCES register (
			reg_num,
			type_num
		);
        
        
-----------------

commit;

CREATE SEQUENCE register_seq start with 1 increment by 1 minvalue 1;  --sequence 생성
CREATE SEQUENCE employ_seq start with 1 increment by 1 minvalue 1; 
CREATE SEQUENCE commute_seq start with 1 increment by 1 minvalue 1; 
CREATE SEQUENCE company_seq start with 1 increment by 1 minvalue 1; 
CREATE SEQUENCE schedule_num_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE resume_seq start with 1 increment by 1 minvalue 1; 

insert into positiontype values (1, '개인회원');    -- positiontype insert into
insert into positiontype values (2, '기업회원');

insert into register values(register_seq.NEXTVAL, 2, '관리자a', 'admina', '1234', '123456789-123453', 'admina@email.com', '053-234-4839', '010-5345-4837',
'851223', NULL, '대구 수성구 고모로 31', '앞', TO_DATE(SYSDATE, 'YYYY-MM-DD') ); -- SYSDATE는 오늘 날짜 기입할때 사용 / register insert into 관리자
insert into register values(register_seq.NEXTVAL, 1, 'aaa', 'aaa','aaa', NULL, 'aaa@email.com', '010-3927-5843', NULL, --register insert into 직원 aaa
'020418', '020418-4283823', '대구 중구 경상감영길 2', '길', TO_DATE('2024-08-10', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'bbb', 'bbb','bbb', NULL, 'bbb@email.com', '010-7346-2243', NULL,
'010924', '010924-4386132', '대구 동구 동촌로 46-9', '뒤', TO_DATE('2024-08-10', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'ccc', 'ccc','ccc', NULL, 'ccc@email.com', '010-9482-4810', NULL,
'000722', '000722-3214207', '대구 달성군 구지면 가천1길 43', '옆', TO_DATE('2024-08-10', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'ddd', 'ddd','ddd', NULL, 'ddd@email.com', '010-1284-3264', NULL,
'970320', '970320-3940291', '대구 군위군 의흥면 가지골길 34-9', '위', TO_DATE('2024-08-11', 'YYYY-MM-DD') );

insert into register values(register_seq.NEXTVAL, 2, '관리자b', 'adminb', '1234', '4930284-12382453', 'adminb@email.com', '02-482-3954', '010-3843-4920',
'901209', NULL, '서울 종로구 북촌로 31-6', '앞', TO_DATE('2024-08-11', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'eee', 'eee','eee', NULL, 'eee@email.com', '010-9382-5839', NULL,
'990328', '990328-1837242', '서울 강남구 가로수길 5', '길', TO_DATE('2024-08-11', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'fff', 'fff','fff', NULL, 'fff@email.com', '010-4829-2910', NULL,
'000823', '000823-4289370', '서울 은평구 갈현로 181', '뒤', TO_DATE('2024-08-11', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'ggg', 'ggg','ggg', NULL, 'ggg@email.com', '010-4189-1242', NULL,
'980204', '980204-1327483', '서울 동대문구 서울시립대로 5', '옆', TO_DATE('2024-08-12', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'hhh', 'hhh','hhh', NULL, 'hhh@email.com', '010-6434-5628', NULL,
'970826', '970826-2324644', '경기 부천시 소사구 경인로 4', '위', TO_DATE('2024-08-12', 'YYYY-MM-DD') );

insert into register values(register_seq.NEXTVAL, 2, '관리자c', 'adminc', '1234', '152-42-57532', 'adminc@email.com', '053-248-4216', '010-3843-4920',
'870530', NULL, '대구광역시 달서구 공원순환로 46', '양옆', TO_DATE('2024-08-16', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 2, '관리자d', 'admind', '1234', '694-24-74512', 'admind@email.com', '051-546-7521', '010-2547-6315',
'691205', NULL, '부산광역시 부산진구 월드컵대로 462', '앞', TO_DATE('2024-08-17', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 2, '관리자e', 'admine', '1234', '367-12-85126', 'admine@email.com', '053-758-1265', '010-7412-5125',
'751103', NULL, '대구광역시 수성구 수성로 213', '뒤뒤', TO_DATE('2024-08-19', 'YYYY-MM-DD') );

insert into register values(register_seq.NEXTVAL, 1, 'iii', 'iii','iii', NULL, 'aaa@email.com', '010-3392-3432', NULL, 
'990318', '990318-1352809', '대구 중구 경상감영길 2', '뒤', TO_DATE('2024-08-10', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'jjj', 'jjj','jjj', NULL, 'jjj@email.com', '010-3251-7635', NULL, 
'000318', '000318-4725621', '대구 중구 경상감영길 3', '위', TO_DATE('2024-08-10', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'kkk', 'kkk','kkk', NULL, 'kkk@email.com', '010-6434-5629', NULL,
'990826', '990826-2324644', '경기 부천시 소사구 경인로 8', '위', TO_DATE('2024-08-14', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, '엘엘엘', 'lll','lll', NULL, 'lll@email.com', '010-1572-9527', NULL,
'000520', '000520-4158753', '대구 중구 달구벌대로447길 ', '길', TO_DATE('2024-08-15', 'YYYY-MM-DD') );

insert into register values(register_seq.NEXTVAL, 1, '엠엠엠', 'mmm','mmm', NULL, 'mmm@email.com', '010-1572-9527', NULL,
'000520', '000520-4158753', '대구 중구 달구벌대로447길 ', '길', TO_DATE('2024-08-15', 'YYYY-MM-DD') );


select * from register;


insert into employ values(142,  employ_seq.nextval, 1,  '001', 'admina', 'aaa', NULL, TO_DATE('2024-08-11', 'YYYY-MM-DD' ), 1,TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-11-10', 'YYYY-MM-DD' ) ); --employ insert into
insert into employ values(143, employ_seq.nextval, 1, '002', 'admina', 'bbb', NULL, TO_DATE('2024-08-11', 'YYYY-MM-DD' ), 1, TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-11-10', 'YYYY-MM-DD' ) );
insert into employ values(144, employ_seq.nextval, 1, '003', 'admina', 'ccc', NULL, TO_DATE('2024-08-11', 'YYYY-MM-DD' ), 1, TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-11-10', 'YYYY-MM-DD' ) );
insert into employ values(145, employ_seq.nextval, 1, '004', 'admina', 'ddd', NULL, TO_DATE('2024-08-12', 'YYYY-MM-DD' ), 1, TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-11-11', 'YYYY-MM-DD' ) );
insert into employ values(151, employ_seq.nextval, 1, '005', 'admina', 'iii', NULL, TO_DATE('2024-08-13', 'YYYY-MM-DD' ), 0, TO_DATE('2024-08-13', 'YYYY-MM-DD' ), TO_DATE('2024-11-12', 'YYYY-MM-DD' ) );
insert into employ values(153, employ_seq.nextval, 1, '006', 'admina', 'kkk', NULL, TO_DATE('2024-08-13', 'YYYY-MM-DD' ), 1, TO_DATE('2024-08-13', 'YYYY-MM-DD' ), TO_DATE('2024-11-12', 'YYYY-MM-DD' ) );

insert into employ values(147, employ_seq.nextval, 1, '0010', 'adminb', 'eee', NULL, TO_DATE('2024-08-11', 'YYYY-MM-DD' ), 1, TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-09-10', 'YYYY-MM-DD' ) );
insert into employ values(148, employ_seq.nextval, 1, '0020', 'adminb', 'fff',  NULL, TO_DATE('2024-08-12', 'YYYY-MM-DD' ), 1, TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-09-11', 'YYYY-MM-DD' ) );
insert into employ values(149, employ_seq.nextval, 1, '0030', 'adminb', 'ggg', NULL, TO_DATE('2024-08-12', 'YYYY-MM-DD' ), 0, TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-09-11', 'YYYY-MM-DD' ) );
insert into employ values(150, employ_seq.nextval, 1, '0040', 'adminb', 'hhh', NULL, TO_DATE('2024-08-14', 'YYYY-MM-DD' ), 1, TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-09-13', 'YYYY-MM-DD' ) );
insert into employ values(152, employ_seq.nextval, 1, '0050', 'admina', 'jjj', NULL, TO_DATE('2024-08-13', 'YYYY-MM-DD' ), 0, TO_DATE('2024-08-13', 'YYYY-MM-DD' ), TO_DATE('2024-11-12', 'YYYY-MM-DD' ) );


insert into commute values(commute_seq.NextVal, 'admina', 'aaa',  '001' ,142, 1, TO_TIMESTAMP('2024-08-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-11 14:00:00','YYYY-MM-DD HH24:MI:SS'), --commute insert into
NULL, NULL, NULL, 300, NULL, NULL, NULL, 300, NULL,  0, NULL, NULL, NULL, NULL, NULL, 49300 ); 
insert into commute values(commute_seq.NextVal, 'admina', 'bbb',  '002' ,143, 1, TO_TIMESTAMP('2024-08-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-11 14:00:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, NULL, NULL, 300, NULL, NULL, NULL, 300, NULL, 0, NULL, NULL, NULL, NULL, NULL, 49300 ); 
insert into commute values(commute_seq.NextVal, 'admina', 'ccc',  '003' ,144, 1, TO_TIMESTAMP('2024-08-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-11 14:00:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, NULL, NULL, 300, NULL, NULL, NULL, 300, NULL,  0, NULL, NULL, NULL, NULL, NULL, 49300 ); 
insert into commute values(commute_seq.NextVal, 'admina', 'ddd',  '004' ,145, 1, TO_TIMESTAMP('2024-08-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-11 14:00:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, NULL, NULL, 300, NULL, NULL, NULL, 300, NULL, 0, NULL, NULL, NULL, NULL, NULL, 49300 ); 

insert into commute values(commute_seq.NextVal, 'adminb', 'eee',  '0010' ,147, 1, TO_TIMESTAMP('2024-08-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-11 14:00:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, NULL, NULL, 300, NULL, NULL, NULL, 300, NULL, 0, NULL, NULL, NULL, NULL, NULL, 49300 ); 
insert into commute values(commute_seq.NextVal, 'adminb', 'fff',  '0020' ,148, 1, TO_TIMESTAMP('2024-08-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-11 14:00:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, NULL, NULL, 300, NULL, NULL, NULL, 300, NULL, 0, NULL, NULL, NULL, NULL, NULL, 49300 ); 
insert into commute values(commute_seq.NextVal, 'adminb', 'ggg',  '0030' ,149, 1, TO_TIMESTAMP('2024-08-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-11 14:00:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, NULL, NULL, 300, NULL, NULL, NULL, 300, NULL, 0, NULL, NULL, NULL, NULL, NULL, 49300 ); 
insert into commute values(commute_seq.NextVal, 'adminb', 'hhh',  '0040' ,150, 1, TO_TIMESTAMP('2024-08-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-11 14:00:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, NULL, NULL, 300, NULL, NULL, NULL, 300, NULL, 0, NULL, NULL, NULL, NULL, NULL, 49300 ); 


insert into company values(company_seq.NEXTVAL, 'admina', null); --insert into company
insert into company values(company_seq.NEXTVAL, 'adminb', null);



INSERT INTO resume VALUES (resume_seq.NEXTVAL, 1, 142, '맥도날드', '대구광역시 중구 공평동', '매니저', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-03-01', 'YYYY-MM-DD'));  --insert into resume
insert into resume values (resume_seq.NEXTVAL, 1, 142, '버거킹', '대구광역시 중구 공평동', '매니저', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-08-01', 'YYYY-MM-DD')); 
INSERT INTO resume VALUES(resume_seq.NEXTVAL, 1, 143, '삼성전자', '서울시 강남구 삼성동', '직원', TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'));
INSERT INTO resume VALUES(resume_seq.NEXTVAL, 1, 144, '애플', '서울시 강남구 서초동', '직원', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'));


insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'aaa', '001', 142 , 1 , 'aaa' ,TO_DATE('2024-08-01', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, 0);  --insert into schedule
 insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'aaa', '001', 142 , 1 , 'aaa' ,TO_DATE('2024-08-02', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, NULL);  
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'aaa', '001', 142 , 1 , 'aaa' ,TO_DATE('2024-08-03', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, NULL);  
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'aaa', '001', 142 , 1 , 'aaa' ,TO_DATE('2024-08-04', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, NULL);  
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'aaa', '001', 142 , 1 , 'aaa' ,TO_DATE('2024-08-05', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, NULL);  
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'aaa', '001', 142 , 1 , 'aaa' ,TO_DATE('2024-08-06', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, NULL);  
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'aaa', '001', 142 , 1 , 'aaa' ,TO_DATE('2024-08-07', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, NULL);  
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'aaa', '001', 142 , 1 , 'aaa' ,TO_DATE('2024-08-08', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, NULL);  
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'aaa', '001', 142 , 1 , 'aaa' ,TO_DATE('2024-08-09', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, NULL); 
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'aaa', '001', 142 , 1 , 'aaa' ,TO_DATE('2024-08-10', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, NULL); 
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'aaa', '001', 142 , 1 , 'aaa' ,TO_DATE('2024-08-11', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, NULL);  
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'aaa', '001', 142 , 1 , 'aaa' ,TO_DATE('2024-08-12', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, NULL); 
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'aaa', '001', 142 , 1 , 'aaa' ,TO_DATE('2024-08-14', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, NULL);  
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'aaa', '001', 142 , 1 , 'aaa' ,TO_DATE('2024-08-15', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, NULL);    


select * from register;
select * from employ;
select * from schedule;
select * from commute;
select * from resume;

commit;

alter table schedule drop column sch_workTime;  --데이터 타입 변경 위해 sch_workTime 컬럼 삭제
alter table schedule drop column sch_workEndTime;  --데이터 타입 변경 위해 sch_workEndTime 컬럼 삭제

alter table schedule add sch_workTime varchar2(200);  --sch_workTime 추가
alter table schedule add sch_workEndTime varchar2(200);  --sch_workEndTime 추가

commit;

select * from commute;

select * from schedule;
desc schedule;

 
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'bbb', '002', 143 , 1 , 'bbb' ,TO_DATE('2024-08-16', 'YYYY-MM-DD' ), null, 'blue', null, 1, '08:00', '15:00' );--insert into schedule
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'bbb', '002', 143 , 1 , 'bbb' ,TO_DATE('2024-08-17', 'YYYY-MM-DD' ), null, 'blue', null, 1, '08:00', '15:00' ); 
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'bbb', '002', 143 , 1 , 'bbb' ,TO_DATE('2024-08-18', 'YYYY-MM-DD' ), null, 'blue', null, 1, '08:00', '15:00' );
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'bbb', '002', 143 , 1 , 'bbb' ,TO_DATE('2024-08-19', 'YYYY-MM-DD' ), null, 'blue', null, 1, '08:00', '15:00' );
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'bbb', '002', 143 , 1 , 'bbb' ,TO_DATE('2024-08-20', 'YYYY-MM-DD' ), null, 'blue', null, 1, '08:00', '15:00' );
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'ddd', '004', 145 , 1 , 'ddd' ,TO_DATE('2024-08-16', 'YYYY-MM-DD' ), null, 'red', null, 1, '15:00', '20:00' );
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'ddd', '004', 145 , 1 , 'ddd' ,TO_DATE('2024-08-17', 'YYYY-MM-DD' ), null, 'red', null, 1, '15:00', '20:00' );
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'ddd', '004', 145 , 1 , 'ddd' ,TO_DATE('2024-08-18', 'YYYY-MM-DD' ), null, 'red', null, 1, '15:00', '20:00' );
insert into schedule values(schedule_seq.NEXTVAL,  'admina', 'ddd', '004', 145 , 1 , 'ddd' ,TO_DATE('2024-08-19', 'YYYY-MM-DD' ), null, 'red', null, 1, '15:00', '20:00' );


insert into commute values(commute_seq.NextVal, 'admina', 'bbb',  '002' ,143, 1, TO_TIMESTAMP('2024-08-16 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-16 15:00:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, NULL, NULL, 200, NULL, NULL, NULL, 200, NULL, 0, NULL, NULL, NULL, NULL, NULL, 45000 ); --insert into commute 0829


commit;    
