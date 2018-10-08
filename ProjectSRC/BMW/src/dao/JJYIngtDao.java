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

public class JJYIngtDao {
	private static JJYIngtDao instance;

	private JJYIngtDao() {
	}

	public static JJYIngtDao getInstance() {
		if (instance == null) {
			instance = new JJYIngtDao();
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

	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from ingredient";
		//String sql = "insert into ingredient values (11,'제발','3','ㅁㅁ','','지성피부','자외선 차단')";
		int result = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			//result = pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println("total result --> " + result);
		} catch (Exception e) {
			System.out.println("TotalCnt error -> " + e.getMessage());
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return result;
	}

	public List<Ingredient> list(int startRow, int endRow) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Ingredient> al = new ArrayList<>();
		String sql = "SELECT * FROM (SELECT ROWNUM rn, A.* FROM (SELECT * FROM ingredient ORDER BY name ) A ) where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Ingredient ingt = new Ingredient();
				ingt.setIngredientNo(rs.getInt(2));
				ingt.setName(rs.getString(3));
				ingt.setGrade(rs.getString(4));
				ingt.setDanger20(rs.getString(5));
				ingt.setDangerAllergy(rs.getString(6));
				ingt.setSpecialyType(rs.getString(7));
				ingt.setFunctional(rs.getString(8));

				al.add(ingt);
			}

		} catch (Exception e) {
			System.out.println("list error -> " + e.getMessage());
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}

		return al;
	}
}
