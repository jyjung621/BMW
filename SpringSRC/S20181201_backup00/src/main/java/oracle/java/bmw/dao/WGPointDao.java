package oracle.java.bmw.dao;

import java.util.List;

import oracle.java.bmw.model.Member;
import oracle.java.bmw.model.Point;

public interface WGPointDao {
	int 	selPoint(String memberId);
	int 	pointTotal(String memberId);
	List<Point> pointList(Point point);
	int		chargePoint(Point point);
}
