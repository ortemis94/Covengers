<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
   padding-bottom: 13%;
   float: left;
}

ul {
   padding: 0;
   line-height: 30px;
   font-size: 12pt;
}

ul#menu>li {
   list-style: none;
   cursor: pointer;
   margin: 15px 0;
}

div#menu>ul {
   padding: 0;
   /* line-height: 30px; */
   font-size: 12pt;
}
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

      $("button.goReview").click(function(){
         var productcode = $(this).parent().find(".productcode").val();
         var paymentno = $(this).parent().find(".paymentno").val();
         
         
         var frm = document.reviewForm;
         frm.productcode1.value = productcode;
         frm.paymentno1.value = paymentno;
         
         
         frm.action = "<%= ctxPath%>/product/showReviewForm.com";
         frm.method = "POST";
         frm.submit();
         
      });
   
   
      $("span.getReview").click(function(){
         
         var productcode = $(this).parent().find(".productcode").val();
         var paymentno = $(this).parent().find(".paymentno").val();
         
         var frm = document.reviewForm;
         frm.productcode1.value = productcode;
         frm.paymentno1.value = paymentno;
         
         
         frm.action = "<%= ctxPath%>/product/getReview.com";
         frm.method = "POST";
         frm.submit();
         
      });
   
   });// end of $(document).ready(function() {});-----------------------------
</script>


<div id="container">
   <div id="menu">

      <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마이페이지</h3>
      <ul id="menu">
         <li onclick="location.href='<%=ctxPath%>/mypage/myInfo.com'"><span></span>&nbsp;내 정보 확인/수정</li>
         <li onclick="location.href='<%=ctxPath%>/member/shippingAddressLookup.com'"><span></span>&nbsp;배송지 관리</li>
         <li onclick="location.href='<%=ctxPath%>/mypage/orderList.com'"><span></span>&nbsp;주문내역</li>
         <li onclick="location.href='<%=ctxPath%>/mypage/purchaseHistory.com'"><span></span>&nbsp;구매내역</li>
         <li onclick="location.href='<%=ctxPath%>/product/myCart.com'"><span></span>&nbsp;장바구니</li>
      </ul>
   </div>
   <div id="miniContainer">
      <h1>구매내역</h1>
      <hr style="border: solid 1px gray;">

      <c:if test="${empty purchaseList}">
         <div>

            <span>구매하신 물건이 없습니다! 첫 구매를 해보세요!</span>

            <button type="button"
               onclick="javascript:location.href='<%=ctxPath%>/product/productDisplay.com'">첫
               구매하러 가기!</button>
         </div>
      </c:if>

      <c:if test="${not empty purchaseList}">


         <table style="width: 100%;">

            <thead style="border-bottom: solid 1px gray;">
               <tr>
                  <th style="padding: 20px;">주문번호</th>
                  <th style="padding: 20px;">상품 이미지</th>
                  <th style="padding: 20px;">상품 이름</th>
                  <th style="padding: 20px;">선택 옵션</th>
                  <th style="padding: 20px;">주문 수량</th>
                  <th style="padding: 20px;">리뷰 작성</th>

               </tr>
            </thead>
            <tbody>
               <tr>
                  <td colspan="5" style="padding: 20px; font-size: 35px; font-weight: bold; color: gray;" align="left">${week[0]}</td>
               </tr>
               <c:forEach items="${purchaseList}" var="purchase"
                  varStatus="status">
                  <c:if test="${purchase.paymentdate eq 0}">
                     <tr style="border-bottom: solid 1px gray; padding-top: 20px;">
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.paymentno}</span></td>
                        <td style="padding: 20px;">
                           <img src="/Covengers/images/${purchase.productimg1}" width="120px" height="200px"">
                        </td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.krproductname}</span></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.optionname}</span></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.orderqty}개</span></td>

                        <c:if test="${purchase.reviewstatus eq 0 }">
                           <td style="padding: 20px;">
                              <input type="hidden" class="productcode" name="productcode"   value="${purchase.productcode}">
                              <input type="hidden" class="paymentno" name="paymentno" value="${purchase.paymentno}">
                              <button type="button" class="goReview" style="white-space: nowrap; cursor: pointer; border:none; background-color: rgba(0,0,0,0);">리뷰쓰기</button>
                           </td>
                        </c:if>
                        <c:if test="${purchase.reviewstatus eq 1}">
                           <td style="padding: 20px;">
                              <input type="hidden" class="productcode" name="productcode"   value="${purchase.productcode}">
                              <input type="hidden" class="paymentno" name="paymentno" value="${purchase.paymentno}">
                              <span class="getReview" style="cursor: pointer;">리뷰 작성 완료 - 보기</span>
                           </td>
                        </c:if>
                     </tr>
                  </c:if>
               </c:forEach>
               <tr>
                  <td colspan="5" style="padding: 20px; font-size: 35px; font-weight: bold; color: gray;"" align="left">${week[1]}</td>
               </tr>
               <c:forEach items="${purchaseList}" var="purchase"
                  varStatus="status">
                  <c:if test="${purchase.paymentdate eq 1}">
                     
                     <tr style="border-bottom: solid 1px gray; padding-top: 20px;">
                     <td style="padding: 20px;"><span  style="font-size: 20px; font-weight: bold;" >${purchase.paymentno}</span></td>
                        <td style="padding: 20px;"><img
                           src="/Covengers/images/${purchase.productimg1}" width="120px"
                           height="200px""></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.krproductname}</span></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.optionname}</span></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.orderqty}</span></td>

                        <c:if test="${purchase.reviewstatus eq 0 }">
                           <td style="padding: 20px;">
                                 <input type="hidden" class="productcode" name="productcode"   value="${purchase.productcode}">
                                 <input type="hidden" class="paymentno" name="paymentno" value="${purchase.paymentno}">
                                 <button type="button" class="goReview" style="white-space: nowrap; cursor: pointer; border:none; background-color: rgba(0,0,0,0);">리뷰쓰기</button>
                           </td>
                        </c:if>
                        <c:if test="${purchase.reviewstatus eq 1}">
                           <td style="padding: 20px;">
                              <input type="hidden" class="productcode" name="productcode"   value="${purchase.productcode}">
                              <input type="hidden" class="paymentno" name="paymentno" value="${purchase.paymentno}">
                              <span class="getReview" style="cursor: pointer;">리뷰 작성 완료 - 보기</span>
                           </td>
                        </c:if>
                     </tr>
                  </c:if>
               </c:forEach>

               <tr>
                  <td colspan="5" style="padding: 20px; font-size: 35px; font-weight: bold; color: gray;"" align="left">${week[2]}</td>
               </tr>
               <c:forEach items="${purchaseList}" var="purchase"
                  varStatus="status">
                  <c:if test="${purchase.paymentdate eq 2}">
                     
                     <tr style="border-bottom: solid 1px gray; padding-top: 20px;">
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.paymentno}</span></td>
                        <td style="padding: 20px;"><img
                           src="/Covengers/images/${purchase.productimg1}" width="120px"
                           height="200px""></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.krproductname}</span></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.optionname}</span></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.orderqty}</span></td>

                        <c:if test="${purchase.reviewstatus eq 0 }">
                           <td style="padding: 20px;">
                                 <input type="hidden" class="productcode" name="productcode"   value="${purchase.productcode}">
                                 <input type="hidden" class="paymentno" name="paymentno" value="${purchase.paymentno}">
                                 <button type="button" class="goReview" style="white-space: nowrap; cursor: pointer; border:none; background-color: rgba(0,0,0,0);">리뷰쓰기</button>
                        </c:if>
                        <c:if test="${purchase.reviewstatus eq 1}">
                           <td style="padding: 20px;">
                              <input type="hidden" class="productcode" name="productcode"   value="${purchase.productcode}">
                              <input type="hidden" class="paymentno" name="paymentno" value="${purchase.paymentno}">
                              <span class="getReview" style="cursor: pointer;">리뷰 작성 완료 - 보기</span>
                           </td>
                        </c:if>
                     </tr>
                  </c:if>
               </c:forEach>
               <tr>
                  <td colspan="5" style="padding: 20px; font-size: 35px; font-weight: bold; color: gray;"" align="left">${week[3]}</td>
               </tr>
               <c:forEach items="${purchaseList}" var="purchase"
                  varStatus="status">
                  <c:if test="${purchase.paymentdate eq 3}">
                     
                     <tr style="border-bottom: solid 1px gray; padding-top: 20px;">
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.paymentno}</span></td>
                        <td style="padding: 20px;"><img
                           src="/Covengers/images/${purchase.productimg1}" width="120px"
                           height="200px""></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.krproductname}</span></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.optionname}</span></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.orderqty}</span></td>

                        <c:if test="${purchase.reviewstatus eq 0 }">
                           <td style="padding: 20px;">
                                 <input type="hidden" class="productcode" name="productcode"   value="${purchase.productcode}">
                                 <input type="hidden" class="paymentno" name="paymentno" value="${purchase.paymentno}">
                                 <button type="button" class="goReview" style="white-space: nowrap; cursor: pointer; border:none; background-color: rgba(0,0,0,0);">리뷰쓰기</button>
                           </td>
                        </c:if>
                        <c:if test="${purchase.reviewstatus eq 1}">
                           <td style="padding: 20px;">
                              <input type="hidden" class="productcode" name="productcode"   value="${purchase.productcode}">
                              <input type="hidden" class="paymentno" name="paymentno" value="${purchase.paymentno}">
                              <span class="getReview" style="cursor: pointer;">리뷰 작성 완료 - 보기</span>
                           </td>
                        </c:if>
                     </tr>
                  </c:if>
               </c:forEach>
               <tr>
                  <td colspan="5" style="padding: 20px; font-size: 35px; font-weight: bold; color: gray;"" align="left">${week[4]}</td>
               </tr>
               <c:forEach items="${purchaseList}" var="purchase"
                  varStatus="status">
                  <c:if test="${purchase.paymentdate eq 4}">
                     
                     <tr style="border-bottom: solid 1px gray; padding-top: 20px;">
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.paymentno}</span></td>
                        <td style="padding: 20px;"><img
                           src="/Covengers/images/${purchase.productimg1}" width="120px"
                           height="200px""></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.krproductname}</span></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.optionname}</span></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.orderqty}</span></td>

                        <c:if test="${purchase.reviewstatus eq 0 }">
                           <td style="padding: 20px;">
                                 <input type="hidden" class="productcode" name="productcode"   value="${purchase.productcode}">
                                 <input type="hidden" class="paymentno" name="paymentno" value="${purchase.paymentno}">
                                 <button type="button" class="goReview" style="white-space: nowrap; cursor: pointer; border:none; background-color: rgba(0,0,0,0);">리뷰쓰기</button>
                        </c:if>
                        <c:if test="${purchase.reviewstatus eq 1}">
                           <td style="padding: 20px;">
                              <input type="hidden" class="productcode" name="productcode"   value="${purchase.productcode}">
                              <input type="hidden" class="paymentno" name="paymentno" value="${purchase.paymentno}">
                              <span class="getReview" style="cursor: pointer;">리뷰 작성 완료 - 보기</span>
                           </td>
                        </c:if>
                     </tr>
                  </c:if>
               </c:forEach>
               <tr>
                  <td colspan="5" style="padding: 20px; font-size: 35px; font-weight: bold; color: gray;"" align="left">${week[5]}</td>
               </tr>
               <c:forEach items="${purchaseList}" var="purchase"
                  varStatus="status">
                  <c:if test="${purchase.paymentdate eq 5}">
                     
                     <tr style="border-bottom: solid 1px gray; padding-top: 20px;">
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.paymentno}</span></td>
                        <td style="padding: 20px;"><img
                           src="/Covengers/images/${purchase.productimg1}" width="120px"
                           height="200px""></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.krproductname}</span></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.optionname}</span></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.orderqty}</span></td>

                        <c:if test="${purchase.reviewstatus eq 0 }">
                           <td style="padding: 20px;">
                                 <input type="hidden" class="productcode" name="productcode"   value="${purchase.productcode}">
                                 <input type="hidden" class="paymentno" name="paymentno" value="${purchase.paymentno}">
                                 <button type="button" class="goReview" style="white-space: nowrap; cursor: pointer; border:none; background-color: rgba(0,0,0,0);">리뷰쓰기</button>
                        </c:if>
                        <c:if test="${purchase.reviewstatus eq 1}">
                           <td style="padding: 20px;">
                              <input type="hidden" class="productcode" name="productcode"   value="${purchase.productcode}">
                              <input type="hidden" class="paymentno" name="paymentno" value="${purchase.paymentno}">
                              <span class="getReview" style="cursor: pointer;">리뷰 작성 완료 - 보기</span>
                           </td>
                        </c:if>
                     </tr>
                  </c:if>
               </c:forEach>
               <tr>
                  <td colspan="5" style="padding: 20px; font-size: 35px; font-weight: bold; color: gray;"" align="left">${week[6]}</td>
               </tr>
               <c:forEach items="${purchaseList}" var="purchase"
                  varStatus="status">
                  <c:if test="${purchase.paymentdate eq 6}">
                     
                     <tr style="border-bottom: solid 1px gray; padding-top: 20px;">
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.paymentno}</span></td>
                        <td style="padding: 20px;"><img
                           src="/Covengers/images/${purchase.productimg1}" width="120px"
                           height="200px""></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.krproductname}</span></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.optionname}</span></td>
                        <td style="padding: 20px;"><span style="font-size: 20px; font-weight: bold;">${purchase.orderqty}</span></td>

                        <c:if test="${purchase.reviewstatus eq 0 }">
                           <td style="padding: 20px;">
                              <input type="hidden" class="productcode" name="productcode"   value="${purchase.productcode}">
                              <input type="hidden" class="paymentno" name="paymentno" value="${purchase.paymentno}">
                              <button type="button" class="goReview" style="white-space: nowrap; cursor: pointer; border:none; background-color: rgba(0,0,0,0);">리뷰쓰기</button>
                           </td>
                        </c:if>
                        <c:if test="${purchase.reviewstatus eq 1}">
                           <td style="padding: 20px;">
                              <input type="hidden" class="productcode" name="productcode"   value="${purchase.productcode}">
                              <input type="hidden" class="paymentno" name="paymentno" value="${purchase.paymentno}">
                              <span class="getReview" style="cursor: pointer;">리뷰 작성 완료 - 보기</span>
                           </td>
                        </c:if>
                     </tr>
                  </c:if>
               </c:forEach>

            </tbody>
         </table>
      </c:if>




   </div>



</div>

<form name="reviewForm">
   <input type="hidden" id="productcode" name="productcode1">
   <input type="hidden" id="paymentno" name="paymentno1">
                                 
</form>

<jsp:include page="../covengers_footer.jsp"></jsp:include> 