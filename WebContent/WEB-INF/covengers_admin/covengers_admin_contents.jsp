<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
    <%
    	String ctxPath = request.getContextPath();
    
    %>

<style type="text/css">

</style>

<script type="text/javascript">



</script>


<!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>



          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
<!--         <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              Dropdown - Messages
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li> -->

            <!-- Nav Item - Alerts -->
          <!--   <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                Counter - Alerts
                <span class="badge badge-danger badge-counter">3+</span>
              </a>
              Dropdown - Alerts
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Alerts Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-file-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 12, 2019</div>
                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-success">
                      <i class="fas fa-donate text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 7, 2019</div>
                    $290.29 has been deposited into your account!
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 2, 2019</div>
                    Spending Alert: We've noticed unusually high spending for your account.
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>

            Nav Item - Messages
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                Counter - Messages
                <span class="badge badge-danger badge-counter">7</span>
              </a>
              Dropdown - Messages
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  Message Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                    <div class="status-indicator"></div>
                  </div>
                  <div>
                    <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                    <div class="small text-gray-500">Jae Chun · 1d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                    <div class="status-indicator bg-warning"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
              </div>
            </li> -->
            
			<li class="nav-item dropdown d-flex align-items-center">
				<a class="dropdown-item" href="#" data-toggle="modal" data-target="#goMainModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  	메인 페이지로
            	</a>
            </li>
            <li class="nav-item dropdown d-flex align-items-center">
            	<div class="topbar-divider d-none d-sm-block"></div>
			</li>
			
            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.loginuser.name}</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <!-- <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#goMainModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  	메인 페이지로
                </a>
              </div> -->
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">모아보기</h1>

          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="font-size: 15pt">${fn:substring(managementInfo.weekOfYear, fn:indexOf(managementInfo.weekOfYear, "-") + 1, -1)}주차 총 판매액</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      	<c:if test="${managementInfo.totalSalesPriceByWeek ne null}">
                      	<span> 
                      		<fmt:parseNumber var="totalSalesPriceByWeek" value="${managementInfo.totalSalesPriceByWeek}" integerOnly="true"/>
                      		<fmt:formatNumber value="${totalSalesPriceByWeek}" pattern="#,###" />원
                      	</span>
                    	</c:if>
                    	<c:if test="${managementInfo.totalSalesPriceByWeek eq null}"><span style="color:red; font-size: 13pt;">주간 판매건수가 없습니다.</span></c:if>
                      	</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1" style="font-size: 15pt">${fn:substring(managementInfo.monthOfYear, fn:indexOf(managementInfo.monthOfYear, "-") + 1, -1)}월 총 판매액</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      	<c:if test="${managementInfo.totalSalesPriceByMonth ne null}">
                      	<span> 
                      		<fmt:parseNumber var="totalSalesPriceByMonth" value="${managementInfo.totalSalesPriceByMonth}" integerOnly="true"/>
                      		<fmt:formatNumber value="${totalSalesPriceByMonth}" pattern="#,###" />원
                      	</span>
                      	</c:if>
                      	<c:if test="${managementInfo.totalSalesPriceByMonth eq null}"><span style="color:red; font-size: 13pt;">월간 판매건수가 없습니다.</span></c:if>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
			
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1" style="font-size: 15pt">등록회원수</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                          	<fmt:formatNumber value="${managementInfo.totalMember }" pattern="#,###" />명
                          </div>
                        </div>
                        <div class="col">
                          <%-- <div class="progress progress-sm mr-2">
                            <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="${managementInfo.totalMember}" aria-valuemin="0" aria-valuemax="1000"></div>
                          </div> --%>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-user-check fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1" style="font-size: 15pt">등록 상품수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      	<fmt:formatNumber value="${managementInfo.totalProduct }" pattern="#,###" />개
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-gift fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="font-size: 15pt">이번달 주문왕</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      <c:if test="${managementInfo.buyUserno ne null}">
                	      <span>${managementInfo.buyName }님</span>
        	              <br>
            	          <span>총 주문수  - <fmt:formatNumber value="${managementInfo.totalOrderQty}" pattern="#,###" />회</span>
                      </c:if>
                      <c:if test="${managementInfo.buyUserno eq null}">
    	                  <span style="color:red; font-size: 13pt;">이번달 주문왕은 없습니다.</span>
                      </c:if>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1" style="font-size: 15pt">이번달 flex왕</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      <c:if test="${managementInfo.flexUserno ne null}">
	                      <span>${managementInfo.flexName }님</span>
	                      <br>
	                      <span>총 결제액  - <fmt:formatNumber value="${managementInfo.totalFlex}" pattern="#,###" />원</span>
	                  </c:if>
                      <c:if test="${managementInfo.flexUserno eq null}">
    	                  <span style="color:red; font-size: 13pt;">이번달 flex왕은 없습니다.</span>
                      </c:if>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          </div>

			
			
            
          <!-- Content Row -->

          <div class="row">
			
            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                 		 <h6 class="m-0 font-weight-bold text-primary">이번주 상품 판매량</h6>
                   </div>
                  </div>
                </div>
               <!--  Card Body -->
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="amountByCategory"></canvas>
                    
                  </div>
                </div>
              </div>
            </div>

         
          </div>

          

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Covengers 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="goMainModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">메인페이지로 넘어가려면 mainPage 버튼을 누르세요.</div>
        <div class="modal-footer">
          <a class="btn btn-primary" id="btnLogout" href="<%=request.getContextPath()%>/main.com">mainPage</a>
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
        </div>
      </div>
      
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="/Covengers/admin/vendor/jquery/jquery.min.js"></script>
  <script src="/Covengers/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/Covengers/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/Covengers/admin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="/Covengers/admin/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/Covengers/admin/js/demo/chart-pie-demo.js"></script>
	
	
	<script type="text/javascript">
	
	var ctx = document.getElementById("amountByCategory");
	var label = new Array();
	var data = new Array();
	/* $.each(${infoList}, function(index, item){
		label.push(item.krcategoryname);
		data.push(item.countPerCategory);
	}); */
	
	/* ${infoList}.each(function(index, item){
		label.push(item.krcategoryname);
		data.push(item.countPerCategory);
	}) */
	
/* 
	<c:forEach var='info' items='${infoList}' varStatus='status'>
		label.push('${info.payday}');
		data.push('${info.sumOrderQty}');
		weekTotalCount += Number("${info.sumOrderQty}");
	</c:forEach>
 */	
 	var weekTotalCount = 0;
	var flag;	
 	var payday = "";
	
	for (var i = 1; i < 8; i++) {
		flag = false;
		switch (i) { // 판매일을 요일로 바꿔준다.
		case 1:
			payday = "일";
			break;
		case 2:
			payday = "월";
			break;
		case 3:
			payday = "화";
			break;
		case 4:
			payday = "수";
			break;
		case 5:
			payday = "목";
			break;
		case 6:
			payday = "금";
			break;
		case 7:
			payday = "토";
			break;
		}
		
		label.push(payday);
		<c:forEach var='info' items='${infoList}' varStatus='status'>
			if ('${info.payday}' == i) {
				data.push('${info.sumOrderQty}');
				weekTotalCount += Number("${info.sumOrderQty}");
				flag = true;
			}
		</c:forEach>
		if (!flag) {
			data.push(0);
		}
	}

	label.push('이번주 총 판매량');
	data.push(weekTotalCount);
	
	console.log(label);
	console.log(data);
	console.log(weekTotalCount);
	
	var myLineChart = new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: label,
	    datasets: [{
	      label: "요일별 상품 판매량",
	      lineTension: 0.3,
	      backgroundColor: "rgba(78, 115, 223, 0.05)",
	      borderColor: "rgba(78, 115, 223, 1)",
	      pointRadius: 3,
	      pointBackgroundColor: "rgba(78, 115, 223, 1)",
	      pointBorderColor: "rgba(78, 115, 223, 1)",
	      pointHoverRadius: 3,
	      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	      pointHitRadius: 10,
	      pointBorderWidth: 2,
	      data: data,
	    }]
	  },
	  options: {
		    maintainAspectRatio: false,
		    layout: {
		      padding: {
		        left: 10,
		        right: 25,
		        top: 25,
		        bottom: 0
		      }
		    }
	  }
	});
	</script>
	
</body>

</html>