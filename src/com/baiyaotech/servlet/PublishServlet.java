package com.baiyaotech.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baiyaotech.Dao.Dao;
import com.baiyaotech.bean.Employer;
import com.baiyaotech.bean.JobInfo;

public class PublishServlet extends HttpServlet {

	public PublishServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("html/text;gbk");
		request.setCharacterEncoding("gbk");
		Dao dao = new Dao();
		String path = request.getContextPath();
		HttpSession session = request.getSession();
		if(session.getAttribute("user2") == null){
			response.sendRedirect(path+"/signin.jsp");
			return;
		}
		String number = (String)session.getAttribute("number2");
		JobInfo jobInfo = new JobInfo();
		String jobTitle = new String(request.getParameter("jobTitle").getBytes("gbk"),"gbk");
		String time = new String(request.getParameter("time").getBytes("gbk"),"gbk");
		String position = new String(request.getParameter("position").getBytes("gbk"),"gbk");
		int surplus = Integer.parseInt(request.getParameter("surplus"));
		String price = new String(request.getParameter("price").getBytes("gbk"),"gbk")+new String(request.getParameter("meta").getBytes("gbk"),"gbk");
		String description = new String(request.getParameter("description").getBytes("gbk"),"gbk");
		String duration = new String(request.getParameter("duration").getBytes("gbk"),"gbk");
		String category = new String(request.getParameter("category").getBytes("gbk"),"gbk");
		String location = new String(request.getParameter("location").getBytes("gbk"),"gbk");
		String contact = new String(request.getParameter("contact").getBytes("gbk"),"gbk");
		String bond = new String(request.getParameter("bond").getBytes("gbk"),"gbk");
		int total = surplus;
		jobInfo.setEmployerId(number);
		jobInfo.setJobTitle(jobTitle);
		jobInfo.setDescription(description);
		jobInfo.setSurplus(surplus);
		jobInfo.setPosition(position);
		jobInfo.setPrice(price);
		jobInfo.setTime(time);
		jobInfo.setTotal(total);
		jobInfo.setDuration(duration);
		jobInfo.setCategory(category);
		jobInfo.setLocation(location);
		jobInfo.setContact(contact);
		jobInfo.setBond(bond);
		boolean result = dao.publishJob(jobInfo);	
		if(result){
			session.setAttribute("publishResult", "发布兼职信息成功！");
			response.sendRedirect(path+"/servlet/PerInfoServlet?person=employer");
		}else{
			session.setAttribute("publishResult", "发布兼职信息失败！");
			response.sendRedirect(path+"/publish.jsp");
		}
	}

	public void init() throws ServletException {

	}

}
