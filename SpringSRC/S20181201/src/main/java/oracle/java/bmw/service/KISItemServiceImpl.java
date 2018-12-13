package oracle.java.bmw.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.bmw.dao.KISItemDao;
import oracle.java.bmw.model.Category;
import oracle.java.bmw.model.Ingredient;
import oracle.java.bmw.model.IngtList;
import oracle.java.bmw.model.ItemInfo;

@Service
public class KISItemServiceImpl implements KISItemService {
	
	@Autowired
	private KISItemDao kid;
	
	@Override
	public int KISItemTotal() {
		return kid.itemTotal();
	}

	@Override
	public List<ItemInfo> itemList(ItemInfo item) {
		return kid.itemList(item);
	}
	
	@Override
	public ItemInfo content(int itemNo) {
		ItemInfo item = kid.content(itemNo);
		return kid.content(itemNo);
	}

	@Override
	public int insert(ItemInfo item) {
		return kid.insert(item);
	}

	@Override
	public List<Category> cateList() {
		return kid.catelist();
	}

	@Override
	public List<ItemInfo> itemList() {
		return kid.itemList();
	}

	@Override
	public List<Category> select() {
		return kid.catelist();
	}

	@Override
	public List<Category> childSelect(Category cate) {
		return kid.childSelect(cate);
	}

	@Override
	public int update(ItemInfo item) {
		return kid.update(item);
	}

	@Override
	public int delete(int itemNo) {
		return kid.delete(itemNo);
	}

	@Override
	public int upHits(int itemNo) {
		return kid.upHits(itemNo);
	}

	@Override
	public List<Category> content() {
		return kid.content();
	}

	@Override
	public List<Ingredient> ingtList() {
		return kid.ingtList();
	}

	@Override
	public List<IngtList> mapplist(int itemNo) {
		return kid.mapplist(itemNo);
	}

	@Override
	public List<Ingredient> ingtList(int itemNo) {
		return kid.ingtList(itemNo);
	}

	@Override
	public int mappInsert(IngtList ingtList) {
		return kid.mappInsert(ingtList);
	}

	@Override
	public int selectItemNo() {
		return kid.selectItemNo();
	}

	@Override
	public int mappUpdate(IngtList ingtlist) {
		return kid.update(ingtlist);
	}

	@Override
	public void mappDelete(IngtList ingtlist) {
		kid.mappDelete(ingtlist);	
	}

//	@Override
//	public String regDate() {
//		return kid.regDate();
//	}
		

}
