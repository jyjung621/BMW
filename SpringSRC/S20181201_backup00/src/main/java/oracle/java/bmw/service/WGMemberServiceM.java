package oracle.java.bmw.service;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.bmw.dao.WGMemberDao;
import oracle.java.bmw.dao.WGPointDao;
import oracle.java.bmw.model.Board;
import oracle.java.bmw.model.Member;
import oracle.java.bmw.model.Point;

@Service
public class WGMemberServiceM implements WGMemberService {

	@Autowired
	private WGMemberDao wmd;
	
	@Autowired
	private WGPointDao wpd;
	
	@Override
	public int insert(Member member) {
		return wmd.insert(member);
	}
	
	@Override
	public int confirm(String memberId) {
		return wmd.confirm(memberId);
	}
	
	@Override
	public int mailSuccess(Member member) {
		return wmd.mailSuccess(member);
	}

	@Override
	public int selPoint(String memberId) {
		return wpd.selPoint(memberId);
	}
	
	// 나중에 Member 부분을 세션에서 아이디값 받아서 바꿔줄것
	@Override
	public int pointTotal(String memberId) {
		return wpd.pointTotal(memberId);
	}
	
	@Override
	public List<Point> pointList(Point point) {
		return wpd.pointList(point);
	}

	@Override
	public int chargePoint(Point point) {
		return wpd.chargePoint(point);
	}
	
	

	
	
	
	
	
}
