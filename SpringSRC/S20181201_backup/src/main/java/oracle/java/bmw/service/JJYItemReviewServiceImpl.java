package oracle.java.bmw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.bmw.dao.JJYItemReviewDao;
import oracle.java.bmw.model.Comments;
import oracle.java.bmw.model.CommentsJJY;

@Service
public class JJYItemReviewServiceImpl implements JJYItemReviewService {

	@Autowired
	private JJYItemReviewDao jrd;

	@Override
	public int JJYItemReviewTotal(Comments comm) {
		return jrd.JJYItemReviewTotal(comm);
	}
	
	
	@Override
	public List<Comments> commentList(Comments comm) {
		return jrd.commentList(comm);
	}


	@Override
	public int commentWrite(Comments comm) {
		return jrd.commentWrite(comm);
	}


	@Override
	public CommentsJJY commentSelect(CommentsJJY comm) {
		return jrd.commentSelect(comm);
	}


	

}
