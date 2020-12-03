package admin.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class MainProductDeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		InterProductDAO pdao = new ProductDAO();
		int n = pdao.mainDeleteAll();
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);
		
		String json = jsonObj.toString();

		request.setAttribute("n", n);
		
		super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
