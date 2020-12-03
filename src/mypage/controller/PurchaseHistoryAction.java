package mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class PurchaseHistoryAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.header(request);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/myPage/purchaseHistory.jsp");
		
	}

}
