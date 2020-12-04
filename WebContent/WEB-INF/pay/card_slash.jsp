<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../covengers_header.jsp"></jsp:include>

<%
  String ctxPath = request.getContextPath();
%>

<style type="text/css">
   
</style>


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
      
      $("tr.selectAddress").click(function(){
         $(this).find("input[name=address]").prop('checked', true);
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
   <div id="payment" style="margin: 0 auto; width: 80%; overflow: auto; background-color: white; margin: auto;">
      <div id="contents_title">
         <h1>결제정보확인</h1>
      </div>
      
      <hr style="border: solid 1px black; width: 80%;">
      
      <div id="contents_pre_payment" style = "width: 100%; height: 90%; border: 0.5px gray thin;">
      
         <div id="userInfo" align="center">
         
            <table style="font-size: 15px;">
               <tr>

                  <th style="padding: 20px;"><span>기본정보 확인</span></th>
                  <th style="width: 70px;"></th>

                  <th style="padding: 20px;"><span>구매자 주소지</span></th>
               </tr>
               <tr>
                  <td><span>구매자 이름 : </span><span>${member.name}</span> <br>
                     <span>구매자 이메일 : </span><span>${member.email}</span> <br> <span>구매자
                        전화번호 : </span><span>${member.mobile}</span> <br></td>
                  <td></td>
                  <td><c:choose>
                        <c:when
                           test="${not empty member.postcode && not empty member.address && not empty member.detailAddress}">
                           <span>우편번호 : ${member.postcode}</span>
                           <br>
                           <span>주소 : ${member.address}</span>
                           <br>
                           <span>상세 주소 : ${member.detailAddress}</span>
                           <br>
                           <span>비고 : ${member.extraAddress}</span>
                           <br>
                        </c:when>
                        <c:otherwise>
                           <span>기본 주소가 입력이 되어있지 않습니다.</span>
                        </c:otherwise>
                     </c:choose></td>
               </tr>
            </table>
            <br>
            
         </div>   
         
         <hr style="width: 80%;">
         
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
               
                  <table style="width: 80%;">
                  
                     <thead style="border-bottom: solid 1px gray;">
                        <tr>
                           <th style="padding: 20px;">배송지 이름</th>
                           <th style="padding: 20px;">수취인 이름</th>
                           <th style="padding: 20px;">연락처</th>
                           <th style="padding: 20px;">우편번호</th>
                           <th style="padding: 20px;">주소</th>
                           <th style="padding: 20px;">상세 주소</th>
                           <th style="padding: 20px;">비고</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${shippingList}" var="shipping" varStatus="status">
                                 <tr style="cursor: pointer; border-bottom: solid 1px gray; padding-top: 20px;" class="selectAddress">
                                    <td style="padding: 20px;"><span>${shipping.siteName}</span></td>
                                    <td style="padding: 20px;"><span>${shipping.receiverName}</span></td>
                                    <td style="padding: 20px;"><span>${shipping.mobile}</span></td>
                                    <td style="padding: 20px;"><span>${shipping.postcode}</span></td>
                                    <td style="padding: 20px;"><span>${shipping.address}</span></td>
                                    <td style="padding: 20px;"><span>${shipping.detailAddress}</span></td>
                                    <td style="padding: 20px;"><span>${shipping.extraAddress}</span></td>
                                    <td style="padding: 20px;"><input type="radio" name="address" id="address${status.index}" value="${shipping.shipNo}" /> </td>
                                 
                                 </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </c:otherwise>
            </c:choose>
         </div>   
         
         <br>
         <br>
         <hr style="width: 80%;">
         
         <div id="productInfo" style="width: 100%; clear: both; margin-top: 50px;">
            <h3>상품 정보</h3>
            <br>
            
            <table style="width: 80%;">
                  
               <thead style="border-bottom: solid 1px gray;">
                  <tr>
                     <th style="padding: 20px;">상품 이미지</th>
                     <th style="padding: 20px;">상품 이름</th>
                     <th style="padding: 20px;">상품 가격</th>
                     <th style="padding: 20px;">선택 옵션</th>
                     <th style="padding: 20px;">주문 수량</th>
                     <th style="padding: 20px;">가격</th>
                     
                  </tr>
               </thead>
               <tbody>
                  <c:if test="${not empty productList}">
                     <c:forEach items="${productList}" var="cart" varStatus="status">
                        <input type="hidden" class="fk_optioncode" value="${cart.fk_optioncode}">
                        <input type="hidden" class="qty" value="${cart.poqty}">
                        <tr style="border-bottom: solid 1px gray; padding-top: 20px;">
                           <td style="padding: 20px;"><img src="/Covengers/images/${cart.productimg}" width="120px" height="200px""></td>
                           <td style="padding: 20px;"><span>${cart.krproductname}</span></td>
                           <td style="padding: 20px;"><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.pprice}"/>원</span></td>
                           <td style="padding: 20px;"><span>${cart.optionname}</span></td>
                           <td style="padding: 20px;"><span>${cart.poqty}</span></td>
                           <td style="padding: 20px;"><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.totalprice}"/>원</span></td>
                        </tr>
                     </c:forEach>
                  
                  </c:if>
                  <c:if test="${empty productList}">
                     <input type="hidden" class="fk_optioncode" value="${paraMap.optioncode}">
                     <input type="hidden" class="qty" value="${paraMap.poqty}">
                     <tr style="border-bottom: solid 1px gray; padding-top: 20px;">
                        <td style="padding: 20px;"><img src="/Covengers/images/${product.productimg}" width="120px" height="200px""></td>
                        <td style="padding: 20px;"><span>${product.krproductname}</span></td>
                        <td style="padding: 20px;"><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${paraMap.pprice}"/>원</span></td>
                        <td style="padding: 20px;"><span>${product.optionname}</span></td>
                        <td style="padding: 20px;"><span>${paraMap.poqty}</span></td>
                        <td style="padding: 20px;"><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${paraMap.sumPrice}"/>원</span></td>
                     </tr>
                  </c:if>
               </tbody>
            </table>
         </div>
         <br>
         <hr style="width: 80%; border: solid 1px black;">
         <br>
         
         <div id="paymentInfo" style="margin: 15px;">
            <div class="col-md-3" style="height: 100px;" align="right">
               <span style="color: blue; font-size: 40px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${member.point}"/>P</span><br>
               <label for="usepoint">포인트 사용</label>&nbsp;&nbsp;
               <input type="checkbox" id="usepoint" name="usepoint" /><br>
               
            </div>
            <div class="col-md-3" style="height: 100px;">
               
               <span style="font-size: 20px;">총 가격 : </span><span style="font-size: 20px;">${paraMap.sumPrice }원</span><br>
               <span style="font-size: 20px;">배송비 : </span><span style="font-size: 20px;">${paraMap.deliveryCharge}원</span><br>
               <span style="font-size: 20px;">차감가격  - </span><span id="minus-price" style="color: red; font-size: 20px;">0</span>원<br>
               
               
            </div>
            <div class="col-md-6" style="height: 100px; padding-left: 120px;" align="left">
               
               <span>결제총액 : </span><span id="payment-price" style="font-size: 50px; color: red; font-weight: bold;">${paraMap.totalCost}</span>원<br>
               
            </div>
         </div>
         <br><br><br><br>
         <br><br>
         <br>
         <br>
         <br>
         <br>
         <div id="goPayment" style="margin: 20px;">
            <button type="button" id="btn-pay" onclick="goPayment()" style="border-radius: 15px; background-color: black; font-size: 20px; color: white; width: 30%; height: 70px; margin: 0 60px;">결제하기</button>
            
            <button type="button" id="btn-cancel" style="border-radius: 15px; background-color: black; font-size: 20px; color: white; width: 30%; height: 70px; margin: 0 60px;" onclick="javascript:location.href='<%= ctxPath %>/product/myCart.com'">장바구니 돌아가기</button>
            
         </div>   
      </div>
   </div>
   
</div>
<br>
<br>
<br>
<br>
<br>

<form name="paymentFrm">
      <input type="hidden" name="fk_optioncodeList">
      <input type="hidden" name="purchasecartno" value="${purchasecartno}">
      <input type="hidden" name="userno" value="${member.userno}">
      <input type="hidden" name="total">
      <input type="hidden" name="shipping">
      <input type="hidden" name="ischecked">
      <input type="hidden" name="ischecked">
   
      
      
   
   </form>
   
   <form name="paymentFinalFrm">
      <input type="hidden" name="purchasecartno" value="${purchasecartno}">
      <input type="hidden" name="userno" value="${member.userno}">
      <input type="hidden" name="total">
      <input type="hidden" name="shipping">
      <input type="hidden" name="ischecked">
      <input type="hidden" name="poqty" value="${paraMap.poqty}">
      <input type="hidden" name="optioncode" value="${paraMap.optioncode}">
</form>


</body>

</html>


