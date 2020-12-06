<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../covengers_header.jsp"></jsp:include>

<%
  String ctxPath = request.getContextPath();
%>


<div align="center">
   <div style="margin: 0 auto; width: 80%; overflow: auto; background-color: white; margin: auto;">
      <div>
         <h1>결제가 완료 되셨습니다!</h1>
      </div>
      <br>
      <hr>
      <br>
      
      <div id="goPayment" style="margin: 20px;">
         <button type="button" style="border-radius: 15px; background-color: black; font-size: 20px; color: white; width: 30%; height: 70px; margin: 0 60px;">주문내역</button>
         
         <button type="button" style="border-radius: 15px; background-color: black; font-size: 20px; color: white; width: 30%; height: 70px; margin: 0 60px;" onclick="javascript:location.href='<%= ctxPath %>/product/myCart.com'">장바구니 돌아가기</button>
         
      </div>   
   </div>
</div>

<jsp:include page="../covengers_footer.jsp"></jsp:include> 