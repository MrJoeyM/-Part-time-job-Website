package com.baiyaotech.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baiyaotech.Dao.Dao;
import com.baiyaotech.bean.Employee;
import com.baiyaotech.bean.JobInfo;

public class GetEmployee extends HttpServlet {

	public GetEmployee() {
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
		String jobId = request.getParameter("jobId");
		ArrayList<Employee> employeess = new ArrayList<Employee>();
		if(dao.getJobEmployees(jobId) != null){
			employeess = dao.getJobEmployees(jobId);
			session.setAttribute("employeess", employeess);
			request.getRequestDispatcher("/WEB-INF/Employee.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("/WEB-INF/Employee.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);		
	}

	public void init() throws ServletException {
		
	}

}
