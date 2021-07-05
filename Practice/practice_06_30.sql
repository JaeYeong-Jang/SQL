--DDL 테이블 관리
create table book(
    book_id number(5),
    title varchar2(50), -- varchar2() --> 메모리를 유동적으로 잡아줌
    author varchar2(10),
    pub_date date
);

alter  table book add (pubs varchar2(50));

alter table book modify (title varchar2(100));

alter table book rename column title to subject;

alter table book drop  (author);

alter table book add (author varchar2(10));

rename book to article;

drop table article;

create table author(
    author_id number(10),-- unique 와 not null의 합은 pk가 된다.
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);

create table book(
    book_id number(10),
    title varchar2(100) not null,
    pubs varchar2(100),
    pub_date date,
    author_id number(10),
    primary key(book_id),
    CONSTRAINT book_fk FOREIGN key(author_id) --foreign key 연결(?)
    REFERENCES author(author_id)
);

--DML-insert 
insert into author -- 컬럼의 순서대로 넣어야 한다.
values(1,'박경리','토지 작가');

select * from author;

insert into author(author_id, author_name)
values(2,'이문열');

update author
set author_name = '기안84',
    author_desc = '웹툰작가'
where author_id = 1;

update author --where절이 생략되면 모든 레코드에 적용된다.(주의 필요)
set author_name = '강풀',
    author_desc = '인기작가';
    
delete from author
where author_id = 1;

delete from author; --조건이 없으면 모든 데이터 삭제(주의 필요)

commit;

insert into author values(2,'기안84','웹툰작가');

insert into author values(3,'강풀','인기작가');

update author
set author_desc = '나혼자산다 출연'
where author_id = 2;

delete from author
where author_id = 1;

rollback; -- insert update delete --> 이 세개만 롤백가능

--SEQUENCE 연속적인 일렬번호 생성 --> PK생성에 주로 사용
create sequence seq_author_id
increment by 1
start with 1
nocache;

insert into author values(seq_author_id.nextval,'기안84','웹툰작가');
insert into author values(seq_author_id.nextval,'이문열','작가');
insert into author values(seq_author_id.nextval,'강풀','인기작가');
--seq_author_id 를 건드릴 때 마다 카운트 증가
select * from author;

select * from user_sequences;

select seq_author_id.currval from dual;

select seq_author_id.nextval from dual; -- 건드릴 때 마다 1씩 증가

insert into author values(seq_author_id.nextval,'장재영','작가');

drop sequence seq_author_id;

select * from user_sequences;