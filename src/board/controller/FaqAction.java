package board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.*;
import common.controller.AbstractController;
import member.model.MemberVO;
import my.util.MyUtil;

public class FaqAction extends AbstractController {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	   super.header(request);

	   HttpSession session = request.getSession();
	   String currentURL = MyUtil.getCurrentURL(request);
	   session.setAttribute("currentURL", currentURL);
	   
	   InterBoardDAO bdao = new BoardDAO();
       List<FaqVO> faqList = bdao.selectFaqList();
      
      
       request.setAttribute("faqList", faqList);
  //   request.setAttribute("loginStatus", loginStatus);
      
       super.setRedirect(false);
       super.setViewPage("/WEB-INF/board/faq.jsp");
      
   }

}