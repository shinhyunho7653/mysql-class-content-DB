# 파일명: having_where구별실습

# 1. 디비선택
use having_db;

# 2-1) 가격이 5000원 이상인 메뉴만 어떤 매장에서 팔렸는지 , 개별 판매 기록을
#     조회!
select
	*
from sales
where price >= 5000;

# -2) 7월 3일 이후에 판매된 기록만 뽑아서 최근 판매 현황을 조회!
#     판매기록 하나하나를 보면서 7월 3일보다 늦니?
#  where

select
	*
from sales
where sale_date >= '2026-07-03'
order by sale_date asc;

# 신촌점에서 판매된 기록만 따로 뽑아서 이후에 매장별 집계를 낼 떄 신촌점만 
# 대상으로 조회! where

select
	*
from sales
where store = '신촌점';

#---------------------------------------------------
# 매출 합계가 20000원 넘는 매장만 우수매장으로 선정하고 싶다!
# having
select 
    store,
    sum(price) as total_price
from sales
group by store
having sum(price) >= 20000;

# 평균 판매가 4900원 미만인 매장을 찾아서 저가 메뉴 위주인지
# 확인 조회!
select 
    store,
    avg(price) as avg_price
from sales
group by store
having avg(price) < 4900;

# --------------------------------------------------------------------------

# 1. 디비 생성
create database shop_db;
use shop_db;

# 2. 사용자 테이블
create table users(
    id  int  primary key  auto_increment,
    email  varchar(100)  not null  unique,
    nickname  varchar(50)  not null
);

# 3. 상품 테이블
create table products(
    id  int  primary key  auto_increment,
    name  varchar(100)  not null,
    price  int  not null,
    ptype  varchar(50)  not null   -- 상품 카테고리(의류, 전자기기 등)
);

# 4. 주문 테이블
create table orders(
    id  int  primary key  auto_increment,
    status  varchar(20)  default '결제대기',
    created_at  timestamp  default current_timestamp,
    user_id  int  not null,

    foreign key (user_id) references users(id)
);

# 5. 주문내역 테이블 (주문 하나에 여러 상품이 담김)
create table order_details(
    id  int  primary key  auto_increment,
    order_id  int  not null,
    product_id  int  not null,
    count  int  not null,

    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)
);

# 6. 결제 테이블
create table payments(
    id  int  primary key  auto_increment,
    amount  int  not null,
    ptype  varchar(50)  not null,   -- 결제수단(카드, 계좌이체 등)
    order_id  int  not null,

    foreign key (order_id) references orders(id)
);

# -------------------------------------------------------------------------

-- 회원 6명
insert into users(email, nickname) values
('kim@test.com', '김철수'),
('lee@test.com', '이영희'),
('park@test.com', '박민수'),
('choi@test.com', '최지은'),
('kang@test.com', '강동원'),
('han@test.com', '한소이');

-- 상품 6개
insert into products(name, price, ptype) values
('무선 이어폰', 89000, '전자기기'),
('블루투스 스피커', 45000, '전자기기'),
('가죽 지갑', 32000, '잡화'),
('면 티셔츠', 25000, '의류'),
('청바지', 55000, '의류'),
('운동화', 78000, '신발');

-- 주문 10건 (회원별로 주문 횟수 차이 나게 설계)
insert into orders(status, user_id) values
('결제완료', 1),  -- order_id 1
('결제완료', 1),  -- order_id 2
('결제완료', 1),  -- order_id 3
('배송중', 2),    -- order_id 4
('결제완료', 2),  -- order_id 5
('결제대기', 3),  -- order_id 6
('결제완료', 4),  -- order_id 7
('결제완료', 4),  -- order_id 8
('결제완료', 4),  -- order_id 9
('취소', 5);      -- order_id 10  (한소이:6번 회원은 주문 자체가 없음)

-- 주문내역 (order_id 1~10, 상품 여러 개씩)
insert into order_details(order_id, product_id, count) values
(1, 1, 1),   -- 김철수: 무선이어폰 1개
(1, 3, 2),   -- 김철수: 가죽지갑 2개
(2, 4, 3),   -- 김철수: 면티셔츠 3개
(3, 2, 1),   -- 김철수: 블루투스스피커 1개
(4, 6, 1),   -- 이영희: 운동화 1개
(5, 4, 1),   -- 이영희: 면티셔츠 1개
(6, 5, 1),   -- 박민수: 청바지 1개
(7, 1, 2),   -- 최지은: 무선이어폰 2개
(8, 6, 1),   -- 최지은: 운동화 1개
(9, 3, 1);   -- 최지은: 가죽지갑 1개

-- 결제 8건 (일부 주문은 아직 결제 안 됨 - 결제대기/취소 상태)
insert into payments(amount, ptype, order_id) values
(153000, '카드', 1),
(75000, '카드', 2),
(45000, '계좌이체', 3),
(78000, '카드', 4),
(25000, '카드', 5),
(178000, '카드', 7),
(78000, '계좌이체', 8),
(32000, '카드', 9);

# mysql 에서도 자동으로 ERD (테이블들 그림 확인)
# 사용자가 주문하고 -> 주문에는 여러 상품이 들어가고 -> 마지막에 결제
# 연결되어있는 중요한 테이블 (주문내역 테이블(order_details))
# 주문 안에 어떤 상품이 몇개 들어있는지 저장
# count 컬럼은 수량









