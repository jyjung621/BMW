package oracle.java.bmw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int total() {
		return session.selectOne("NYSCateTotal");
	}

	@Override
	public List<Category> CategoryListView(Category cate) {
		return session.selectList("NYSCateList", cate);
	}

	@Override
	public Category datail(int categoryNo) {
		return session.selectOne("NYSCateDetail", categoryNo);
	}

	@Override
	public int CategoryUpdatePro(Category cate) {
		System.out.println(cate);
		return session.update("NYSCateUpdate", cate);
	}

	@Override
	public List<Category> CategoryParentNameList(Category cate) {
		return session.selectList("NYSCateParList", cate);
	}

	@Override
	public int CategoryDelete(int categoryNo) {
		return session.delete("NYSCateDelete", categoryNo);
	}

	@Override
	public int CategoryWritePro(Category cate) {
		System.out.println("name -> " + cate.getName());
		System.out.println("parent -> " + cate.getParent());
		System.out.println("isPublic -> " + cate.getIsPublic());
		System.out.println("division -> " + cate.getDivision());
		return session.insert("NYSCateInsert", cate);
	}

	@Override
	public Category detail(String name) {
		return session.selectOne("NYSCateDetail2", name);
	}

	@Override
	public List<Category> CategoryParentNameList2() {
		return session.selectList("NYSCateParList");
	}



	
	
	
}
