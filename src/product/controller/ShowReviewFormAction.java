package product.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import my.util.MyUtil;
import product.model.*;

public class ShowReviewFormAction extends AbstractController {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String method = request.getMethod();
      super.header(request);
      HttpSession session = request.getSession();
      MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

      if (loginuser != null) {
         if ("post".equalsIgnoreCase(method)) {

            // 일단 상품 코드 받고
            String productcode = request.getParameter("productcode1");

            // 주문 코드 받고
            String orderno =  request.getParameter("paymentno1");

            // flqb 입력 혹은 업데이트 확인용
            // 등록되어 있는 리뷰인지 아닌지 확인용으로 등록이 되어있다면 리뷰 수정이 되어지고
            // 등록이 되어있지 않다면 새로운 리뷰 등록이 되어진다.
            
            String reviewno = request.getParameter("reviewno");
            
            Map<String, String> review = null;
            
            ProductVO product = null;
            
            InterProductDAO pdao = new ProductDAO();
            if(reviewno != null) {
               
               review = pdao.getOneReview(reviewno);
               request.setAttribute("review", review);
               
            } else {
               product = pdao.selectOneProduct(productcode);
               
               // 임의로 변수 설정 (디비에 들어가는지 확인용)
               
               // 변수 설정 끝
               Map<String, String> paraMap = new HashMap<String, String>();
               paraMap.put("rgrade", "0");
               
               request.setAttribute("product", product);
               request.setAttribute("orderno", orderno);
               request.setAttribute("review", paraMap);
               
            }

            System.out.println("review : " + review);
            System.out.println("product : " + product);

            request.setAttribute("loginuser", loginuser);
            
            super.setRedirect(false);
            super.setViewPage("/WEB-INF/review/showReview.jsp");

         } else {
            String message = "비정상적인 경로로 접근 하셨습니다~";
            String loc = "javascript:history.back()";

            request.setAttribute("message", message);
            request.setAttribute("loc", loc);

            super.setRedirect(false);
            super.setViewPage("/WEB-INF/msg.jsp");
         }

      } else {
         String message = "로그인이 필요합니당";
         String loc = "javascript:history.back()";

  		 String currentURL = MyUtil.getCurrentURL(request);
         session.setAttribute("currentURL", currentURL);
         
         request.setAttribute("message", message);
         request.setAttribute("loc", loc);

         super.setRedirect(false);
         super.setViewPage("/WEB-INF/msg.jsp");
      }

   }

}