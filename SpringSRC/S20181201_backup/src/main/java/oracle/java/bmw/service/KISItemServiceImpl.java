package oracle.java.bmw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.bmw.dao.KISItemDao;
import oracle.java.bmw.model.Category;
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
		return kid.content(itemNo);
	}

	@Override
	public int insert(ItemInfo item, Category cate) {
		return kid.insert(item, cate);
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

//	@Override
//	public int update(Ingredient ingt) {
//		return kid.update(ingt);
//	}
//
	@Override
	public int delete(int itemNo) {
		return kid.delete(itemNo);
	}

	@Override
	public int upHits(int itemNo) {
		return kid.upHits(itemNo);
	}

	@Override
	public String regDate() {
		return kid.regDate();
	}
		

}
