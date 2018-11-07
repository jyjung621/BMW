package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemInfo;
import dao.SDBItemDao;

public class SDBmainFormAct implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			SDBItemDao id = SDBItemDao.getInstance();
			List<ItemInfo> list = id.list();
			
			request.setAttribute("list", list);
		}catch(Exception e) {System.out.println(e.getMessage());	}
		return "mainForm2.jsp";
	}

}
