<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
    //String categoryInfo = request.getParameter("categoryInfo");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
  <title>Covengers</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Favicons -->
  <link href="/Covengers/assets/img/favicon.png" rel="icon">
  <link href="/Covengers/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <!-- Google Fonts -->
  
  <link href="/Covengers/assets/css/login-register.css" rel="stylesheet" />
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
	
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/Covengers/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/Covengers/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="/Covengers/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/Covengers/assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="/Covengers/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="/Covengers/assets/vendor/aos/aos.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.11.4.custom/jquery-ui.css" />

  <!-- Template Main CSS File -->
  <link href="/Covengers/assets/css/style.css" rel="stylesheet">
  
  <script src="/Covengers/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
  <script src="/Covengers/assets/js/bootstrap.js" type="text/javascript"></script>
  <script src="/Covengers/assets/js/login-register.js" type="text/javascript"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" ></script>
  <script type="text/javascript" src="/Covengers/js/jquery-3.3.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
  <script src="http://malsup.github.io/min/jquery.form.min.js"></script>
  <!-- =======================================================
  * Template Name: Squadfree - v2.2.0
  * Template URL: https://bootstrapmade.com/squadfree-free-bootstrap-template-creative/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
 
<style>
.container {
  position: relative;
  width: 100%;
}

/* .image {
  display: block;
  width: 100%;
  height: auto;
  
} */

/* .overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: #008CBA;
  overflow: hidden;
  width: 100%;
  height: 100%;
  -webkit-transform: scale(0);
  -ms-transform: scale(0);
  transform: scale(0);
  -webkit-transition: .3s ease;
  transition: .3s ease;
} */

/* .container:hover .overlay {
  -webkit-transform: scale(1);
  -ms-transform: scale(1);
  transform: scale(1);
} */

.text {
  color: white;
  font-size: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  text-align: center;
}

.container {
  position: relative;
  font-family: Arial;
}



h2#mainProduct {
  margin: 0 0 10px 0;
  font-size: 64px;
  font-weight: 700;
  line-height: 56px;
  text-transform: uppercase;
  color: #fff;
  text-shadow: -1px 0 2px #2f4d5a;
}

img#gif {
	width : 100%;
	height : 150px;
}

div.text-block {
	background-color: rgba( 255, 255, 255, 0 );
}

.myimage {
	height: 600px;
	margin: 50px 0;
}


.mycontainer {
	display: inline-flex;
	background: rgba( 0, 0, 0, 0.7 );
}

.services {
	height: 95vh;
}

.adtitle {
	color: white;
	font-weight: bold;
}

.addesc {
	color: white;
}

.myp {
	font-family: Poppins, Raleway, sans-serif;
	font-size: 25pt;
	color: white;
}

a {
	height: 60px;
}

</style>



<script type="text/javascript">
	
	$(document).ready(function (){
		
		$("input#password7").keydown(function(key) {
			if (key.keyCode == 13) {
				login();
			}
		});
		
	});
	
    function login() {
    	var frm = document.loginFrm;
	    frm.action = "<%= request.getContextPath()%>/member/login2.com";
	    frm.method = "post";
	    frm.submit();
    }
    

	function searchEmail() {
		
		$.ajax({
    		url:"<%= ctxPath%>/member/searchEmail.com",
    		data:{"name":$("input#name").val(), "password":$("input#sepassword").val()}, 
    		type:"post",
    		dataType:"json",  
    		success:function(json){
    			    			
    			if (json.email == null) {
    				alert(" You don't have account ")
    			} else {
        			alert("Your Email is " + json.email);
    			}		
    			
    		},
    		error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);

			}
    		
    	});
					
	}

	function searchPassword() {
		
		$.ajax({
    		url:"<%= ctxPath%>/member/searchUser.com",
    		data:{"email":$("input#email2").val(), "name":$("input#name2").val()}, 
    		type:"post",
    		dataType:"json",  
    		success:function(json){
    			
    			if ("1" != json.n) {
    				alert(" You don't have account ");
    			}else {
    				changePW();
    			}
    			
    		},
    		error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);

			}
    		
    	});

		
	}
	
	function changePW() {
    	var frm = document.pwForm;
	    frm.action = "<%=request.getContextPath()%>/member/updatePassword.com";
		frm.method = "post";
		frm.submit();
	}
    
    
    
</script>

</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top header-transparent">
    <div class="container d-flex align-items-center">

      <div class="logo mr-auto">
        <h1 class="text-light"><a href="main.com"><span>Covengers</span></a></h1>
        
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="#hero">Home</a></li>
          
          
        <c:if test="${ sessionScope.loginuser != null }">
			<li><a href="<%= ctxPath%>/member/logout.com">Logout</a></li>
		</c:if>
			      
		  
		<c:if test="${ sessionScope.loginuser == null }">
			<li><a href="<%= ctxPath%>/member/register.com">Register</a></li>
          	<li><a data-toggle="modal" data-target="#loginModal">Login</a></li>
		</c:if>
		  
          
        <li class="drop-down"><a href="<%=ctxPath%>/product/productDisplay.com">Product</a>
	       <ul>
	       <li class="drop-down"><a href="#">PERFUME</a>
			<ul>
		   	  <c:forEach var="list" items="${categoryInfo}" varStatus="status">
				<c:if test="${list.fk_kindcode eq 'PF'}">
				  <li><a href="<%=ctxPath%>/product/productDisplay.com?categorycode=${list.fk_categorycode}">${list.encategoryname}</a></li>
				</c:if>
		      </c:forEach>
			</ul>
		   </li>
	       <li class="drop-down"><a href="#">DIFFUSER</a>
			<ul>
		   	  <c:forEach var="list" items="${categoryInfo}" varStatus="status">
				<c:if test="${list.fk_kindcode eq 'DF'}">
				  <li><a href="<%=ctxPath%>/product/productDisplay.com?categorycode=${list.fk_categorycode}">${list.encategoryname}</a></li>
				</c:if>
		      </c:forEach>
			</ul>
		   </li>
	       <li class="drop-down"><a href="#">CANDLE</a>
			<ul>
		   	  <c:forEach var="list" items="${categoryInfo}" varStatus="status">
				<c:if test="${list.fk_kindcode eq 'CD'}">
				  <li><a href="<%=ctxPath%>/product/productDisplay.com?categorycode=${list.fk_categorycode}">${list.encategoryname}</a></li>
				</c:if>
		      </c:forEach>
			</ul>
		   </li>
	       <li class="drop-down"><a href="#">INCENSE</a>
			<ul>
		   	  <c:forEach var="list" items="${categoryInfo}" varStatus="status">
				<c:if test="${list.fk_kindcode eq 'IC'}">
				  <li><a href="<%=ctxPath%>/product/productDisplay.com?categorycode=${list.fk_categorycode}">${list.encategoryname}</a></li>
				</c:if>
		      </c:forEach>
			</ul>
		   </li>
	      </ul>
	    </li>
	    
	    <li class="drop-down"><a href="<%= ctxPath%>/board/faq.com">board</a>
			 <ul>
			 	<li><a href="<%= ctxPath%>/board/faq.com">FAQ</a></li>
			    <li><a href="<%= ctxPath%>/board/qnaList.com">QnA</a></li>
			    <li><a href="<%= ctxPath%>/product/showReview.com">REVIEW</a></li>
			 </ul>
		</li>
	    
        <!--  <li><a href="#team">Brand</a></li>
        <li><a href="#contact">Contact Us</a></li> -->
	
		<li>
			<c:if test="${sessionScope.loginuser.status ne 3}"><a href="<%=request.getContextPath()%>/mypage/myInfo.com"><img src="/Covengers/images/user5.png" style="width: 25px; height: 25px;" /></a></c:if>
			<c:if test="${sessionScope.loginuser.status eq 3}"><a href="<%=request.getContextPath()%>/covengers.com"><img src="/Covengers/images/user5.png" style="width: 25px; height: 25px;" /></a></c:if>
		</li>
        <li><a href="<%=request.getContextPath()%>/product/myCart.com"><img src="/Covengers/images/shopping-cart8.png" style="width: 25x; height: 25px; margin-top: 2px;" /></a></li>
	
        </ul>
      </nav><!-- .nav-menu -->
	

    </div>
    
    
  </header><!-- End Header -->
  
<div class="modal fade login" id="loginModal">
		<div class="modal-dialog login animated">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="box">
						<div class="content">
							<div class="social">
								<a class="circle github" href="#"> <i
									class="fa fa-github fa-fw"></i>
								</a> <a id="google_login" class="circle google" href="#"> <i
									class="fa fa-google-plus fa-fw"></i>
								</a> <a id="facebook_login" class="circle facebook" href="#"> <i
									class="fa fa-facebook fa-fw"></i>
								</a>
							</div>
							<div class="division">
								<div class="line l"></div>
								<span>or</span>
								<div class="line r"></div>
							</div>
							<div class="error"></div>
							<div class="form loginBox">
								<form accept-charset="UTF-8" name="loginFrm">
									<input id="email" class="form-control" type="text"
										placeholder="Email" name="email"> <input id="password7"
										class="form-control" type="password" placeholder="Password"
										name="pwd"> <input class="btn btn-default btn-login"
										type="button" value="Login" onclick="login()"><br>
									<a data-toggle="modal" data-target="#searchEmailModal">SearchEmail</a>&nbsp;&nbsp;&nbsp;
									<a data-toggle="modal" data-target="#modifyPasswordModal">SearchPW</a>
								</form>
							</div>
						</div>
					</div>
					<div class="box">
						<div class="content registerBox" style="display: none;">
							<div class="form">
								<form method="" html="{:multipart=>true}" data-remote="true"
									action="" accept-charset="UTF-8">
									<input id="email" class="form-control" type="text"
										placeholder="Email" name="email"> <input id="password"
										class="form-control" type="password" placeholder="Password"
										name="password"> <input id="password_confirmation"
										class="form-control" type="password"
										placeholder="Repeat Password" name="password_confirmation">
									<input class="btn btn-default btn-register" type="button"
										value="Create account" name="commit">
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="forgot login-footer">
						<span>Looking to <a href="javascript: showRegisterForm();">create
								an account</a> ?
						</span>
					</div>
					<div class="forgot register-footer" style="display: none">
						<span>Already have an account?</span> <a
							href="<%=ctxPath%>/member/LoginAction2.com">Login</a>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- ID 찾기 모델 -->
	<div class="modal fade login" id="searchEmailModal">
		<div class="modal-dialog login animated">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="box">
						<div class="content">


							<div class="error"></div>
							<div class="form loginBox">
								<form accept-charset="UTF-8" name="searchEmailFrm">
									<h3>Please enter your name and password.</h3>
									<input id="name" class="form-control" type="text" placeholder="name" name="name"> 
									<input id="sepassword" class="form-control" type="password" placeholder="Password" name="password1"> 
									<input class="btn btn-default btn-login" type="button" value="Search" onclick="searchEmail()"><br>
								</form>
							</div>
						</div>
					</div>
					<div class="box">
						<div class="content registerBox" style="display: none;">
							<div class="form">
								<form method="" html="{:multipart=>true}" data-remote="true"
									action="" accept-charset="UTF-8">
									<input id="email" class="form-control" type="text"
										placeholder="Email" name="email"> <input id="password"
										class="form-control" type="password" placeholder="Password"
										name="password"> <input id="password_confirmation"
										class="form-control" type="password"
										placeholder="Repeat Password" name="password_confirmation">
									<input class="btn btn-default btn-register" type="button"
										value="Create account" name="commit">
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
<!-- 패스워드 수정하기 -->
	<div class="modal fade login" id="modifyPasswordModal">
		<div class="modal-dialog login animated">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="box">
						<div class="content">


							<div class="error"></div>
							<div class="form loginBox">
								<form accept-charset="UTF-8" name="pwForm">
									<h3>Please fill in your e-mail and name.</h3>
									<input id="email2" class="form-control" type="text" placeholder="email1" name="email1"> 
									<input id="name2" class="form-control" type="text" placeholder="name1"name="name1"> 
									<input class="btn btn-default btn-login" type="button" value="Search" onclick="searchPassword()"><br>
								</form>
							</div>
						</div>
					</div>
					<div class="box">
						<div class="content registerBox" style="display: none;">
							<div class="form">
								<form method="" html="{:multipart=>true}" data-remote="true"
									action="" accept-charset="UTF-8">
									<input id="email" class="form-control" type="text"
										placeholder="Email" name="email"> <input id="password"
										class="form-control" type="password" placeholder="Password"
										name="password"> <input id="password_confirmation"
										class="form-control" type="password"
										placeholder="Repeat Password" name="password_confirmation">
									<input class="btn btn-default btn-register" type="button"
										value="Create account" name="commit">
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>	


  <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="hero-container" data-aos="fade-up">
      <h1>Welcome to Covengers</h1>
      <h2>We are a professional team on perfume.</h2>
      <a href="#adproduct" class="btn-get-started scrollto"><i class="bx bx-chevrons-down"></i></a>
    </div>
  </section><!-- End Hero -->

  <main id="main">


    <!-- ======= Services Section ======= -->
    <div id="adproduct">
	    <c:forEach var="svo" items="${plist}" varStatus="status">
		    <section id="services" class="services" style="background-image: url( 'images/adproduct_a${status.count}.png' )">
		      <div class="container" >
		        <div class="section-title" data-aos="fade-in" data-aos-delay="100">
		          <h2 id="mainProduct">${svo.enproductname}</h2>
		        </div>
				<div class="container mycontainer" data-aos="fade-in" data-aos-delay="100">
					<img src="/Covengers/images/${svo.productimg1}" class="image myimage">
			        <!-- <div class="row"> -->
			          <div class="col-md-24 col-lg-24 d-flex align-items-center mb-5 mb-lg-0">
			            <div class="descBox" data-aos="fade-up">
			              <h4 class="adtitle">${svo.krproductname}</h4>
			              <p class="addesc">${svo.productdescshort}</p>
			              <div><a href="<%=ctxPath %>/product/productDetail.com?productcode=${svo.productcode}">자세히보기</a></div>
			            </div>
			          </div>
			       <!-- </div> -->
				</div>
		      </div>
		    </section>
	    </c:forEach>
    </div>
	

   
    <!-- ======= Cta Section ======= -->
   <section id="cta" class="cta" style="margin-top: 100px;">
      <div class="container" data-aos="zoom-in">

        <div class="text-center">
         <!--  <h3></h3>
          <p></p> -->
          <a class="cta-btn" href="<%=ctxPath%>/product/productDisplay.com">제품둘러보기</a>
        </div>

      </div>
    </section><!-- End Cta Section -->
  

    

    <!-- ======= Team Section ======= -->
    <section id="team" class="team" style="background:rgba(0, 0, 0, 0.5); margin-top: 100px;">
      <div class="container" style="text-align: center;">

        <div class="section-title" data-aos="fade-in" data-aos-delay="100">
          <h2>Team</h2>
        </div>
		<p class="myp" style="font-weight: bold;">"los jóvenes persiguiendo por sus sueños"</p>
        <p class="myp" style="font-size: 20pt;">권오윤 김민성 박지현 안세형 황주호</p>

       

      </div>
    </section><!-- End Team Section -->



    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact section-bg">
      <div class="container">

        <div class="section-title" data-aos="fade-in" data-aos-delay="100">
          <h2>Contact</h2>
        </div>

        <div class="row" data-aos="fade-up" data-aos-delay="200">

          <div class="col-lg-6 ">
            <iframe class="mb-4 mb-lg-0" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.9372323357097!2d126.91735991531138!3d37.55654257979972!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c993410ca2f63%3A0x5bc4dfe507bd6544!2z7IyN7Jqp6rCV67aB6rWQ7Jyh7IS87YSw!5e0!3m2!1sko!2skr!4v1604739280862!5m2!1sko!2skr" frameborder="0" style="border:0; width: 100%; height: 384px;" allowfullscreen></iframe>
          </div>
          
          <div class="col-lg-6 col-md-6">
            <div class="info-box  mb-4">
              <i class="bx person"></i>
              <h3>Covengers</h3>
              <p>Ssangyong Gangbuk education center 21,<br>
                World Cup North Road in Mapo-gu, Seoul<br><br>
                <strong>Phone:</strong> +82 1234-5677<br>
                <strong>Email:</strong> info@example.com<br></p>
                <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          

        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer"  style="background-color: black;">
   

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Covengers</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        
        Designed by <a href="#">Covengers</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#header" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="<%= ctxPath %>/assets/vendor/jquery/jquery.min.js"></script>
  <script src="<%= ctxPath %>/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%= ctxPath %>/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="<%= ctxPath %>/assets/vendor/php-email-form/validate.js"></script>
  <script src="<%= ctxPath %>/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="<%= ctxPath %>/assets/vendor/counterup/counterup.min.js"></script>
  <script src="<%= ctxPath %>/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="<%= ctxPath %>/assets/vendor/venobox/venobox.min.js"></script>
  <script src="<%= ctxPath %>/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="<%= ctxPath %>/assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="<%= ctxPath %>/assets/js/main.js"></script>

</body>

</html>