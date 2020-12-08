package common.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.util.MyUtil;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class CovengersAssemble extends AbstractController {

	@Override
	public String toString() {
		return "@@@ 클래스 IndexController 의 인스턴스 메소드 toString() 호출";
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// System.out.println("@@@ 확인용 IndexController 인스턴스 메소드 excute 호출");
		// request.setAttribute("name", "황주호");

		// 201121 박지현추가
		InterProductDAO pdao = new ProductDAO();
		List<ProductVO> plist = pdao.productInfoForAD();
		
		List<ProductVO> categoryInfo = new ArrayList<>();
		categoryInfo = pdao.categoryInfo();
		
		request.setAttribute("plist", plist);
		request.setAttribute("categoryInfo", categoryInfo);
		
		HttpSession session = request.getSession();
        String currentURL = MyUtil.getCurrentURL(request);
        session.setAttribute("currentURL", currentURL);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/covengers_assemble.jsp");

	}

}
