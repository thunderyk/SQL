/*author table 생성*/
create table author(
author_id number(10),
author_name varchar2(100) not null,
author_desc varchar2(100),
primary key(author_id)
);

/*book table 생성
그런데 이거 먼저하면 생성이 안됨, 이유는 book에서
author의 author_id를 사용하는데 author가 아직
생성이 안되면 안만들어짐*/
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

/*book sequence 생성*/
create sequence seq_book_id
increment by 1
start with 1;

/*author sequence 생성*/
create sequence seq_author_id
increment by 1
start with 1;

/*실수 반복으로 인한 지우고 삭제하고 다시 만들기 위해서
테스트 용으로 사용*/
/*시퀀스 자체를 삭제*/
drop sequence seq_author_id;
drop sequence seq_book_id;

/*테이블 내용 전체 삭제
그런데 book에 내용이 있으면
author 삭제 안됨*/
delete from author;
delete from book;

/*테이블 자체를 삭제*/
drop table author;
drop table book;

/*테스트로 전체를 보기 위해 사용*/
select * from author;
select * from book;

/*지금 시퀀스 번호 확인을 위해서 사용*/
select seq_book_id.currval from dual;
select seq_author_id.currval from dual;

/*author 먼저 데이터를 넣음*/
insert into author values(seq_author_id.nextval,'이문열','경북 양양');
insert into author values(seq_author_id.nextval,'박경리','경상남도 통영');
insert into author values(seq_author_id.nextval,'유시민','17대 국회의원');
insert into author values(seq_author_id.nextval,'기안84','기안동에서 산 84년생');
insert into author values(seq_author_id.nextval,'강풀','온라인 만화가 1세대');
insert into author values(seq_author_id.nextval,'김영하','알쓸신잡');

/*book 데이터 넣음*/
insert into book values(seq_book_id.nextval,'우리들의 일그러진 영웅','다림','1998-02-22',1);
insert into book values(seq_book_id.nextval,'삼국지','민음사','2002-03-01',1);
insert into book values(seq_book_id.nextval,'토지','마로니에북스','2012-08-15',2);
insert into book values(seq_book_id.nextval,'유시민의 글쓰기 특강','생각의길','2015-04-01',3);
insert into book values(seq_book_id.nextval,'패션왕','중앙북스(books)','2012-02-22',4);
insert into book values(seq_book_id.nextval,'순정만화','재미주의','2011-08-03',5);
insert into book values(seq_book_id.nextval,'오직두사람','문학동네','2017-05-04',6);
insert into book values(seq_book_id.nextval,'26년','재미주의','2012-02-04',5);

/*select로 book과 author 잘 나오는지 확인*/
select book_id ,
       title,
       pubs,
       pub_date,
       bk.author_id,
       author_name,
       author_desc
from book bk, author au
where bk.author_id = au.author_id
order by book_id asc;

/*업데이트 해서 위에 select로 확인하면 변경된것 잘 나오므*/
update author
set author_desc = '서울특별시'
where author_name = '강풀';

/*book에서 author의 author_id를
가지고 있어서 삭제가 안됨*/
delete from author
where author_name = '기안84';

/*그래서 book의 데이터 먼저 삭제*/
delete from book
where book_id =5;
delete from author
where author_name = '기안84';
--위의 select로 확인하면 잘 됨