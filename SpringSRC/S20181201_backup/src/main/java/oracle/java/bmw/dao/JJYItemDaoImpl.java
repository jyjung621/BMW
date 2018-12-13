package oracle.java.bmw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Comments;
import oracle.java.bmw.model.ItemInfoJJY;

@Repository
public class JJYItemDaoImpl implements JJYItemDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void itemRaingUpdate(Comments comm) {
		System.out.println("itemRaingUpdate() Start....");
		ItemInfoJJY itemJJY = session.selectOne("JJYSelectRating", comm);
		System.out.println("JJYSelectRating End....");
		float ratingAvg = (float)itemJJY.getRatingSum() / itemJJY.getRatingCnt();
		System.out.println("ratingAvg = " + ratingAvg);
		itemJJY.setRating(ratingAvg);
		session.update("JJYItemRatingUpdate", itemJJY);
		System.out.println("JJYItemRatingUpdate End....");
	}

}
