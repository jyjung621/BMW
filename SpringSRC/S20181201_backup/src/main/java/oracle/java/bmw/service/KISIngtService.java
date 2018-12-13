package oracle.java.bmw.service;

import java.util.List;

import oracle.java.bmw.model.Ingredient;

public interface KISIngtService {
	List<Ingredient> ingtList(Ingredient ingt);
	int KISIngtTotal();
	Ingredient content(int ingredientNo);
	int delete(int ingredientNo);
	int update(Ingredient ingt);
	int insert(Ingredient ingt);
	

}
