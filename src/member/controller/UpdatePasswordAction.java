package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class UpdatePasswordAction extends AbstractController{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
         
      
      String email = request.getParameter("email1");
      String name = request.getParameter("name1");
            
      request.setAttribute("email", email);
      request.setAttribute("name", name);
      
      
      super.setViewPage("/WEB-INF/login/passwordFind.jsp");
      
   }

}