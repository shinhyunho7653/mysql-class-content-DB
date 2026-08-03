use olineshoppingmall;

# sum()
#  - 합계를 구하는 함수

# 모든 상품 가격의 합계
# 합계를 보기가 힘들다!
select 
	sum(price)
from 
	product;
    
# format(숫자(컬럼명),소수점 자리수) 
#  숫자를 사람이 읽기 좋은 문자열로 바꿔주는 함수!
#  천 단위마다 콤마를 자동으로 넣어준다.
#   두번째 소수점 자리 0으로 하면 330000  -> 330,000
#        소수점 자리 2으로 하면 330000  -> 330,000.00
select 
	format(1234567,0);


select 
	# 가격은 소수점이 없이 보여줘!
	format(sum(price),0)
from 
	product;
    
# 삼성 상품 가격의 합계 구하시오!
select 
	# 가격은 소수점이 없이 보여줘!
	format(sum(price),0)
from 
	product
where 
	brand ="삼성";

# 재고의 총합 구하시오!    
select 
	
	sum(stock)
from 
	product;
    
    
# 매출/정산 - 가장 많이 쓰이는 용도!
# 장바구니 / 주문 총액 계산 
#  계산식을 먼저 만들고 그걸 합산 하는 패턴이 실무에서 매우 흔함
#  sum(price * quantity)
# 포인트/ 적립금 시스템 
#  - 실제로 계속 sum()하게 되면 성능저하(느리다) update 로 관리하는 경우가
#    있다.
# sum() NULL을 자동으로 무시한다( 그냥 빼고 계산  )
#  실무에서 종종 실수하는 포인트! sum() count() 주의해서확인!