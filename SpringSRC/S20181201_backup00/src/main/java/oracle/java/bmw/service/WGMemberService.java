package oracle.java.bmw.service;

import java.util.List;

import oracle.java.bmw.model.Member;
import oracle.java.bmw.model.Point;

public interface WGMemberService {
	
	int		insert(Member member);
	int		confirm(String memberId);
	int		mailSuccess(Member member);
	int 	selPoint(String memberId);
	int 	pointTotal(String memberId);
	List<Point> pointList(Point point);
	int		chargePoint(Point point);
}
