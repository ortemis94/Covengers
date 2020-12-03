package payment.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import member.model.ShippingAddressVO;
import payment.model.CardSlashDAO;
import payment.model.InterCardSlashDAO;

public class RealPaymentAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.header(request);
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

		String method = request.getMethod();

		if (loginuser != null) { // 누군가가 로그인이 되어져 있는 상태

			if ("POST".equalsIgnoreCase(method)) { // 포스트 방식으로 넘어왔을 경우 - 올바른 경우

				String fk_optioncodeList = request.getParameter("fk_optioncodeList");
				String userno = request.getParameter("userno");
				String total = request.getParameter("total");
				String shipping = request.getParameter("shipping");
				String purchasecartno = request.getParameter("purchasecartno");
				
				
				
				

				Map<String, String> paraMap = new HashMap<String, String>();

				paraMap.put("fk_optioncodeList", fk_optioncodeList);
				paraMap.put("userno", userno);
				paraMap.put("total", total);
				paraMap.put("shipping", shipping);
				paraMap.put("purchasecartno", purchasecartno);
				
			

				InterCardSlashDAO cdao = new CardSlashDAO();
				
				MemberVO member = cdao.getOneUser(paraMap);
				ShippingAddressVO shippingAddress = cdao.getShippingAddress(paraMap);

				request.setAttribute("member", member);
				request.setAttribute("shippingAddress", shippingAddress);
				request.setAttribute("paraMap", paraMap);

				super.setRedirect(false);
				super.setViewPage("/WEB-INF/pay/paymentGateway.jsp");

			} else { // 겟방식으로 넘어왔을 경우 - 올바르지 않은 경우

				String message = "비정상적인 경로로 접근 하셨습니다~";
				String loc = "javascript:history.back()";

				request.setAttribute("message", message);
				request.setAttribute("loc", loc);

				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");

			}

		} else { // 로그인 한 유저가 없이 들어왔을 경우

			String message = "로그인이 필요합니당";
			String loc = "javascript:history.back()";

			request.setAttribute("message", message);
			request.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");

		}
	}

}
