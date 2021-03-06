package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class KISItemDao {
	private static KISItemDao instance;

	private KISItemDao() {
	}

	public static KISItemDao getInstance() {
		if (instance == null) {
			instance = new KISItemDao();
		}
		return instance;
	}

	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	public List<ItemInfo> list(int startRow, int endRow) throws SQLException {
		List<ItemInfo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn, a.*" + "from (select * from iteminfo order by name) a"
				+ ") where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemInfo item = new ItemInfo();
				item.setItemNo(rs.getInt(2));
				item.setCategoryNo(rs.getInt(3));
				item.setBrand(rs.getString(4));
				item.setName(rs.getString(5));
				item.setInfo(rs.getString(6));
				item.setPrice(rs.getInt(7));
				item.setRating(rs.getInt(8));
				item.setHits(rs.getInt(9));
				item.setLikeCnt(rs.getInt(10));
				item.setIsPublic(rs.getString(11));
				item.setMemberId(rs.getString(12));
				item.setRegDate(rs.getString(13));
				list.add(item);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}

	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) from iteminfo";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}

			System.out.println("getTotalCnt --> " + result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	// itemNo 최신번호 select
	public int selectItemNo() throws SQLException {
		Connection conn = null;
		String sql = "select fn_MaxNoForTable('ItemInfo') itemNo from dual";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int itemNum = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				itemNum = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("selectItemNo -> " + e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return itemNum;
	}

	public int insert(ItemInfo item) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql1 = "insert into iteminfo values(?,?,?,?,?,?,?,?,?,?,?,fn_DateToChar(sysdate))";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, item.getItemNo());
			pstmt.setInt(2, item.getCategoryNo());
			pstmt.setString(3, item.getBrand());
			pstmt.setString(4, item.getName());
			pstmt.setString(5, item.getInfo());
			pstmt.setInt(6, item.getPrice());
			pstmt.setInt(7, (int) item.getRating());
			pstmt.setInt(8, item.getHits());
			pstmt.setInt(9, item.getLikeCnt());
			pstmt.setString(10, item.getIsPublic());
			pstmt.setString(11, item.getMemberId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insert -> " + e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	// ingtlist(성분목록 테이블) 데이터 삽입
	public int mappingInsert(int itemNo, int ingredientNo) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result2 = 0;
		String sql = "insert into ingtlist values(?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNo);
			pstmt.setInt(2, ingredientNo);
			result2 = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("mappingInsert -> " + e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result2;
	}

	public int mappingDelete(int itemNo) throws SQLException {
		Connection conn = null;
		int result = 0;
		String sql = "delete from ingtlist where itemNo=?";
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public ItemInfo select(int itemNo) throws SQLException {
		ItemInfo item = new ItemInfo();
		Connection conn = null;
		String sql = "select * from iteminfo where itemNo=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				item.setItemNo(rs.getInt(1));
				item.setCategoryNo(rs.getInt(2));
				item.setBrand(rs.getString(3));
				item.setName(rs.getString(4));
				item.setInfo(rs.getString(5));
				item.setPrice(rs.getInt(6));
				item.setRating(rs.getInt(7));
				item.setHits(rs.getInt(8));
				item.setLikeCnt(rs.getInt(9));
				item.setIsPublic(rs.getString(10));
				item.setMemberId(rs.getString(11));
				item.setRegDate(rs.getString(12));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return item;
	}

	public void hits(int itemNo) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update iteminfo set hits = hits+1 where itemNo=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNo);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("hits--> " + e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}

	public int delete(int itemNo) throws SQLException {
		Connection conn = null;
		int result = 0;
		String sql = "delete from iteminfo where itemNo=?";
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public int update(ItemInfo item) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update iteminfo set categoryNo=?, brand=?, name=?, info=?, price=?, isPublic=?, memberId=? where itemNo=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, item.getCategoryNo());
			pstmt.setString(2, item.getBrand());
			pstmt.setString(3, item.getName());
			pstmt.setString(4, item.getInfo());
			pstmt.setInt(5, item.getPrice());
			pstmt.setString(6, item.getIsPublic());
			pstmt.setString(7, item.getMemberId());
			pstmt.setInt(8, item.getItemNo());
			result = pstmt.executeUpdate();
			System.out.println("업데이트 result 값--> " + result);
		} catch (Exception e) {
			System.out.println("update --> " + e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	// 대분류 카테고리 가져오기
	public List<Category> list() throws SQLException {
		List<Category> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from category where parent is null order by name";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Category cate = new Category();
				cate.setCategoryNo(rs.getInt(1));
				cate.setName(rs.getString(2));
				cate.setParent(rs.getString(3));
				cate.setIsPublic(rs.getString(4));
				list.add(cate);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}

	// 
	public List<Category> list3(int categoryNo) throws SQLException {
		List<Category> list2 = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Category cate2 = null;
		String sql = "select * from category where parent = (select parent from category where categoryNo=?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, categoryNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cate2 = new Category();
				cate2.setCategoryNo(rs.getInt(1));
				cate2.setName(rs.getString(2));
				cate2.setParent(rs.getString(3));
				cate2.setIsPublic(rs.getString(4));
				list2.add(cate2);

				cate2 = null;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list2;
	}
	
	// 소분류 카테고리 가져오기
	public List<Category> list2(int categoryNo) throws SQLException {
		List<Category> list2 = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Category cate2 = null;
		String sql = "select * from category where parent = (select name from category where categoryNo=?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, categoryNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cate2 = new Category();
				cate2.setCategoryNo(rs.getInt(1));
				cate2.setName(rs.getString(2));
				cate2.setParent(rs.getString(3));
				cate2.setIsPublic(rs.getString(4));
				list2.add(cate2);

				cate2 = null;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list2;
	}

	// 제품수정화면에서 해당제품번호로 카테고리번호 select
	public Category cateSelect(int categoryNo) throws SQLException {
		Category cate = new Category();
		Connection conn = null;
		String sql = "select categoryNo, name, parent from category where categoryNo=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, categoryNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cate.setCategoryNo(rs.getInt(1));
				cate.setName(rs.getString(2));
				cate.setParent(rs.getString(3));
//				cate.setIspublic(rs.getString(4));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return cate;
	}
}
