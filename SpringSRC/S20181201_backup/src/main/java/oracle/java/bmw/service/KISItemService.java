package oracle.java.bmw.service;

import java.util.List;

import oracle.java.bmw.model.Category;
import oracle.java.bmw.model.ItemInfo;

public interface KISItemService {
	List<ItemInfo> itemList(ItemInfo item);
	int KISItemTotal();
	ItemInfo content(int itemNo);
//	int delete(int ingredientNo);
//	int update(Ingredient ingt);
	int insert(ItemInfo item, Category cate);
	List<Category> cateList();
	List<ItemInfo> itemList();
	List<Category> select();
	List<Category> childSelect(Category cate);
	int delete(int itemNo);
	int upHits(int itemNo);
	String regDate();

}
