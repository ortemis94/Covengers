package mypage.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.InterOrderDAO;
import product.model.OrderDAO;

public class PurchaseHistoryAction extends AbstractController {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      super.header(request);
      HttpSession session = request.getSession();
      MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
      
      if (loginuser == null) {
         super.setRedirect(true);
         super.setViewPage(request.getContextPath() + "/member/login.com");
      } else {

         String userno = loginuser.getUserno();

         InterOrderDAO odao = new OrderDAO();
         
         List<Map<String,String>> purchaseList = odao.getPurchaseList(userno);
         
         
         Date date = new Date();
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
         
         String today = sdf.format(date);

         date = new Date(date.getTime()+(1000*60*60*24*-1));
         String prev1 = sdf.format(date);
         date = new Date(date.getTime()+(1000*60*60*24*-1));
         String prev2 = sdf.format(date);
         date = new Date(date.getTime()+(1000*60*60*24*-1));
         String prev3 = sdf.format(date);
         date = new Date(date.getTime()+(1000*60*60*24*-1));
         String prev4 = sdf.format(date);
         date = new Date(date.getTime()+(1000*60*60*24*-1));
         String prev5 = sdf.format(date);
         date = new Date(date.getTime()+(1000*60*60*24*-1));
         String prev6 = sdf.format(date);

         
         List<String> week = new ArrayList<String>();
         
         week.add(today);
         week.add(prev1);
         week.add(prev2);
         week.add(prev3);
         week.add(prev4);
         week.add(prev5);
         week.add(prev6);
         
         int[] check = {0, 0, 0, 0, 0, 0, 0};
         
         for (Map<String, String> purchase : purchaseList) {
            switch (purchase.get("paymentcheck")) {
         case "0":
            check[0] = 1;
            break;
         case "1":
            check[1] = 1;
            break;
         case "2":
            check[2] = 1;
            break;
         case "3":
            check[3] = 1;
            break;
         case "4":
            check[4] = 1;
            break;
         case "5":
            check[5] = 1;
            break;
         case "6":
            check[6] = 1;
            break;
         
         }
            
            purchase.get("paymentcheck");
         }
         
         request.setAttribute("check", check);
         request.setAttribute("week", week);
         request.setAttribute("purchaseList", purchaseList);

         super.setRedirect(false);
         super.setViewPage("/WEB-INF/myPage/purchaseHistory.jsp");
      }
   }

}