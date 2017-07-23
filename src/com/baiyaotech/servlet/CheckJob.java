package com.baiyaotech.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baiyaotech.Dao.Dao;

public class CheckJob extends HttpServlet {

	public CheckJob() {
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
		String jobId = request.getParameter("jobId");
		String checked = request.getParameter("checked");
		if(checked.equals("no")){
			if(dao.checkJob(jobId, "未通过")){
				response.sendRedirect(path+"/servlet/ManageJob");
			}
		}else if(checked.equals("yes")){
			if(dao.checkJob(jobId, "已通过")){
				response.sendRedirect(path+"/servlet/ManageJob");
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
