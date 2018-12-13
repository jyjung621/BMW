package oracle.java.bmw.dao;

import java.util.List;

import oracle.java.bmw.model.Board;

public interface SDBBoardDao {

	List<Board> SDBBoardList(Board board);
	int SDBBoardTotal();
}
