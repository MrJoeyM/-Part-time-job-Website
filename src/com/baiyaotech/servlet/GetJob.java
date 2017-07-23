package com.baiyaotech.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baiyaotech.Dao.Dao;
import com.baiyaotech.bean.Employee;
import com.baiyaotech.bean.JobInfo;

public class GetJob extends HttpServlet {

	public GetJob() {
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
		ArrayList<JobInfo> jobs = dao.getJobs();
		if(jobs != null){
			session.setAttribute("jobs", jobs);
		}
		response.sendRedirect(path+"/index.jsp");		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void init() throws ServletException {
	}

}
