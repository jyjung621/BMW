package oracle.java.bmw.dao;

import java.util.List;

import oracle.java.bmw.model.Comments;
import oracle.java.bmw.model.CommentsJJY;

public interface JJYItemReviewDao {

	List<Comments> commentList(Comments comm);

	int JJYItemReviewTotal(Comments comm);

	int commentWrite(Comments comm);

	CommentsJJY commentSelect(CommentsJJY comm);

}
