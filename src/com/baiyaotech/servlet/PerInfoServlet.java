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

public class PerInfoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public PerInfoServlet() {
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
		String person = request.getParameter("person");
		if(person.equals("employer")){
			if(session.getAttribute("user2") == null){
				response.sendRedirect(path+"/signin.jsp");
				return;
			}
			String number = (String)session.getAttribute("number2");
			ArrayList<JobInfo> jobs = dao.getJob(number);
			session.setAttribute("jobInfo2",jobs);														
			for (int i = 0; i < jobs.size(); i++) {
				if( dao.getEmployees(jobs.get(i).getJobId()) != null)
				{
					session.setAttribute("employees"+i, dao.getEmployees(jobs.get(i).getJobId()));
				}
				session.setAttribute("employees"+i, dao.getEmployees(jobs.get(i).getJobId()));
			}
			response.sendRedirect(path+"/employerInfo.jsp");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void init() throws ServletException {

	}

}
