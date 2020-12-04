package covengers.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.management.model.InterManagementDAO;
import admin.management.model.ManagementDAO;
import common.controller.AbstractController;
import member.model.MemberVO;

public class AdminAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		if (loginuser == null || loginuser.getStatus() != 3 ) { // 로그인 하지 않았거나 상태가 3이 아니라면(관리자가 들어온게 아니라면)
			String message = "권한이 없습니다.";
			String loc = request.getContextPath() + "/main.com";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}else { // 관리자로 로그인하여 들어온 것이라면
			
			InterManagementDAO mdao = new ManagementDAO();
			
			Map<String, String> managementInfo = mdao.getManagementInfo(); // 관리자가 필요한 모든 정보를 다 불러온다.
			
			List<Map<String, String>> infoList = mdao.getListManagementInfo();
			
			request.setAttribute("managementInfo", managementInfo);
			request.setAttribute("infoList", infoList);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/admin/covengers_admin.jsp");
			
		}


	}

}
