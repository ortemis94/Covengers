<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
   String ctxPath = request.getContextPath();
%>

<jsp:include page="../covengers_header.jsp"></jsp:include>


<style type="text/css">

div#container {
   /* border: solid 1px yellow; */
   width: 1300px;
   margin: 30px auto;
   text-align: center;
}

div#menu {
   /*        border: solid 1px yellow; */
   width: 250px;
   margin: 100px auto;
   padding: 20px 20px;
   text-align: left;
   float: left;
}

div#miniContainer {
   /*      border: solid 1px red;  */
   width: 700px;
   margin: 0 auto;
   text-align: center;
   display: inline-block;
   float: left;
}

ul {
   padding: 0;
   /* line-height: 40px; */
   font-size: 12pt;
}

ul#menu>li {
   list-style: none;
   cursor: pointer;
   margin: 15px 0;
}

   
      
</style>

<script>
   $(document).ready(function(){
	   
      $(".filledstar").hide();
      $(".emptystar").show();
      
      for(var i = 0 ; i < ${review.rgrade}; i++) {
         $("div#star-rating span").eq(i).find(".emptystar").hide();
         $("div#star-rating span").eq(i).find(".filledstar").show();
      }
      
      $("button#updateReview").click(function(){
         var frm = document.updateReviewFrm
         frm.action = "<%= ctxPath%>/product/showReviewForm.com";
         frm.method = "POST";
         frm.submit();
      });
      
      $("button#deleteReview").click(function(){
         var frm = document.deleteReviewFrm
         frm.action = "<%= ctxPath%>/product/deleteReview.com";
         frm.method = "POST";
         frm.submit();
      });
   });
   
   
</script>
 
 
 <div id="container">
   <div id="menu">
   </div>
   <div id="miniContainer">
      <h1> ${review.krproductname} 리뷰 </h1>
      <hr style="border: solid 1px gray;">

      <div style="height: 80%; width: 80%; margin: auto" align="center" id="review">

         <div>
            <div>
               <div>
                    <label style="width: 100px; text-align: left; font-weight: bold; font-size: 20px;" for="name">작성자 : </label>
                    <input style="border: none; font-weight: bold; font-size: 20px;" type="text" id="email" value="${review.email}" readonly />
                </div>
                <div>
                    <label style="width: 100px; text-align: left; font-weight: bold; font-size: 20px;" for="mail">작성일 :  </label>
                    <input style="border: none; font-weight: bold; font-size: 20px;" type="text" id="krproductname" value="${review.rdate}" readonly />
                </div>
            </div>
            
            <br>
            <br>

            <div id="rcontents" style="border: black solid 1px; width: 60%; height: 300px; display: inline-block;" align="center">
               <span id="contents">${review.rcontents}</span>
            </div>



            <div id="star-rating" style="margin: 20px;">
               <c:forEach begin="1" end="5" varStatus="status">
                  <span id="grade${status.count}"   style="display: inline-block; width: 30px; height: 30px;">
                     <img class="emptystar" src="<%= ctxPath %>/images/whitestar.png" width="30px" height="30px">
                     <img class="filledstar" src="<%= ctxPath %>/images/blackstar.png" width="30px" height="30px">
                  </span>
               </c:forEach>               
               <br>
               <br>
               <br>
               <br>
               <div>
                  <c:if test="${review.fk_userno == sessionScope.loginuser.userno or sessionScope.loginuser.status > 1}">                  
                     <button type="button" id='updateReview' style="border-radius: 20px; color: white; width: 150px; height: 80; margin: 0 30px; background-color: black;">리뷰 수정</button>
                     <button type="button" id="deleteReview"style="border-radius: 20px; color: white; width: 150px; height: 80; margin: 0 30px; background-color: black;">리뷰 삭제</button>
                  </c:if>
                  <c:if test="${review.fk_userno != sessionScope.loginuser.userno or sessionScope.loginuser == null}">                  
                     <button type="button" id='getBack' onclick="javascript:location.href='<%= ctxPath%>/product/showReview.com'" style="border-radius: 20px; color: white; width: 150px; height: 80; margin: 0 30px; background-color: black;">목록으로</button>
                  </c:if>
               </div>
               <br>
               <br>
               <br>
               <br>
               <br>
               <br>
            </div>
            
            <form name="updateReviewFrm">
               <input type="hidden" name="reviewno" value="${review.reviewno}" />
            </form>
            
            <form name="deleteReviewFrm">
               <input type="hidden" name="reviewno" value="${review.reviewno}" />
               <input type="hidden" name="orderno" value="${review.fk_orderno}" />
               <input type="hidden" name="productcode" value="${review.fk_productcode}" />
            </form>

            
               
         </div>
      </div>
   </div>
</div>

<jsp:include page="../covengers_footer.jsp"></jsp:include> 