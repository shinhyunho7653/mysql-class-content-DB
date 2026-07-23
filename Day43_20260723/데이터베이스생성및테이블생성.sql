# 데이터베이스(DB)
# - 테이블들을 모아놓은 큰 창고

# 테이블
# - 그 창고 안에 있는 표 하나(엑셀 시트)

# 회원들의 정보를 저장하는 창고

create database member_db;

# DB 선택하는 명령어(안전)
use member_db;

# 테이블 생성 (액셀 시트, 표 하나)
create table members(
	# 저장할 항목들 작성
    # 변수명 타입
    name varchar(50),
    age int
);

# 테이블을 만들면 테이블 구조확인
desc members;

# 데이터베이스에서 사용하는 타입
# 정수
#	- int
# 문자
#	- varchar(크기)
# 블로그나 게시글, 자기소개 긴 글
#	- text
# 날짜
#	- date (생년월일)
# 날짜 + 시간
#	- datatime (가입일, 작성일)
# 실수
#	- double
# 돈, 가격
#	- decimal(숫자, 자릿수)
# is ~ 인가? 결과가 true / false
#	- boolean

# 게시글
# 1. 게시글들을 저장하는 DB
create database post_db;

# 2. DB 선택
use post_db;

# 3. 표 하나(액셀시트)
create table posts(
	제목 varchar(100), # 100글자만 저장한다.
    내용 text,
    조회수 int
);

# 4. 구조 확인
desc posts;

# 쇼핑몰 (상품)
# 상품들을 저장하는 DB
create database product_db;

# 2. 창고 선택
use product_db;

# 3. 표 하나 생성
create table products(
	상품명 varchar(100),
    가격 decimal(10,2),    # 전체자릿수, 소수점 아래 2자리 (8자리 정수, 2자리는 실수)
						  # 1000원 - > 1000.00
    재고 int
);

# 4. 구조 확인
desc products;

# 실행 종류 2 가지
# 방금 하는 것처럼 명령문 작성 후 한줄씩 실행 ctrl + enter;
# 자바처럼 한꺼번에 확인하는 명령문 실행 ctrl + shift + enter;
# DB는 한 줄씩 실행해서 정상 실행되는지 확인을 많이 한다.

# 다이어리 프로그램
# 일기들을 저장하는 DB
# 1. diary_db;
create database diary_db;

# 2. DB 선택;
use diary_db;

# 3. 표 하나
#	제목 100 넘지 않기
#	내용 긴 글
#	작성일 날짜만 들어갈 것
#	테이블 이름 diaries
create table diaries(
	제목 varchar(100),
    내용 text,
    작성일 date
);

# 4. 구조 확인
desc diaries;




