-- ���� ���̺�� ����
drop table cart purge;
drop table notice purge;
drop table qa purge;
drop table orderinfo purge;
drop table goods purge;
drop table member purge;




-- ���� �������� ����
drop sequence cart_seq;
drop sequence orderInfo_seq;
drop sequence QA_seq;
drop sequence notice_seq;

---��ǰ
   -- vegetable, fruit, seafood, meat, noodle
   create table goods
   ( gCode varchar2(20) PRIMARY KEY, -- ��ǰ�ڵ�
     gCategory varchar2(20) not null,   -- ��ǰ ī�װ�
     gName varchar2(50) not null,   -- ��ǰ �̸�   (���� ����� �̸��� ǥ�� ������, ������ ����)
     gPrice NUMBER(6) not null,     -- ��ǰ ����
     gImage varchar2(20) not null,   -- ��ǰ �̹���
     gUnit varchar2(20),     -- �ǸŴ��� (����� ���� ���� ��� NULL)
     gWeight varchar2(20)   -- �߷� (����� ���� ���� ��� NULL)
     );

-- goods���̺� gStock(���) �׸� �߰�
ALTER TABLE goods
add gStock NUMBER(20);

-- �⺻ ��� 1000�������� �߰�
insert into goods 
  values ('M1',	'Meat', '���', '7200', 'meat1', '20��', '1200g', 1000);
insert into goods 
  values ('M2',	'Meat', '��������', '2682', 'meat2', '1��', '150g', 1000);
insert into goods 
  values ('M3',	'Meat', '����', '12660', 'meat3', '1��', '600g', 1000);
insert into goods 
  values ('M4',	'Meat', '�մٸ� ��', '6900', 'meat4', '1��', '600g', 1000);
insert into goods 
  values ('M5',	'Meat', '�Ұ�� ������', '7500', 'meat5', '1��', '200g', 1000);
insert into goods 
  values ('M6',	'Meat', '���', '12660', 'meat6', '1��', '600g', 1000);
insert into goods 
  values ('M7',	'Meat', '�޴ٸ� ��', '4500', 'meat7', '1��', '600g', 1000);
insert into goods 
  values ('M8',	'Meat', 'ġ����', '9730', 'meat8', '1��', '300g', 1000);
insert into goods 
  values ('M9',	'Meat', '���� ����', '11900', 'meat9', '1��', '1kg', 1000);
insert into goods 
  values ('M10', 'Meat', '�ߺ������� ��', '5800', 'meat10', '1��', '1kg', 1000);
insert into goods 
  values ('M11', 'Meat', '�Ұ�� ���Ÿ���', '8100', 'meat11', '1��', '200g', 1000);
insert into goods 
  values ('M12', 'Meat', '�� �ٸ���', '12800', 'meat12', '1��', '1kg', 1000);
insert into goods 
  values ('M13', 'Meat', '���߸� ��', '4800', 'meat13', '1��', '450g', 1000);
insert into goods 
  values ('M14', 'Meat', '��������', '9500', 'meat14', '1��', '150g', 1000);
insert into goods 
  values ('M15', 'Meat', '��� ���', '12900', 'meat15', '1��', '1kg', 1000);
insert into goods 
  values ('M16', 'Meat', '������� ������', '3600', 'meat16', '1��', '300g', 1000);
insert into goods 
  values ('M17', 'Meat', '�Ұ�� ���', '11500', 'meat17', '1��', '250g', 1000);
insert into goods 
  values ('M18', 'Meat', 'ä����', '16000', 'meat18', '1��', '250g', 1000);
insert into goods 
  values ('M19', 'Meat', '������� ���', '5400', 'meat19', '1��', '300g', 1000);
insert into goods 
  values ('M20', 'Meat', '����', '6930', 'meat20', '1��', '500g', 1000);
insert into goods 
  values ('M21', 'Meat', '����', '3500', 'meat21', '1��', '500g', 1000);
insert into goods 
  values ('M22', 'Meat', '�� �Ƚɻ�', '6900', 'meat22', '1��', '500g', 1000);
insert into goods 
  values ('M23', 'Meat', '�� ������', '12900', 'meat23', '1��', '2kg', 1000);
insert into goods 
  values ('M24', 'Meat', '�Ұ�� ��л�', '8910', 'meat24', '1��', '200g', 1000);
insert into goods 
  values ('M25', 'Meat', '�� ������', '8600', 'meat25', '1��', '500g', 1000);
insert into goods 
  values ('M26', 'Meat', '������', '15700', 'meat26', '1��', '300g', 1000);
insert into goods 
  values ('M27', 'Meat', '�ɵ��', '29900', 'meat27', '1��', '200g', 1000);
insert into goods 
  values ('M28', 'Meat', '�簥��', '15000', 'meat28', '1��', '300g', 1000);
insert into goods 
  values ('M29', 'Meat', '�Թ� ������ũ', '13000', 'meat29', '2��', '600g', 1000);
insert into goods 
  values ('M30', 'Meat', '�Ұ�� �Ƚ�', '15900', 'meat30', '1��', '200g', 1000);
  
-- ��, ���, ���� DB
insert into goods values ('N1', 'Noodle', '�丶�� �ҽ�', 2500, 'noodle1', '1��', '500g', 1000);
insert into goods values ('N2', 'Noodle', '�����佺��', 5980, 'noodle2', '1��', '230g', 1000);
insert into goods values ('N3', 'Noodle', '���İ�Ƽ', 2450, 'noodle3', '1��', '500g', 1000);
insert into goods values ('N4', 'Noodle', '�������', 4790, 'noodle4', '1��', '295ml', 1000);
insert into goods values ('N5', 'Noodle', '�丶�� ��ø', 2580, 'noodle5', '1��', '280g', 1000);
insert into goods values ('N6', 'Noodle', '������Ż �巹��', 3250, 'noodle6', '1��', '270g', 1000);
insert into goods values ('N7', 'Noodle', '������� ����', 2650, 'noodle7', '1��', '200g', 1000);
insert into goods values ('N8', 'Noodle', 'ī�� �и�', 3280, 'noodle8', '1��', '100g', 1000);
insert into goods values ('N9', 'Noodle', '��⸧', 14980, 'noodle9', '1��', '320ml', 1000);
insert into goods values ('N10', 'Noodle', '���⸧', 7980, 'noodle10', '1ĵ', '350ml', 1000);
insert into goods values ('N11', 'Noodle', '�޹и�', 4300, 'noodle11', '1��', '400g', 1000);
insert into goods values ('N12', 'Noodle', '�Ҹ�', 3150, 'noodle12', '1��', '900g', 1000);
insert into goods values ('N13', 'Noodle', '�쵿�縮��', 1100, 'noodle13', '1��', '210g', 1000);
insert into goods values ('N14', 'Noodle', '��Į����', 2480, 'noodle14', '1��', '320g', 1000);
insert into goods values ('N15', 'Noodle', '�ø��� ����', 7980, 'noodle15', '1��', '500ml', 1000);
insert into goods values ('N16', 'Noodle', '���尡��', 9800, 'noodle16', '1��', '250g', 1000);
insert into goods values ('N17', 'Noodle', '�ұ�', 4800, 'noodle17', '1��', '500g', 1000);
insert into goods values ('N18', 'Noodle', '����', 2070, 'noodle18', '1��', '1kg', 1000);
insert into goods values ('N19', 'Noodle', '��ġ����', 3500, 'noodle19', '1��', '1000ml', 1000);
insert into goods values ('N20', 'Noodle', '������', 5000, 'noodle20', '1��', '840ml', 1000);
insert into goods values ('N21', 'Noodle', '��� �ҽ�', 3280, 'noodle21', '1��', '455g', 1000);
insert into goods values ('N22', 'Noodle', '���ҽ�', 3900, 'noodle22', '1��', '725g', 1000);
insert into goods values ('N23', 'Noodle', '���', 3980, 'noodle23', '1��', '300g', 1000);
insert into goods values ('N24', 'Noodle', '����', 2700, 'noodle24', '1��', '500ml', 1000);
insert into goods values ('N25', 'Noodle', '��������', 4900, 'noodle25', '1��', '150g', 1000);
insert into goods values ('N26', 'Noodle', '���縮', 1580, 'noodle26', '1��', '110gx5����', 1000);
insert into goods values ('N27', 'Noodle', '��ħ����', 2980, 'noodle27', '1��', '1kg', 1000);
insert into goods values ('N28', 'Noodle', '������', 9000, 'noodle28', '1��', '1kg', 1000);
insert into goods values ('N29', 'Noodle', '����', 2050, 'noodle29', '1��', '500g', 1000);
insert into goods values ('N30', 'Noodle', '�ø����', 2800, 'noodle30', '1��', '700g', 1000);
insert into goods values ('N31', 'Noodle', '�Ŀ���', 7510, 'noodle31', '1��', '1.8L', 1000);
insert into goods values ('N32', 'Noodle', '���� ����', 3200, 'noodle32', '1��', '120g', 1000);
insert into goods values ('N33', 'Noodle', '������', 3340, 'noodle33', '1ĵ', '50g', 1000);  



-- ä��
insert into goods values ('V1',	'Vegetable', '��ȣ��', '1480', 'veg1', '1��', NULL, 1000);
insert into goods values ('V2',	'Vegetable', '���̹���', '1160', 'veg2', '1��', '2��', 1000);
insert into goods values ('V3',	'Vegetable', '��Ÿ�� ����', '1050', 'veg3', '1��', '200g', 1000);
insert into goods values ('V4',	'Vegetable', '��', '1450', 'veg4', '1��', '800g �̻�', 1000);
insert into goods values ('V5',	'Vegetable', '����', '1090', 'veg5', '1��', '3��', 1000);
insert into goods values ('V6',	'Vegetable', '�����', '2590', 'veg6', '1��', '500g ����', 1000);
insert into goods values ('V7',	'Vegetable', '����', '3600', 'veg7', '1��', '1.8kg', 1000);
insert into goods values ('V8',	'Vegetable', '�񸶴�', '2990', 'veg8', '1��', '200g', 1000);
insert into goods values ('V9',	'Vegetable', '����', '6980', 'veg9', '1��', '1kg', 1000);
insert into goods values ('V10','Vegetable', '�����̹���', '2000', 'veg10', '1��', '400g', 1000);
     
insert into goods values ('V11','Vegetable', '�ٴٱ����', '2800', 'veg11', '1��', '3����', 1000);
insert into goods values ('V12','Vegetable', '���� ����ݸ�', '2120', 'veg12', '1��', '1����', 1000);
insert into goods values ('V13','Vegetable', '������ī', '2480', 'veg13', '1��', '2��', 1000);
insert into goods values ('V14','Vegetable', '�����', '2590', 'veg14', '1��', '200g �̻�', 1000);
insert into goods values ('V15','Vegetable', '���', '2990', 'veg15', '1����', '500g(2~4����)', 1000);
insert into goods values ('V16','Vegetable', '����', '2690', 'veg16', '1��', '1��/1kg �̻�', 1000);
insert into goods values ('V17','Vegetable', '�˹�� ����', '3990', 'veg17', '1��', NULL, 1000);
insert into goods values ('V18','Vegetable', '�����', '3790', 'veg18', '1��', '900g ����', 1000);
insert into goods values ('V19','Vegetable', '����', '2220', 'veg19', '1��', '200g', 1000);
insert into goods values ('V20','Vegetable', 'û�����', '2280', 'veg20', '1��', '200g', 1000);
     
insert into goods values ('V21','Vegetable', 'û����', '1480', 'veg21', '1��', '150g', 1000);
insert into goods values ('V22','Vegetable', '�̳���', '4990', 'veg22', '1��', '200g', 1000);
insert into goods values ('V23','Vegetable', '�ñ�ġ', '2190', 'veg23', '1����', '200g', 1000);
insert into goods values ('V24','Vegetable', '������', '2690', 'veg24', '1��', '500g', 1000);
insert into goods values ('V25','Vegetable', '����', '2180', 'veg25', '1��', '2��', 1000);
insert into goods values ('V26','Vegetable', '�����', '4780', 'veg26', '1��', '800g', 1000);
insert into goods values ('V27','Vegetable', '����̹���', '3690', 'veg27', '1��', '6~9��', 1000);
insert into goods values ('V28','Vegetable', '���ֳ���', '1990', 'veg28', '1��', '200g', 1000);
insert into goods values ('V29','Vegetable', '�θ���', '2990', 'veg29', '1��', '200g', 1000);
insert into goods values ('V30','Vegetable', '�ᳪ��', '2600', 'veg30', '1��', '340', 1000);

-- ����
INSERT INTO goods VALUES 
('F1','Fruit','�ٳ���','2980','fruit1','1��','1kg', 1000);
INSERT INTO goods VALUES 
('F2', 'Fruit','����','14900','fruit2','1��','1.5kg', 1000);
INSERT INTO goods VALUES 
('F3','Fruit','���θ���','7980','fruit3','1��','500g', 1000);
INSERT INTO goods VALUES 
('F4','Fruit','����丶��','4179','fruit4','1��','500g', 1000);
INSERT INTO goods VALUES 
('F5','Fruit','�ƺ�ī��','3240','fruit5','1��','200g', 1000);
INSERT INTO goods VALUES 
('F6','Fruit','������','7600','fruit6','1��','1kg', 1000);
INSERT INTO goods VALUES 
('F7','Fruit','��纣��','8091','fruit7','1��','100g', 1000);
INSERT INTO goods VALUES 
('F8','Fruit','û�ۻ��','7990','fruit8','1��','1kg', 1000);
INSERT INTO goods VALUES 
('F9','Fruit','����û����','9996','fruit9','1��','500g', 1000);
INSERT INTO goods VALUES 
('F10','Fruit','�ϼ��丶��','8557','fruit10','1��','2kg', 1000);
INSERT INTO goods VALUES 
('F11','Fruit','�����̾�����','8910','fruit11','1��','500g', 1000);
INSERT INTO goods VALUES 
('F12','Fruit','�Ű��','7900','fruit12','1��','1kg', 1000);
INSERT INTO goods VALUES 
('F13','Fruit','�õ���纣��','8055','fruit13','1��','1kg', 1000);
INSERT INTO goods VALUES 
('F14','Fruit','���Ű��','9900','fruit14','1��','800g', 1000);
INSERT INTO goods VALUES 
('F15','Fruit','�������ξ���','9800','fruit15','1��','1kg', 1000);
INSERT INTO goods VALUES 
('F16','Fruit','ȥ������','11430','fruit16','1��','700g', 1000);
INSERT INTO goods VALUES 
('F17','Fruit','������û����','6840','fruit17','1��','500g', 1000);
INSERT INTO goods VALUES 
('F18','Fruit','�ڸ�','10900','fruit18','1��','1.8kg', 1000);
INSERT INTO goods VALUES 
('F19','Fruit','��������','12900','fruit19','1��','1.1kg', 1000);
INSERT INTO goods VALUES 
('F20','Fruit','���ξ���ûũ','5480','fruit20','1��','400g', 1000);
INSERT INTO goods VALUES 
('F21','Fruit','ī����','14800','fruit21','1��','1.4kg', 1000);
INSERT INTO goods VALUES 
('F22','Fruit','����������','10900','fruit22','1��','650g', 1000);
INSERT INTO goods VALUES 
('F23','Fruit','�õ����ø���','7225','fruit23','1��','1kg', 1000);
INSERT INTO goods VALUES 
('F24','Fruit','�������','16900','fruit24','1��','1.2kg', 1000);
INSERT INTO goods VALUES 
('F25','Fruit','���ð���','2490','fruit25','1��','150g', 1000);
INSERT INTO goods VALUES 
('F26','Fruit','�ҽ÷���','2565','fruit26','1��','300g', 1000);
INSERT INTO goods VALUES 
('F27','Fruit','�õ�����','7110','fruit27','1��','1kg', 1000);
INSERT INTO goods VALUES 
('F28','Fruit','�����','3960','fruit28','1��','450g', 1000);

-- �ػ깰
INSERT INTO GOODS
VALUES ( 'S1', 'Seafood', '����', '3900', 'seafood1', '1��', '250g', 1000 );
INSERT INTO GOODS
VALUES ( 'S2', 'Seafood', '��ġ', '11100', 'seafood2', '1��', '350g', 1000 );
INSERT INTO GOODS
VALUES ( 'S3', 'Seafood', '����', '5900', 'seafood3', '1��', '500g', 1000 );
INSERT INTO GOODS
VALUES ( 'S4', 'Seafood', '��ġ', '6500', 'seafood4', '1��', '450g', 1000 );
INSERT INTO GOODS
VALUES ( 'S5', 'Seafood', '���', '22000', 'seafood5', '1��', '240g', 1000 );
INSERT INTO GOODS
VALUES ( 'S6', 'Seafood', '�Ʊ�', '16900', 'seafood6', '1��', '1000g', 1000 );
INSERT INTO GOODS
VALUES ( 'S7', 'Seafood', '�뱸', '11997', 'seafood7', '1��', '500g', 1000 );
INSERT INTO GOODS
VALUES ( 'S8', 'Seafood', '���ٸ�', '16900', 'seafood8', '1����', '400g', 1000 );
INSERT INTO GOODS
VALUES ( 'S9', 'Seafood', '���ڹ�', '6500', 'seafood9', '1��', '350g', 1000 );
INSERT INTO GOODS
VALUES ( 'S10', 'Seafood', '����', '9990', 'seafood10', '1��', '200g', 1000 );
INSERT INTO GOODS
VALUES ( 'S11', 'Seafood', '����', '22900', 'seafood11', '1��', '400g', 1000 );
INSERT INTO GOODS
VALUES ( 'S12', 'Seafood', '��¡��', '12900', 'seafood12', '1��', '400g', 1000 );
INSERT INTO GOODS
VALUES ( 'S13', 'Seafood', '����', '19900', 'seafood13', '1��', '240g', 1000 );
INSERT INTO GOODS
VALUES ( 'S14', 'Seafood', '�޲ٹ�', '19710', 'seafood14', '1��', '500g', 1000 );
INSERT INTO GOODS
VALUES ( 'S15', 'Seafood', '����', '22500', 'seafood15', '1����', '500g', 1000 );
INSERT INTO GOODS
VALUES ( 'S16', 'Seafood', '������', '7500', 'seafood16', '1��', '200g', 1000 );
INSERT INTO GOODS
VALUES ( 'S17', 'Seafood', '��', '4500', 'seafood17', '1��', '200g', 1000 );
INSERT INTO GOODS
VALUES ( 'S18', 'Seafood', '����', '8900', 'seafood18', '1��', '1000g', 1000 );
INSERT INTO GOODS
VALUES ( 'S19', 'Seafood', '����', '25000', 'seafood19', '1��', '200g', 1000 );
INSERT INTO GOODS
VALUES ( 'S20', 'Seafood', '�۰�', '9160', 'seafood20', '1��', '260g', 1000 );
INSERT INTO GOODS
VALUES ( 'S21', 'Seafood', '�ػ�', '11439', 'seafood21', '1��', '300g', 1000 );
INSERT INTO GOODS
VALUES ( 'S22', 'Seafood', '���¾�', '6500', 'seafood22', '1��', '250g', 1000 );
INSERT INTO GOODS
VALUES ( 'S23', 'Seafood', '�ɰ�', '59900', 'seafood23', '1��', '950g', 1000 );
INSERT INTO GOODS
VALUES ( 'S24', 'Seafood', '����', '9900', 'seafood24', '1��', '300g', 1000 );
INSERT INTO GOODS
VALUES ( 'S25', 'Seafood', '�����', '6640', 'seafood25', '1��', '200g', 1000 );
INSERT INTO GOODS
VALUES ( 'S26', 'Seafood', '�췷', '5600', 'seafood26', '1��', '180g', 1000 );
INSERT INTO GOODS
VALUES ( 'S27', 'Seafood', 'Ȳ��', '5500', 'seafood27', '1��', '280g', 1000 );
INSERT INTO GOODS
VALUES ( 'S28', 'Seafood', '��ġ', '9900', 'seafood28', '1��', '600g', 1000 );
INSERT INTO GOODS
VALUES ( 'S29', 'Seafood', '�̿�', '8900', 'seafood29', '1��', '130g', 1000 );
INSERT INTO GOODS
VALUES ( 'S30', 'Seafood', '�ٽø�', '6900', 'seafood30', '1��', '200g', 1000 );

-- cart ���̺� ����
create table cart
(  num NUMBER(6) PRIMARY KEY,
    userid VARCHAR2(10),
    gCode varchar2(20) not null,
    gName varchar2(50) not null,
    gPrice NUMBER(6) not null,
    gAmount NUMBER(2) not null,
    gImage varchar2(20) not null
);   
  
   
create sequence cart_seq;

-- Member table ����
create table member
(
  userid varchar2(10) primary key,
  passwd varchar2(10) not null,
  username varchar2(10) not null,
  post varchar2(6) not null,
  addr1 varchar2(500) not null,
  addr2 varchar2(500) not null,
  phone1 varchar2(3) not null,
  phone2 varchar2(4) not null,
  phone3 varchar2(4) not null,
  email1 varchar2(20) not null,
  email2 varchar2(20) not null
);

-- orderInfo ���̺� ����
create table orderInfo
  (  num NUMBER(6) PRIMARY KEY,
     userid VARCHAR2(10),
     gCode varchar2(20) not null,
     gName varchar2(50) not null,
     gPrice NUMBER(6) not null,
     gAmount NUMBER(2) not null,
     gImage varchar2(20) not null,
     orderName VARCHAR2(10) NOT NULL,
     post VARCHAR2(5) NOT NULL,
     addr1 VARCHAR2(500) NOT NULL,
     addr2 VARCHAR2(500) NOT NULL,
     phone VARCHAR2(11) NOT NULL,
     payMethod VARCHAR2(10) NOT NULL,
     orderDay DATE  DEFAULT SYSDATE
  );   
  alter table orderInfo
  add CONSTRAINT orderInfo_userid_fk FOREIGN KEY(userid)
   REFERENCES member(userid) ON DELETE CASCADE;
   
   
  alter table orderInfo
  add CONSTRAINT orderInfo_gCode_fk FOREIGN KEY(gCode)
   REFERENCES goods(gCode) ON DELETE CASCADE; 
   
   create sequence orderInfo_seq;
   
-- ���������� ����
ALTER TABLE orderInfo
MODIFY ( paymethod VARCHAR2(30) );


-- Notice(��������) ���̺� ����
create table Notice
(  num NUMBER(6) PRIMARY KEY,
    writeDay DATE  DEFAULT SYSDATE,
    title varchar2(500),
    contents varchar2(3900)
);   
-- �������� �Խ��� ��ȣ ������ ����
create sequence notice_seq;

-- QA(1:1����) ���̺� ����
create table QA
(  num NUMBER(6) PRIMARY KEY,
    category varchar2(20),
    writeDay DATE  DEFAULT SYSDATE,
    title varchar2(500),
    contents varchar2(3900),
    userid  varchar2(20)
);   
   
alter table QA
add CONSTRAINT QA_userid_fk FOREIGN KEY(userid)
REFERENCES member(userid) ON DELETE CASCADE;

-- 1:1���� �Խ��� ��ȣ ������ ����
create sequence QA_seq;

-- QA(1:1����) ���̺� �亯 �Ӽ� �߰�
ALTER TABLE QA
add answer VARCHAR(3900);


-- cart�� userid FK �߰�
alter table cart
add CONSTRAINT cart_userid_fk FOREIGN KEY(userid)
REFERENCES member(userid) ON DELETE CASCADE;
   
alter table cart
add CONSTRAINT cart_gCode_fk FOREIGN KEY(gCode)
REFERENCES goods(gCode) ON DELETE CASCADE;  
