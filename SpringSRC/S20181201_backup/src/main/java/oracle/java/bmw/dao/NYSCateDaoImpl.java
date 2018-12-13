package oracle.java.bmw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Category;

@Repository
public class NYSCateDaoImpl implements NYSCateDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int total() {
		return session.selectOne("NYSCateTotal");
	}

	@Override
	public List<Category> NYSCateList(Category cate) {
		return session.selectList("NYSCateList", cate);
	}
	
	
	
}
