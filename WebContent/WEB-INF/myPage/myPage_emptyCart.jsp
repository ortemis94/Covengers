<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%>    

<jsp:include page="../covengers_header.jsp"></jsp:include>

<style type="text/css">

	div#container {
      /* border: solid 1px yellow; */
       width: 1200px;
       margin: 30px auto;
       text-align: center;
    }

    div#miniContainer {
/*       border: solid 1px red; */
       width: 700px;
       margin: 0 auto;
       text-align: center;
       display: inline-block;
    }

</style>

<script>

	$(document).ready(function() {
		
		// === "로그인하기" 버튼을 누르면 로그인 페이지로 이동함.
		$("button#goLogin").click(function() {
			
			location.href="<%= ctxPath%>/main.com";
			
		});// end of $("button#goLogin").click(function() {});---------------------

		// === "이전페이지로" 버튼을 누르면 직전 페이지로 이동함.
		$("button#goBack").click(function() {
			
			history.back();
			// location.href="javascript:history.back();";
			
		});// end of $("button#goBack").click(function() {});----------------------
		
	});// end of $(document).ready(function() {});---------------------------------

</script>
<!-- <body style="height: 100%;"> -->
	<div id="container">
		<div id="miniContainer">
			<h2 >장 바 구 니</h2>
			
			<hr style="border: solid 1px gray;">
		
			<span style="color: red; font-size: 20pt;">로그인을 진행해주세요.</span><br><br>
			<!-- <span style="color: red;">로그인</span><span>을 진행해주세요.</span><br><br> -->
			
			<!-- <button id="goLogin" type="button" class="btn btn-info">메인 페이지로</button> -->
			<button id="goBack" type="button" class="btn btn-info">이전 페이지로</button>
		</div>
	</div>

<jsp:include page="../covengers_footer.jsp"></jsp:include>

