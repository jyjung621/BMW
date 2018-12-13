package oracle.java.bmw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Comments;
import oracle.java.bmw.model.CommentsJJY;

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
	public CommentsJJY commentSelect(CommentsJJY comm) {
		return session.selectOne("JJYCommentSelect", comm);
	}

	

}
