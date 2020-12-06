<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      width: 250px;
      margin: 100px auto;
      padding: 20px 20px;
      text-align: left;
      float: left;
   }
      
   div#miniContainer {
      width: 700px;
      margin: 0 auto;
      text-align: center;
      display: inline-block;
      padding-bottom: 13%;
      float: left; 
   }
   
   ul {
      padding: 0;
      /* line-height: 40px; */
      font-size: 12pt;
   }
   
   ul#menu > li{
      list-style: none;
      cursor: pointer;
      margin: 15px 0;
   }
   

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

   $(document).ready(function() {
      
      $("div#menu").find("span").each(function() {
         $(this).html("<img src='<%=ctxPath %>/images/perfumeicon3.png' width='25px;' height='25px;' />");
      });
      
      $("div#menu").find("li").hover(function(event) {
         $(this).find("span").html("<img src='<%=ctxPath %>/images/perfumeicon4.png' width='25px;' height='25px;' />");
      }, function(event) {
         $(this).find("span").html("<img src='<%=ctxPath %>/images/perfumeicon3.png' width='25px;' height='25px;' />");
      });
      
   });// end of $(document).ready(function() {});-----------------------------

</script>

<div id="container">
   <div id="menu">
      
      <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마이페이지</h3>
      <ul id="menu">
         <li onclick="location.href='<%= ctxPath%>/mypage/myInfo.com'"><span></span>&nbsp;내 정보 확인/수정</li>
         <li onclick="location.href='<%= ctxPath%>/member/shippingAddressLookup.com'"><span></span>&nbsp;배송지 관리</li>
         <li onclick="location.href='<%= ctxPath%>/mypage/orderList.com'"><span></span>&nbsp;주문내역</li>
         <li onclick="location.href='<%= ctxPath%>/mypage/purchaseHistory.com'"><span></span>&nbsp;구매내역</li>
         <li onclick="location.href='<%= ctxPath%>/product/myCart.com'"><span></span>&nbsp;장바구니</li>
      </ul>
   </div>
      <div id="miniContainer">
      <h1>주문내역</h1>
        <hr style="border: solid 1px gray;">
        
        <c:forEach var="order" items="${orderList}">
        ${order.o_paymentno}<br>
        ${order.o_fk_userno}<br>
        ${order.o_totalprice}<br>
        ${order.o_paymentdate}<br>
        ${order.o_fk_shippingno}<br>
        
        ${order.o_pdetailno}<br>
        ${order.o_fk_optioncode}<br>
        ${order.o_krproductname} ${order.o_optionname} ${order.o_orderqty}개<br>
        ${order.o_optionname}<br>
        ${order.o_price}<br>
        ${order.o_orderqty}<br>
        <br>
        </c:forEach>
        
        
      </div>
</div>
    
<jsp:include page="../covengers_footer.jsp"></jsp:include>     