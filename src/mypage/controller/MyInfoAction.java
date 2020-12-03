package mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class MyInfoAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.header(request);
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		// DAO에 회원 한명만 select 하는 메서드를 만들어 그걸로 loginuser를 가져오거나 아래 setAttribute에 넣어주기.
		

		if (loginuser == null) { // 로그인하지 않고 들어왔을 때
			
			String message = "로그인이 필요합니다.";
		//	String loc = request.getContextPath() + "/member/login.com";
			String loc = request.getContextPath() + "/main.com";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}else { // 로그인 하고 들어왔을 때
			
			String method = request.getMethod();
			InterMemberDAO mdao = new MemberDAO();
			
			if (method.equalsIgnoreCase("GET")) { // GET 방식으로 들어왔을 때
				
				loginuser = mdao.selectMemberInfo(loginuser.getUserno()); // 유저 정보 가져오기
				
				request.setAttribute("loginuser", loginuser);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/myPage/myInfo.jsp");
			}else { // POST 방식으로 들어왔을 때
				
				String name = request.getParameter("name");
				String password = request.getParameter("password");
				String birthday = request.getParameter("birthday");
				String gender = request.getParameter("gender");
				String mobile = request.getParameter("mobile");

				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("userno", loginuser.getUserno());
				paraMap.put("name", name);
				paraMap.put("password", password);
				paraMap.put("birthday", birthday);
				paraMap.put("gender", gender);
				paraMap.put("mobile", mobile);
				
				int n = mdao.updateMemberInfo(paraMap);
				
				System.out.println(n);
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("n", n);
				
				String json = jsonObj.toString();
				System.out.println(json);
				
				request.setAttribute("json", json);
				
				super.setRedirect(false);
			//	super.setViewPage("/WEB-INF/myPage/myInfo.jsp");
				super.setViewPage("/WEB-INF/jsonview.jsp");
			}
			
		}
		
	}

}
