package product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.io.UnsupportedEncodingException;

import util.security.AES256;
import util.security.SecretMyKey;

public class OrderDAO implements InterOrderDAO {

   private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;

   private AES256 aes;

   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   public OrderDAO() {
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

   // 개별 주문 내역 가져오기
   @Override
   public List<OrderVO> selectDetailList(String fk_userno) throws SQLException {

      List<OrderVO> orderList = new ArrayList<>();

      try {

         conn = ds.getConnection();

         String sql = " select p.paymentno, p.fk_userno, p.totalprice, to_char(p.paymentdate, 'yyyy-mm-dd hh24:mi:ss') as paymentdate, "
               + "         p.fk_shippingno, d.pdetailno, d.fk_optioncode, t.krproductname, o.optionname, t.price as price, d.orderqty as orderqty "
               + " from tbl_payment p " + " join tbl_payment_detail d " + " on p.paymentno = fk_paymentno "
               + " join tbl_option o " + " on o.optioncode = d.fk_optioncode " + " join tbl_product t "
               + " on t.productcode = o.fk_productcode " + " where p.fk_userno = ?  and d.delstatus = 0 "
               + " order by paymentdate desc ";

         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, fk_userno);

         rs = pstmt.executeQuery();

         while (rs.next()) {
            OrderVO order = new OrderVO();

            order.setO_paymentno(rs.getInt(1));
            order.setO_fk_userno(rs.getString(2));
            order.setO_totalprice(rs.getString(3));
            order.setO_paymentdate(rs.getString(4));
            order.setO_fk_shippingno(rs.getInt(5));
            order.setO_pdetailno(rs.getInt(6));
            order.setO_fk_optioncode(rs.getString(7));
            order.setO_krproductname(rs.getString(8));
            order.setO_optionname(rs.getString(9));
            order.setO_price(rs.getInt(10));
            order.setO_orderqty(rs.getInt(11));

            orderList.add(order);

         }

      } finally {
         close();
      }

      return orderList;

   }

   // 전체 주문 내역 가져오기
   @Override
   public List<OrderVO> selectOrderList(String fk_userno) throws SQLException {
      List<OrderVO> orderList = new ArrayList<>();

      try {

         conn = ds.getConnection();

         String sql = " select e.fk_paymentno, p.fk_userno, to_char(p.paymentdate, 'yyyy-mm-dd hh24:mi:ss') as paymentdate, p.totalprice, p.fk_shippingno, e.pdetailno, e.orderqty, e.fk_optioncode, d.optionname, r.krproductname, r.productcode "
               + " from tbl_payment p " + " join ( select PDETAILNO, FK_PAYMENTNO, FK_OPTIONCODE, ORDERQTY "
               + " from tbl_payment_detail " + " where rowid in ( " + " select max(rowid) "
               + " from tbl_payment_detail " + " group by fk_paymentno) ) e " + " on p.paymentno = e.fk_paymentno "
               + " join tbl_option d " + " on d.OPTIONCODE = e.fk_optioncode " + " join tbl_product r "
               + " on r.PRODUCTCODE = d.FK_PRODUCTCODE " + " where fk_userno = ? "
               + " order by e.fk_paymentno desc ";

         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, fk_userno);

         rs = pstmt.executeQuery();

         while (rs.next()) {
            OrderVO order = new OrderVO();

            order.setPaymentno(rs.getInt(1));
            order.setUserno(rs.getString(2));
            order.setPaymentdate(rs.getString(3));
            order.setTotalprice(rs.getInt(4));
            order.setShippingno(rs.getInt(5));
            order.setPdetailno(rs.getInt(6));
            order.setOrderqty(rs.getInt(7));
            order.setOptioncode(rs.getString(8));
            order.setOptionname(rs.getString(9));
            order.setKrname(rs.getString(10));
            order.setO_productcode(rs.getString(11));

            orderList.add(order);

         }

      } finally {
         close();
      }

      return orderList;
   }

   @Override
   public List<Map<String, String>> getPurchaseList(String userno) throws SQLException {
      List<Map<String, String>> purchaseList = new ArrayList<>();
      
      try {
         conn = ds.getConnection();
         
         String sql = "select m.paymentno, p.productimg1, p.krproductname, o.optionname, d.orderqty\n"+
               ", case (trunc(sysdate) - trunc(m.paymentdate)) when 0 then 0 \n"+
               "                                             when 1 then 1\n"+
               "                                             when 2 then 2\n"+
               "                                             when 3 then 3\n"+
               "                                             when 4 then 4\n"+
               "                                             when 5 then 5\n"+
               "                                            else  6  end as paymentcheck\n"+
               ", p.productcode, d.reviewstatus\n"+
               "from tbl_payment_detail d join \n"+
               "                                ( select paymentno, paymentdate\n"+
               "                                  from tbl_payment\n"+
               "                                  where fk_userno = ? and sysdate - paymentdate < 7 \n"+
               "                                ) m\n"+
               "on d.fk_paymentno = m.paymentno\n"+
               "join tbl_option o\n"+
               "on d.fk_optioncode = o.optioncode\n"+
               "join tbl_product p\n"+
               "on o.fk_productcode = p.productcode\n"+
               "where delstatus > 0\n"+
               "order by m.paymentdate";
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userno);
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            Map<String, String> purchase = new HashMap<String, String>();
            
            purchase.put("paymentno", rs.getString(1));
            purchase.put("productimg1", rs.getString(2));
            purchase.put("krproductname", rs.getString(3));
            purchase.put("optionname", rs.getString(4));
            purchase.put("orderqty", rs.getString(5));
            purchase.put("paymentcheck", rs.getString(6));
            purchase.put("productcode", rs.getString(7));
            purchase.put("reviewstatus", rs.getString(8));
            
            purchaseList.add(purchase);
            
         }
         
      } finally {
         close();
      }
      
      return purchaseList;
   }

}