package oracle.java.bmw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.bmw.dao.JJYItemDao;
import oracle.java.bmw.model.Comments;

@Service
public class JJYItemServiceImpl implements JJYItemService {

	@Autowired
	private JJYItemDao jid;
	
	@Override
	public void itemRaingUpdate(Comments comm) {
		jid.itemRaingUpdate(comm);
	}

}
