package oracle.java.bmw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Comments;

@Repository
public class JJYItemReviewDaoImpl implements JJYItemReviewDao {

	@Autowired
	private SqlSession session;

	@Override
	public int JJYItemReviewTotal(Comments comm) {
		return session.selectOne("JJYCommentsTotal", comm);
	}
	
	@Override
	public List<Comments> commentList(Comments comm) {
		return session.selectList("JJYCommentList", comm);
	}

	@Override
	public int commentWrite(Comments comm) {
		return session.insert("JJYCommentWrite", comm);
	}

	@Override
	public Comments commentSelect(Comments comm) {
		return session.selectOne("JJYCommentSelect", comm);
	}

	@Override
	public int commentUpdate(Comments comm) {
		return session.update("JJYCommentUpdate", comm);
	}

	@Override
	public int commentDelete(Comments comm) {
		return session.delete("JJYCommentDelete", comm);
	}

	@Override
	public long commentCount(Comments comm) {
		return session.selectOne("JJYCommentCount", comm);
	}

}
