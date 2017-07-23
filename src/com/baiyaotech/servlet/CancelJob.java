package com.baiyaotech.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baiyaotech.Dao.Dao;

public class CancelJob extends HttpServlet {

	public CancelJob() {
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
		String number = new String(request.getParameter("number").getBytes("gbk"),"gbk");
		String jobId = new String(request.getParameter("jobId").getBytes("gbk"),"gbk");
		if(dao.cancelRecord(number, jobId))
		{
			dao.addSurplus(jobId);
			response.sendRedirect(path+"/servlet/GetRecord");
			return;
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void init() throws ServletException {

	}

}
