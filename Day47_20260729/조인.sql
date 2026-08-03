# 명사 - 엑셀 시트 하나 만든다.(표하나)
#      저장 해야 하는 대상!
#  계속 저장할 값이 어떤거지?
#  호텔,객실(잔여수),손님, 예약!

# 동사 - 행동(연결방법)
#    대상과 대상의 관계
#  손님이 객실을 예약한다. 

# 손님은 예약! -> 예약 -> 객실!
# 외래키 (mysql 정해놓은 키워드)
# forgin key  (FK)
# 테이블과 테이블을 연결하는 제약조건!

# 1. join_db 생성
create database join_db;

# 2. 디비 선택
use join_db;

# 3. 테이블 생성을 위해서 명사 찾기
# [상황]
# 카페에서 메뉴판을 관리하려고 합니다.
# 메뉴는 "커피", "논커피", "티" 같은 카테고리로 분류되어 있고,
# 하나의 카테고리에는 여러 개의 메뉴가 속합니다.

# 명사 - 카테고리, 메뉴

# 1:N 관계 판단(테이블연결)
# 카테고리 하나에 메뉴가 몇개? -> 여러개 (many)
# 메뉴 하나가 카테고리를 몇개 가지고 있나? -> 1개
#	아메리카노는 "커피" 카테고리 하나뿐
# 메뉴 테이블에 카테고리번호 (FK) 를 넣는다

#4. 실제 테이블 만들기
#   카테고리 테이블 (커피, 논커피, 티)
create table menu_categories(
	#컬럼명(항목)  타입  대표키(기본키)  자동으로 1씩 증가(시작1부터)
    category_id  int  primary key  auto_increment,
    
    #컬럼명(항목)        타입      빈 값 허용안함!(무조건 값저장)
    category_name  varchar(50)  not null
);
insert into menu_categories(category_name) values
('커피'),
('논커피'),
('티');

# 구조 확인
desc menu_categories;

# 전체 조회 (값 확인)
select * from menu_categories;

# 5. 테이블 하나 더 생성
# 메뉴 테이블 (카테고리번호 FK로 연결)
create table menus(
    menu_id  int  primary key  auto_increment,
    menu_name  varchar(50)  not null,
    price  int,
	
    # 테이블 연결한 번호를 저장하는 컬럼 하나 만든다
    category_id int,
    
    # 어떤 테이블과 연결할지 설정
    foreign key (category_id) references menu_categories(category_id)
);

insert into menus(menu_name, price, category_id) values
('아메리카노', 4500, 1),
('카페라떼', 5000, 1),
('초코라떼', 5500, 2),
('딸기스무디', 6000, 2),
('얼그레이', 5000, 3);

# 구조확인
desc menus;

# 값 확인 (전체 조회)
select * from menus;







