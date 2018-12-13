package oracle.java.bmw.service;

import java.util.List;

import oracle.java.bmw.model.Comments;
import oracle.java.bmw.model.CommentsJJY;

public interface JJYItemReviewService {

	int JJYItemReviewTotal(Comments comm);

	List<Comments> commentList(Comments comm);

	int commentWrite(Comments comm);

	CommentsJJY commentSelect(CommentsJJY comm);

}
