package oracle.java.bmw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Board;

@Repository
public class SDBBoardDaoImpl implements SDBBoardDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Board> SDBBoardList(Board board) {
		/*System.out.println("board list.size-> " + list.size());*/
		return session.selectList("SDBBoardList", board);
	}

	@Override
	public int SDBBoardTotal() {
		return session.selectOne("SDBBoardTotal");
	}

}
