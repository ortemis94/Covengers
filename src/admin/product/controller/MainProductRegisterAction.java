package admin.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class MainProductRegisterAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		InterProductDAO pdao = new ProductDAO();
		
		List<ProductVO> pList = pdao.selectMainProduct();
		
		System.out.println(pList.size());
		request.setAttribute("pList", pList);
		
		super.setViewPage("/WEB-INF/admin/registerMainProduct.jsp");
		
	}

}
