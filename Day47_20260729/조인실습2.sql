#파일명: 조인실습2
#1. 디비선택
use join_db;

# [상황]
# 카페에 회원가입한 손님이 있고, 손님이 메뉴를 주문합니다.
# 명사: 회원, 메뉴, 주문

# [판단]
#  - 회원이 여러명? -> 테이블
#  - 회원 한명이 주문을 여러번? -> 주문 테이블 필요
#  - 그래서 "주문" 테이블에 회원번호(FK) + 메뉴번호(FK) 둘 다 넣는다
# ----------------------------------------------------------

# 회원 여러명을 저장하는 테이블 생성
create table users(
    user_id  int  primary key  auto_increment,
    user_name  varchar(50)  not null
);
insert into users(user_name) values
('김철수'),
('이영희');

select * from users;

# 김철수가 아메리카노를 주문했다!
# 이미 메뉴라는 테이블에 아메리카노라는 정보가 있다
# 메뉴명이 있는데 굳이 또 orders에 컬럼명을 이용해서 값을 또 저장한다?
# 주문 테이블 입장에서는 여러명의 사람이 주문 아메리카노 10명 
# 테이블들끼리 연결해서 가져오면된다.


create table orders(
	#주문도 순서대로 받아서 만들어줘야된다.
    order_id int primary key auto_increment,
	
    # 이미 만들어진 메뉴테이블을 연결하자!
    menu_id int,  # 값을 저장하는게 아니라 메뉴테이블의 번호를 저장 
    
    # user들의 정보도 연결하자!
    user_id int ,
    
    # 연결할 테이블들을 설정 
    # menu_id orders(내) 컬럼에 menus 테이블을 연결할께 대표key이용해서!
    foreign key (menu_id) references menus(menu_id),
    foreign key (user_id) references users(user_id)    
);
desc orders;
select * from orders;

insert into orders (menu_id, user_id) values 
(1,1),
(1,2),
(3,1)
;
# 테이블 연결 후 전체조회!
select 
	*
from orders o         #1. 기준이 되는 테이블 선택!
join menus m   #2. 연결할 테이블 선택!
	on o.menu_id = m.menu_id
join users  u
	on u.user_id = o.user_id;

# 특정 조건을 이용해서 1번 주문번호가 어떤 고객이 어떤음료를 
# 시켰는지 조회!
select 
	o.order_id ,
    m.menu_name,
    u.user_name
from orders o         #1. 기준이 되는 테이블 선택!
join menus m   #2. 연결할 테이블 선택!
	on o.menu_id = m.menu_id
join users  u
	on u.user_id = o.user_id
where
 o.order_id = 1
;

# MUL = Multiple 
# 같은 값이 여러번 나올 수 있는 컬럼!
# 외래키 중에 똑같은 값들이 여러번 저장될 수있다.
# 테이블연결키 번호가 여러번 저장될 수있다! 
# 커피 - 아메리카노의 카테고리번호 저장, 카페라떼 카테고리번호 저장



