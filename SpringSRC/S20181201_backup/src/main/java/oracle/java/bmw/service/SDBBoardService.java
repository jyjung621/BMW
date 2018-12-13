package oracle.java.bmw.service;

import java.util.List;

import oracle.java.bmw.model.Board;

public interface SDBBoardService {

	List<Board> SDBBoardList(Board board);
	int SDBBoardTotal();
}
