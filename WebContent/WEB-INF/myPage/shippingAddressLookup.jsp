<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String ctxPath = request.getContextPath();
   //    /Covengers
%>


<jsp:include page="../covengers_header.jsp"></jsp:include> 

<title>배송지 목록</title>



<jsp:include page="../covengers_header.jsp"></jsp:include>
<style type="text/css">
   
   .myinput {
      border: none;
      outline: none;
      font-size: 15pt;
      margin-bottom: 10px;
      width: 90%;
   }
   
    div.addressCard {
      border: solid 1px lightgray;
      border-radius: 10px;
      width: 600px;
      margin: 30px auto;
      padding: 20px 30px;
   }
   
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
      line-height: 30px;
      font-size: 12pt;
      list-style-type: none;
   }
   
   ul#menu > li{
      list-style: none;
      cursor: pointer;
      margin: 15px 0;
   }
   
   div#menu > ul {
      padding: 0;
/*       line-height: 30px; */
      font-size: 12pt;
   }
   
   button.btnAddAddress {
      display: block;
      margin: 20px auto;
   }
   
       
    div.defaultAddress {
       font-size: 10pt; 
       color: #09d062; 
       font-weight: bold;
       border: solid 1px #09d062;
       border-radius: 15px;
       padding: 3px 5px;
       margin-bottom: 5px;
       width: 80px;
    }
    
   div#container1 {
      font-family: "Open Sans", sans-serif;
      padding-top: 100px;
   }
   
   label {
      font-size: 11pt;
   }
   
</style>

<script type="text/javascript">
   $(document).ready(function(){
      // 마이페이지 메뉴부분 이미지 관련 코드.
       $("div#menu").find("span").each(function() {
         $(this).html("<img src='<%=ctxPath %>/images/perfumeicon3.png' width='25px;' height='25px;' />");
      });
      
      $("div#menu").find("li").hover(function(event) {
         $(this).find("span").html("<img src='<%=ctxPath %>/images/perfumeicon4.png' width='25px;' height='25px;' />");
      }, function(event) {
         $(this).find("span").html("<img src='<%=ctxPath %>/images/perfumeicon3.png' width='25px;' height='25px;' />");
      }); 
      var shipno = "";
      
      $("button.btnUpdate").click(function(){ // 수정버튼 클릭시
         
         shipno = $(this).siblings("input[name=shipNo]").val();
         userno = $(this).siblings("input[name=userno]").val();
      //   alert(shipno);
         
      //   shipno = $(this).siblings("input[name=shipNo]").val();
      
         goUpdateAddress(shipno, userno);
         
      });
      
      $("button.btnDelete").click(function(){ //삭제버튼 클릭시
         shipno = $(this).siblings("input[name=shipNo]").val();
         $.ajax({
            url: "<%= request.getContextPath() %>/member/shippingAddressDelete.com",
            data: {"shipNo" : shipno},
            type: "post",
            dataType: "json",
            success:function(json){
               if(json.isDeleted){
                  alert("배송지 삭제 성공");
                  location.reload();
               }
               else{
                  alert("배송지 삭제 실패");
               }
            },
            error: function(request, status, error){
                   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                }
         });
      });

      
      $("button.btnAddAddress").click(function(){ //배송지 추가 버튼 클릭시
         
         var numberOfShippingAddress = ${numberOfShippingAddress}
         
         
         if(numberOfShippingAddress >= 10){
            alert("배송지는 10개까지 등록 가능합니다.");
            return;
         }
         else{
            var url = "<%=ctxPath%>/member/shippingAddressAdd.com";
               
             window.open(url, "shippingAddressEdit", "left=350px, top=100px, width=800px, height=650px");
         }
      });
      
   });// end of $(document).ready(function(){})--------------------------------------------------------
   
   function goUpdateAddress(shipno, userno){      
      //정보수정하기 팝업창 띄우기
         var url = "<%=ctxPath%>/member/shippingAddressUpdate.com?shipNo="+shipno+"&userno="+userno;
         
         window.open(url, "shippingAddressEdit", "left=350px, top=100px, width=800px, height=650px");
         
   }
   
</script>
<div id="container">
   <div id="menu">
      <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마이페이지</h3>
      <ul id="menu" style="line-height: 40px;">
         <li onclick="location.href='<%= ctxPath%>/mypage/myInfo.com'"><span style="float:left;"></span>&nbsp;내 정보 확인/수정</li>
         <li onclick="location.href='<%= ctxPath%>/member/shippingAddressLookup.com'"><span style="float:left;"></span>&nbsp;배송지 관리</li>
         <li onclick="location.href='<%= ctxPath%>/mypage/orderList.com'"><span style="float:left;"></span>&nbsp;주문내역</li>
         <li onclick="location.href='<%= ctxPath%>/mypage/purchaseHistory.com'"><span style="float:left;"></span>&nbsp;구매내역</li>
         <li onclick="location.href='<%= ctxPath%>/product/myCart.com'"><span style="float:left;"></span>&nbsp;장바구니</li>
      </ul>
   </div>


   <div id="miniContainer">
         <h1>내 정보 확인</h1>
           <hr style="border: solid 1px gray;">
      </div>
</div>
    
    <div id="container1">
        <c:if test="${not empty addressList}">
            <c:forEach var="svo" items="${addressList}">
                <div class="addressCard">
                    <c:if test="${svo.status eq '1'}">
                        <div class="defaultAddress">기본배송지</div>
                    </c:if>
                    <input type="hidden" name="shipNo" value="${svo.shipNo}" />
                    <label>수취인명</label>
                    <input name="receiverName" class="myinput" value="${svo.receiverName}" readonly /><br>
                    <label>배송지이름</label>
                    <input name="siteName" class="myinput" value="${svo.siteName}" readonly /><br>
                    <label>우편번호</label>
                    <input name="postcode" class="myinput" value="${svo.postcode}" readonly /><br>
                    <label>주소</label><br>
                    <input name="address" class="myinput" value="${svo.address}" readonly /><br>
                    <input name="detailAddress" class="myinput" value="${svo.detailAddress}" readonly /><br>
                    <input name="extraAddress" class="myinput" value="${svo.extraAddress}" readonly /><br>
                    <label>연락처</label><br>
                    <input name="mobile" class="myinput" value="${svo.mobile}" readonly /><br>
                    <label>요청사항</label>
                    <input name="deliveryRequest" class="myinput" value="${svo.deliveryRequest}" readonly /><br>
                    <input type="hidden" name="status" value="${svo.status}" />
                    <input type="hidden" name="userno" value="${svo.userno}"></input>
                    <button class="btnUpdate btn btn-default" type="button">수정</button>
                    <button class="btnDelete btn btn-default" type="button">삭제</button>
                </div>
            </c:forEach>
           <button type="button" class="btnAddAddress btn btn-info">배송지 추가</button>
        </c:if>
        <c:if test="${empty addressList}">
            <div>등록된 배송지가 없습니다.</div>
           <button type="button" class="btnAddAddress btn btn-info">배송지 추가</button>
        </c:if>
    </div>
 <jsp:include page="../covengers_footer.jsp"></jsp:include>
