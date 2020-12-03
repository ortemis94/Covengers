<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../covengers_header.jsp"></jsp:include>

<%
  String ctxPath = request.getContextPath();
%>

<style type="text/css">
	.payment-form {
        padding-bottom: 50px;
        font-family: 'Montserrat', sans-serif;
    }

    .payment-form.dark {
        background-color: #f6f6f6;
    }

    .payment-form .content {
        box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
        background-color: white;
    }

    .payment-form .block-heading {
        padding-top: 50px;
        margin-bottom: 40px;
        text-align: center;
    }

    .payment-form .block-heading p {
        text-align: center;
        max-width: 420px;
        margin: auto;
        opacity: 0.7;
    }

    .payment-form.dark .block-heading p {
        opacity: 0.8;
    }

    .payment-form .block-heading h1,
    .payment-form .block-heading h2,
    .payment-form .block-heading h3 {
        margin-bottom: 1.2rem;
        color: #3b99e0;
    }

    .payment-form form {
        border-top: 2px solid #5ea4f3;
        box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
        background-color: #ffffff;
        padding: 0;
        max-width: 600px;
        margin: auto;
    }

    .payment-form .title {
        font-size: 1em;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        margin-bottom: 0.8em;
        font-weight: 600;
        padding-bottom: 8px;
    }

    .payment-form .products {
        background-color: #f7fbff;
        padding: 25px;
    }

    .payment-form .products .item {
        margin-bottom: 1em;
    }

    .payment-form .products .item-name {
        font-weight: 600;
        font-size: 0.9em;
    }

    .payment-form .products .item-description {
        font-size: 0.8em;
        opacity: 0.6;
    }

    .payment-form .products .item p {
        margin-bottom: 0.2em;
    }

    .payment-form .products .price {
        float: right;
        font-weight: 600;
        font-size: 0.9em;
    }

    .payment-form .products .total {
        border-top: 1px solid rgba(0, 0, 0, 0.1);
        margin-top: 10px;
        padding-top: 19px;
        font-weight: 600;
        line-height: 1;
    }

    .payment-form .card-details {
        padding: 25px 25px 15px;
    }

    .payment-form .card-details label {
        font-size: 12px;
        font-weight: 600;
        margin-bottom: 15px;
        color: #79818a;
        text-transform: uppercase;
    }

    .payment-form .card-details button {
        margin-top: 0.6em;
        padding: 12px 0;
        font-weight: 600;
    }

    .payment-form .date-separator {
        margin-left: 10px;
        margin-right: 10px;
        margin-top: 5px;
    }

    @media (min-width: 576px) {
        .payment-form .title {
            font-size: 1.2em;
        }

        .payment-form .products {
            padding: 40px;
        }

        .payment-form .products .item-name {
            font-size: 1em;
        }

        .payment-form .products .price {
            font-size: 1em;
        }

        .payment-form .card-details {
            padding: 40px 40px 30px;
        }

        .payment-form .card-details button {
            margin-top: 2em;
        }
    }

    .border-none {
        border: none;
        width: 100px;
    }
</style>


<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

<script type="text/javascript">

	$(document).ready(function () {
    	
		$("input:checkbox[name=usepoint]").click(function(){
			
			var ischecked = $(this).prop('checked');
			
			if(ischecked){
				if(${member.point} >= ${paraMap.totalCost}) {
					$("span#minus-price").text(${paraMap.totalCost});
					$("span#payment-price").text("0");
				} else {
					$("span#minus-price").text(${member.point});
					var total = Number("${paraMap.totalCost}") - Number("${member.point}")
					$("span#payment-price").text(total);
				}
			 } else {
				$("span#minus-price").text("0");
				$("span#payment-price").text(${paraMap.totalCost});
			 }
		});
		
		
		
		
		
		
		$("input.fk_optioncode").each(function(index, item){
			optioncodeList.push($(this).val());
		});
		
		
	});
	var optioncodeList = new Array();
    
	

    function goPayment() {
    	
    	var flag = false;
    	
    	var length = $("input:radio[name=address]:checked").length;
    	
    	if(length == 0){
    		alert("배송지를 선택해야쥬??");
    		flag = true;
    	}
    	
    	if (!flag) {
	    	var frm = document.paymentFrm;
             
    	    window.open("", "popupOpener", "left=50%, top=50%, width=1000px, height=1000px");
    	    
	    	frm.fk_optioncodeList.value = optioncodeList;
	    	frm.shipping.value = $("input:radio[name=address]:checked").val();
	    	frm.total.value = $("span#payment-price").text();
    	    frm.ischecked.value = $("input:checkbox[name=usepoint]").prop("checked");
	    	
	    	frm.target = "popupOpener";
    		frm.action = "<%= ctxPath %>/payment/realPayment.com";
    		frm.method = "POST";
    		frm.submit();
    		frm.target  = "_self";

    	}
    	
    	
    	
    	
    }
    
    function goHome(){
    	location.href="/Covengers/main.com"
    }
    
    function goFinal() {
    	 var frm = document.paymentFinalFrm;
       
         
         frm.total.value = $("span#payment-price").text();
         frm.shipping.value = $("input:radio[name=address]:checked").val();
         frm.ischecked.value = $("input:checkbox[name=usepoint]").prop("checked");
         
         frm.action = "<%= ctxPath%>/payment/paymentEnd.com";
         frm.method = "POST";
         frm.submit();
    }

</script>


<div id="pre_payment" align="center">
	<div id="payment" style="margin: 0 auto; width: 70%; height: 100%; overflow: auto; background-color: white; margin: auto;">
		<div id="contents_title">
			<h2>결제정보확인</h2>
		</div>
		
		<hr style="border: solid 1px black;">
		
		<div id="contents_pre_payment" style = "width: 100%; height: 90%; border: 0.5px gray thin;">
		
			<div id="userInfo" align="center">
			
				<table style="font-size: 15px;">
					<tr>
						
						<th>기본정보 확인</th>
						<th style = "width: 50px;"""></th>
						
						<th>
							<span>구매자 주소지</span>
						</th>
						</tr>
						<tr>
						<td>
							<span>구매자 이름 : </span><span>${member.name}</span>
							<br>
							<span>구매자 이메일 : </span><span>${member.email}</span>
							<br>
							<span>구매자 전화번호 : </span><span>${member.mobile}</span>
							<br>
						</td>
						<td>           </td>
						<td>
							<c:choose>
								<c:when test="${not empty member.postcode && not empty member.address && not empty member.detailAddress}">
									<span>우편번호 : ${member.postcode}</span> <br>
									<span>주소 : ${member.address}</span> <br>
									<span>상세 주소 : ${member.detailAddress}</span> <br>
									<span>비고 : ${member.extraAddress}</span> <br>			
								</c:when>
								<c:otherwise>
									<span>기본 주소가 입력이 되어있지 않습니다.</span>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
				<br>
				
			</div>	
			
			<hr>
			
			<div id="addressInfo" style="width: 100%; clear: both; margin-top: 50px;">
				<!-- 조건을 줘서 기본 등록되어있는 주소가 있다면 해당 주소를 입력해 주고
				그렇지 않다면 배송지 목록을 띄워서 배송지를 선택 할 수있게 한다.
				 -->
				 
				<h3>배송정보</h3>
				<br>
				<c:choose>
					<c:when test="${empty shippingList}">
				
						<div>
							<span>등록된 배송지가 없습니다!</span>
							<br>
							<button type="button" onclick="javascript:location.href='<%= ctxPath %>/member/shippingAddressAdd.com'">배송지 등록하기</button>
							
						</div>
						
					</c:when>
					<c:otherwise>
					
						<c:forEach items="${shippingList}" var="shipping" varStatus="status">
							<div  style=" margin: 10px;">
								<label for = "address">
									<span>배송지 이름 :</span><span>${shipping.siteName}</span><br>
									<span>수취인 이름 : </span><span>${shipping.receiverName}</span><br>
									<span>주소 : </span><span>${shipping.address}</span> <br>
									
									<span>우편번호 : </span><span>${shipping.postcode}</span> <br>
									<span>상세 주소 : </span><span>${shipping.detailAddress}</span> <br>
									<span>비고 : </span><span>${shipping.extraAddress}</span> <br>	
									<span>연락처 : </span><span>${shipping.mobile}</span> <br>
									
								</label>
								<br>
								<input type="radio" name="address" id="address" value="${shipping.shipNo}"/>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>	
			
			<div id="productInfo" style="width: 100%; clear: both; margin-top: 50px;">
				<h3>상품 정보</h3>
				<br>
				<c:if test="${not empty productList}">
					<c:forEach items="${productList}" var="cart" varStatus="status">
						<div class="col-md-4" style="height: 320px;">
							<input type="hidden" class="fk_optioncode" value="${cart.fk_optioncode}">
							<input type="hidden" class="qty" value="${cart.poqty}">
							<img src="/Covengers/images/${cart.productimg}" width="200px" height="300pxpx" style="float: left;">
							<p style="border: solid 1px black;">
								<span>상품 이름 : </span><span>${cart.krproductname}</span> <br>
								<span>상품 가격 : </span><span>${cart.pprice}원</span><br>
								<span>선택 옵션 : </span><span>${cart.optionname}</span><br>
								<span>주문 수량 : </span><span>${cart.poqty}</span> <br><br>
								<span>가격 : </span><span>${cart.totalprice}원</span> <br>
							<</p>
						</div>
					</c:forEach>
				
				</c:if>
				<c:if test="${empty productList}">
					<div class="col-md-4" style="height: 320px;">
						<input type="hidden" class="fk_optioncode" value="${paraMap.optioncode}">
						<input type="hidden" class="qty" value="${paraMap.poqty}">
						<img src="/Covengers/images/${product.productimg}" width="200px" height="300pxpx" style="float: left;">
						<span>상품 이름 : </span><span>${product.krproductname}</span> <br>
						<span>상품 가격 : </span><span>${paraMap.pprice}원</span><br>
						<span>선택 옵션 : </span><span>${product.optionname}</span><br>
						<span>주문 수량 : </span><span>${paraMap.poqty}</span> <br><br>
						<span>가격 : </span><span>${paraMap.sumPrice}원</span> <br>
					</div>
				
				
				</c:if>
			</div>
			
			
			<div id="paymentInfo" style="clear: both; padding-top: 50px;">
				<div align="left">
					<span>포인트 : </span><span>${member.point}</span> <br>
					<label for="usepoint">포인트 사용</label>&nbsp;&nbsp;
					<input type="checkbox" id="usepoint" name="usepoint" /><br>
					<span>총 가격 : </span><span>${paraMap.sumPrice }원</span><br>
					<span>배송비 : </span><span>${paraMap.deliveryCharge}원</span><br>
					<span>차감가격  - </span><span id="minus-price">0</span>원<br>
					
					<span>결제총액 : </span><span id="payment-price">${paraMap.totalCost}</span>원<br>
					
				</div>
			</div>
			
			<div id="goPayment">
				<button type="button" id="btn-pay" onclick="goPayment()">결제하기</button>
				<button type="button" id="btn-cancel" onclick="javascript:location.href='<%= ctxPath %>/product/myCart.com'">장바구니 돌아가기</button>
				
			</div>	
			
		
		</div>
	</div>
	
	</div>

<br>
<br>
<br>
<br>
<br>




