# 주석(데이터베이스코드 작성할떄 메모)
# create(만들기 자바 new)

# 학생들의 정보를 저장하는 저장소
create database students;

# 실행 ctrl + enter;
# 실무에서는 이름을 지을때 프로젝트 / 서비스 성격이 드러나게 짓는다.

# 이미 있는 이름으로 만들면 에러가 나거나 실무 스크립트에서는 안전하게 아래처럼
# 이름을 지어서 사용한다. 
-- create database students_db;
-- create database students_dev;  # 개발환경
-- create database students_prod; # 운영

# 데이터를 저장하는 언어들은 SQL언어들은 무조건 대문자
# 자동 정렬 ctrl + b;

# 데이터베이스 저장소를 한번 만들어 놓으면 똑같은 중복적인 데이터베이스는
# 만들지 못한다.

# 데이터베이스가 이미 있다면 만들지 말고 데이터베이스가 없다면 생성해라
create database if not exists students;

# mysql 데이터베이스틑 저장소를 여러개 관리할 수 있다.
# 어떤 데이터베이스를 사용할지 선택
use students;

create database A;

# 필요없는 데이터베이스를 삭제할떄 drop