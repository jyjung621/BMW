package oracle.java.bmw.service;

import java.util.List;

import oracle.java.bmw.model.Comments;

public interface JJYItemReviewService {

	int JJYItemReviewTotal(Comments comm);

	List<Comments> commentList(Comments comm);

	int commentWrite(Comments comm);

	Comments commentSelect(Comments comm);

	int commentUpdate(Comments comm);

	int commentDelete(Comments comm);

	long commentCount(Comments comm);

}
