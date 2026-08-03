#파일명: 조인실습3_todo앱만들기

# 1. 디비 생성  
create database todos_db;

# 2. 디비 선택
use todos_db;

# 3. 테이블을 생성
# [상황]
# 회원이 할 일(todo)을 등록한다. 
# 할일 마다 " 누가 만들었는지" 어떤 카테고리인지" 필요하다!
#   카테고리: 업무, 공부, 개인일정 , 쇼핑, 병원,회사 (고객이 직접만들어서 사용)
# 계속 관리해야되는것!( 저장해야될 대상)
# 명사 : 회원, 할일 , 카테고리 

# 진짜 필요해? (여러개를 저장하니?)
# 회원 - 여러명 테이블O
# 할일 - 여러개 테이블o
# 카테고리 - 여러개 테이블O

# 회원테이블에 들어갈 컬럼(항목)
#  아이디, 비밀번호,이름, email

# 할일에 들어갈 컬럼(항목)
#  할일내용

# 어디에 카테고리를 연결? 외래키는 어디다 작성하지?
# 회원 한명이  할일이 여러개 만들 수있나요? O  (여러개 - 할일)
# 그러면 카테고리 하나에 할일이 여러개  있나요? O (여러개 - 할일)

# 회원 테이블에서 카테고리를 직접 연결하는 것?
#  - 한명의 회원은 한개의 카테고리를 하질 수있다 처럼 보일 수있다! 
#  - 원래 카테고리는 1번 공부 카테고리를 update를 하면 모든 할일이 2.쇼핑
#      잘못된 위치가 나오면 기존에 내용들이 버그를 유발할 수있다. 
# 중간테이블 
#  - 여러개의 데이터를 연결해서 사용할 수있도록!
#  - 각각으로 나눠진 테이블에서 공통적으로 사용하는 테이블! 
    
create table users(
    user_id  int  primary key  auto_increment,
    user_name  varchar(50)  not null
);

insert into users(user_name) values
('김철수'), ('이영희');

select * from users;


# 하나의 카테고리도 여러개의 할일을 가질 수 있다 
#   여러개 - 할일
create table categories(
    category_id  int  primary key  auto_increment,
    category_name  varchar(50)  not null
);

insert into categories(category_name) values
('업무'), ('개인'), ('공부');

select * from categories;


#--------------------------------------------
# 할일 테이블은 회원 입장에서 보면 회원 한명이 할일 여러개 가짐(1:N)

create table todos(
	todo_id  int  primary key  auto_increment,
    content  varchar(200)  not null,
    
    # 여러개의 할일이 어떤 user것 인지 알아야된다. 
    # 테이블 연결을 위해서 컬럼을 만든다. 연결테이블의 대표키를 숫자를 저장한다.
    user_id int ,
    category_id int , # 대표키를 저장하는 컬럼 타입은 꼭! 맞춰줘야된다!
    
    # 테이블 연결 설정!
    foreign key (user_id) references users(user_id),
    foreign key (category_id) references categories(category_id)
        
);
insert into todos(content, user_id, category_id) values
('보고서 작성', 1, 1),   -- 김철수 - 업무
('장보기', 1, 2),        -- 김철수 - 개인 (같은 회원, 다른 행!)
('회의 준비', 2, 1);     -- 이영희 - 업무 (같은 카테고리, 다른 행!)

select * from todos;

# 지금 가지고 있는 모든 테이블을 합치기 
# 전체 조회

# 1. 어떤 테이블 기준으로 선택
# 2. 연결할 테이블 선택
#     어떤 기준으로 테이블을 연결할 컬럼 선택할지
# 3. 전체 조회!

#  만약 내가 완료, 진행중, 대기  - 어쨌든 저장되는 값은 하나! 
# 만약 로그 기록들을 저장해야된다면  로그테이블을 만들어서 
#  진행상태 테이블로 나눠서 저장하는 것도 고려할 수있다.
# 한 시점에 값은 딱 하나만 가진다. 컬럼명
# 언제,누가,어떻게 상태가 바뀌는지 이력이 필요하다
# history 남기고 싶다
# 컬럼은 현재값 하나만 저장 (자바 변수)

select 
	*
from todos t
join users u
	on u.user_id = t.user_id
join categories c
	on c.category_id = t.category_id;
    
# 연결하는 컬럼명과 대표키 컬럼명이 똑같으면 조회를 할 때 
# on c.category_id = t.category_id; 너무길다 근데 컬럼명은 똑같다
# 그럴때 아래 using() 줄인다. 하지만 행동은 똑같이 한다. 
# using(컬럼명)

# 근데 양쪽컬럼이 다르면 어쩔 수 없이 on이용해서 조건에 맞는 
# 컬럼들만 조회해서 와야된다.!

# 업무 카테고리에 속한 할일만 보여줘! (select) 
# 보고서작성
# 회의준비!
# 1. 테이블 합칠때도 고민 ? 진짜 3개를 다 연결해야되나?
select 
	t.content
from  todos t   #1. 기준 중간 테이블선택
join categories c #2. 연결 테이블 선택!
	on t.category_id = c.category_id 
where c.category_name = '업무'
;


#  카테고리에 쇼핑목록을 추가해줘 
-- insert into categories(category_name) values
-- ('쇼핑');

-- select * from categories;









