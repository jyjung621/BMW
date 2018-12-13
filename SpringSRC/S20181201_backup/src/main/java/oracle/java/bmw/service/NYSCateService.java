package oracle.java.bmw.service;

import java.util.List;

import oracle.java.bmw.model.Category;

public interface NYSCateService {

	int total();
	List<Category> NYSCateList(Category cate);

}
