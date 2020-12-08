package product.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import my.util.MyUtil;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class GetReviewAction extends AbstractController {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String method = request.getMethod();
      super.header(request);
      HttpSession session = request.getSession();
      MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

      if (loginuser != null) {
         if ("post".equalsIgnoreCase(method)) {
            
            String currentURL = MyUtil.getCurrentURL(request);
            session.setAttribute("currentURL", currentURL);
            
            String productcode = request.getParameter("productcode1");
            String paymentno = request.getParameter("paymentno1");
            String userno = loginuser.getUserno();

            Map<String, String> paraMap = new HashMap<String, String>();
            paraMap.put("productcode", productcode);
            paraMap.put("paymentno", paymentno);
            paraMap.put("userno", userno);

            InterProductDAO pdao = new ProductDAO();
            
            
            System.out.println(productcode);
            System.out.println(paymentno);
            System.out.println(userno);

            String reviewno = pdao.getReview(paraMap);
            
            

            // 가지고 온 리뷰넘버를 가지고 해당하는 1개의 리뷰에 대한 필요한 정보를 데이터베이스에서 가지고온돠

            Map<String, String> review = pdao.getOneReview(reviewno);

            // List<Map<String, String>> reviewList = pdao.getOtherReview(reviewno);

            if (review.size() == 0) { // 해당 번호의 상품이 디비에 없을 경우
               String message = "해당 상품의 리뷰가 없습니다!!!";
               String loc = request.getContextPath() + "/product/showReview.com";

               request.setAttribute("message", message);
               request.setAttribute("loc", loc);

               super.setRedirect(false);
               super.setViewPage("/WEB-INF/msg.jsp");
            } else {
               // 가지고 온 리뷰 정보를 뷰딴에 뿌려주기 위해 넘겨준다.
               request.setAttribute("review", review);

               super.setRedirect(false);
               super.setViewPage("/WEB-INF/review/showOneReview.jsp");
            }

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