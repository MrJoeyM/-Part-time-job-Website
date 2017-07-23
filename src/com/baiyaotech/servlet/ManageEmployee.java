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
import com.baiyaotech.bean.JobInfo;
import com.baiyaotech.bean.JobRecord;

public class ManageEmployee extends HttpServlet {


	private static final long serialVersionUID = 1L;

	public ManageEmployee() {
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
		HttpSession session = request.getSession();
		ArrayList<JobRecord> informations = new ArrayList<JobRecord>();
		informations = dao.getInformation();
		if(informations != null){
			session.setAttribute("informations", informations);
			request.getRequestDispatcher("/WEB-INF/ManagerEmployee.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
	}

	public void init() throws ServletException {

	}

}
