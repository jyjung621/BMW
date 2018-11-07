<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="dao.JJYItemCategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    	int cateNum = Integer.parseInt(request.getParameter("cateNum"));
    	String pageNumIC = request.getParameter("pageNumIC");
    
    	JJYItemCategoryDao jd = JJYItemCategoryDao.getInstance();
    		
    	int totCnt = jd.getTotalCnt(cateNum); 
		int currentPage = Integer.parseInt(pageNumIC);
		int pageSize = 10, blockSize = 10;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int startNum = totCnt - startRow + 1;
		int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
		int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
		int endPage = startPage + blockSize -1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("totCnt", totCnt);
		jsonObj.put("currentPage", currentPage);
		jsonObj.put("startRow", startRow);
		jsonObj.put("endRow", endRow);
		jsonObj.put("startNum", startNum);
		jsonObj.put("pageCnt", pageCnt);
		jsonObj.put("startPage", startPage);
		jsonObj.put("endPage", endPage);
		jsonObj.put("blockSize", blockSize);
		
// 		JSONArray jsonArr = new JSONArray();
// 		jsonArr.put(index, value)

		PrintWriter pw = response.getWriter();
		pw.println(jsonObj);
    	
    
    %>