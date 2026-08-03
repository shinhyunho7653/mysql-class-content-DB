# 파일명: groupby실습

# 1. groupby_db생성
create database  groupby_db;

# 2. 디비 선택
use groupby_db;

# 3. group by?
#	같은 값끼리 여러 행을 하나로 묶어주는 문법
#	그룹화(파티)
/*
1. FROM              → 어떤 테이블에서
      ↓
2. WHERE              → 묶기 전에 먼저 조건으로 걸러냄 (선택)
      ↓
3. GROUP BY 컬럼       → 같은 값끼리 그룹으로 묶음
      ↓
4. 집계함수 계산        → 그룹 안에서 COUNT/SUM/AVG 등 계산
      ↓
5. SELECT             → 그룹명 + 계산결과를 화면에 보여줌
*/

# 4. 테이블 생성
# 카페 체인점에서 
create table sales(
    sale_id  int  primary key  auto_increment,
    store  varchar(50)  not null,
    menu_name  varchar(50)  not null,
    price  int  not null
);
insert into sales(store, menu_name, price) values
('강남점', '아메리카노', 4500),
('강남점', '카페라떼', 5000),
('강남점', '아메리카노', 4500),
('홍대점', '아메리카노', 4500),
('홍대점', '초코라떼', 5500),
('홍대점', '아메리카노', 4500),
('신촌점', '카페라떼', 5000),
('신촌점', '얼그레이', 5000),
('신촌점', '얼그레이', 5000),
('신촌점', '초코라떼', 5500);

select * from sales;

# 5. 매장별로 총 판매 건수, 총 매출액
#	-1) 총 판매 건수 조회

select 				# 3. 출력
	store,
    count(*) as sales_count
from sales			# 1. 테이블 선택
group by			# 2. 매장별로 그룹지음
	store;
    
select 				# 3. 출력
	store
from sales			# 1. 테이블 선택
group by			# 2. 매장별로 그룹지음
	store;

#	-2) 총 매출액 각각 지점마다 조회 하시오 집계함수
select
	store,
    format(sum(price),0) as 총매출액
from sales
group by
	store;
    
/*
실무에서 사용하는 대표 상황
- 관리자 대시보드 (일별 / 월별 매출, 지점별 매출, 카테고리별 판매량)
- 랭킹 / 인기 콘텐츠 (좋아요, 조회수 많은 게시글)
- 회원등급/세그먼트 (구매 횟수별 회원 등급 분류)
- 로그 분석 (시간대 별로 접속자 수, 에러 유형별 발생 건수)
- 정산/회계 (결제 수단별 합계, 부서별 지출합계)
 
count(*)    -- null 포함 전체 행 개수!
count(컬럼명) count(print) -- price가 null이 아닌 행만 카운트한다.
count(distinct store) 중복없이 종류만 세고 싶을 때 자주 사용을 한다. 
 
매장별,월별 매출을 나누고 싶다면 둘다 group by 넣어야함
group by 
	store , month
    "내가 궁금한 단위가 뭐지?" 먼저 정하고 그 컬럼들을 group by에 넣는 습관!
group by  == 숫자를 요약해서 보여주는 모든 화면들에서 쓰이는 핵심 도구
    인기메뉴 top랭킹
    SNS인플루언서별 활동 리포트
    집계함수들이 사용이 된다는것!
*/





