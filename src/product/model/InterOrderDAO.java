package product.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterOrderDAO {

   // 개별 주문 내역 가져오기
   List<OrderVO> selectDetailList(String fk_userno) throws SQLException;
   
   // 전체 주문 내역 가져오기
   List<OrderVO> selectOrderList(String fk_userno) throws SQLException;

   // 세형 최근 1주일 구매 내역 가져오기
   List<Map<String, String>> getPurchaseList(String userno) throws SQLException;
}