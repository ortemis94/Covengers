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
		
		$(".error").hide();
        $("input#emailtext").hide(); 
        $("input#name").focus();
        
        $("input#name").blur(function () {
            var name = $(this).val().trim();

            if (name == "") {
                $(this).next().show();
            } else {
                $(this).next().hide();
            }
        });

        
        $("input#emailid").click(function name() { // 이메일 입력창을 클릭할 때
        	$("#emailCheck").text("이메일은 수정할 수 없습니다.");
        	$("#emailCheck").show();
		});
        
        $("input#emailid").blur(function() { // 이메일 입력창을 벗어났을 때
        	$("#emailCheck").hide();
		});
        
        /* 
            $("input#prePassword").blur(function () {
            var pwd = $(this).val().trim();

            if (pwd == "") {
                $(this).next().text("비밀번호를 입력해주세요.");
                $(this).next().show();
            } else {
                var regExp = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
                // 숫자/문자/특수문자/ 포함 형태의 8~15자리 이내의 암호 정규표현식 객체 생성

                var bool = regExp.test(pwd);

                if (!bool) {
                    $(this).next().text("비밀번호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.");
                    $(this).next().show();
                } else {
                    $(this).next().hide();
                }
            }
        });
        */
        

        $("input#password").blur(function () {
            var pwd = $(this).val().trim();

            if (pwd == "") {
                $(this).next().text("비밀번호를 입력해주세요.");
                $(this).next().show();
            } else {
                var regExp = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
                // 숫자/문자/특수문자/ 포함 형태의 8~15자리 이내의 암호 정규표현식 객체 생성

                var bool = regExp.test(pwd);

                if (!bool) {
                    $(this).next().text("비밀번호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.");
                    $(this).next().show();
                    $(this).val("");
                    $(this).focus();
                } else {
                    $(this).next().hide();
                }
            }
        });

        $("input#passwordCheck").blur(function() {
            var pwd = $(this).parent().siblings().children("input#password").val();
            var pwdcheck = $(this).val().trim();

            if (pwdcheck == "") {
                $(this).next().text("비밀번호 확인을 진행해주세요.");
                $(this).next().show();
            } else {
                if (pwd != pwdcheck) {
                    $(this).next().text("비밀번호가 일치하지 않습니다.");
                    $(this).next().show();
                    $(this).val("");
                    $("input#password").focus();
                }else {
                    $(this).next().hide();
                }
            }
        });

        $("input#birthday").keyup(function(){
        	$(this).val( $(this).val().replace(/[^\d]/g, "").replace(/(\d{4})(\d{2})(\d{2})/,"$1.$2.$3") );
        	
        	var birthday = $(this).val();
        	if(birthday == ""){
       		 	$(this).next().text("생년월일을 올바르게 입력해주세요.(생년월일을 8자리로 입력해주세요! ) 예) 19960716 ");
                $(this).next().show();
                $(this).val("");
       		}else {
       			$(this).next().hide();
                // 010-7681-0219
                $(this).blur(function () {
            		birthday = $(this).val();
               		if(birthday.length != 10){

               			$(this).next().text("생년월일을 올바르게 입력해주세요.(생년월일을 8자리로 입력해주세요! ) 예) 19960716 ");
                        $(this).next().show();
                        $(this).val("");
               		}
               });
       		}
        });

        
        $("input#mobile").keyup(function() { 
        	$(this).val( $(this).val().replace(/[^\d]/g, "").replace(/(\d{3})(\d{4})(\d{4})/,"$1-$2-$3"));
        	
        	var mobile = $(this).val();
        	if(mobile == ""){
        		 $(this).next().text("전화번호 11자리(또는 10자리)를 입력해주세요.");
                 $(this).next().show();
                 $(this).val("");
        	}else {
        		$(this).next().hide();
                // 010-7681-0219
                $(this).blur(function () {
                	mobile = $(this).val();
                	if(mobile.length != 13){

                		 $(this).next().text("전화번호 11자리(또는 10자리)를 입력해주세요.");
                         $(this).next().show();
                         $(this).val("");
                	}
                });
        	}
        });
	    
	    
	});// end of $(document).ready(function() {});-----------------------------

	
	function goUpdate() {
		
	////// 필수입력사항에 모두 입력이 됐는지 검사하기 /////

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
        
        if (!bFlagRequiredInfo) {
        	
        	var form_data = $("form[name=registerFrm]").serialize();
        	
        	$.ajax({
        		url:"<%= ctxPath%>/mypage/myInfo.com",
        		data:form_data,
        		type:"POST",
        		dataType:"json",
        		success: function(json){ 
        			var n = json.n;
        			
        			if (n == 1) {
						alert("정보수정이 완료되었습니다.");
						location.href="<%= ctxPath%>/mypage/myInfo.com";
					}else if(n == 0) {
						alert("비밀번호가 틀렸습니다.");
						$("input#password").val("");
						$("input#passwordCheck").val("");
						$("input#password").focus();
					}
     		    },
     		    error: function(request, status, error){
                    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                }
        	});
            <%-- 
            var frm = document.registerFrm;
            frm.action = "<%= ctxPath%>/mypage/myInfo.com"; //자기가 자기한테 보내는중
            frm.method = "post";
            frm.submit(); 
            --%>
        } 
		
	}// end of function goUpdate() {}-----------------------------------
	
	
	
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
		<h1>내 정보 확인 &amp; 수정</h1>
        <hr style="border: solid 1px gray; color: gray;">
        
        
        <form name="registerFrm">
                <fieldset>
                    <ul id="Info">
                        <li>
                            <label class="pequenoTitle">닉네임&nbsp;</label><span class="necesitado">*</span> <input type="text" name="name" id="name" class="myinput requiredInfo" size="41px" value= "${loginuser.name}"/>
                            <div class="error">닉네임은 필수입력사항 입니다.</div>
                        </li>
                        <li>
                            <label class="pequenoTitle">이메일&nbsp;</label><span class="necesitado">*</span><br>
                            <input type="text" id="emailid" class="myinput requiredInfo" size="41px" value="${loginuser.email}" readonly/>
					        <input type="hidden" name="email" id="email"/>
                            <div class="error" id="emailCheck"></div>
                        </li>
                      <!--  
                        <li>
                            <label class="pequenoTitle">기존비밀번호&nbsp;</label><span class="necesitado">*</span> <input type="password" name="prePassword" id="prePassword" class="myinput requiredInfo" size="41px" />
                            <div class="error"></div>
                        </li> -->
                        <li>
                            <label class="pequenoTitle">비밀번호&nbsp;</label><span class="necesitado">*</span> <input type="password" name="password" id="password" class="myinput requiredInfo" size="41px" />
                            <div class="error"></div>
                        </li>
                        <li>
                            <label class="pequenoTitle">비밀번호확인&nbsp;</label><span class="necesitado">*</span> <input type="password" name="passwordCheck" id="passwordCheck" class="myinput requiredInfo" size="41px" />
                            <div class="error"></div>
                        </li>
                        <li>
                            <label class="pequenoTitle">생년월일</label> <input type="text" name="birthday" id="birthday" class="myinput" size="41px" maxlength="10" value="${loginuser.birthday}" />
                            <div class="error"></div>
                        </li>
                         
                        <li>
                        	<label class="pequenoTitle">성별</label><br>
                            <select id="gender" name="gender" aria-label="성별" >
                            	<c:choose>
                            		<c:when test="${loginuser.gender eq null}"> 
                            			<option value="" selected>성별</option>
	                            		<option value="1">남자</option>
	                            		<option value="2">여자</option>
	                            		<option value="3">선택 안함</option>
	                            	</c:when>
	                            	<c:when test="${loginuser.gender eq 1}"> 
                            			<option value="">성별</option>
	                            		<option value="1" selected>남자</option>
	                            		<option value="2">여자</option>
	                            		<option value="3">선택 안함</option>
	                            	</c:when>
	                            	<c:when test="${loginuser.gender eq 2}"> 
                            			<option value="">성별</option>
	                            		<option value="1">남자</option>
	                            		<option value="2" selected>여자</option>
	                            		<option value="3">선택 안함</option>
	                            	</c:when>
									<c:otherwise>
										<option value="">성별</option>
	                            		<option value="1">남자</option>
	                            		<option value="2">여자</option>
	                            		<option value="3" selected>선택 안함</option>
									</c:otherwise>	
	                            </c:choose>
                          	</select>
                        </li>
                        
                        <li>
                            <label class="pequenoTitle">핸드폰번호</label> <input type="text" name="mobile" id="mobile" class="myinput" maxlength="13" size="41px" value="${loginuser.mobile}" />
                            <div class="error"></div>
                        </li>
                    <!--   
                        <li>
                            <label class="pequenoTitle">취향정보</label><span>(2개까지 선택가능)</span>
                            <div id="like">
                                <label for="dulce">달콤한향</label><input type="checkbox" name="taste" id="dulce" value="달콤"  />&nbsp;&nbsp; 
                                <label for="limpio">상쾌한향</label><input type="checkbox" name="taste" id="limpio" value="상쾌" />&nbsp;&nbsp; 
                                <label for="acido">상큼한향</label><input type="checkbox" name="taste" id="acido" value="상큼" />&nbsp;&nbsp; 
                                <label for="pesado">무거운향</label><input type="checkbox" name="taste" id="pesado" value="무거운" />&nbsp;&nbsp; 
                                <label for="fresco">시원한향</label><input type="checkbox" name="taste" id="fresco" value="시원" />&nbsp;&nbsp;
                            </div>
                            <div class="error">취향은 두개까지 선택가능합니다.</div>
                        </li> 
                    --> 
                    </ul>
                    <div id="buttons" style="text-align: center;">
                        <button type="button" class="btn btn-default" onclick="goUpdate()">수정</button>
                        <!-- <button type="button" class="btn btn-default" onclick="location.href='http://localhost:9090/Covengers/main.com'">취소</button> -->
                    </div>
                </fieldset>
            </form>
        
        
   	</div>
</div>