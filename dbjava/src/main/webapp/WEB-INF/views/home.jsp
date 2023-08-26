<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	<main class="homeMain">
		<div class="categories">
            	<div class="categorieImgBox"><img src="http://192.168.64.200/펜션.png" class="categoryImg"><p>펜션</p></div>
            	<div class="categorieImgBox"><img src="http://192.168.64.200/풀빌라.png" class="categoryImg"><p>풀빌라</p></div>
                <div class="categorieImgBox"><img src="http://192.168.64.200/호텔.png" class="categoryImg"><p>호텔</p></div>
                <div class="categorieImgBox"><img src="http://192.168.64.200/리조트.png" class="categoryImg"><p>리조트</p></div>
                <div class="categorieImgBox"><img src="http://192.168.64.200/글램핑.png" class="categoryImg"><p>글램핑</p></div>
                <div class="categorieImgBox"><img src="http://192.168.64.200/캠핑.png" class="categoryImg"><p>캠핑</p></div>
                <div class="categorieImgBox"><img src="http://192.168.64.200/게스트하우스.png" class="categoryImg"><p>게스트하우스</p></div>
                <div class="categorieImgBox"><img src="http://192.168.64.200/한옥.png" class="categoryImg"><p>한옥</p></div>
                <div class="categorieImgBox"> <img src="http://192.168.64.200/료칸.png" class="categoryImg"><p>료칸</p></div>
        </div>
		<div class="roomBox">
			<c:forEach var="dto" items="${list }">
				<a href="${cpath }/rent/room/${dto.idx}">
					<div class="room">
						<img src="${dto.filePath }" class="roomImg">
						<span>${dto.title }</span>
						<span>${dto.price }원</span>
					</div>
				</a>
			</c:forEach>
		</div>		
	</main>

</body>
</html>