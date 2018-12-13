package oracle.java.bmw.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Category;
import oracle.java.bmw.model.Ingredient;
import oracle.java.bmw.model.IngtList;
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
		ItemInfo item = session.selectOne("KISItemContent", itemNo);
		return session.selectOne("KISItemContent", item);
	}

	@Override
	public int insert(ItemInfo item) {
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
	public List<Category> content() {
		return session.selectList("childCate");
	}

	@Override
	public List<Ingredient> ingtList() {
		return session.selectList("KISIngtList");
	}

	@Override
	public int update(ItemInfo item) {
		return session.update("KISItemUpdate", item);
	}

	@Override
	public List<IngtList> mapplist(int itemNo) {
		return session.selectList("KISMappingList", itemNo);
	}

	@Override
	public List<Ingredient> ingtList(int itemNo) {
		return session.selectList("KISIngtName", itemNo);
	}	

	@Override
	public int selectItemNo() {
		return session.selectOne("KISItemNoSelect");
	}

	@Override
	public int mappInsert(IngtList ingtList) {
		return session.insert("KISMappingInsert", ingtList);
	}

	@Override
	public int update(IngtList ingtlist) {
		int result = 0;
		
		result = session.insert("KISMappingInsert", ingtlist);
		return result;
	}

	@Override
	public void mappDelete(IngtList ingtlist) {
		session.delete("KISMappingDelete", ingtlist);		
	}




}
