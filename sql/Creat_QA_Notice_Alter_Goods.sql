

-- goods테이블에 gStock(재고) 항목 추가
ALTER TABLE goods
add gStock VARCHAR(20);

-- Notice(공지사항) 테이블 생성
create table Notice
(  num NUMBER(6) PRIMARY KEY,
    writeDay DATE  DEFAULT SYSDATE,
    title varchar2(500),
    contents varchar2(3900),
    writer varchar2(500),
    viewcount NUMBER(6)
);   
-- 공지사항 게시판 번호 시퀀스 생성
create sequence notice_seq;

-- QA(1:1문의) 테이블 생성
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

-- 1:1문의 게시판 번호 시퀀스 생성
create sequence QA_seq;

-- QA(1:1문의) 테이블 답변 속성 추가
ALTER TABLE QA
add answer VARCHAR(3900);