<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
   <script type="text/javascript">

   $(document).ready(function(){
      $("div#menu").find("span").each(function() {
         $(this).html("<img src='<%=ctxPath %>/images/perfumeicon3.png' width='25px;' height='25px;' />");
      });
      
      $("div#menu").find("li").hover(function(event) {
         $(this).find("span").html("<img src='<%=ctxPath %>/images/perfumeicon4.png' width='25px;' height='25px;' />");
      }, function(event) {
         $(this).find("span").html("<img src='<%=ctxPath %>/images/perfumeicon3.png' width='25px;' height='25px;' />");
      });
   });
   </script>

<div align="center" id="container">

   <div id="menu">

      <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마이페이지</h3>
      <ul id="menu">
         <li onclick="location.href='<%=ctxPath%>/mypage/myInfo.com'"><span></span>&nbsp;내
            정보 확인/수정</li>
         <li
            onclick="location.href='<%=ctxPath%>/member/shippingAddressLookup.com'"><span></span>&nbsp;배송지
            관리</li>
         <li onclick="location.href='<%=ctxPath%>/mypage/orderList.com'"><span></span>&nbsp;주문내역</li>
         <li onclick="location.href='<%=ctxPath%>/mypage/purchaseHistory.com'"><span></span>&nbsp;구매내역</li>
         <li onclick="location.href='<%=ctxPath%>/product/myCart.com'"><span></span>&nbsp;장바구니</li>
      </ul>
      
   </div>
   <div id="miniContainer" >
      <div>
         <h1>${message}</h1>
      </div>
      <br>
      <hr>
      <br>
      
      <div style="height: 70px;">
         <button type="button" style="border-radius: 15px; background-color: black; font-size: 15px; color: white; width: 200px; height: 70px; margin: 0 20px;" onclick="javascript:location.href='<%= ctxPath%>/mypage/purchaseHistory.com'">구매 내역 페이지로 돌아가기</button>
         
         <button type="button" style="border-radius: 15px; background-color: black; font-size: 15px; color: white; width: 200px; height: 70px; margin: 0 20px;" onclick="javascript:location.href='<%= ctxPath%>/product/showReview.com'">리뷰 게시판 이동</button>
         
      </div>   
   </div>
</div>

<jsp:include page="../covengers_footer.jsp"></jsp:include> 