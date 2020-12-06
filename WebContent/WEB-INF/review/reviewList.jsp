<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
   String ctxPath = request.getContextPath();
%>

<jsp:include page="../covengers_header.jsp"></jsp:include>



<style type="text/css">

body {
  font-family: "Open Sans", sans-serif;
  color: #444444;
  height: 100%;
  margin: 0;
}

   div#container {
      /* border: solid 1px yellow;  */
      width: 100%;
      margin: 30px auto;
      padding-bottom: 200px;
      text-align: center; 
    }
   
   div#miniContainer {
      /* border: solid 1px red; */ 
      width: 80%;
      margin: 0 auto;
      text-align: center;
      display: inline-block;
    }

   button.mybtn:hover {
           font-weight: bold;
    }
   
    button.mybtn {
         border: none;
           margin: 10px 10px;
           padding: 7px 7px;
           background-color: #eee;
           color: #444;
           border-radius: 5%;
           float: right;
      }
      
      div.board {
         background-color: #f2f2f2;
         width: 100%;
         height: 40px;
         cursor: pointer;
         margin: 0 auto;
         padding: 5px;
      }
      
      div.board:hover {
         background-color: #ccc;
      }
      
</style>

<script>
   $(document).ready(function(){
      
      $(".emptystar").show();
      $(".filledstar").hide();
      $(".rgrade").hide();
      
      
      $.each($("span.rgrade"), function(index, item){
         console.log(index);
         for(var i = 0 ; i < Number($(this).text()); i++) {
            $("div.star-rating").eq(index).find("span").eq(i).find(".emptystar").hide();
            $("div.star-rating").eq(index).find("span").eq(i).find(".filledstar").show();
         }
      });
      
      
      
      
      
      
      $("div.board").click(function(){
         location.href = "<%= ctxPath%>/product/showOneReview.com?reviewno=" + $(this).find('.reviewno').val();
      });
   })

</script>


   <div id="container">
      <div id="miniContainer">
      
         <h1>리뷰보기</h1>
            <hr style="border: solid 1px gray;">   
            
            <!-- <form name="memberFrm">
            <select id="searchType" name="searchType">
               <option value="name">회원명</option>
               <option value="userid">아이디</option>
               <option value="email">이메일</option>
            </select> <input type="text" id="searchWord" name="searchWord" /> <input
               type="text" style="display: none;">
            <button type="button" onclick="goSearch();" style="margin-right: 30px;"
               id="search">검색</button>
         
            <span style="color: red; font-weight: bold; font-size: 12pt;">페이지당
               회원명수-</span> <select id="sizePerPage" name="sizePerPage">
               <option value="10">10</option>
               <option value="5">5</option>
               <option value="3">3</option>
            </select>
         </form> -->
         
         <c:if test="${reviewList.size() eq 0}">
            <h2>등록된 리뷰가 없습니다.</h2>
         </c:if>
         
         <c:if test="${reviewList.size() ne 0}">
            <c:forEach var="review" items="${reviewList}">
               <div class="board well" style="border:solid 1px gray; margin-bottom:10px;" align="center">
                  <input class="reviewno" name="reviewno" type="hidden" value="${review.reviewno}" />
                  <label style="color: #cc66ff; height: 100%; width: 18%; text-align: left;">${review.email}</label>&nbsp;&nbsp;&nbsp;
                  
                  <span class="rgrade">${review.rgrade }</span>
                  <div class="star-rating" style="height: 100%; width:100px; text-align: left; display: inline-block;">
                  
                     <c:forEach begin="1" end="5" varStatus="status">
                        <span id="grade${status.count}"   style="display: inline-block; width: 15px; height: 15px;">
                        <img class="emptystar" src="<%= ctxPath %>/images/whitestar.png" width="15px" height="15px">
                        <img class="filledstar" src="<%= ctxPath %>/images/blackstar.png" width="15px" height="15px">
                        </span>
                     </c:forEach>
         
                  </div>
                  &nbsp;&nbsp;
                  <label style="color: #cc66ff; height: 100%; width: 150px; text-align: left;">${review.fk_productcode}</label>&nbsp;&nbsp;&nbsp;
                  
                  <c:if test="${fn:length(review.rcontents) <= 16 }">
                     <label style="color: #cc66ff; height: 100%; width: 35%; text-align: left;">${review.rcontents }</label>&nbsp;&nbsp;&nbsp;
                  </c:if>
                  
                  <c:if test="${fn:length(review.rcontents) > 16 }">
                     <c:set var="contents" value="${ fn:substring(review.rcontents, 0, 16)}"></c:set>
                     <c:set var="contents" value="${fn:replace(contents,'<br>', ' ') }"></c:set>
                     <label style="color: #cc66ff; height: 100%; width: 35%; text-align: left;">${contents }...</label>&nbsp;&nbsp;&nbsp;
                  </c:if>

                  <label>${review.rdate}</label>
               </div>
            </c:forEach>
         </c:if>
         
         <br>
         <div>${pageBar}</div>
      
      </div>
   </div>



<jsp:include page="../covengers_footer.jsp"></jsp:include>

