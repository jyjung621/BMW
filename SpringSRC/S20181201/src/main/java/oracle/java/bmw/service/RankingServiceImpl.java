package oracle.java.bmw.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.bmw.dao.RankingDao;
import oracle.java.bmw.model.ItemInfo;
import oracle.java.bmw.model.Ranking;

@Service
public class RankingServiceImpl implements RankingService {

	@Autowired
	private RankingDao rd;

	@Override
	public List<ItemInfo> RankingType(Ranking rank) {
		return rd.RankingType(rank);
	}


	
	
}
