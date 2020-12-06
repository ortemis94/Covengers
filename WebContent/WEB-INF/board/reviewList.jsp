<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰목록 페이지</title>
</head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>

	$(document).ready(function() {
		
		$("button#registbtn").click(function() {
			
		});
		
	});// end of $(document).ready(function() {}-------------------------

</script>

	<div id="container">
		<h1>리 뷰</h1>
      	<hr style="border: solid 1px gray;">
		
		<div id="item">
		
		</div>
	
		<button id="registbtn" class="btn btn-info btn-lg" data-toggle="modal" data-target="#selectPerchase">후기 등록</button>

  		<!-- 구매내역 고르기 Modal -->
	  	<div class="modal fade" id="selectPerchase" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      	<div class="modal-content">
		        	<div class="modal-header">
		          		<button type="button" class="close" data-dismiss="modal">&times;</button>
		          		<h4 class="modal-title">리뷰상품 선택</h4>
		        	</div>
		        	<div class="modal-body">
		          		상품 넣기
		          		
		        	</div>
		        	<div class="modal-footer">
		        		<button id="selectBtn" type="button" class="btn btn-default">선택</button>
		        		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		        	</div>
		      	</div>
		      
		    </div>
	  	</div>
  
  
	</div>
	
<jsp:include page="../covengers_footer.jsp"></jsp:include> 