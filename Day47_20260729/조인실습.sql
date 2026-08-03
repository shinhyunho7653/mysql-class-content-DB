# id 다음에는 기본적으로 int를 사용하는 이유는!
# 숫자를 쓰는 이유는 문자들은 언젠가는 중복되는 문자들이 발생!
# 경단위! 0~ 42억!
# 파일명: 조인실습 

#1. 디비선택
use join_db;

#2. 전체 조회
select * from menu_categories;
select * from menus;

#3. join 키워드 
# ==========================================================
# [2단계] JOIN 기본 문법
# ==========================================================
# select 컬럼들         4. 화면에 보여줘!
# from   테이블A        1. 기준이 되는 테이블 선택!   
# join   테이블B        2. 연결할 테이블 선택!
#   on   테이블A.연결컬럼 = 테이블B.연결컬럼  3. 어떤 컬럼을 이용해서
#                                      FK , PK 연결할지 지정

#   - 나눠져있는 여러 테이블을 필요할 때 다시 합치는 것!
# -0) 먼저 쪼개져있는 테이블을 하나로 붙이기!

-- select *
-- from menus,menu_categories;  # 모든 행을 서로 다 붙여버린다.

# 그럼 서로 연결 조건이 있으면 조건이 맞는 컬럼들만 가져와라!
# 외래키 이용한다. 
select *
from menus,menu_categories
where menus.category_id = menu_categories.category_id;

# where 
#  1. 테이블 연결 (양쪽에 조건이 모두 만족해야 true으로 인식해서
#               데이터를 가져온다)
#  2. 조건 검색 

# 현재는 표준 join (테이블 합치기) 
#           조건을 줄때 on 조건 확인해서 붙이기!

# -1) 아메리카노가 어느 카테고리야? 조회해줄래?
select 
	*
from  menus as m
join  menu_categories as mc
	on m.category_id = mc.category_id;

# 테이블이름이 너무 길면 as 를 이용해서 별명을 달아준다. 
# 테이블 이름 앞글자만 따서 짧게 짓는다.
select 
	*
from  menus m
join  menu_categories mc
	on m.category_id = mc.category_id;
    
# 원하는 컬럼만 골라서 조회하고 싶다.
#  메뉴 아이디랑 메뉴이름 카테고리 이름     
select 
	m.menu_id,
    m.menu_name,
    mc.category_name
    
from  menus m
join  menu_categories mc
	on m.category_id = mc.category_id
where mc.category_name = '커피';
    
    
#실무에서는 회사마다 컨벤션이 있는 경우도 많다!
# 그래서 첫 글자 조합, 테이블 순서대로 m1,m2 가독성 높이고 싶을경우는
# 위에 처럼 테이블이름의 첫글자들을 조합을 해서 작성한다.
# 실무에서는 int만 쓰는것이 아니라 프로그램 자체의 데이터들의 
# 상황을 보고 BIGINT  - 단일 서버, 순서가 필요하다 (auto_increment)

# 유튜브 같이 여러대의 서버가 필요할 때 있다! 
#  (auto_increment) 서버들마다 id값이 충돌! 
#  UUID 도구를 이용해서 id값들을 랜덤으로 중복없이 뽑는 도구를 사용한다
#  라이브러리사용! 

# 검색할 때 UUID가 고유한 key로 동작하기때문에 자바에 map처럼 
# 금방 찾아준다! 검색 속도 올라간다!







