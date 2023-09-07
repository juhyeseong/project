<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	<div class="homeMain">
		<div class="wishListInfo">
			<h1>내가 찜한 숙소</h1>
			<span>삭제는 좋아요를 한번 더 누르시면 삭제됩니다</span>
		</div>
		<div class="roomBox">
			<c:forEach var="dto" items="${wishList }">
					<div class="room">
						<a href="${cpath }/rent/room/${dto.rent}">
							<img src="${dto.filePath }" class="roomImg">
						</a>
						<div class="roomItemInfo">
							<div>
								<span class="ellipsis">${dto.title}</span>
								<span class="roomPrice"><fmt:formatNumber value="${dto.price }" groupingUsed="true"/>원</span> 
							</div>
							<div class="wish">
								<img  src="http://192.168.64.200/heart.png">
							</div>
							<input type="hidden" value="${dto.rent }">
						</div>
					</div>
			</c:forEach>
		</div>		
	</div>
	
	<script>
		const wishBtnList = document.querySelectorAll('.wish')
	    const loginIdx = '${login.idx }'
	    const cpath = '${cpath }'
	    
	    function wishDeleteHandler(event) {
	    	const target = event.target
	    	const rentIdx = target.parentNode.parentNode.children[2]
	    	const opt = {
    				method: 'POST',
    				headers:  {
    					'CONTENT-TYPE' : 'application/json; charset=utf-8'
    				},
    				body: JSON.stringify({
    					rent: rentIdx.value,
    					member: loginIdx
    				})
    		}
    		const url = cpath + '/wishList/deleteWishList'
    		
    		console.log(loginIdx)
    		console.log(rentIdx.value)
    		
    		fetch(url, opt)
    		location.reload()
	    }
	    
	    wishBtnList.forEach(wishBtn => wishBtn.onclick = wishDeleteHandler)
	</script>
</body>
</html>