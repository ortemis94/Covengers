<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../covengers_header.jsp"></jsp:include>

<%
  String ctxPath = request.getContextPath();
%>


	<div id="paymentEndContainer">
		<div>
			<div>
				<h3>결제가 완료 되셨습니다!</h3>
			</div>
			<br>
			<hr>
			<br>
			<div>
				<span>주문내역</span>&nbsp;&nbsp;&nbsp;
				<span onclick="javascript:location.href='<%= ctxPath %>/product/productDisplay.com'">쇼핑하기</span>
			</div>
		</div>
	</div>
</body>

</html>