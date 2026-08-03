# 파일명 : left조인실습

# 1. 디비 선택
use sns_db;

# 2. 전체 조회
select * from comments;
select * from photos;
select * from users;

# 3. left 조인을 위한 데이터 추가 (inser)
insert into users(nickname, email) values
('신인_박서준', 'newbie1@test.com'),   -- user_id = 4, 사진 없음
('연습생_김민지', 'newbie2@test.com'), -- user_id = 5, 사진 없음
('배우_한지민', 'hanjm@test.com'),     -- user_id = 6, 사진 있음
('가수_이준호', 'leejh@test.com');     -- user_id = 7, 사진 있음

insert into photos(caption, user_id) values
('팬미팅 현장', 6),           -- photo_id = 5, 댓글 없음
('공연 리허설 중', 6),        -- photo_id = 6, 댓글 없음
('신곡 발표 무대', 7),        -- photo_id = 7, 댓글 있음
('인터뷰 촬영 현장', 7);      -- photo_id = 8, 댓글 있음

insert into comments(body, user_id, photo_id) values
('신곡 대박이에요', 1, 7),
('무대 퍼포먼스 최고', 2, 7),
('인터뷰 잘 봤어요', 3, 8),
('목소리 좋네요', 6, 7);

select * from comments;
select * from photos;
select * from users;

# -------------------------------------------------------------------

# SNS앱의 " 전체 회원 관리"화면
#  이 회원이 뭘 올렸는지 한눈에 확인 (전체 사용자 + 올린 사진) join 
#  문제 - 처음 가입하고 아무것도 안 올린 사용자!
#    그러면 전체 회원 관리라고 할 수없다!

# 핵심 = 그러면 전체 회원을 기준으로 모든 행을 반드시 살려야되는구나!
#    left join이용해서 매칭을 하고 사진이 없는 사람들은 NULL 데이터가 조회된다

select *
from users u
left join photos p
	on u.user_id = p.user_id;

# -------------------------------------------------------------------

# 게시글 상세 페이지 하단에 댓글 목록을 보여줘야한다.
# 게시글은 있는데 댓글이 안 달린 게시글 (방금 올린 게시글) 댓글없음
# join 게시글테이블 + 댓글 테이블 (공통된 번호가 없으면) 데이터를 못가져온다.

# 게시글은 photos테이블로 대신 한다.
# 왼쪽 기준 테이블은 photos (게시글은 모두 살리기) 
# left join comments 붙이기 

select #4. 보여줘!
	*
from photos p					 #1. photos 기준 선택
left join comments c			 #2. comments 테이블을 붙인다.(연결)
	on p.photo_id = c.photo_id;  #3. user_id가 같은 데이터끼리 연결

# ------------------------------------------------------------------

# 우리 서비스 활동 현황 보려고한다.
# 사진만 올리고 댓글은 한번도 안쓴 눈팅형! 사용자가 누군지 파악
# 댓글을 안쓴 사용자도 포함!

# 기준 users , 연결할 테이블 comments 
# 코드 작성해서 누가 댓글을 안썼는지 전체 조회!
# 닉네임하고 body만 출력!

select u.nickname, c.body
from users u
left join comments c
	on u.user_id = c.user_id;

# 사용자별 사진 개수
# 관리자가 대시보드 "회원별 게시물 수" 랭킹을 보여주고싶다.
# 활동 없는 회원 사진 NULL 이라고 나오는게 아니라 정확히 0으로 표시하고
# 싶다 전체 조회를 해서 NULL이 아니라 정확히 0 개 - 힌트 count()
# nickname    photo_count	
# 배우_이도현    3
# 연습생_김민지  0

select 
	nickname,
    count(u.user_id) as photo_count
from users u
left join photos p
	on u.user_id = p.user_id
group by 
	u.user_id;








