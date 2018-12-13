package oracle.java.bmw.dao;

import java.util.List;

import oracle.java.bmw.model.Comments;

public interface JJYItemReviewDao {

	List<Comments> commentList(Comments comm);

	int JJYItemReviewTotal(Comments comm);

	int commentWrite(Comments comm);

	Comments commentSelect(Comments comm);

	int commentUpdate(Comments comm);

	int commentDelete(Comments comm);

	long commentCount(Comments comm);

}
