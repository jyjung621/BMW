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

import com.oreilly.servlet.MultipartRequest;

public class JJYItemReviewDao {
	private static JJYItemReviewDao instance;

	private JJYItemReviewDao() {
	}

	public static JJYItemReviewDao getInstance() {
		if (instance == null) {
			instance = new JJYItemReviewDao();
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

	public int getTotalCommentCnt(int mainNo, String ref_Table) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) from comments where mainno=? and ref_table=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mainNo);
			pstmt.setString(2, ref_Table);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}

			System.out.println("getTotalCnt --> " + result);
		} catch (Exception e) {
			System.out.println("getTotalCommentCnt error -> " + e.getMessage());
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

	public Comments selectComment(int mainNo, int subNo, String ref_Table) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Comments comm = null;
		String sql = "select * from comments where mainno=? and subno=? and ref_table=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mainNo);
			pstmt.setInt(2, subNo);
			pstmt.setString(3, ref_Table);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				comm = new Comments();
				comm.setMainNo(rs.getInt("MAINNO"));
				comm.setSubNo(rs.getInt("SUBNO"));
				comm.setRef_Table(rs.getString("REF_TABLE"));
				comm.setIsPublic(rs.getString("ISPUBLIC"));
				comm.setHits(rs.getInt("HITS"));
				comm.setRef(rs.getInt("REF"));
				comm.setRe_step(rs.getInt("RE_STEP"));
				comm.setRe_level(rs.getInt("RE_LEVEL"));
				comm.setContent(rs.getString("CONTENT"));
				comm.setContent2(rs.getString("CONTENT2"));
				comm.setContent3(rs.getString("CONTENT3"));
				comm.setRating(rs.getInt("RATING"));
				comm.setLikeCnt(rs.getInt("LIKECNT"));
				comm.setMemberId(rs.getString("MEMBERID"));
				comm.setRegDate(rs.getString("REGDATE"));
			}
			System.out.println("selectComment 진행...");
		} catch (Exception e) {
			System.out.println("selectComment error -> " + e.getMessage());
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

		return comm;
	}

	public List<Comments> list(int itemNo, String ref_Table, int startRow, int endRow) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn, a.* from (select * from comments where mainno=? and ref_table=? order by subno desc) a) where rn between ? and ?";

		Comments comm = null;
		List<Comments> comms = new ArrayList<>();

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNo);
			pstmt.setString(2, ref_Table);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				comm = new Comments();
				comm.setMainNo(rs.getInt("MAINNO"));
				comm.setSubNo(rs.getInt("SUBNO"));
				comm.setRef_Table(rs.getString("REF_TABLE"));
				comm.setIsPublic(rs.getString("ISPUBLIC"));
				comm.setHits(rs.getInt("HITS"));
				comm.setRef(rs.getInt("REF"));
				comm.setRe_step(rs.getInt("RE_STEP"));
				comm.setRe_level(rs.getInt("RE_LEVEL"));
				comm.setContent(rs.getString("CONTENT"));
				comm.setContent2(rs.getString("CONTENT2"));
				comm.setContent3(rs.getString("CONTENT3"));
				comm.setRating(rs.getInt("RATING"));
				comm.setLikeCnt(rs.getInt("LIKECNT"));
				comm.setMemberId(rs.getString("MEMBERID"));
				comm.setRegDate(rs.getString("REGDATE"));

				comms.add(comm);
				comm = null;
			}
			System.out.println("ReviewList 실행...");
		} catch (Exception e) {
			System.out.println("ReviewList error -> " + e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return comms;
	}

	public void reviewHits(int mainNo, int subNo, String ref_table) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update comments set hits = hits+1 where mainNo=? and subno=? and ref_table=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mainNo);
			pstmt.setInt(2, subNo);
			pstmt.setString(3, ref_table);
			pstmt.executeUpdate();

			System.out.println("reviewHits 실행...");
		} catch (Exception e) {
			System.out.println("reviewHits error -> " + e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}

	public int likeCnt(int mainNo, int reviewNo, String ref_Table) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update comments set likecnt=likecnt+1 where mainNo=? and subno=? and ref_table=?";
		String sql1 = "select likecnt from comments where mainNo=? and subno=? and ref_table=?";
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mainNo);
			pstmt.setInt(2, reviewNo);
			pstmt.setString(3, ref_Table);
			pstmt.executeUpdate();

			pstmt.close();

			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, mainNo);
			pstmt.setInt(2, reviewNo);
			pstmt.setString(3, ref_Table);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}

			System.out.println("likeCnt 실행...");
		} catch (Exception e) {
			System.out.println("reviewHits error -> " + e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return result;
	}

	public int writeComment(Comments comm) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into comments (mainno, subno, ref_table, ispublic, re_level, content, content2, content3, memberid, regdate) "
				+ "	values (?, fn_MaxNoForTable('comments','iteminfo', ?), ?, ?, 1, ?, ?, ?, ?, fn_datetochar(sysdate))";
		int result = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comm.getMainNo());
			pstmt.setInt(2, comm.getMainNo());
			pstmt.setString(3, comm.getRef_Table());
			pstmt.setString(4, comm.getIsPublic());
			pstmt.setString(5, comm.getContent());
			pstmt.setString(6, comm.getContent2());
			pstmt.setString(7, comm.getContent3());
			pstmt.setString(8, comm.getMemberId());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("writeComment error -> " + e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return result;
	}

	public int updateComments(Comments comm) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update comments set content=?, content2=?, content3=?, isPublic=?, rating=?, regdate=FN_DATETOCHAR(sysdate) where mainno=? and subno=? and ref_Table=?";
		int result = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comm.getContent());
			pstmt.setString(2, comm.getContent2());
			pstmt.setString(3, comm.getContent3());
			pstmt.setString(4, comm.getIsPublic());
			pstmt.setInt(5, comm.getRating());
			pstmt.setInt(6, comm.getMainNo());
			pstmt.setInt(7, comm.getSubNo());
			pstmt.setString(8, comm.getRef_Table());
			result = pstmt.executeUpdate();

			System.out.println("updateComments 실행..." + result);
		} catch (Exception e) {
			System.out.println("updateComment error -> " + e.getMessage());
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}

		return result;
	}

	public int deleteComments(int mainNo, int subNo, String ref_Table) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from comments where mainno=? and subno=? and ref_Table=?";
		int result = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mainNo);
			pstmt.setInt(2, subNo);
			pstmt.setString(3, ref_Table);
			result = pstmt.executeUpdate();

			System.out.println("deleteComment 실행..." + result);
		} catch (Exception e) {
			System.out.println("deleteComment error -> " + e.getMessage());
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}

		return result;
	}

	public int writeReview(MultipartRequest multi, Comments comm) throws SQLException {
		int result = 1;
//		int mainNo = BoardDao.getInstance().insert(new Board(boardCategory, title, content, viewGrade, isPublic, memberId));

		int mainNo = 0;
		int subNo = 0;
		
		int tmp = writeComment(comm);
		if(tmp > 0 ) {
			mainNo = comm.getMainNo();
			subNo = comm.getSubNo();
		}
		
		if (mainNo > 0) {
			System.out.println("정상 게시물 등록시");
			List<SaveFiles> list = FileProcess.getInstance().fileMoveToPart(multi, "REVIEW", mainNo, subNo);
			if (list != null && list.size() > 0) {
				result = SaveFilesDao.getInstance().insertList(list);
			}
		} else {
			result = 0;
			// 임시 폴더에 저장된 파일 삭제
			FileProcess.getInstance().tempFileDelete(multi);
		}
		return result;
	}

}
