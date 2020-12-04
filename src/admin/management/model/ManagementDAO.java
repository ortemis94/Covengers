package admin.management.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ManagementDAO implements InterManagementDAO {
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public ManagementDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/covengers_oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	private void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public Map<String, String> getManagementInfo() throws SQLException {
		
		Map<String, String> managementInfo = new HashMap<String, String>();
		
			try {
				conn = ds.getConnection();
				
				//////////////////////// 이번주 주간 총 판매액
				String sql = "select to_char(sysdate, 'yyyy-ww') as weekOfYear, sum(totalprice) as totalSalesPriceByWeek\n"+
						"    from tbl_payment \n"+
						"    where to_char(paymentdate, 'yyyy-ww') = to_char(sysdate,'yyyy-ww')";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					managementInfo.put("weekOfYear", rs.getString(1));
					managementInfo.put("totalSalesPriceByWeek", rs.getString(2));
				}
				
				//////////////////////// 이번달  총 판매액 
				sql = "select to_char(sysdate, 'yyyy-mm') as monthOfYear, sum(totalprice) as totalSalesPriceByMonth\n"+
						"from tbl_payment\n"+
						"where (to_char(sysdate, 'yyyy-mm') = to_char(paymentdate, 'yyyy-mm'))";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					managementInfo.put("monthOfYear", rs.getString(1));
					managementInfo.put("totalSalesPriceByMonth", rs.getString(2));
				}
				
				//////////////////// 총 등록된 회원수
				
				sql = "select count(*) as totalMember\n"+
						"from tbl_member\n"+
						"where status = 1";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					managementInfo.put("totalMember", rs.getString(1));
				}
				
				////////////////////총 등록된 상품수(옵션제외)
				
				sql = "select count(*) as totalProduct\n"+
						"from tbl_product\n"+
						"where productstatus != 0\n";
						
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					managementInfo.put("totalProduct", rs.getString(1));
				}
				
				
				
				////////////////////이번달 주문왕 (주문수)
				
				sql = "select fk_userno, name, purchasecount\n"+
						"from\n"+
						"(\n"+
						"    select fk_userno, count(*) AS purchasecount\n"+
						"    from tbl_payment \n"+
						"    where (to_char(sysdate, 'yy-mm') = to_char(paymentdate, 'yy-mm'))\n"+
						"    group by fk_userno\n"+
						")V join tbl_member M\n"+
						"on V.fk_userno = M.userno\n"+
						"where M.status = 1";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					managementInfo.put("buyUserno", rs.getString(1));
					managementInfo.put("buyName", rs.getString(2));
					managementInfo.put("totalOrderQty", rs.getString(3));
				}
				
				
				////////////////////이번달 flex (구매액)
				
				sql = "select fk_userno, name, totalflex\n"+
						"from\n"+
						"(\n"+
						"    select fk_userno, first_value(sum(totalprice)) over() as totalflex\n"+
						"    from tbl_payment\n"+
						"    where (to_char(sysdate, 'yy-mm') = to_char(paymentdate, 'yy-mm'))\n"+
						"    group by fk_userno\n"+
						"    order by sum(totalprice)\n"+
						")V join tbl_member M\n"+
						"on V.fk_userno = M.userno\n"+
						"where status = 1";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					managementInfo.put("flexUserno", rs.getString(1));
					managementInfo.put("flexName", rs.getString(2));
					managementInfo.put("totalFlex", rs.getString(3));
				}
				
			} finally {
			
				close();
			}
		
		return managementInfo;
		
		
		
	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<Map<String, String>> getListManagementInfo() throws SQLException {
		
		List<Map<String, String>> infoList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
		
			String sql = "select to_char(sysdate, 'ww') "+
						 "from dual";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String sysdate = rs.getString(1); // 오늘날짜를 주차로 계산하여 sysdate에 저장.
			
			sql = "select payday, sum(sumOrderQty) as sumOrderQty\n"+
					"from      \n"+
					"(\n"+
					"    select sum(sumorderqty) as sumOrderQty, to_char(p.paymentdate, 'ww d') as payday\n"+
					"    from \n"+
					"    (\n"+
					"        select fk_paymentno, sum(orderqty) as sumorderqty\n"+
					"        from tbl_payment_detail \n"+
					"        group by fk_paymentno\n"+
					"    )V join tbl_payment P\n"+
					"    on V.fk_paymentno = P.paymentno\n"+
					"    group by to_char(p.paymentdate, 'ww d'), sumorderqty\n"+
					")V2\n"+
					"group by payday\n"+ 
					"order by payday asc";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) { 
				
				String payday = rs.getString(1); // 상품이 팔린 날짜를 주차와 요일(숫자)로 계산하여 payday에 저장.
			//	System.out.println( payday.substring(0, payday.indexOf(" ")) + "주");
			//	System.out.println( payday.substring((payday.indexOf(" "))+1) + "요일");
				
				String payweek = payday.substring(0, payday.indexOf(" "));
				
				payday = payday.substring(payday.indexOf(" ")+1);
				
				if (payweek.equals(sysdate)) { // 상품 판매일이 오늘날짜와 같은 주차라면 판매요일과 판매량을 map에 저장 후 infoList에 추가.
					Map<String, String> map = new HashMap<String, String>();
					map.put("payday", payday);
					map.put("sumOrderQty", rs.getString(2));
					
					infoList.add(map);
				}
			}
		} finally {
			close();
		}
////////////////////카테고리별 등록된 상품 갯수
		return infoList;
	}


/*
		@Override
		public List<Map<String, String>> getListManagementInfo() throws SQLException {
			List<Map<String, String>> infoList = new ArrayList<>();
			try {
				conn = ds.getConnection();
				
				String sql = "select krcategoryname, V.fk_categorycode, countPerCategory\n"+
						"from\n"+ "(select fk_categorycode, count(*) as countPerCategory\n"+
						"from tbl_product\n"+ "where productstatus > 0\n"+
						"group by fk_categorycode\n"+ ") v join\n"+
						"(select categorycode, krcategoryname\n"+ "from tbl_category\n"+ ") c\n"+
						"on v.fk_categorycode = c.categorycode\n"+ "order by 2";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) { 
					Map<String, String> map = new HashMap<String, String>();
					
					map.put("krcategoryname", rs.getString(1));
					map.put("categorycode", rs.getString(2));
					map.put("countPerCategory", rs.getString(3)); 
					
					infoList.add(map);
				}
			} finally {
				close();
			}
		return infoList;
	}

 */
	
	
	
}