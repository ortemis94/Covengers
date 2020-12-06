package product.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class ShowOneReviewAction extends AbstractController {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      super.header(request);
      String method = request.getMethod();
      
      if ("GET".equals(method)) {
         // 겟방식을 타고 리뷰 넘버를 가지고 넘어온다.
         String reviewno = request.getParameter("reviewno");
         
         
         if (reviewno == null) {  // 리뷰넘버가 비어있을 경우
            String message = "등록된 리뷰가 없습니다.";
            String loc = request.getContextPath() + "/product/showReview.com";
            
            request.setAttribute("message", message);
            request.setAttribute("loc", loc);
            
            super.setRedirect(false);
            super.setViewPage("/WEB-INF/msg.jsp");
            
         } else {
            // 가지고 온 리뷰넘버를 가지고 해당하는 1개의 리뷰에 대한 필요한 정보를 데이터베이스에서 가지고온돠
            
            InterProductDAO pdao = new ProductDAO();
            
            Map<String, String> review = pdao.getOneReview(reviewno);
            
            // List<Map<String, String>> reviewList = pdao.getOtherReview(reviewno);
            
            if (review.size() == 0) {  // 해당 번호의 상품이 디비에 없을 경우
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
            
         }
      } else {
         
      }
      
      
   }

}