package com.baiyaotech.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baiyaotech.Dao.Dao;
import com.baiyaotech.bean.JobInfo;

public class GetRecord extends HttpServlet {

	public GetRecord() {
		super();
	}

	public void destroy() {
		super.destroy();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("html/text;gbk");
		request.setCharacterEncoding("gbk");
		Dao dao = new Dao();
		String path = request.getContextPath();
		HttpSession session = request.getSession();
		String number = null;
		if(session.getAttribute("number1") != null)
		{
			number = (String)session.getAttribute("number1");
		}
		if(number == null || number.equals("")){
			response.sendRedirect(path+"/signin.jsp");
			return;
		}
		ArrayList<JobInfo> records = (ArrayList<JobInfo>)dao.getRecord(number);
		if(records != null){
			session.setAttribute("record", records);
		}
		response.sendRedirect(path+"/employeeInfo.jsp");

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void init() throws ServletException {
		
	}

}
