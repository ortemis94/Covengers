<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		list-style-type: none;
	}
	
	ul#menu > li{
		list-style: none;
		cursor: pointer;
		margin: 15px 0;
	}
	
	div#menu > ul {
		padding: 0;
/* 		line-height: 30px; */
		font-size: 12pt;
	}
	
			ul#Info {
				padding-left: 40px;
			}
	
            ul > li {
                line-height: 40px;
            }
            #marca {
                margin-top: 60px;
                text-align: center;
            }
            input.myinput {
                border: none;
                border-bottom: solid 1px lightgray;
                outline: none;
                font-size: 15pt;
                margin-bottom: 10px;
            }
            form {
                width: 600px;
                margin: 0 auto;
                padding: 20px 30px;
                text-align: left;
            }
            .pequenoTitle {
                font-weight: bold;
                font-size: 13pt;
            }
            .error {
                font-size: 11pt;
                color: red;
                margin-bottom: 10px;
            }
            button {
                font-weight: bold;
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
                border-radius: 20px;
                padding-top: 20px;
                padding-bottom: 20px;
                padding-right: 10px;
            }
            #like {
                border: solid 1px lightgray;
                border-radius: 10px;
                width: 95%;
                padding-left: 5%;
            }
            
            span.necesitado {
                color: red;
                font-weight: bold;
                font-size: 13pt;
            }
            
            select {
			    width: 130px;  /* 너비설정 */
			    height: 40px;
			    border: none;
			    font-size: 13pt;
			    border-bottom: solid 1px lightgray;
                outline: none;

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
			<li onclick="location.href='<%= ctxPath%>/mypage/myInfo.com'"><span id="now"></span>&nbsp;내 정보 확인/수정</li>
			<li onclick="location.href='<%= ctxPath%>/member/shippingAddressLookup.com'"><span></span>&nbsp;배송지 관리</li>
			<li onclick="location.href='<%= ctxPath%>/mypage/orderList.com'"><span></span>&nbsp;주문내역</li>
			<li onclick="location.href='<%= ctxPath%>/mypage/purchaseHistory.com'"><span></span>&nbsp;구매내역</li>
			<li onclick="location.href='<%= ctxPath%>/product/myCart.com'"><span></span>&nbsp;장바구니</li>
		</ul>
	</div>
   	<div id="miniContainer">
		<h1>내 정보 확인 & 수정</h1>
        <hr style="border: solid 1px gray; color: gray;">
        
        <form name="registerFrm">
                <fieldset>
                    <ul id="Info">
                        <li>
                            <label class="pequenoTitle">성명&nbsp;</label><span class="necesitado">*</span> <input type="text" name="name" id="name" class="myinput requiredInfo" size="41px" />
                            <div class="error">성명은 필수입력사항 입니다.</div>
                        </li>
                        <li>
                            <label class="pequenoTitle">이메일&nbsp;</label><span class="necesitado">*</span><br>
                            <input type="text" id="emailid" class="myinput requiredInfo" size="10px" placeholder="이메일 입력"/>
                            <span>@</span>
                            <input type="text" id="emailtext" class="myinput" size="10px"/>
                            <select id="select">
					            <option value="" disabled selected>E-Mail 선택</option>
					            <option value="naver.com" id="naver.com">naver.com</option>
					            <option value="gmail.com" id="gmail.com">gmail.com</option>
					            <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
					            <option value="nate.com" id="nate.com">nate.com</option>
					            <option value="directly" id="textEmail">직접 입력하기</option>
					        </select>
					        <input type="hidden" name="email" id="email"/>
                            <div class="error" id="emailCheck"></div>
                        </li>
                        <li>
                            <label class="pequenoTitle">비밀번호&nbsp;</label><span class="necesitado">*</span> <input type="password" name="password" id="password" class="myinput requiredInfo" size="41px" />
                            <div class="error"></div>
                        </li>
                        <li>
                            <label class="pequenoTitle">비밀번호확인&nbsp;</label><span class="necesitado">*</span> <input type="password" name="passwordCheck" id="passwordCheck" class="myinput requiredInfo" size="41px" />
                            <div class="error"></div>
                        </li>
                        <li>
                            <label class="pequenoTitle">생년월일</label> <input type="text" name="birthday" id="birthday" class="myinput" size="41px" maxlength="10" placeholder="예) 19960716" />
                            <div class="error"></div>
                        </li>
                         
                        <li>
                        	<label class="pequenoTitle">성별</label><br>
                            <select id="gender" name="gender" aria-label="성별">
	                            <option value="" selected>성별</option>
	                            <option value="1">남자</option>
	                            <option value="2">여자</option>
	                            <option value="3">선택 안함</option>
                          	</select>
                        </li>
                        
                        <li>
                            <label class="pequenoTitle">핸드폰번호</label> <input type="text" name="mobile" id="mobile" class="myinput" placeholder=" - 없이 입력" maxlength="13" size="41px" />
                            <div class="error"></div>
                        </li>
                        <li>
                            <label class="pequenoTitle">취향정보</label><span>(2개까지 선택가능)</span>
                            <div id="like">
                                <label for="dulce">달콤한향</label><input type="checkbox" name="taste" id="dulce" value="달콤"  />&nbsp;&nbsp; 
                                <label for="limpio">상쾌한향</label><input type="checkbox" name="taste" id="limpio" value="상쾌" />&nbsp;&nbsp; 
                                <label for="acido">상큼한향</label><input type="checkbox" name="taste" id="acido" value="상큼" />&nbsp;&nbsp; 
                                <label for="pesado">무거운향</label><input type="checkbox" name="taste" id="pesado" value="무거운" />&nbsp;&nbsp; 
                                <label for="fresco">시원한향</label><input type="checkbox" name="taste" id="fresco" value="시원" />&nbsp;&nbsp;
                            </div>
                            <!-- <div class="error">취향은 두개까지 선택가능합니다.</div> -->
                        </li>
                    </ul>
                    <div id="buttons" style="text-align: center;">
                        <button type="button" class="btn btn-default" onclick="goRegister()">수정</button>
                        <button type="button" class="btn btn-default" onclick="location.href='http://localhost:9090/Covengers/main.com'">취소</button>
                    </div>
                </fieldset>
            </form>
        
        
   	</div>
</div>