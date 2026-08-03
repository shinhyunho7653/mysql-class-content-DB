# 파일명: 조인실습_SNS

#1.디비 생성
create database sns_db;

#2.디비 선택
use sns_db;

#3. 테이블 생성 
create table users(
    user_id  int  primary key  auto_increment,
    nickname  varchar(50)  not null,
    email  varchar(100)
);

insert into users(nickname, email) values
('배우_이도현', 'leedh@test.com'),
('한소이_actor', 'hansoi@test.com'),
('강태오_official', 'kangto@test.com');

select * from users;

#-------------------------------------------
create table photos(
    photo_id  int  primary key  auto_increment,
    caption  varchar(200),
    user_id  int,

    foreign key (user_id) references users(user_id)
);

insert into photos(caption, user_id) values
('오늘 촬영장 현장 📸', 1),
('시사회 레드카펫', 2),
('대본 리딩 중', 1),
('신작 포스터 공개!', 3);

select * from photos;

#-----------------------------------------------
create table comments(
    comment_id  int  primary key  auto_increment,
    body  varchar(200),
    user_id  int,
    photo_id  int,

    foreign key (user_id) references users(user_id),
    foreign key (photo_id) references photos(photo_id)
);

insert into comments(body, user_id, photo_id) values
('연기 미쳤다 진짜', 2, 1),
('이 작품 기대돼요', 3, 1),
('멋있어요', 3, 1),
('드레스 너무 예뻐요', 1, 2),
('레드카펫 완전 소화', 3, 2),
('대본리딩 현장 궁금했는데', 2, 3),
('포스터 언제 공개된거예요?', 1, 4);

select * from comments;

# 수업 55분에 시작
# 테이블들이 어떻게 연결되었는지 코드 가독!
# 실제로 전체 테이블을 붙여보는 코드 작성시 기준이 되는 테이블이 뭘까?






