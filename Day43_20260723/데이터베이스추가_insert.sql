
# 데이터를 추가하는 insert

# 1. DB 선택
use post_db;

# 2. 내용 추가
#	posts 안에 값들을 추가한다
#	values 순서대로 집어넣는다.
insert into posts values ("첫 게시글입니다.", "안녕하세요", 0);
insert into posts values ("두번째 게시글입니다.","반갑습니다!~",0);

# ----------------------------------------------------------------------------

# product_db 선택
use product_db;

# 2. 내용 추가 (순서대로 집어넣을때)
insert into products values ("운동화",100000,20);
insert into products values ("무선이어폰",150000,2);
insert into products values ("안경",200000,0);

# 디비 만들기 -> 저장할 표 -> 데이터 추가 -> 확인

# ----------------------------------------------------------------------------

# 1. twitter_db 선택
use twitter_db;

# 2. 내용 추가
insert into boards values ("오늘 날씨가 좋다! ☀");
insert into boards values ("Hello Twitter! 😄");
insert into boards values ("こんにちは！🌸");

# 한꺼번에 100개, 50개
# 여러 행을 한꺼번에 넣는 방법 (Bulk Insert)
insert into boards values
("오늘 날씨가 좋다! ☀"),
("Hello Twitter! 😄"),
("こんにちは！🌸");

# 실무에서는 수천~ 수백만 건의 데이터가 한번에 저장 돼야될때가 있다.
# 그때 빠르게 저장하는 방식!

# ----------------------------------------------------------------------------

# mysql 대소문자 구별 안함
create database Users;

use Users;

create table user_infos(
	name varchar(100),
    phone varchar(100),
    address varchar(100)
);

# 첫번째 사람
insert into user_infos values ("에리나", "010-1234-1234", "경기도 동탄");

# 두번째 사람
insert into user_infos values ("알렉스", "경기도 동탄");

# values 단점 : 순서대로 들어간다. 위에처럼 문제점이 터질 수 있다.

insert into user_infos (name, address) values ("에리나", "경기도 동탄");
insert into user_infos (phone, name) values ("010-1234-1234", "알렉스");




