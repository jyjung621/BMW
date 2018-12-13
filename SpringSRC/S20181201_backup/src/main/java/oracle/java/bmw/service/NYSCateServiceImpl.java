package oracle.java.bmw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.bmw.dao.NYSCateDao;
import oracle.java.bmw.model.Category;

@Service
public class NYSCateServiceImpl implements NYSCateService {
	@Autowired
	private NYSCateDao cd;
	
	@Override
	public int total() {
		return cd.total();
	}

	@Override
	public List<Category> NYSCateList(Category cate) {
		return cd.NYSCateList(cate);
	}

	
}
