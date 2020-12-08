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

public class DeleteReviewAction extends AbstractController {

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

            String reviewno = request.getParameter("reviewno");
            String orderno = request.getParameter("orderno");
            String productcode = request.getParameter("productcode");
            
            
            Map<String, String> paraMap = new HashMap<String, String>();
            paraMap.put("reviewno", reviewno);
            paraMap.put("orderno", orderno);
            paraMap.put("productcode", productcode);
            
            
            InterProductDAO pdao = new ProductDAO();
            
            int n = pdao.deleteReview(paraMap);
            
            String message = "";
            
            if (n == 0) {  // 시스템문제
               message = "시스템 적으로 문제가 발생했습니다.<br>리뷰 수정에 실패하셨습니다.";
            } else if(n == 1) {  // 정상적으로 인서트
               message = "리뷰삭제 성공!!";
            } else if (n == 2) {  // 이미 작성한 유저
               message = "바보야~~바보들아~~";
            } else {  // 외계생물
               message = "이건 절대 뜰 수 없지만 그냥넣음";
            }
            
            request.setAttribute("n", n);
            request.setAttribute("message", message);
            
            super.setRedirect(false);
            super.setViewPage("/WEB-INF/review/reviewResult.jsp");
            
            
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