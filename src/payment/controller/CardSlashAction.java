package payment.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;
import member.model.ShippingAddressVO;
import payment.model.CardSlashDAO;
import payment.model.InterCardSlashDAO;
import product.model.CartDAO;
import product.model.CartVO;
import product.model.InterCartDAO;
import product.model.InterProductDAO;

public class CardSlashAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.header(request);
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

		String method = request.getMethod();

		if (loginuser != null) { // 누군가가 로그인이 되어져 있는 상태

			if ("POST".equalsIgnoreCase(method)) { // 포스트 방식으로 넘어왔을 경우 - 올바른 경우

				// 사용자 정보
				String userno = loginuser.getUserno();
				// String userno = "2011145556";
				// String email = "irismaa96@naver.com";

				InterCardSlashDAO cdao = new CardSlashDAO();
				Map<String, String> paraMap = new HashMap<String, String>();

				paraMap.put("userno", userno);

				MemberVO member = cdao.getOneUser(paraMap);

				request.setAttribute("member", member);

				//////////////////////////////////////////////////////////////////////////////////////////////////////
				// 배송지 정보

				InterMemberDAO mdao = new MemberDAO();
				List<ShippingAddressVO> shippingList = mdao.selectAddressList(userno);
				request.setAttribute("shippingList", shippingList);
				//////////////////////////////////////////////////////////////////////////////////////////////////////

				// 주문한 상품 정보를 알려주는 곳에서 바로결제로 넘어왔는지 장바구니에서 넘어왔는지에 따라서
				// 넘겨주는 방식을 다르게 처리하되 같은 값을 넘겨줄 수는 없을까?!

				// 주문한 상품 정보
				String productcode = request.getParameter("productcode");
				
				
				if (productcode == null) {  // 장바구니에서 결제 했을 경우
					
					String purchasecartno = request.getParameter("purchasecartno");
					String sumPrice = request.getParameter("sumPrice");
					String deliveryCharge = request.getParameter("deliveryCharge");
					String totalCost = request.getParameter("totalCost");
					List<String> cartno = new ArrayList<>();
					String[] purchasecartnoArr = purchasecartno.split(",");
					
					for (int i = 0; i < purchasecartnoArr.length; i++) {
						cartno.add(purchasecartnoArr[i]);
					}
					
					List<Map<String, String>> productList = cdao.productList(cartno);
					
					paraMap.put("sumPrice", sumPrice);
					paraMap.put("deliveryCharge", deliveryCharge);
					paraMap.put("totalCost", totalCost);
					
					request.setAttribute("purchasecartno", purchasecartno);
					request.setAttribute("productList", productList);
					request.setAttribute("paraMap", paraMap);
				} else {
					
					String poqty = request.getParameter("poqty");
					String pprice = request.getParameter("pprice");
					String deliveryCharge = "2500";
					String totalprice = request.getParameter("totalprice");
					if (Integer.parseInt(totalprice) > 300000) {
						deliveryCharge = "0";
					}
					String optioncode = request.getParameter("optioncode");
					
					Map<String, String> paraMap1 = new HashMap<String, String>();
					paraMap1.put("productcode", productcode);
					paraMap1.put("optioncode", optioncode);
					
					
					Map<String, String> product = cdao.getOneProduct(paraMap1);
					
					
					paraMap.put("poqty", poqty);
					paraMap.put("pprice", pprice);
					paraMap.put("optioncode", optioncode);
					paraMap.put("sumPrice", totalprice);
					paraMap.put("deliveryCharge", deliveryCharge);
					paraMap.put("totalCost", String.valueOf(Integer.parseInt(totalprice) + Integer.parseInt(deliveryCharge)));
					
					request.setAttribute("product", product);
					request.setAttribute("paraMap", paraMap);
				}
				


				super.setRedirect(false);
				super.setViewPage("/WEB-INF/pay/card_slash.jsp");

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
