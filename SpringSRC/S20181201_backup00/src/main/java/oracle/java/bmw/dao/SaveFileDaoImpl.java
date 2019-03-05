package oracle.java.bmw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.bmw.model.SaveFiles;

@Repository
public class SaveFileDaoImpl implements SaveFileDao {

	@Autowired
	private SqlSession session;

	
	
	@Override
	public int uploadFileInsertDB(SaveFiles saveFile) {
		return session.insert("uploadFileInsertDB", saveFile);
	}
	
}
