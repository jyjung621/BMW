package oracle.java.bmw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Category;
import oracle.java.bmw.model.ItemInfo;

@Repository
public class KISItemDaoImpl implements KISItemDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ItemInfo> itemList(ItemInfo item) {
		return session.selectList("KISItemList", item);
	}

	@Override
	public int itemTotal() {
		return session.selectOne("KISItemTotal");
	}

	@Override
	public ItemInfo content(int itemNo) {
		return session.selectOne("KISItemContent", itemNo);
	}

	@Override
	public int insert(ItemInfo item, Category cate) {
		return session.insert("KISItemWrite", item);
	}

	@Override
	public List<Category> catelist() {
		return session.selectList("KISCateList");
	}

	@Override
	public List<ItemInfo> itemList() {
		return session.selectList("KISCateList");
	}

	@Override
	public List<Category> childSelect(Category cate) {
		return session.selectList("childCate", cate);
	}

	@Override
	public int delete(int itemNo) {
		return session.delete("KISItemDelete", itemNo);
	}

	@Override
	public int upHits(int itemNo) {
		return session.update("KISItemHits", itemNo);		
	}

	@Override
	public String regDate() {
		return session.selectOne("regDate");
	}
	
	

//	@Override
//	public int update(Ingredient ingt) {
//		return session.update("KISIngtUpdate", ingt);
//	}
//
//
//	@Override
//	public void insert() {
//		session.insert("KISIngtWrite");
//	}



}
