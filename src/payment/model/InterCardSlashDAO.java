package payment.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import member.model.MemberVO;
import member.model.ShippingAddressVO;

public interface InterCardSlashDAO {
	// 유저정보 보여주기 위해 한명 선택해오자~
	MemberVO getOneUser(Map<String, String> paraMap) throws SQLException;

	// 이거 선택한 상품들 정보를 뿌려줘야 하니까 가져오는거지~
	List<Map<String, String>> productList(List<String> cartno) throws SQLException;
	
	// 배송지 주소를 통해서 배송정보 받아오기
	ShippingAddressVO getShippingAddress(Map<String, String> paraMap) throws SQLException;
	

	// 카트디테일을 가지고 온다.
	List<Map<String, String>> getCartDetail(Map<String, String> paraMap) throws SQLException;

	// 모든 트랜젝션 처리를 해줄 수 있는 메소드
	int paymentFinal(Map<String, String> paraMap, List<Map<String, String>> cartList) throws SQLException;
	
	// 바로 결제시 필요한 상품정보 가져오기
	Map<String, String> getOneProduct(Map<String, String> paraMap1) throws SQLException;
  
	


}
