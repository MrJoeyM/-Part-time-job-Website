package com.baiyaotech.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baiyaotech.Dao.Dao;

public class AddJob extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public AddJob() {
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
		String jobId = request.getParameter("jobId");
		int surplus = Integer.parseInt(request.getParameter("surplus"));
		if(surplus <= 0 ){
			response.sendRedirect(path+"/index.jsp");
			session.setAttribute("returnValue","该兼职人数已满");
			return;
		}
		if(dao.hasJoined(number, jobId))
		{
			response.sendRedirect(path+"/index.jsp");
			session.setAttribute("returnValue","您已添加此兼职!");
			return;
		}
		if(jobId != null && number != null){
			boolean result1 = dao.addJob(jobId, number);
			boolean result2 = dao.updateSurplus(jobId);
			if(result1 && result2){
				session.setAttribute("returnValue","添加兼职成功!");
				response.sendRedirect(path+"/servlet/GetRecord");
				return;
			}else{
				response.sendRedirect(path+"/servlet/GetJob");
				return;
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void init() throws ServletException {
		
	}

}
