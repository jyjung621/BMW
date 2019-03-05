package oracle.java.bmw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.Board;
import oracle.java.bmw.model.Member;
import oracle.java.bmw.model.Point;

@Repository
public class WGPointDaoM implements WGPointDao {
	
	@Autowired
	private SqlSession session;
	
//	@Override
//	public List<Board> SDBBoardList(Board board) {		
//					xml로 가서    id="selectBoard", 인자로 board 보냄 
//		return session.selectList("selectBoard", board);
//	}
	
	// 회원이 갖고있는 현재포인트 검색
		@Override
		public int selPoint(String memberId) {
			int result = 0;
			try {
				result = session.selectOne("WGselPoint", memberId);
			} catch(Exception e) {
				System.out.println("selPoint 에러 : "+e.getMessage());
			}
			
			return result;
		}
		
		@Override
		public int pointTotal(String memberId) {
			return session.selectOne("WGpointTotal", memberId);
		}
		
		@Override
		public List<Point> pointList(Point point) {
			return session.selectList("WGpointList", point);
		}

		@Override
		public int chargePoint(Point point) {
			System.out.println("chargePoint sql 실행한다?");
			return session.insert("WGchargePoint", point);
		}
		
		

		
}
