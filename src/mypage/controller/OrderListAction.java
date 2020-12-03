package mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;

public class OrderListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.header(request);
//		HttpSession session = request.getSession();
//		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");

/*		if (loginuser == null) {
			super.setRedirect(true);
			super.setViewPage(request.getContextPath() + "/member/login.com");
		}else {
			*/
	/*		Inter*/
			
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/myPage/orderList.jsp");
//		}

		
		
		
		
		
	}

}
