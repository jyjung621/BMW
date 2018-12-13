package oracle.java.bmw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Comments;
import oracle.java.bmw.model.ItemInfo;

@Repository
public class JJYItemDaoImpl implements JJYItemDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void itemRaingUpdate(Comments comm) {
		System.out.println("itemRaingUpdate() Start....");
		ItemInfo item = session.selectOne("JJYSelectRating", comm);
		System.out.println("JJYSelectRating End....");
		float ratingAvg = (float)item.getRatingSum() / item.getRatingCnt();
		System.out.println("ratingAvg = " + ratingAvg);
		item.setRating(ratingAvg);
		session.update("JJYItemRatingUpdate", item);
		System.out.println("JJYItemRatingUpdate End....");
	}

}
