<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../manageHeader.jsp" %>
   <div id="rentImg">
      <div class="rentImgAdd">
         <div class="rentImgScroll">
            <h1>사진을 수정해주세요</h1>
            <div class="imgInfo">사진을 추가/삭제하면 자동으로 저장됩니다 ~~</div>
            <div class="rentImgWrap">
               <c:if test="${rent.filePathList[0] != null }">
                  <div class="mainImgSpace">
                     <div class="mainInputSpace hidden">
                        <input type="file" id="mainImg" class="fileImg" onchange="rentImgInputHandler(event)">
                        <div class="inputInfo">
                           <img src="http://192.168.64.200/picture.png">
                           <h3>
                           	      여기다 사진을 끌어다 놓으세요<br>
                           </h3>
                           <span>
				                              또는 공간을 클릭하여<br>
				                              업로드할 사진을 선택해주세요
                              <br><br>
                           </span>
                        </div>
                     </div>
                     <div class="mainImg">
                        <button class="mainImgDelete" onclick="imgDeleteHandler(event)">삭제</button>
                          <img class="preview-img addMainImg" src="${rent.filePathList[0] }">
                     </div>
                  </div>
               </c:if>
               <c:if test="${rent.filePathList[0] == null }">
                  <div class="mainImgSpace">
                     <div class="mainInputSpace">
                        <input type="file" id="mainImg" class="fileImg" onchange="rentImgInputHandler(event)">
                        <div class="inputInfo">
                           <img src="http://192.168.64.200/picture.png">
                           <h3>
                              	여기다 사진을 끌어다 놓으세요<br>
                           </h3>
                           <span>
				                              또는 공간을 클릭하여<br>
				                              업로드할 사진을 선택해주세요
                              <br><br>
                           </span>
                        </div>
                     </div>
                     <div class="mainImg hidden">
                        <button class="mainImgDelete" onclick="imgDeleteHandler(event)">삭제</button>
                          <img class="preview-img addMainImg">
                     </div>
                  </div>
               </c:if>
               <div class="subImg">
                  <div class="subImgWrap">
                  <c:forEach var="index" begin="1" end="4" step="1">
                     <c:if test="${rent.filePathList[index] == null }">
                        <div class="subImgSpace">
                           <div class="subInputSpace">
                              <input type="file" class="fileImg" onchange="rentImgInputHandler(event)">
                              <div class="subInfo">
                                 <img src="http://192.168.64.200/picture.png">
                              </div>
                           </div>
                           <div class="subImg hidden">
                              <button class="subImgDelete" onclick="imgDeleteHandler(event)">삭제</button>
                                <img class="preview-img addMainImg">
                           </div>
                        </div>
                     </c:if>
                     <c:if test="${rent.filePathList[index] != null }">
                        <div class="subImgSpace">
                           <div class="subInputSpace hidden">
                              <input type="file" class="fileImg" onchange="rentImgInputHandler(event)">
                              <div class="subInfo">
                                 <img src="http://192.168.64.200/picture.png">
                              </div>
                           </div>
                           <div class="subImg">
                              <button class="subImgDelete" onclick="imgDeleteHandler(event)">삭제</button>
                                <img class="preview-img addMainImg" src="${rent.filePathList[index] }">
                           </div>
                        </div>
                     </c:if>
                  </c:forEach>
                  </div>
               </div>
            </div>
            <div class="preFileUpload"><a href="${cpath }/rent/modify/${rent.idx }"><button>이전</button></a></div>
         </div>
      </div>
   </div>
   
   <script src="${cpath }/resources/script/rent/fileUpdate.js"></script>
   <script>
      const rentImg = document.getElementById('rentImg')
      const rentImgBtn = document.getElementById('rentImgBtn')
      let fileImgList = document.querySelectorAll('.fileImg')
      let subImgWrap = document.querySelector('.subImgWrap')
      const idx = ${rent.idx }
      const cpath = '${cpath }'
   </script>
</body>
</html>