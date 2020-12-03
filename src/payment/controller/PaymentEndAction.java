package payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import payment.model.CardSlashDAO;
import payment.model.InterCardSlashDAO;

public class PaymentEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.header(request);
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

		String method = request.getMethod();

		if (loginuser != null) { // 누군가가 로그인이 되어져 있는 상태

			if ("POST".equalsIgnoreCase(method)) { // 포스트 방식으로 넘어왔을 경우 - 올바른 경우

				String purchasecartno = request.getParameter("purchasecartno");
				String userno = request.getParameter("userno");
				String total = request.getParameter("total");
				String shipping = request.getParameter("shipping");
				String optioncode = request.getParameter("optioncode");
				String poqty = request.getParameter("poqty");
				
				String ischecked = request.getParameter("ischecked");

				Map<String, String> paraMap = new HashMap<String, String>();

				paraMap.put("userno", userno);
				paraMap.put("total", total);
				paraMap.put("shipping", shipping);
				paraMap.put("purchasecartno", purchasecartno);
				paraMap.put("ischecked", ischecked);
				paraMap.put("optioncode", optioncode);
				paraMap.put("poqty", poqty);

				InterCardSlashDAO cdao = new CardSlashDAO();
				
				List<Map<String, String>> cartList = null;
				System.out.println("purchasecartno > -" + purchasecartno +"-");
				System.out.println("optioncode > -" + optioncode +"-");
				
				if ("".equals(optioncode) ) {
					cartList = cdao.getCartDetail(paraMap);
					System.out.println("여기들어오는지 확인");
				}
				
				int n = cdao.paymentFinal(paraMap, cartList);
				
				
				
				if (n == 1) {  // 모든 프로세스를 다 완료한 경우
					

					super.setRedirect(false);
					super.setViewPage("/WEB-INF/pay/paymentEnd.jsp");
					
					
				} else {  // 모든 프로세스를 완료 하지 못한 경우
					String message = "내부적 프로세스 문제로 인해 결제에 실패했습니다ㅠㅠㅠㅠ";
					String loc = "/Covengers/main.com";

					request.setAttribute("message", message);
					request.setAttribute("loc", loc);

					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
				}
				

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
