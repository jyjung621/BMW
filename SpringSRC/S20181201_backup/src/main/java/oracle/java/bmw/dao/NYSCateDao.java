package oracle.java.bmw.dao;

import java.util.List;


import oracle.java.bmw.model.Category;

public interface NYSCateDao {

	int total();
	List<Category> NYSCateList(Category cate);

}
