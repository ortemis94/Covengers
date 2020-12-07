package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class UpdatePassword3Action extends AbstractController {
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      String email = request.getParameter("email");
      String password = request.getParameter("password");
      
      InterMemberDAO mdao = new MemberDAO();
      int n = mdao.updatePassword(email, password);
      
      super.setViewPage("/WEB-INF/login/changePW_modal.jsp");

   }

}