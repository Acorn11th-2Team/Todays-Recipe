-- cart�� userid FK �߰�
alter table cart
add CONSTRAINT cart_userid_fk FOREIGN KEY(userid)
REFERENCES member(userid) ON DELETE CASCADE;

-- goods���̺� gStock(���) �׸� �߰�
ALTER TABLE goods
add gStock VARCHAR(20);

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


