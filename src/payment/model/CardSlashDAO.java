package payment.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.model.MemberVO;
import member.model.ShippingAddressVO;

import java.sql.*;
import java.util.*;
import util.security.*;

import java.util.concurrent.ThreadLocalRandom;

public class CardSlashDAO implements InterCardSlashDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private AES256 aes;

	// 생성자
	public CardSlashDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/covengers_oracle");
			aes = new AES256(SecretMyKey.KEY);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	// 사용한 자원을 반납하는 close() 메소드 생성하기
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
	}// end of private void close() {}--------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public MemberVO getOneUser(Map<String, String> paraMap) throws SQLException {
		MemberVO member = new MemberVO();
		try {
			conn = ds.getConnection();
			
			String sql = " select userno, name, email, mobile, postcode, address, detailaddress, extraaddress, point \n " + 
					" from tbl_member \n" + 
					" where userno = ? and status > 0 and idle = 0"
					+ " order by 1 ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userno"));
			
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				member.setUserno(rs.getString(1));
				member.setName(rs.getString(2));
				member.setEmail(aes.decrypt(rs.getString(3)));
				member.setMobile(aes.decrypt(rs.getString(4)));
				member.setPostcode(rs.getString(5));
				member.setAddress(rs.getString(6));
				member.setDetailAddress(rs.getString(7));
				member.setExtraAddress(rs.getString(8));
				member.setPoint(rs.getString(9));
			}
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return member;
	}

////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<Map<String, String>> productList(List<String> cartno) throws SQLException {
		
		List<Map<String, String>> productList = new ArrayList<>();
			
		try {
			conn = ds.getConnection();
			
			String sql = "select c.cartno, c.fk_userno, c.fk_productcode, c.poqty, c.fk_optioncode, c.pprice, p.krproductname, o.optionname, o.stock, p.productimg1 \n" + 
					"from tbl_cart c \n" + 
					"left join\n" + 
					"tbl_product p\n" + 
					"on c.fk_productcode = p.productcode\n" + 
					"left join\n" + 
					"tbl_option o\n" + 
					"on c.fk_optioncode = o.optioncode\n" + 
					"where cartno = ? ";
			
			for (String eachCart : cartno) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,  eachCart);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					Map<String, String> cart = new HashMap<>();
					
					cart.put("cartno", rs.getString(1));
					cart.put("fk_userno", rs.getString(2));
					cart.put("fk_productcode", rs.getString(3));
					cart.put("poqty", rs.getString(4));
					cart.put("fk_optioncode", rs.getString(5));
					cart.put("pprice", rs.getString(6));
					cart.put("krproductname", rs.getString(7));
					cart.put("optionname", rs.getString(8));
					cart.put("stock", rs.getString(9));
					int totalprice = Integer.parseInt(rs.getString(6)) * Integer.parseInt(rs.getString(4)); 
					
					cart.put("totalprice",String.valueOf(totalprice));
					cart.put("productimg", rs.getString(10));
					
					productList.add(cart);
				}
				
			}
		} finally {
			close();
		}
		
		
		
		return productList;
		
		
	}

////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public ShippingAddressVO getShippingAddress(Map<String, String> paraMap) throws SQLException {
		
		ShippingAddressVO shippingAddress = null;
		try {
			conn = ds.getConnection();
			
			String sql = "\n"+
					"select ship_seq, fk_userno, receivername, sitename, postcode, address, detailaddress, extraaddress, mobile\n"+
					"from tbl_shipping\n"+
					"where ship_seq = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("shipping"));
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				shippingAddress = new ShippingAddressVO();
				
				shippingAddress.setShipNo(rs.getString(1));
				shippingAddress.setUserno(rs.getString(2));
				shippingAddress.setReceiverName(rs.getString(3));
				shippingAddress.setSiteName(rs.getString(4));
				shippingAddress.setPostcode(rs.getString(5));
				shippingAddress.setAddress(rs.getString(6));
				shippingAddress.setDetailAddress(rs.getString(7));
				shippingAddress.setExtraAddress(rs.getString(8));
				try {
					shippingAddress.setMobile(aes.decrypt(rs.getString(9)));
				} catch (UnsupportedEncodingException | GeneralSecurityException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
		} finally {
			close();
		}
		
		return shippingAddress;
	}

////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<Map<String, String>> getCartDetail(Map<String, String> paraMap ) throws SQLException {
		
		List<Map<String, String>> cartList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select cartno, fk_userno, fk_productcode, poqty, fk_optioncode, pprice "
					+ " from tbl_cart "
					+ " where cartno = ? ";
			
			String[] cartno = paraMap.get("purchasecartno").split("\\,");
			
			for(String cart : cartno) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, cart);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					Map<String, String> cartDetail = new HashMap<String, String>();
					
					cartDetail.put("cartno", rs.getString(1));
					cartDetail.put("fk_userno", rs.getString(2));
					cartDetail.put("fk_productcode", rs.getString(3));
					cartDetail.put("poqty", rs.getString(4));
					cartDetail.put("fk_optioncode", rs.getString(5));
					cartDetail.put("pprice", rs.getString(6));
					
					cartList.add(cartDetail);
				}
			}
			
			
		} finally {
			close();		
		}
		
		return cartList;
	}
////////////////////////////////////////////////////////////////////////////////////////////////////

	@Override
	public int paymentFinal(Map<String, String> paraMap,  List<Map<String, String>> cartList) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			conn.setAutoCommit(false);
			
			// 일단 주문 테이블에 인서트
			String sql = " insert into tbl_payment(paymentno, fk_userno, totalprice, fk_shippingno)\n "+
					" values(pseq.nextval, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("userno"));
			pstmt.setString(2, paraMap.get("total"));
			pstmt.setString(3, paraMap.get("shipping"));
			
			
			int n1 = pstmt.executeUpdate();
			
			System.out.println( "1 > "+n1);
			
			// 주문 상세 테이블에 인서트////////////////////////////////////////////////////////////////
			sql = "insert into tbl_payment_detail(pdetailno, fk_paymentno, fk_optioncode, orderqty)\r\n" + 
				"values(dseq.nextval, pseq.currval, ?, ? )";
			
			int n2 = 1;
			System.out.println(cartList);
			
			if (cartList != null) {
				for (Map<String, String> cart : cartList) {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, cart.get("fk_optioncode"));
					pstmt.setString(2, cart.get("poqty"));
					
					n2 *= pstmt.executeUpdate();
				}
				
			} else {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, paraMap.get("optioncode"));
				pstmt.setString(2, paraMap.get("poqty"));
				
				n2 *= pstmt.executeUpdate();
				System.out.println("check1");
			}
			
			System.out.println("2 > "+n2);
			
			// 포인트 사용 결제시 유저포인트 차감///////////////////////////////////////////////////////////////////
			
			int n3 = 1;
			
			if("true".equals(paraMap.get("ischecked"))) {
				sql = " update tbl_member set point = case when point - ? > 0 then point - ? else 0 end "
						+ " where userno = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, Integer.parseInt(paraMap.get("total")));
				pstmt.setInt(2, Integer.parseInt(paraMap.get("total")));
				pstmt.setString(3, paraMap.get("userno"));
				
				n3 *= pstmt.executeUpdate();	
			}
			System.out.println("3 > "+n3);
			
			// 신규 포인트 적립/////////////////////////////////////////////////////////////////////////////////////
			
			sql = " update tbl_member set point = point + ? "
					+ "where userno = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (int)(Integer.parseInt(paraMap.get("total")) * 0.05));
			pstmt.setString(2, paraMap.get("userno"));
			
			int n4 = pstmt.executeUpdate();	
			
			System.out.println("4 > "+n4);
			// 재고 수량 마이너스
			
			sql = " update tbl_option set stock = stock - ? "
					+ " where optioncode = ? ";
			
			int n5 = 1;
			if (cartList != null) {
				for(Map<String, String> cart : cartList) {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, Integer.parseInt(cart.get("poqty")));
					pstmt.setString(2, cart.get("fk_optioncode"));
					
					n5 *= pstmt.executeUpdate();
				}				
			} else {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, Integer.parseInt(paraMap.get("poqty")));
				pstmt.setString(2, paraMap.get("optioncode"));
				
				n5 *= pstmt.executeUpdate();
				System.out.println("check2");
			}
			
			System.out.println("5 > "+ n5);
			
			// 장바구니에서 삭제해주기
			
			if (cartList != null) {
				System.out.println("낫널 들어옴");
				sql = " delete tbl_cart "
						+ " where cartno = ? ";
				
				String[] cartno = paraMap.get("purchasecartno").split("\\,");
				
				int n6 = 1;
				
				for(String cart : cartno) {
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, cart);
					
					n6 *= pstmt.executeUpdate();
				}
				
				result = n1 * n2 * n3 * n4 * n5 * n6;
			} else {
				System.out.println("널 들어옴");
				result =  n1 * n2 * n3 * n4 * n5;
				System.out.println("check3");
				System.out.println("미리 결과 함 보기 " + result);
			}
			
			System.out.println("결과" + result );
			
			if (result == 1) {
				conn.commit();
			} else {
				conn.rollback();
			}
			
			
		} finally {
			
			close();
			
		}
		
		
		return result;
	}
////////////////////////////////////////////////////////////////////////////////////////////////////

	@Override
	public Map<String, String> getOneProduct(Map<String, String> paraMap1) throws SQLException {
		
		Map<String,String> product = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select krproductname, productimg1, optionname\n"+
					" from tbl_product p join tbl_option o\n"+
					 " on p.productcode = o.fk_productcode\n"+
					" where p.productcode = ? and o.optioncode = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap1.get("productcode"));
			pstmt.setString(2, paraMap1.get("optioncode"));
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				product = new HashMap<String, String>();
				
				product.put("krproductname", rs.getString(1));
				product.put("productimg", rs.getString(2));
				product.put("optionname", rs.getString(3));
			}
		} finally {
			close();
		}
		
		return product;
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////
}

















