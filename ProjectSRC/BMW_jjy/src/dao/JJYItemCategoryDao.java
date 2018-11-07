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

public class JJYItemCategoryDao {
	private static JJYItemCategoryDao instance;

	private JJYItemCategoryDao() {
	}

	public static JJYItemCategoryDao getInstance() {
		if (instance == null) {
			instance = new JJYItemCategoryDao();
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();

			System.out.println("DB 연결...");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	
	public int getTotalCnt(int categoryNo) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql0 = "select count(*) from iteminfo";
		String sql1 = "select count(*) from iteminfo where categoryno=?";
		try {
			conn = getConnection();
			if(categoryNo == 0) {
				pstmt = conn.prepareStatement(sql0);
			} else {
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, categoryNo);				
			}
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
	
	
	
	
	
	public List<ItemInfo> itemCateList(int categoryNo, int sortName ,int startRow, int endRow) throws SQLException {
		List<ItemInfo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ItemInfo item = null;
		String sql0 = "select * from (select rownum rn, a.*" + "from (select * from iteminfo order by rating) a"
				+ ") where rn between ? and ?";
		String sql1 = "select * from (select rownum rn, a.*" + "from (select * from iteminfo where categoryno=? order by name) a"
				+ ") where rn between ? and ?";
		String sql2 = "select * from (select rownum rn, a.*" + "from (select * from iteminfo where categoryno=? order by rating desc) a"
				+ ") where rn between ? and ?";
		String sql3 = "select * from (select rownum rn, a.*" + "from (select * from iteminfo where categoryno=? order by likecnt desc) a"
				+ ") where rn between ? and ?";
		String sql4 = "select * from (select rownum rn, a.*" + "from (select * from iteminfo where categoryno=? order by regdate desc) a"
				+ ") where rn between ? and ?";
		try {
			conn = getConnection();
			if (categoryNo == 0) {
				pstmt = conn.prepareStatement(sql0);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				switch(sortName) {
					case 1:
						pstmt = conn.prepareStatement(sql1);
						break;
					case 2:
						pstmt = conn.prepareStatement(sql2);
						break;
					case 3:
						pstmt = conn.prepareStatement(sql3);
						break;
					case 4:
						pstmt = conn.prepareStatement(sql4);
						break;
					default :
						break;
				}
				pstmt.setInt(1, categoryNo);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);				
			}
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				item = new ItemInfo();
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
				item = null;
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

	// 대분류 카테고리 가져오기
		public List<Category> cateParentList() throws SQLException {
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
		// 소분류 카테고리 가져오기
		public List<Category> cateChildList(int categoryNo) throws SQLException {
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
		
		// 소분류 카테고리 가져오기
				public List<Category> cateChildList2(int categoryNo) throws SQLException {
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
		
		// 카테고리 테이블 조회
		public List<Category> cateAll() throws SQLException {
			List<Category> cateAll = new ArrayList<>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Category cate2 = null;
			String sql = "select * from category";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					cate2 = new Category();
					cate2.setCategoryNo(rs.getInt(1));
					cate2.setName(rs.getString(2));
					cate2.setParent(rs.getString(3));
					cate2.setIsPublic(rs.getString(4));
					cateAll.add(cate2);

//							cate2 = null;
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
			return cateAll;
		}
	
}
