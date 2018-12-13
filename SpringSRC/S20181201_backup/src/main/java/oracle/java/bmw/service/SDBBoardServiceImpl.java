package oracle.java.bmw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.bmw.dao.SDBBoardDao;
import oracle.java.bmw.model.Board;

@Service
public class SDBBoardServiceImpl implements SDBBoardService {

	@Autowired
	private SDBBoardDao sbd;
	
	@Override
	public List<Board> SDBBoardList(Board board) {
		System.out.println("SDBBoardList");
		return sbd.SDBBoardList(board);
	}

	@Override
	public int SDBBoardTotal() {
		System.out.println("SDBBoardTotal");
		return sbd.SDBBoardTotal();
	}
	

}
