# 1. DB 선택
use students_db;

# update == 데이터 값 수정
# alter == 테이블을 수정할 때 (테이블 구조 변경)
# - 컬럼 추가 / 삭제 / 수정
# - 컬럼 이름 변경
# - 데이터 타입 변경
# - 테이블명 변경
# 운영중인 시스템에서도 컬럼을 추가하려고 기본 디비를 삭제
# DB라면 다운타임(DownTime) 발생
# 다운타임(DownTime)
# - 서비스가 잠시 멈춰서 사용자가 이용할 수 없는 시간

# alter 가 나오게 됐다
# - 데이터를 유지한채로 구조만 안전하게 수정 가능
# - 서비스 요구사항 변화에 유연하게 대응
# - 운영중인 시스템에서도 스키마 마이크레이션 가능

# 마이그레이션(Migration)
# - 데이터나 시스템을 새로운 환경으로 옮기거나 변경하는 작업

select * from students;

# 1. 테이블 구조 확인
# describe - 설명하다, 기술하다, 구조를 보여주다
desc students;

# 2. 무엇을 바꿀지 결정 (추가/삭제/수정/이름변경)
# 3. 컬럼 추가

/*
ALTER TABLE 테이블명
ADD COLUMN 컬럼명 데이터타입;
*/

alter table students			# 1. 수정할 테이블 선택
add column phone varchar(50);	# 2. 추가할 컬럼명과 타입을 작성

alter table students			# 1. 수정할 테이블 선택
add column box varchar(50);	# 2. 추가할 컬럼명과 타입을 작성

# alter를 이용해서 필요없는 컬럼 하나만 삭제
alter table students
drop column box;

desc students;

# phone -> mobile 컬럼명 하나 바꾸기

alter table students
rename column moblie to mobile;

# 타입 변경
alter table students
modify column score bigint;
# modify = 수정하다, 변경하다

# 여러개 추가하기
alter table students
add column address varchar(200),
add column email varchar(100);

# address , email 다른 개발자랑 이름이 충돌
# 이름만 변경 address -> home_address
#           email -> user_email;
alter table students
rename column address to home_address,
rename column email to user_email;

desc students;

# email 타입이 너무 커 줄여 50으로
# home_address 타입이 너무 작다 300으로 변경
alter table students
modify column user_email varchar(50),
modify column home_address varchar(300);

# 여러개의 컬럼들을 한꺼번에 바꾸는 것보다는 안정성을 위해서
# 각각 변경하는게 좋다




