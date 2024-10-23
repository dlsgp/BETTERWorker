/* exerd ���� */
ALTER TABLE register
   DROP
      CONSTRAINT FK_positiontype_TO_register
      CASCADE;

ALTER TABLE commute
   DROP
      CONSTRAINT FK_register_TO_commute
      CASCADE;

ALTER TABLE commute
   DROP
      CONSTRAINT FK_employ_TO_commute
      CASCADE;

ALTER TABLE schedule
   DROP
      CONSTRAINT FK_register_TO_schedule
      CASCADE;

ALTER TABLE schedule
   DROP
      CONSTRAINT FK_employ_TO_schedule
      CASCADE;

ALTER TABLE resume
   DROP
      CONSTRAINT FK_register_TO_resume
      CASCADE;

ALTER TABLE register
   DROP
      PRIMARY KEY
      CASCADE
      KEEP INDEX;

ALTER TABLE positiontype
   DROP
      PRIMARY KEY
      CASCADE
      KEEP INDEX;

ALTER TABLE commute
   DROP
      PRIMARY KEY
      CASCADE
      KEEP INDEX;

ALTER TABLE myPage
   DROP
      PRIMARY KEY
      CASCADE
      KEEP INDEX;

ALTER TABLE payManager
   DROP
      PRIMARY KEY
      CASCADE
      KEEP INDEX;

ALTER TABLE schedule
   DROP
      PRIMARY KEY
      CASCADE
      KEEP INDEX;

ALTER TABLE registerCeo
   DROP
      PRIMARY KEY
      CASCADE
      KEEP INDEX;

ALTER TABLE resume
   DROP
      PRIMARY KEY
      CASCADE
      KEEP INDEX;

ALTER TABLE company
   DROP
      PRIMARY KEY
      CASCADE
      KEEP INDEX;

ALTER TABLE employ
   DROP
      PRIMARY KEY
      CASCADE
      KEEP INDEX;

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

COMMENT ON TABLE register IS 'ȸ������';

COMMENT ON COLUMN register.reg_num IS '��ȣ';

COMMENT ON COLUMN register.type_num IS '�з�';

COMMENT ON COLUMN register.name IS '�̸�/��ǥ���̸�';

COMMENT ON COLUMN register.id IS '���̵�';

COMMENT ON COLUMN register.pwd IS '��й�ȣ';

COMMENT ON COLUMN register.jobNum IS '����ڵ�Ϲ�ȣ';

COMMENT ON COLUMN register.email IS '�̸���';

COMMENT ON COLUMN register.tel IS '��ȭ��ȣ';

COMMENT ON COLUMN register.phoneNum IS '��ǥ�� ��ȭ��ȣ';

COMMENT ON COLUMN register.birth IS '�������';

COMMENT ON COLUMN register.birthNum IS '�ֹι�ȣ';

COMMENT ON COLUMN register.add1 IS '�ּ�';

COMMENT ON COLUMN register.add2 IS '���ּ�';

COMMENT ON COLUMN register.reg_date IS '������';

ALTER TABLE register
   ADD
      CONSTRAINT PK_register
      PRIMARY KEY (
         reg_num,
         type_num
      );

/* ��å���� */
CREATE TABLE positiontype (
   type_num NUMBER NOT NULL, /* �з� */
   type_name VARCHAR2(30) NOT NULL /* �з��̸� */
);

COMMENT ON TABLE positiontype IS '��å����';

COMMENT ON COLUMN positiontype.type_num IS '�з�';

COMMENT ON COLUMN positiontype.type_name IS '�з��̸�';

ALTER TABLE positiontype
   ADD
      CONSTRAINT PK_positiontype
      PRIMARY KEY (
         type_num
      );

/* ����� */
CREATE TABLE commute (
   commute_num NUMBER NOT NULL, /* ����ٹ�ȣ */
   reg_num NUMBER NOT NULL, /* ��ȣ */
   type_num NUMBER NOT NULL, /* �з� */
   ceo_id VARCHAR2(50) NOT NULL, /* ��� ���̵� */
   work_id VARCHAR2(50) NOT NULL, /* ����� ���̵� */
   staff_number NUMBER NOT NULL, /* �����ȣ */
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
   hourWage NUMBER, /* �ñ� */
   holiday_pay NUMBER, /* ���޼��� */
   insurance VARCHAR2(10), /* 4�뺸������ */
   etc NUMBER, /* ��Ÿ�޿� */
   pay1 NUMBER, /* 1���� �޿� */
   pay2 NUMBER, /* 2���� �޿� */
   pay3 NUMBER, /* 3���� �޿� */
   pay4 NUMBER, /* 4���� �޿� */
   pay5 NUMBER, /* 5���� �޿� */
   pay NUMBER /* �� �޿� */
);

COMMENT ON TABLE commute IS '�����';

COMMENT ON COLUMN commute.commute_num IS '����ٹ�ȣ';

COMMENT ON COLUMN commute.reg_num IS '��ȣ';

COMMENT ON COLUMN commute.type_num IS '�з�';

COMMENT ON COLUMN commute.ceo_id IS '��� ���̵�';

COMMENT ON COLUMN commute.work_id IS '����� ���̵�';

COMMENT ON COLUMN commute.staff_number IS '�����ȣ';

COMMENT ON COLUMN commute.workIn IS '��ٽð�';

COMMENT ON COLUMN commute.workOut IS '��ٽð�';

COMMENT ON COLUMN commute.restTime_start IS '�ްԽ��۽ð�';

COMMENT ON COLUMN commute.restTime_end IS '�ްԳ��ð�';

COMMENT ON COLUMN commute.workTime1 IS '1���� �ٹ��ð�';

COMMENT ON COLUMN commute.workTime2 IS '2���� �ٹ��ð�';

COMMENT ON COLUMN commute.workTime3 IS '3���� �ٹ��ð�';

COMMENT ON COLUMN commute.workTime4 IS '4���� �ٹ��ð�';

COMMENT ON COLUMN commute.workTime5 IS '5���� �ٹ��ð�';

COMMENT ON COLUMN commute.workTime IS '�� �ٹ��ð�';

COMMENT ON COLUMN commute.hourWage IS '�ñ�';

COMMENT ON COLUMN commute.holiday_pay IS '���޼���';

COMMENT ON COLUMN commute.insurance IS '4�뺸������';

COMMENT ON COLUMN commute.etc IS '��Ÿ�޿�';

COMMENT ON COLUMN commute.pay1 IS '1���� �޿�';

COMMENT ON COLUMN commute.pay2 IS '2���� �޿�';

COMMENT ON COLUMN commute.pay3 IS '3���� �޿�';

COMMENT ON COLUMN commute.pay4 IS '4���� �޿�';

COMMENT ON COLUMN commute.pay5 IS '5���� �޿�';

COMMENT ON COLUMN commute.pay IS '�� �޿�';

ALTER TABLE commute
   ADD
      CONSTRAINT PK_commute
      PRIMARY KEY (
         commute_num,
         reg_num,
         type_num,
         ceo_id,
         work_id,
         staff_number
      );

/* ���������� */
CREATE TABLE myPage (
   staff_num VARCHAR2(20) NOT NULL, /* �����ȣ */
   name VARCHAR(20) NOT NULL, /* �̸� */
   class VARCHAR(10) NOT NULL, /* ���� */
   tel INT(11) NOT NULL, /* ��ȭ��ȣ */
   regNum INT(25) NOT NULL, /* �ֹ�/����ڵ�Ϲ�ȣ */
   email VARCHAR(50), /* �̸��� */
   address VARCHAR(100) NOT NULL, /* �ּ� */
   joinDate DATE NOT NULL, /* �Ի��� */
   insurance CHAR(1) NOT NULL, /* 4�뺸������ */
   workTime TIMESTAMP NOT NULL, /* �ٹ��ð� */
   restTime TIMESTAMP NOT NULL, /* �ްԽð� */
   etc DECIMAL(7), /* ��Ÿ */
   restDate CHAR(1) NOT NULL, /* �޹��� */
   totalWorkTime TIMESTAMP NOT NULL, /* �ѱٹ��ð� */
   expectSum DECIMAL(8) NOT NULL /* ����޿��ݾ� */
);

COMMENT ON TABLE myPage IS '����������';

COMMENT ON COLUMN myPage.staff_num IS '�����ȣ';

COMMENT ON COLUMN myPage.name IS '�̸�';

COMMENT ON COLUMN myPage.class IS '����';

COMMENT ON COLUMN myPage.tel IS '��ȭ��ȣ';

COMMENT ON COLUMN myPage.regNum IS '�ֹ�/����ڵ�Ϲ�ȣ';

COMMENT ON COLUMN myPage.email IS '�̸���';

COMMENT ON COLUMN myPage.address IS '�ּ�';

COMMENT ON COLUMN myPage.joinDate IS '�Ի���';

COMMENT ON COLUMN myPage.insurance IS '4�뺸������';

COMMENT ON COLUMN myPage.workTime IS '�ٹ��ð�';

COMMENT ON COLUMN myPage.restTime IS '�ްԽð�';

COMMENT ON COLUMN myPage.etc IS '��Ÿ';

COMMENT ON COLUMN myPage.restDate IS '�޹���';

COMMENT ON COLUMN myPage.totalWorkTime IS '�ѱٹ��ð�';

COMMENT ON COLUMN myPage.expectSum IS '����޿��ݾ�';

ALTER TABLE myPage
   ADD
      CONSTRAINT PK_myPage
      PRIMARY KEY (
         staff_num
      );

/* �޿����� */
CREATE TABLE payManager (
   pay_num INT(255) NOT NULL, /* ��ȣ */
   staff_num INT(255) NOT NULL, /* �����ȣ */
   hourWage DECIMAL(6) NOT NULL, /* �ñ� */
   insurance CHAR(1) NOT NULL, /* 4�뺸������ */
   bonus DECIMAL(7) NOT NULL, /* ���޼��� */
   etc DECIMAL(7), /* ��Ÿ */
   weekWork1 TIMESTAMP NOT NULL, /* 1�ֱٹ��ð�(��) */
   weekWork2 TIMESTAMP NOT NULL, /* 2�ֱٹ��ð�(��) */
   weekWork3 TIMESTAMP NOT NULL, /* 3�ֱٹ��ð�(��) */
   weekWork4 TIMESTAMP NOT NULL, /* 4�ֱٹ��ð�(��) */
   weekWork5 TIMESTAMP, /* 5�ֱٹ��ð�(��) */
   sum DECIMAL(8) NOT NULL /* ��ü�޿� */
);

COMMENT ON TABLE payManager IS '�޿�����';

COMMENT ON COLUMN payManager.pay_num IS '��ȣ';

COMMENT ON COLUMN payManager.staff_num IS '�����ȣ';

COMMENT ON COLUMN payManager.hourWage IS '�ñ�';

COMMENT ON COLUMN payManager.insurance IS '4�뺸������';

COMMENT ON COLUMN payManager.bonus IS '���޼���';

COMMENT ON COLUMN payManager.etc IS '��Ÿ';

COMMENT ON COLUMN payManager.weekWork1 IS '1�ֱٹ��ð�(��)';

COMMENT ON COLUMN payManager.weekWork2 IS '2�ֱٹ��ð�(��)';

COMMENT ON COLUMN payManager.weekWork3 IS '3�ֱٹ��ð�(��)';

COMMENT ON COLUMN payManager.weekWork4 IS '4�ֱٹ��ð�(��)';

COMMENT ON COLUMN payManager.weekWork5 IS '5�ֱٹ��ð�(��)';

COMMENT ON COLUMN payManager.sum IS '��ü�޿�';

ALTER TABLE payManager
   ADD
      CONSTRAINT PK_payManager
      PRIMARY KEY (
         pay_num,
         staff_num
      );

/* �����ٰ��� */
CREATE TABLE schedule (
   schedule_num NUMBER NOT NULL, /* ������ ���� ��ȣ */
   reg_num NUMBER NOT NULL, /* ��ȣ */
   type_num NUMBER NOT NULL, /* �з� */
   ceo_id VARCHAR2(50) NOT NULL, /* ��� ���̵� */
   work_id VARCHAR2(50) NOT NULL, /* ����� ���̵� */
   staff_number NUMBER NOT NULL, /* �����ȣ */
   name VARCHAR(20), /* �̸� */
   sch_workDate DATE, /* �ٹ���¥ */
   sch_workTime TIMESTAMP, /* �ٹ��ð� */
   sch_workEndTime TIMESTAMP, /* �ٹ��ð� �� */
   sch_restTime VARCHAR2(50), /* �ްԽð� */
   color VARCHAR(20), /* �������� */
   memo VARCHAR2(2000), /* �޸� */
   restDate VARCHAR2(20) /* �޹��� */
);

COMMENT ON TABLE schedule IS '�����ٰ���';

COMMENT ON COLUMN schedule.schedule_num IS '������ ���� ��ȣ';

COMMENT ON COLUMN schedule.reg_num IS '��ȣ';

COMMENT ON COLUMN schedule.type_num IS '�з�';

COMMENT ON COLUMN schedule.ceo_id IS '��� ���̵�';

COMMENT ON COLUMN schedule.work_id IS '����� ���̵�';

COMMENT ON COLUMN schedule.staff_number IS '�����ȣ';

COMMENT ON COLUMN schedule.name IS '�̸�';

COMMENT ON COLUMN schedule.sch_workDate IS '�ٹ���¥';

COMMENT ON COLUMN schedule.sch_workTime IS '�ٹ��ð�';

COMMENT ON COLUMN schedule.sch_workEndTime IS '�ٹ��ð� ��';

COMMENT ON COLUMN schedule.sch_restTime IS '�ްԽð�';

COMMENT ON COLUMN schedule.color IS '��������';

COMMENT ON COLUMN schedule.memo IS '�޸�';

COMMENT ON COLUMN schedule.restDate IS '�޹���';

ALTER TABLE schedule
   ADD
      CONSTRAINT PK_schedule
      PRIMARY KEY (
         schedule_num,
         reg_num,
         type_num,
         ceo_id,
         work_id,
         staff_number
      );

/* ����ȸ������ */
CREATE TABLE registerCeo (
   num INT(255) NOT NULL, /* ��ȣ */
   id VARCHAR(30) NOT NULL, /* ���̵� */
   pwd VARCHAR(30) NOT NULL, /* ��й�ȣ */
   tel INT(11) NOT NULL, /* ��ȭ��ȣ */
   ceoName VARCHAR(20) NOT NULL, /* ��ǥ�ڸ� */
   ceoTel INT(11), /* ��ǥ����ȭ��ȣ */
   regNum INT(25) NOT NULL, /* ����ڵ�Ϲ�ȣ */
   email VARCHAR(50) NOT NULL, /* �̸��� */
   address VARCHAR(100) NOT NULL /* �ּ� */
);

COMMENT ON TABLE registerCeo IS '����ȸ������';

COMMENT ON COLUMN registerCeo.num IS '��ȣ';

COMMENT ON COLUMN registerCeo.id IS '���̵�';

COMMENT ON COLUMN registerCeo.pwd IS '��й�ȣ';

COMMENT ON COLUMN registerCeo.tel IS '��ȭ��ȣ';

COMMENT ON COLUMN registerCeo.ceoName IS '��ǥ�ڸ�';

COMMENT ON COLUMN registerCeo.ceoTel IS '��ǥ����ȭ��ȣ';

COMMENT ON COLUMN registerCeo.regNum IS '����ڵ�Ϲ�ȣ';

COMMENT ON COLUMN registerCeo.email IS '�̸���';

COMMENT ON COLUMN registerCeo.address IS '�ּ�';

ALTER TABLE registerCeo
   ADD
      CONSTRAINT PK_registerCeo
      PRIMARY KEY (
         num
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

COMMENT ON TABLE resume IS '�˹� �̷�';

COMMENT ON COLUMN resume.history_num IS '�̷� ��ȣ';

COMMENT ON COLUMN resume.type_num IS '�з�';

COMMENT ON COLUMN resume.reg_num IS '��ȣ';

COMMENT ON COLUMN resume.comName IS '�����';

COMMENT ON COLUMN resume.comAdd IS '�����ּ�';

COMMENT ON COLUMN resume.todo IS '����';

COMMENT ON COLUMN resume.past_join_date IS '�Ի���';

COMMENT ON COLUMN resume.past_leaveDate IS '�����';

ALTER TABLE resume
   ADD
      CONSTRAINT PK_resume
      PRIMARY KEY (
         history_num,
         type_num,
         reg_num
      );

/* ��� */
CREATE TABLE company (
   com_order NUMBER, /* ��ȣ */
   ceo_id VARCHAR2(50) NOT NULL, /* ��� ���̵� */
   ceo_qr varchar2(2000) /* QR�ڵ� */
);

COMMENT ON TABLE company IS '���';

COMMENT ON COLUMN company.com_order IS '��ȣ';

COMMENT ON COLUMN company.ceo_id IS '��� ���̵�';

COMMENT ON COLUMN company.ceo_qr IS 'QR�ڵ�';

ALTER TABLE company
   ADD
      CONSTRAINT PK_company
      PRIMARY KEY (
         ceo_id
      );

/* ��� */
CREATE TABLE employ (
   em_num NUMBER, /* ���� */
   staff_number NUMBER NOT NULL, /* �����ȣ */
   ceo_id VARCHAR2(50) NOT NULL, /* ��� ���̵� */
   work_id VARCHAR2(50) NOT NULL, /* ����� ���̵� */
   employ_date DATE, /* �Ի��� */
   exp_periodStart DATE, /* �����Ⱓ ���� */
   exp_periodEnd DATE /* �����Ⱓ �� */
);

COMMENT ON TABLE employ IS '���';

COMMENT ON COLUMN employ.em_num IS '����';

COMMENT ON COLUMN employ.staff_number IS '�����ȣ';

COMMENT ON COLUMN employ.ceo_id IS '��� ���̵�';

COMMENT ON COLUMN employ.work_id IS '����� ���̵�';

COMMENT ON COLUMN employ.employ_date IS '�Ի���';

COMMENT ON COLUMN employ.exp_periodStart IS '�����Ⱓ ����';

COMMENT ON COLUMN employ.exp_periodEnd IS '�����Ⱓ ��';

ALTER TABLE employ
   ADD
      CONSTRAINT PK_employ
      PRIMARY KEY (
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
         staff_number,
         ceo_id,
         work_id
      )
      REFERENCES employ (
         staff_number,
         ceo_id,
         work_id
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
         staff_number,
         ceo_id,
         work_id
      )
      REFERENCES employ (
         staff_number,
         ceo_id,
         work_id
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
        
/* exerd �� */       

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

insert into employ values(1, 001, 'admina', 'aaa', TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-11-10', 'YYYY-MM-DD' ) ); --employ insert into
insert into employ values(2, 002, 'admina', 'bbb', TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-11-10', 'YYYY-MM-DD' ) );
insert into employ values(3, 003, 'admina', 'ccc', TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-11-10', 'YYYY-MM-DD' ) );
insert into employ values(4, 004, 'admina', 'ddd', TO_DATE('2024-08-12', 'YYYY-MM-DD' ), TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-11-11', 'YYYY-MM-DD' ) );

insert into employ values(1, 0010, 'adminb', 'eee', TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-09-10', 'YYYY-MM-DD' ) );
insert into employ values(2, 0020, 'adminb', 'fff', TO_DATE('2024-08-12', 'YYYY-MM-DD' ), TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-09-11', 'YYYY-MM-DD' ) );
insert into employ values(3, 0030, 'adminb', 'ggg', TO_DATE('2024-08-12', 'YYYY-MM-DD' ), TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-09-11', 'YYYY-MM-DD' ) );
insert into employ values(4, 0040, 'adminb', 'hhh', TO_DATE('2024-08-14', 'YYYY-MM-DD' ), TO_DATE('2024-08-11', 'YYYY-MM-DD' ), TO_DATE('2024-09-13', 'YYYY-MM-DD' ) );

select * from register;

insert into commute values(commute_seq.NextVal, 2, 1, 'admina', 'aaa', 1, TO_TIMESTAMP('2024-08-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-11 14:00:00','YYYY-MM-DD HH24:MI:SS'), --commute insert into
NULL, NULL, NULL, 300, NULL, NULL, NULL, 300, 9860,NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 49300 ); 
insert into commute values(commute_seq.NextVal, 3, 1, 'admina', 'bbb', 2, TO_TIMESTAMP('2024-08-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-11 14:00:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, NULL, NULL, 300, NULL, NULL, NULL, 300, 9860,NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 49300 ); 
insert into commute values(commute_seq.NextVal, 4, 1, 'admina', 'ccc', 3, TO_TIMESTAMP('2024-08-11 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-11 22:00:00','YYYY-MM-DD HH24:MI:SS'), 
TO_TIMESTAMP('2024-08-11 17:00:00','YYYY-MM-DD HH24:MI:SS'),  TO_TIMESTAMP('2024-08-11 17:30:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, 300, NULL, NULL, NULL, 300, 9860,NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 49300 ); 
insert into commute values(commute_seq.NextVal, 5, 1, 'admina', 'ddd',4, TO_TIMESTAMP('2024-08-12 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-12 14:00:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, NULL, NULL, 300, NULL, NULL, NULL, 300, 9860,NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 49300 );

insert into commute values(commute_seq.NextVal, 7, 1, 'adminb', 'eee', 10, TO_TIMESTAMP('2024-08-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-11 14:00:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, NULL, NULL, 300, NULL, NULL, NULL, 300, 9860,NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 49300 ); 
insert into commute values(commute_seq.NextVal, 8, 1, 'adminb', 'fff', 20,TO_TIMESTAMP('2024-08-12 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-12 14:00:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, NULL, NULL, 300, NULL, NULL, NULL, 300, 9860,NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 49300 ); 
insert into commute values(commute_seq.NextVal, 9, 1, 'adminb', 'ggg',30, TO_TIMESTAMP('2024-08-12 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-12 22:00:00','YYYY-MM-DD HH24:MI:SS'), 
TO_TIMESTAMP('2024-08-11 17:00:00','YYYY-MM-DD HH24:MI:SS'),  TO_TIMESTAMP('2024-08-11 17:30:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, 300, NULL, NULL, NULL, 300, 9860,NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 49300 ); 
insert into commute values(commute_seq.NextVal, 10, 1, 'adminb', 'hhh',40, TO_TIMESTAMP('2024-08-14 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-14 14:00:00','YYYY-MM-DD HH24:MI:SS'), 
NULL, NULL, NULL, 300, NULL, NULL, NULL, 300, 9860,NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 49300 ); 
/*
insert into commute values(11, 1, 'admina', 'aaa', TO_TIMESTAMP('2024-08-13 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-13 14:00:00','YYYY-MM-DD HH24:MI:SS'), --commute insert into
NULL, NULL, NULL, 300, 300, NULL, NULL, 300, 9860,NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 98600 );  --insert into 'aaa', 'bbb' ����� �ð� �߰�
insert into commute values(2, 1, 'admina', 'aaa', TO_TIMESTAMP('2024-08-14 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-14 14:00:00','YYYY-MM-DD HH24:MI:SS'), --commute insert into
NULL, NULL, NULL, 300, 600, NULL, NULL, 300, 9860,NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 147900 ); 
insert into commute values(2, 1, 'admina', 'aaa', TO_TIMESTAMP('2024-08-16 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-16 14:00:00','YYYY-MM-DD HH24:MI:SS'), --commute insert into
NULL, NULL, NULL, 300, 900, NULL, NULL, 300, 9860,NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 197200 ); 
insert into commute values(2, 1, 'admina', 'aaa', TO_TIMESTAMP('2024-08-17 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-17 14:00:00','YYYY-MM-DD HH24:MI:SS'), --commute insert into
NULL, NULL, NULL, 300, 1200, NULL, NULL, 300, 9860,NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 246500 ); 
insert into commute values(2, 1, 'admina', 'aaa', TO_TIMESTAMP('2024-08-18 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-18 14:00:00','YYYY-MM-DD HH24:MI:SS'), --commute insert into
NULL, NULL, NULL, 300, 1500, NULL, NULL, 300, 9860,NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 295800 ); */

insert into company values(company_seq.NEXTVAL, 'admina', null); --insert into company
insert into company values(company_seq.NEXTVAL, 'adminb', null);


insert into schedule values(schedule_seq.NEXTVAL, 82, 1, 'admina', 'aaa', 1 , 'aaa' ,TO_DATE('2024-08-13', 'YYYY-MM-DD' ),  TO_TIMESTAMP('2024-08-13 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 
    TO_TIMESTAMP('2024-08-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  NULL, 'yellow', NULL, NULL);  --schedule insert into aaa

INSERT INTO resume (history_num, type_num, reg_num, comName, comAdd, todo, past_join_date, past_leaveDate) 
VALUES (resume_seq.NEXTVAL, 1, 82, '�Ƶ�����', '�뱸������ �߱� ����', '�Ŵ���', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-03-01', 'YYYY-MM-DD'));  --resume insert into

update resume set comName='����ŷ', todo='����', past_join_date=('2024-02-01'), past_leaveDate=('2024-05-05') where reg_num=82;  --resume update set
   

insert into register values(register_seq.NEXTVAL, 1, 'iii', 'iii','iii', NULL, 'aaa@email.com', '010-3392-3432', NULL, --register insert into ���� iii
'990318', '990318-1352809', '�뱸 �߱� ��󰨿��� 2', '��', TO_DATE('2024-08-10', 'YYYY-MM-DD') );
insert into register values(register_seq.NEXTVAL, 1, 'jjj', 'jjj','jjj', NULL, 'jjj@email.com', '010-3251-7635', NULL, --register insert into ���� iii
'000318', '000318-4725621', '�뱸 �߱� ��󰨿��� 3', '��', TO_DATE('2024-08-10', 'YYYY-MM-DD') );
insert into employ values(5, 005, 'admina', 'iii', TO_DATE('2024-08-13', 'YYYY-MM-DD' ), TO_DATE('2024-08-13', 'YYYY-MM-DD' ), TO_DATE('2024-11-12', 'YYYY-MM-DD' ) ); --employ insert into ���� iii
insert into employ values(6, 006, 'admina', 'jjj', TO_DATE('2024-08-14', 'YYYY-MM-DD' ), TO_DATE('2024-08-14', 'YYYY-MM-DD' ), TO_DATE('2024-11-13', 'YYYY-MM-DD' ) ); --employ insert into ���� jjj


insert into register values(register_seq.NEXTVAL, 1, 'kkk', 'kkk','kkk', NULL, 'kkk@email.com', '010-6434-5629', NULL,
'990826', '990826-2324644', '��� ��õ�� �һ籸 ���η� 8', '��', TO_DATE('2024-08-14', 'YYYY-MM-DD') ); --register insert into ���� kkk
insert into employ values(7, 007, 'admina', 'kkk', TO_DATE('2024-08-14', 'YYYY-MM-DD' ), TO_DATE('2024-08-14', 'YYYY-MM-DD' ), TO_DATE('2024-11-13', 'YYYY-MM-DD' ) ); --employ insert into ���� kkk


/*������ ���̺� db����*/
insert into schedule VALUES(schedule_num_seq.NEXTVAL, 7, 1, 'adminb', 'eee' , 10 , 'eee', TO_DATE('2024-01-02', 'YYYY-MM-DD' ), TO_TIMESTAMP('2024-08-13 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-13 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), '13:00-14:00','�Ķ���', '�̻����', '0');
insert into schedule VALUES(schedule_num_seq.NEXTVAL, 8, 1, 'adminb', 'fff' , 20 , 'fff', TO_DATE('2024-01-11', 'YYYY-MM-DD' ), TO_TIMESTAMP('2024-08-14 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-14 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), '12:00-13:00','������', '�̻����', '1');
            
/*���� ����form ���� ������Ʈ ���� update��*/
UPDATE schedule SET sch_workDate = TO_DATE('2024-01-05', 'YYYY-MM-DD') WHERE work_id = 'eee';

commit;       