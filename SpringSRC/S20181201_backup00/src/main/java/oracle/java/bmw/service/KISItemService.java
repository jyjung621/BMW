package oracle.java.bmw.service;

import java.util.HashMap;
import java.util.List;

import oracle.java.bmw.model.Category;
import oracle.java.bmw.model.Ingredient;
import oracle.java.bmw.model.IngtList;
import oracle.java.bmw.model.ItemInfo;

public interface KISItemService {
	List<ItemInfo> itemList(ItemInfo item);
	int KISItemTotal();
	ItemInfo content(int itemNo);
	int insert(ItemInfo item);
	List<Category> cateList();
	List<ItemInfo> itemList();
	List<Category> select();
	List<Category> childSelect(Category cate);
	int delete(int itemNo);
	int upHits(int itemNo);
//	String regDate();
	List<Category> content();
	List<Ingredient> ingtList();
	int update(ItemInfo item);
	int mappInsert(IngtList ingtList);
	List<IngtList> mapplist(int itemNo);
	List<Ingredient> ingtList(int itemNo);
	int selectItemNo(); // 매매핑테이블 저장하려면 itemNo 먼저 구해야 함
	int mappUpdate(IngtList ingtlist);
	void mappDelete(IngtList ingtlist);

}
