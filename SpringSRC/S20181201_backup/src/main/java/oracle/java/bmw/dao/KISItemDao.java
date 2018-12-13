package oracle.java.bmw.dao;

import java.util.List;

import oracle.java.bmw.model.Category;
import oracle.java.bmw.model.Ingredient;
import oracle.java.bmw.model.ItemInfo;

public interface KISItemDao {
	List<ItemInfo> itemList(ItemInfo item);
	int itemTotal();
	ItemInfo content(int itemNo);
//	int delete(int ingredientNo);
//	int update(Ingredient ingt);
//	void insert();
	int insert(ItemInfo item, Category cate);
	List<Category> catelist();
	List<ItemInfo> itemList();
	List<Category> childSelect(Category cate);
	int delete(int itemNo);
	int upHits(int itemNo);
	String regDate();
}
