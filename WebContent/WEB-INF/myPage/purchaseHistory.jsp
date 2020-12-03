<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
/*     	border: solid 1px yellow; */
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
		line-height: 30px;
		font-size: 12pt;
	}
	
	ul#menu > li{
		list-style: none;
		cursor: pointer;
		margin: 15px 0;
	}
	
	div#menu > ul {
		padding: 0;
		/* line-height: 30px; */
		font-size: 12pt;
	}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		// 마이페이지 메뉴부분 이미지 관련 코드.
	    $("div#menu").find("span").each(function() {
			$(this).html("<img src='<%=ctxPath %>/images/perfumeicon3.png' width='25px;' height='25px;' />");
		});
		
		$("div#menu").find("li").hover(function(event) {
			$(this).siblings("span").html("<img src='<%=ctxPath %>/images/perfumeicon3.png' width='25px;' height='25px;' />");
			$(this).find("span").html("<img src='<%=ctxPath %>/images/perfumeicon4.png' width='25px;' height='25px;' />");
		}, function(event) {
			$(this).find("span").html("<img src='<%=ctxPath %>/images/perfumeicon3.png' width='25px;' height='25px;' />"); 
		}); 
	  
	   ///////////////////////////////////////////////////

		
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
		<h1>구매내역</h1>
        <hr style="border: solid 1px gray;">
        <!-- 장바구니에 들어있는 상품이 없으면 -->
      <c:if test="">
         <span style="color: red; font-size: 20pt;">장바구니가 비었습니다.</span><br><br>
         <button id="goBack" type="button" class="btn btn-info">이전 페이지로</button>
      </c:if>

      <!--장바구니에 들어있는 상품이 있으면  -->
      <c:if test="">

         <span class="head">제품</span><span class="head">가격</span><span class="head">수량</span><span
            class="head">합계</span>
         <hr style="width: 680px; border: solid 1px gray;">

         <div id="allCheckBox">
            <input type="checkbox" id="allCheck" name="allCheck" /> <label for="allCheck">전체 선택/해제</label>
         </div>
         <br>


            <c:forEach var="product" items="${cartList}">
               <div class="item">
                  <input type="checkbox" class="individualCheck"><br>
                  <span class="left">${product.krproductname}</span><br>
                  <div class="productImg">
                     <img class="left" src="../images/${product.productimg1}" />
                  </div>
                  
                  <input class="ipPrice" type="hidden" value="${product.pprice}" /> 
                  <span class="cost left pPrice">￦<fmt:formatNumber value="${product.pprice}" pattern="#,###" /></span>
                  
                  <input class="poqty left" type="number" min="1" value="${product.poqty}" />
                  
				  <input class="itotalPrice" type="hidden" value="${product.totalprice}" />
                  <span class="cost left totalPrice">￦<fmt:formatNumber value="${product.totalprice}" pattern="#,###" /></span><br>
                  
                  <button type="button" class="individualDelete mybtn2">삭제</button>
                  <button type="button" class="save mybtn2">저장</button>
                  <input type="hidden" class="cartno" value="${product.cartno}" />
                  <input type="hidden" class="optionno" value="${product.fk_optioncode}" />
               </div>
               <br><br>

            </c:forEach>


         <div id="rightDiv" class="order-wrap">
         	<form name="cartForm">
               <input type="hidden" name="purchasecartno" value="" />
               <input type="hidden" name="purchaseoption" value="" />
  		       <input type="hidden" name="sumPrice" value="" />
  		       <input type="hidden" name="deliveryCharge" value="" />
  		       <input type="hidden" name="totalCost" value="" />
         	</form>
               <ul class="order-con">
			      <li>
			         <span>전체 품목 합계</span>
			       	 <span id="sumPrice">0</span><span>￦</span>
			      </li>
			      <li>
			         <span>배송비</span>
		 			 <span id="deliveryCharge">0</span><span>￦</span>
			      </li>
			      <li>
			         <span>총합계</span>
			         <span id="totalCost">0</span><span>￦</span>
			      </li>
			   </ul>
			   <div class="order-btn">
			      <button id="checkedCardSlash" type="button" class="mybtn">선택 상품 결제하기</button>
			      <button id="cardSlash" type="button" class="mybtn">전체 상품 결제하기</button>
			   </div>
            </div>
		 
         <button id="selectDelete" type="button" class="left mybtn">선택삭제</button>
         <button id="allDelete" type="button" class="left mybtn">전체삭제</button>


      </c:if>
        
        
        
        
        
   	</div>
</div>
    
  