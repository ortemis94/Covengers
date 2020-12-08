package product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import my.util.MyUtil;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class ProductListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.header(request);
		InterProductDAO pdao = new ProductDAO();
		List<ProductVO> pList = pdao.selectAll();
		
		// System.out.println(pList.size());
		request.setAttribute("pList", pList);
		
		HttpSession session = request.getSession();
		String currentURL = MyUtil.getCurrentURL(request);
        session.setAttribute("currentURL", currentURL);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/producttables.jsp");
		
	}

}
