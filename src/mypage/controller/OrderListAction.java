package mypage.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;
import product.model.*;

public class OrderListAction extends AbstractController {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      super.header(request);
      HttpSession session = request.getSession();
      MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

      if (loginuser == null) {
         super.setRedirect(true);
         super.setViewPage(request.getContextPath() + "/member/login.com");
      } else {

         /* Inter */

         session.setAttribute("userno", loginuser.getUserno());

         InterOrderDAO odao = new OrderDAO();
         List<OrderVO> orderList = odao.selectDetailList(loginuser.getUserno());

         request.setAttribute("orderList", orderList);

         super.setRedirect(false);
         super.setViewPage("/WEB-INF/myPage/orderList.jsp");
      }

   }

}