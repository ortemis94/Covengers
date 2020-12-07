<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
       String ctxPath = request.getContextPath();
    %>
<title>배송지 추가</title>

<style type="text/css">

 body {
       font-family: "Open Sans", sans-serif;
    }
    
   span.necesitado {
       color: red;
       font-weight: bold;
       font-size: 13pt;
   }
   
   .mylabel {
        width: 100px;
    }

   legend {
         font-size: 16pt;
         font-weight: bold;
         text-align: center;
         width: 120px;
         border: none;
     }
     
     fieldset {
         border: solid 1px lightgray;
         border-radius: 10px;
         padding-bottom: 20px;
         padding-right: 10px;
         width: 90%;
     }
     
     table#tblAddAddress {
      border-collapse: separate;
        border-spacing: 0 10px;
   }

   input.myinput {
      width: 70%;
      height: 25px;
      font-size: 11pt;
      
   }
    
    input#postcode {
       width: 30%;
    }
    
    select#select {
       height: 25px;
       width: 70%
    }
    
    input#deliveryRequest {
       width: 50%;
    }
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

 
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
      
      $("input#deliveryRequestInput").hide();
         
      $("select#select").change(function(){ //셀렉트 체인지 됐을때
            
            var deliveryRequest = "";
         
            if($(this).val() == "기타"){ // 직접입력을 선택했을 때
               $("input#deliveryRequestInput").val("");
               $("input#deliveryRequestInput").show(); // 입력란 보여주기
               $("input#deliveryRequestInput").keyup(function(){
                  deliveryRequest = $("input#deliveryRequestInput").val();
                  $("input#deliveryRequest").val(deliveryRequest);
               });
            }
            else{ // 다른걸 선택했을 때
               $("input#deliveryRequestInput").hide(); // 입력란 숨기기
               $("input#deliveryRequestInput").val("");
               deliveryRequest = $("select#select").val();
               $("input#deliveryRequest").val(deliveryRequest);
               }
         
      });
      
      $("input#mobile").keyup(function() { 
           $(this).val( $(this).val().replace(/[^\d]/g, "").replace(/(\d{3})(\d{4})(\d{4})/,"$1-$2-$3"));
           
           var mobile = $(this).val();
           if(mobile == ""){
               $(this).next().text("전화번호 11자리(또는 10자리)를 입력해주세요.");
                 $(this).next().show();
           }
           else{
                // 010-7681-0219
                $(this).blur(function () {
                   mobile = $(this).val();
                   if(mobile.length != 13){
                         $(this).val("");
                   }
                });
           }
        });
      
      $("button#searchAddress").click(function () {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ""; // 주소 변수
                    var extraAddr = ""; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === "R") {
                        // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else {
                        // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === "R") {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== "" && data.apartment === "Y") {
                            extraAddr += extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== "") {
                            extraAddr = " (" + extraAddr + ")";
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("extraAddress").value = extraAddr;
                    } else {
                        document.getElementById("extraAddress").value = "";
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("postcode").value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detailAddress").focus();
                },
            }).open();
        }); // end of $("button#searchAddress").click(function () {}------------------
              
              
      
   });// end of $(document).ready(function(){}-----------------------------------
   
   function goAddAddress(){
       var bFlagRequiredInfo = false;

         $(".requiredInfo").each(function () {
             var data = $(this).val(); //선택자(필수입력란)의 값
             if (data == "") {
                 //선택자(필수입력란)의 값이 공백일 때
                 bFlagRequiredInfo = true;
                 alert("필수 입력사항을 모두 입력해주세요.");
                 return false;
             }
         });
         
        if(!bFlagRequiredInfo){
         var frm = document.addAddressFrm;
           frm.action = "shippingAddressAdd.com"; //자기가 자기한테 보내는중
           frm.method = "post";
           frm.submit();
        }
   } // end of function goAddAddress(){}-----------------------

</script>


<div id="container1" align ="center">
   
    <form name="addAddressFrm">
      <h3 style="margin-top: 20px;">배송지등록</h3>
       <div style="border: solid 1px lightgray; width: 80%; padding: 20px; border-radius: 20px;">
         <table id="tblAddAddress">
            <tr>
                <td>배송지명<span class="necesitado">*</span></td>
                <td>
                    <input type="hidden" name="userno" value="${sessionScope.loginuser.userno}"/>
                    <input type="text" id="siteName" name="siteName" class="requiredInfo myinput"/>
                </td>
            </tr>   
            <tr>
                <td>수취인명<span class="necesitado">*</span></td>
                <td>
                    <input type="text" id="receiverName" name="receiverName" class="requiredInfo myinput"/>
                </td>
            </tr>   
            <tr>
                <td>우편번호<span class="necesitado">*</span></td>
                <td>
                    <input type="text" name="postcode" id="postcode" size="5pt" maxlength="5" placeholder="우편번호" class="requiredInfo myinput"/>
                    <button type="button" id="searchAddress" class="btn btn-default">우편번호찾기</button><br/>
                </td>
            </tr>
            <tr>
               <td>주소<span class="necesitado">*</span></td>
               <td><input type="text" name="address" id="address" size="41px" placeholder="주소" class="requiredInfo myinput" /><br/> </td>
            </tr>
            <tr>
               <td>상세주소<span class="necesitado">*</span></td>
               <td> <input type="text" name="detailAddress" id="detailAddress" size="41px" class="requiredInfo myinput" placeholder="상세주소" /><br/></td>
            </tr>
            <tr>
               <td>참고항목</td>
               <td><input type="text" name="extraAddress" id="extraAddress" size="41px" class="myinput" placeholder="참고항목" /><br/></td>
            </tr>
            <tr>
                <td>연락처<span class="necesitado">*</span></td>
                <td>
                    <input type="text" id="mobile" name="mobile" class="requiredInfo myinput"  maxlength="13"/>
                </td>
            </tr> 
            <tr>
                <td>요청사항</td>
                <td>
                    <select id="select">
                        <option value="" disabled selected>요청사항선택</option>
                        <option>문 앞</option>
                        <option>직접받고 부재시 문 앞</option>
                        <option>경비실</option>
                        <option>택배함</option>
                        <option>기타</option>
               </select>
                    <input type="text" id="deliveryRequestInput" class="myinput" />
               <input type="hidden" id="deliveryRequest" name="deliveryRequest"/>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="status" value="1"/><span style="width: 100%">기본배송지로 저장</span>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                   <button type="button" id="btnAdd" class="btn btn-default" onClick="goAddAddress();">저장</button>
                </td>
            </tr>
         </table>
      </div>
    </form>
</div>

</body>
</html>