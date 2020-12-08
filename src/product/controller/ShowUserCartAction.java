package product.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import my.util.MyUtil;
import product.model.CartDAO;
import product.model.CartVO;
import product.model.InterCartDAO;

public class ShowUserCartAction extends AbstractController  {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.header(request);
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if (loginuser == null || loginuser.getStatus() != 3) {
			String message = "비정상적 경로입니다.";
			String loc="javascript:history.back()";
			
			String currentURL = MyUtil.getCurrentURL(request);
	        session.setAttribute("currentURL", currentURL);
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
		}else {
			String userno = request.getParameter("userno");
			
			InterCartDAO cdao = new CartDAO();
			List<CartVO> cartList = cdao.selectCartList(userno);
			
			request.setAttribute("cartList", cartList);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/myPage/myPage_cart.jsp");
		}
		
	}

}
