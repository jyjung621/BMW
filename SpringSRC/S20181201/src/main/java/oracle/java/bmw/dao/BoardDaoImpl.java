package oracle.java.bmw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Board;
import oracle.java.bmw.model.SaveFiles;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Board> BoardList(Board board) {
		return session.selectList("BoardList", board);
	}

	@Override
	public int BoardTotal() {
		return session.selectOne("BoardTotal");
	}

	@Override
	public Board BoardContent(int boardNo) {
		return session.selectOne("BoardContent", boardNo);
	}

	@Override
	public int BoardDelete(int boardNo) {
		return session.delete("BoardDelete", boardNo);
	}

	@Override
	public int BoardWrite(Board board) {
		return session.insert("BoardWrite", board);
	}

	@Override
	public void BoardHitPlus(int boardNo) {
		session.update("BoardHitPlus", boardNo);
	}

	@Override
	public int BoardUpdate(Board board) {
		System.out.println("DAO SDBBoardUpdate  board.getBoardNo()->" + board.getBoardNo());
		int kkk = 0;
		try {
			kkk=session.update("BoardUpdate", board);
		}
		catch (Exception e) {
			System.out.println("e.getMessage()->" + e.getMessage());
		}
		return kkk;		
	}

	@Override
	public int BoardSaveFilesWrite(Board board) {
		return session.insert("BoardSaveFilesWrite", board);
	}

	@Override
	public int BoardSaveFilesTempDelete() {
		return session.delete("BoardSaveFilesTempDelete");
	}

	@Override
	public int BoardSaveFilesUpdate(String boardCategory) {
		return session.update("BoardSaveFilesUpdate", boardCategory);
	}

	@Override
	public int BoardCategoryTotal(String boardCategory) {
		return session.selectOne("BoardCategoryTotal", boardCategory);
	}

	@Override
	public List<Board> WebzineList(Board board) {
		return session.selectList("WebzineList", board);
	}

	@Override
	public List<SaveFiles> BoardSaveFilesList(SaveFiles sf) {
		return session.selectList("BoardSaveFilesList", sf);
	}

	@Override
	public int BoardSaveFilesRealDelete(int boardNo) {
		return session.delete("BoardSaveFilesRealDelete", boardNo);
	}

	@Override
	public List<Board> EventList(Board board) {
		return session.selectList("EventList", board);
	}

	@Override
	public List<SaveFiles> BoardSaveFilesEventList(SaveFiles sf) {
		return session.selectList("BoardSaveFilesEventList", sf);
	}

	@Override
	public Board SelectEvent(int boardNo) {
		return session.selectOne("SelectEvent", boardNo);
	}

	
	
	

	
	

	
}
