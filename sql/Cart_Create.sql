-- 기존에 cart 테이블이 있다면 삭제
drop table cart purge;

-- cart 테이블 생성
create table cart
(  num NUMBER(6) PRIMARY KEY,
    userid VARCHAR2(10),
    gCode varchar2(20) not null,
    gName varchar2(50) not null,
    gPrice NUMBER(6) not null,
    gAmount NUMBER(4) not null,
    gImage varchar2(20) not null
);   
   
alter table cart
add CONSTRAINT cart_userid_fk FOREIGN KEY(userid)
REFERENCES member(userid) ON DELETE CASCADE;
   
alter table cart
add CONSTRAINT cart_gCode_fk FOREIGN KEY(gCode)
REFERENCES goods(gCode) ON DELETE CASCADE;    
   
create sequence cart_seq;