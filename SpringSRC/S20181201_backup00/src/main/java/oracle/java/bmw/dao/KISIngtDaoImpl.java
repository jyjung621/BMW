package oracle.java.bmw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Ingredient;

@Repository
public class KISIngtDaoImpl implements KISIngtDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Ingredient> ingtList(Ingredient ingt) {
		return session.selectList("KISIngtList", ingt);
	}

	@Override
	public int total() {
		return session.selectOne("KISIngtTotal");
	}

	@Override
	public Ingredient content(int ingredientNo) {
		Ingredient ingt = session.selectOne("KISIngtContent", ingredientNo);
		return session.selectOne("KISIngtContent", ingt);
	}

	@Override
	public int update(Ingredient ingt) {
		return session.update("KISIngtUpdate", ingt);
	}

	@Override
	public int insert(Ingredient ingt) {
		return session.insert("KISIngtWrite", ingt);
	}

	@Override
	public int delete(int ingredientNo) {
		return session.delete("KISIngtDelete", ingredientNo);
	}

	@Override
	public void insert() {
		session.insert("KISIngtWrite");
	}
	



}
