--테이블 생성
create table book(
    book_id number(5),
    title varchar2(50),
    author varchar2(10),
    pub_date date
);

--테이블 칼럼 추가
alter table book add (pubs varchar2(50));

--테이블 칼럼 수정
alter table book modify (title varchar2(100));

--테이블 칼럼 이름 변경
alter table book rename column title to subject;

--테이블 칼럼 삭제
alter table book drop(author);

--테이블 이름 변경
rename book to article;

--테이블 삭제
drop table article;

create table author(
author_id number(10),
author_name varchar2(100) not null,
author_desc varchar2(500),
primary key(author_id)
);

------------------------------------------
/*insert문 2가지 방법*/
insert into author values(1,'박경리','토지 작가');
insert into author values(2,'이문열');

insert into author (author_id,author_name)values(2,'이문열');
insert into author values(3,'이문열',null);

select * from author;

update author
set author_name = '기안84',
    author_desc = '나혼자산다 출연 웹툰작가'
where author_id = 3;

delete from author where author_id = 5;
delete from author;

insert into author values(1,'이문열','경북 영양');
insert into author values(2,'박경리','경남 통영');
insert into author values(3,'유시민','17대국회의원');

create sequence seq_author_id
increment by 1
start with 1;

drop sequence seq_author_id;

insert into author values(SEQ_AUTHOR_ID.nextval,'김민희','양양');
insert into author values(SEQ_AUTHOR_ID.nextval,'김만수','부산');

select seq_author_id.currval from dual;

select * from user_sequences;

rollback;
commit;

create table book(
book_id number(10),
title varchar2(100) not null,
pubs varchar2(100),
pub_date date,
author_id number(10),
primary key(book_id),
constraint fk_book foreign key (author_id)
references author(author_id)
);

drop table book;