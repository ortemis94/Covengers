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
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
   
      if ("${review.reviewno}" == "" || "${review.reviewno}" == null) {
         $(".filledstar").hide();
         $("span#result").hide();
         
         
      } else {
         
         $(".filledstar").hide();
         $(".emptystar").show();
         
         
         
         
         for(var i = 0 ; i < ${review.rgrade} ; i++) {
            $("div#star-rating span").eq(i).find(".emptystar").hide();
            $("div#star-rating span").eq(i).find(".filledstar").show();
         }
         
         
         
         
      }
      
      $("div#star-rating span").click(function(){
         var index = $(this).index() + 1;
            
         $(".filledstar").hide(); 
         $(".emptystar").show(); 
            
         for (var i = 0; i < index; i++) {
            $("div#star-rating span").eq(i).find(".emptystar").hide();
            $("div#star-rating span").eq(i).find(".filledstar").show();
         }
            
         $("span#result").hide().html(index);
            
      });
      
      
   });// end of $(document).ready(function() {});-----------------------------
               
   function resetReview() {
      $("textarea#rcontent").val("");
      $(".filledstar").hide();
      $(".emptystar").show();
   }
   
   function writeReview() {
      
      if($("textarea#rcontent").val().trim() == "") {
         alert("내용이 비어있습니다!");
         return;
      }
      
      if ($("span#result").text().trim() == "") {
         alert("별점을 선택해 주세용!");
         return;
      }
      
      
      
      var frm = document.goReview;
      frm.orderno.value = "${orderno}"; 
      frm.productcode.value = "${product.productcode}";  
      frm.userno.value = "${loginuser.userno}";  
      frm.rcontent.value = $("textarea#rcontent").val();
      frm.rgrade.value = $("span#result").text();
      
      
      frm.action = "<%=ctxPath%>/product/writeReview.com";
      frm.method = "POST";
      frm.submit();
   }
   
   


   function updateRevie() {
      if($("textarea#rcontent").val().trim() == "") {
         alert("내용이 비어있습니다!");
         return;
      }
      
      if ($("span#result").text().trim() == "") {
         alert("별점을 선택해 주세용!");
         return;
      }
      
      var frm = document.updateReview;
      
      frm.reviewno.value = "${review.reviewno}"; 
      frm.rcontent.value = $("textarea#rcontent").val();
      frm.rgrade.value = $("span#result").text();
      
      frm.action = "<%=ctxPath%>/product/updateReview.com";
      frm.method = "POST";
      frm.submit();
   }
   
</script>
   <div id="container">
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
      <c:if test="${review.rgrade eq 0}">
      <div id="miniContainer">
         <h1>리뷰 작성</h1>
         <hr style="border: solid 1px gray;">
   
         <div style="height: 80%; width: 80%; margin: auto" align="center" id="review">
   
            <div>
               <div>
                  <div>
                       <label style="width: 100px; text-align: left; font-weight: bold; font-size: 20px;" for="name">작성자 : </label>
                       <input style="border: none; font-weight: bold; font-size: 20px;" type="text" id="email" value="${loginuser.email}" readonly />
                   </div>
                   <div>
                       <label style="width: 100px; text-align: left; font-weight: bold; font-size: 20px;" for="mail">상품 : </label>
                       <input style="border: none; font-weight: bold; font-size: 20px;" type="text" id="krproductname" value="${product.krproductname}" readonly />
                   </div>
               </div>
               
               <br>
               <br>
   
               <div align="center">
                  <textarea id="rcontent" name="rcontent" rows="15" cols="60" style="font-size: 20px; resize: none;" placeholder="리뷰 내용을 써주세여~"></textarea>
               </div>
   
   
   
   
               <div id="star-rating" style="margin: 20px;">
                  <c:forEach begin="1" end="5" varStatus="status">
                     <span id="grade${status.count}" style="display: inline-block; width: 30px; height: 30px;">
                        <img class="emptystar" src="<%=ctxPath%>/images/whitestar.png" width="30px" height="30px">
                        <img class="filledstar" src="<%=ctxPath%>/images/blackstar.png" width="30px" height="30px">
                     </span>
                  </c:forEach>
                  <span id="result"></span>
   
               </div>
   
               <div>
                  <button type="button" onclick="writeReview();" style="border-radius: 20px; color: white; width: 150px; height: 80; margin: 0 30px; background-color: black;">리뷰등록</button>
                  <button type="button" onclick="resetReview();" style="border-radius: 20px; color: white; width: 150px; height: 80; margin: 0 30px; background-color: black;">취소</button>
               </div>
               <br>
               <br>
               <br>
               <br>
               <br>
               <br>
               <br>
            </div>
   
         </div>
   
         <div>
            <form name="goReview">
               <input type="hidden" name="orderno" />
               <input type="hidden" name="productcode" />
               <input type="hidden" name="userno" />
               <input type="hidden" name="rcontent" />
               <input type="hidden" name="rgrade" />
   
   
            </form>
         </div>
   
   
      </div>
      </c:if>
      <c:if test="${review.rgrade ne 0}">
      <div id="miniContainer">
         <h1>리뷰 수정</h1>
         <hr style="border: solid 1px gray;">
   
         <div style="height: 80%; width: 80%; margin: auto" align="center" id="review">
   
            <div>
               <div>
                  <div>
                       <label style="width: 100px; text-align: left; font-weight: bold; font-size: 20px;" for="name">작성자 : </label>
                       <input style="border: none; font-weight: bold; font-size: 20px;" type="text" id="email" value="${review.email}" readonly />
                   </div>
                   <div>
                       <label style="width: 100px; text-align: left; font-weight: bold; font-size: 20px;" for="mail">상품 : </label>
                       <input style="border: none; font-weight: bold; font-size: 20px;" type="text" id="krproductname" value="${review.krproductname}" readonly />
                   </div>
               </div>
               
               <br>
               <br>
   
               <div align="center">
                  <textarea id="rcontent" name="rcontent" rows="15" cols="60" style="font-size: 20px; resize: none;" placeholder="리뷰 내용을 써주세여~">${review.rcontents}</textarea>
               </div>
   
   
   
   
               <div id="star-rating" style="margin: 20px;">
                  <c:forEach begin="1" end="5" varStatus="status">
                     <span id="grade${status.count}" style="display: inline-block; width: 30px; height: 30px;">
                        <img class="emptystar" src="<%=ctxPath%>/images/whitestar.png" width="30px" height="30px">
                        <img class="filledstar" src="<%=ctxPath%>/images/blackstar.png" width="30px" height="30px">
                     </span>
                  </c:forEach>
                  <span id="result"></span>
   
               </div>
   
               <div>
                  <button type="button" onclick="updateRevie();" style="border-radius: 20px; color: white; width: 150px; height: 80; margin: 0 30px; background-color: black;">리뷰수정</button>
                  <button type="button" onclick="javascript:location.href='<%= ctxPath%>/product/showReview.com'" style="border-radius: 20px; color: white; width: 150px; height: 80; margin: 0 30px; background-color: black;">취소</button>
               </div>
               <br>
               <br>
               <br>
               <br>
               <br>
               <br>
               <br>
            </div>
   
         </div>
   
         <div>
            <form name="updateReview">
               <input type="hidden" name="reviewno" />
               <input type="hidden" name="rcontent" />
               <input type="hidden" name="rgrade" />
   
   
            </form>
         </div>
   
   
      </div>
      </c:if>
   </div>

<jsp:include page="../covengers_footer.jsp"></jsp:include> 

