# 영화 리뷰 사이트
# 영화 정보를 저장하는 DB
# 1. DB 생성 movie_db;
create database movie_db;

# 2. DB 선택
use movie_db;

# 3. 표 하나
#	제목 100 글자
#	줄거리
#	평점
#	상영여부 지금 상영중인지 아닌지
create table movies(
	제목 varchar(100),
    줄거리 text,
    평점 double,
    상영여부 boolean
);

# 4. 구조 확인
desc movies;

# -----------------------------------------------------------------------------
# SNS , 트위터 , 게시글 이모티콘 되게 많이 들어갑니다.
# 일반 글자 (한글,영어,숫자) 1~3바이트 사이로 표현 
# 중국어,일본어, 이모티콘 4바이트 차지!
# 안녕하세요😀 -->  안녕하세요????
# utf8mb4 = 글자를 저장하는 방법 (문자 인코딩)

# 1. DB 만들기
create database twitter_db;

# 2. DB 선택
use twitter_db;

# 3. 게시글 표 하나
create table boards(
	내용 text
) character set utf8mb4;

# 4. 구조 확인
desc boards;

# 정처기 필기
#  데이터 타입 지정 --> 도메인 개념으로 출제
#  (하나의 애트리뷰트가 가질 수있는 원자값들의 집합을 의미하는 것은?)
#   해석 - 한 칸(column 속성)에 들어갈 수있는 값내용들의 범위를 정하는 개념이
#         뭐냐?
#   정답 도메인

# 테이블마다 이모티콘 설정을 하면 효율성이 조금 떨어진다
# 디비 자체에 설정한다. 
# 실무에서 권장하는 방법으로 작성!
# 디비 자체에 설정하자
# 디비 안에 어떤 테이블이 오든 다 적용된다. (자동으로 utf8mb4 다 적용된다)
# 일관성

# 디비 저장소에 한번 설정하면 끝
# collate 그 글자들을 어떤 순서로 정렬하고 같다? 다르다? 어떻게 판단하느냐

create database twitter_db
character set utf8mb4
collate utf8mb4_unicode_ci;


