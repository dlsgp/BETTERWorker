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

/* ����� */
DROP TABLE commute 
	CASCADE CONSTRAINTS;

/* ȸ������ */
DROP TABLE register 
	CASCADE CONSTRAINTS;

/* ��� */
DROP TABLE company 
	CASCADE CONSTRAINTS;

/* �����ٰ��� */
DROP TABLE schedule 
	CASCADE CONSTRAINTS;

/* ��å���� */
DROP TABLE positiontype 
	CASCADE CONSTRAINTS;

/* ��� */
DROP TABLE employ 
	CASCADE CONSTRAINTS;

/* �˹� �̷� */
DROP TABLE resume 
	CASCADE CONSTRAINTS;

/* ����� */
CREATE TABLE commute (
	commute_num NUMBER NOT NULL, /* ����ٹ�ȣ */
	ceo_id VARCHAR2(50) NOT NULL, /* ��� ���̵� */
	work_id VARCHAR2(50) NOT NULL, /* ����� ���̵� */
	staff_number VARCHAR2(100) NOT NULL, /* �����ȣ */
	reg_num NUMBER NOT NULL, /* ��ȣ */
	type_num NUMBER NOT NULL, /* �з� */
	workIn TIMESTAMP, /* ��ٽð� */
	workOut TIMESTAMP, /* ��ٽð� */
	restTime_start TIMESTAMP, /* �ްԽ��۽ð� */
	restTime_end TIMESTAMP, /* �ްԳ��ð� */
	workTime1 NUMBER, /* 1���� �ٹ��ð� */
	workTime2 NUMBER, /* 2���� �ٹ��ð� */
	workTime3 NUMBER, /* 3���� �ٹ��ð� */
	workTime4 NUMBER, /* 4���� �ٹ��ð� */
	workTime5 NUMBER, /* 5���� �ٹ��ð� */
	workTime NUMBER, /* �� �ٹ��ð� */
	holiday_pay NUMBER, /* ���޼��� */
	etc NUMBER, /* ��Ÿ�޿� */
	pay1 NUMBER, /* 1���� �޿� */
	pay2 NUMBER, /* 2���� �޿� */
	pay3 NUMBER, /* 3���� �޿� */
	pay4 NUMBER, /* 4���� �޿� */
	pay5 NUMBER, /* 5���� �޿� */
	pay NUMBER /* �� �޿� */
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

/* ȸ������ */
CREATE TABLE register (
	reg_num NUMBER NOT NULL, /* ��ȣ */
	type_num NUMBER NOT NULL, /* �з� */
	name VARCHAR2(30), /* �̸�/��ǥ���̸� */
	id VARCHAR2(30), /* ���̵� */
	pwd VARCHAR2(50), /* ��й�ȣ */
	jobNum VARCHAR2(50), /* ����ڵ�Ϲ�ȣ */
	email VARCHAR(50), /* �̸��� */
	tel VARCHAR2(30), /* ��ȭ��ȣ */
	phoneNum VARCHAR2(30), /* ��ǥ�� ��ȭ��ȣ */
	birth VARCHAR2(30), /* ������� */
	birthNum VARCHAR2(30), /* �ֹι�ȣ */
	add1 VARCHAR2(100), /* �ּ� */
	add2 VARCHAR2(100), /* ���ּ� */
	reg_date DATE /* ������ */
);

ALTER TABLE register
	ADD
		CONSTRAINT PK_register
		PRIMARY KEY (
			reg_num,
			type_num
		);

/* ��� */
CREATE TABLE company (
	com_order NUMBER, /* ��ȣ */
	ceo_id VARCHAR2(50) NOT NULL, /* ��� ���̵� */
	ceo_qr varchar2(2000) /* QR�ڵ� */
);

ALTER TABLE company
	ADD
		CONSTRAINT PK_company
		PRIMARY KEY (
			ceo_id
		);

/* �����ٰ��� */
CREATE TABLE schedule (
	schedule_num NUMBER NOT NULL, /* ������ ���� ��ȣ */
	ceo_id VARCHAR2(50) NOT NULL, /* ��� ���̵� */
	work_id VARCHAR2(50) NOT NULL, /* ����� ���̵� */
	staff_number VARCHAR2(100) NOT NULL, /* �����ȣ */
	reg_num NUMBER NOT NULL, /* ��ȣ */
	type_num NUMBER NOT NULL, /* �з� */
	name VARCHAR(20), /* �̸� */
	sch_workDate DATE, /* �ٹ���¥ */
	sch_workTime TIMESTAMP, /* �ٹ��ð� */
	sch_workEndTime TIMESTAMP, /* �ٹ��ð� �� */
	sch_restTime VARCHAR2(50), /* �ްԽð� */
	color VARCHAR(20), /* �������� */
	memo VARCHAR2(2000), /* �޸� */
	restDate NUMBER /* �޹����� */
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

/* ��å���� */
CREATE TABLE positiontype (
	type_num NUMBER NOT NULL, /* �з� */
	type_name VARCHAR2(30) NOT NULL /* �з��̸� */
);

ALTER TABLE positiontype
	ADD
		CONSTRAINT PK_positiontype
		PRIMARY KEY (
			type_num
		);

/* ��� */
CREATE TABLE employ (
	reg_num NUMBER NOT NULL, /* ��ȣ */
	em_num NUMBER, /* ���� */
	type_num NUMBER NOT NULL, /* �з� */
	staff_number VARCHAR2(100) NOT NULL, /* �����ȣ */
	ceo_id VARCHAR2(50) NOT NULL, /* ��� ���̵� */
	work_id VARCHAR2(50) NOT NULL, /* ����� ���̵� */
	hourWage NUMBER, /* �ñ� */
	employ_date DATE, /* �Ի��� */
	insurance NUMBER, /* 4�뺸������ */
	exp_periodStart DATE, /* �����Ⱓ ���� */
	exp_periodEnd DATE /* �����Ⱓ �� */
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

/* �˹� �̷� */
CREATE TABLE resume (
	history_num NUMBER NOT NULL, /* �̷� ��ȣ */
	type_num NUMBER NOT NULL, /* �з� */
	reg_num NUMBER NOT NULL, /* ��ȣ */
	comName varchar2(50), /* ����� */
	comAdd VARCHAR2(100), /* �����ּ� */
	todo VARCHAR(60), /* ���� */
	past_join_date DATE, /* �Ի��� */
	past_leaveDate DATE /* ����� */
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

CREATE SEQUENCE register_seq start with 1 increment by 1 minvalue 1;  --sequence ����
CREATE SEQUENCE employ_seq start with 1 increment by 1 minvalue 1; 
CREATE SEQUENCE commute_seq start with 1 increment by 1 minvalue 1; 
CREATE SEQUENCE company_seq start with 1 increment by 1 minvalue 1; 
CREATE SEQUENCE schedule_num_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE resume_seq start with 1 increment by 1 minvalue 1; 

insert into positiontype values (1, '����ȸ��');    -- positiontype insert into
insert into positiontype values (2, '���ȸ��');

insert into register values(register_seq.NEXTVAL, 2, '������a', 'admina', '1234', '123456789-123453', 'admina@email.com', '053-234-4839', '010-5345-4837',
'851223', NULL, '�뱸 ������ ���� 31', '��', TO_DATE(SYSDATE, 'YYYY-MM-DD') ); -- SYSDATE�� ���� ��¥ �����Ҷ� ��� / register insert into ������
insert into register values(register_seq.NEXTVAL, 1, 'aaa', 'aaa','aaa', NULL, 'aaa@email.com', '010-3927-5843', NULL, --register insert into ���� aaa
'020418', '020418-4283823', '�뱸 �߱� ��󰨿��� 2', '��', TO_DATE('2024-08-10', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'bbb', 'bbb','bbb', NULL, 'bbb@email.com', '010-7346-2243', NULL,
'010924', '010924-4386132', '�뱸 ���� ���̷� 46-9', '��', TO_DATE('2024-08-10', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'ccc', 'ccc','ccc', NULL, 'ccc@email.com', '010-9482-4810', NULL,
'000722', '000722-3214207', '�뱸 �޼��� ������ ��õ1�� 43', '��', TO_DATE('2024-08-10', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'ddd', 'ddd','ddd', NULL, 'ddd@email.com', '010-1284-3264', NULL,
'970320', '970320-3940291', '�뱸 ������ ����� ������� 34-9', '��', TO_DATE('2024-08-11', 'YYYY-MM-DD') );

insert into register values(register_seq.NEXTVAL, 2, '������b', 'adminb', '1234', '4930284-12382453', 'adminb@email.com', '02-482-3954', '010-3843-4920',
'901209', NULL, '���� ���α� ���̷� 31-6', '��', TO_DATE('2024-08-11', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'eee', 'eee','eee', NULL, 'eee@email.com', '010-9382-5839', NULL,
'990328', '990328-1837242', '���� ������ ���μ��� 5', '��', TO_DATE('2024-08-11', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'fff', 'fff','fff', NULL, 'fff@email.com', '010-4829-2910', NULL,
'000823', '000823-4289370', '���� ���� ������ 181', '��', TO_DATE('2024-08-11', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'ggg', 'ggg','ggg', NULL, 'ggg@email.com', '010-4189-1242', NULL,
'980204', '980204-1327483', '���� ���빮�� ����ø���� 5', '��', TO_DATE('2024-08-12', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'hhh', 'hhh','hhh', NULL, 'hhh@email.com', '010-6434-5628', NULL,
'970826', '970826-2324644', '��� ��õ�� �һ籸 ���η� 4', '��', TO_DATE('2024-08-12', 'YYYY-MM-DD') );

insert into register values(register_seq.NEXTVAL, 2, '������c', 'adminc', '1234', '152-42-57532', 'adminc@email.com', '053-248-4216', '010-3843-4920',
'870530', NULL, '�뱸������ �޼��� ������ȯ�� 46', '�翷', TO_DATE('2024-08-16', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 2, '������d', 'admind', '1234', '694-24-74512', 'admind@email.com', '051-546-7521', '010-2547-6315',
'691205', NULL, '�λ걤���� �λ����� �����Ŵ�� 462', '��', TO_DATE('2024-08-17', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 2, '������e', 'admine', '1234', '367-12-85126', 'admine@email.com', '053-758-1265', '010-7412-5125',
'751103', NULL, '�뱸������ ������ ������ 213', '�ڵ�', TO_DATE('2024-08-19', 'YYYY-MM-DD') );

insert into register values(register_seq.NEXTVAL, 1, 'iii', 'iii','iii', NULL, 'aaa@email.com', '010-3392-3432', NULL, 
'990318', '990318-1352809', '�뱸 �߱� ��󰨿��� 2', '��', TO_DATE('2024-08-10', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'jjj', 'jjj','jjj', NULL, 'jjj@email.com', '010-3251-7635', NULL, 
'000318', '000318-4725621', '�뱸 �߱� ��󰨿��� 3', '��', TO_DATE('2024-08-10', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'kkk', 'kkk','kkk', NULL, 'kkk@email.com', '010-6434-5629', NULL,
'990826', '990826-2324644', '��� ��õ�� �һ籸 ���η� 8', '��', TO_DATE('2024-08-14', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, '������', 'lll','lll', NULL, 'lll@email.com', '010-1572-9527', NULL,
'000520', '000520-4158753', '�뱸 �߱� �ޱ������447�� ', '��', TO_DATE('2024-08-15', 'YYYY-MM-DD') );

insert into register values(register_seq.NEXTVAL, 1, '������', 'mmm','mmm', NULL, 'mmm@email.com', '010-1572-9527', NULL,
'000520', '000520-4158753', '�뱸 �߱� �ޱ������447�� ', '��', TO_DATE('2024-08-15', 'YYYY-MM-DD') );


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



INSERT INTO resume VALUES (resume_seq.NEXTVAL, 1, 142, '�Ƶ�����', '�뱸������ �߱� ����', '�Ŵ���', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-03-01', 'YYYY-MM-DD'));  --insert into resume
insert into resume values (resume_seq.NEXTVAL, 1, 142, '����ŷ', '�뱸������ �߱� ����', '�Ŵ���', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-08-01', 'YYYY-MM-DD')); 
INSERT INTO resume VALUES(resume_seq.NEXTVAL, 1, 143, '�Ｚ����', '����� ������ �Ｚ��', '����', TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'));
INSERT INTO resume VALUES(resume_seq.NEXTVAL, 1, 144, '����', '����� ������ ���ʵ�', '����', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'));


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

alter table schedule drop column sch_workTime;  --������ Ÿ�� ���� ���� sch_workTime �÷� ����
alter table schedule drop column sch_workEndTime;  --������ Ÿ�� ���� ���� sch_workEndTime �÷� ����

alter table schedule add sch_workTime varchar2(200);  --sch_workTime �߰�
alter table schedule add sch_workEndTime varchar2(200);  --sch_workEndTime �߰�

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
