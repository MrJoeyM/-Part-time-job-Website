package com.baiyaotech.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baiyaotech.Dao.Dao;
import com.baiyaotech.bean.Employee;
import com.baiyaotech.bean.Employer;


public class SignServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;


	public SignServlet() {
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
		
		String path = request.getContextPath();
		HttpSession session= request.getSession();
		session.setAttribute("error",null);
		Dao dao = new Dao();
		String randomString = (String)session.getAttribute("randomString");
		String checkNode = request.getParameter("checkCode");
		session.setAttribute("number1",null);
		session.setAttribute("number2",null);
		session.setAttribute("user1",null);
		session.setAttribute("user2",null);
		String from = "";
		if(request.getParameter("from") != null){
			from = (String)request.getParameter("from");
		}
		if("signup".equals(from)){
			String number = new String(request.getParameter("number").getBytes("gbk"),"gbk");
			String password = new String(request.getParameter("password1").getBytes("gbk"),"gbk");
			String university = new String(request.getParameter("university").getBytes("gbk"),"gbk");
			String position = new String(request.getParameter("position").getBytes("gbk"),"gbk");
			String contact = new String(request.getParameter("contact").getBytes("gbk"),"gbk");
			Employee employee = new Employee();
			employee.setEmployeeId(number);
			employee.setPassword(password);
			employee.setUniversity(university);
			employee.setPosition(position);
			employee.setContact(contact);
			boolean result = dao.signup(employee);
			//�ж��û��Ƿ�ע��ɹ������ע��ɹ�����ת����¼����
			if(result)
			{
				session.setAttribute("error",null);
				session.setAttribute("number1", number);
				session.setAttribute("user1", employee);
				response.sendRedirect(path+"/servlet/GetJob");
				return;
			}
			else {
				//����û�ע��ʧ�ܣ�����ת��ע�����
				session.setAttribute("error","ע��ʧ��");
				response.sendRedirect(path+"/signup.jsp");
				return;
			}
		}else if("signup2".equals(from)){
			String number = new String(request.getParameter("number").getBytes("gbk"),"gbk");
			String password = new String(request.getParameter("password1").getBytes("gbk"),"gbk");
			String company = new String(request.getParameter("company").getBytes("gbk"),"gbk");
			String description = new String(request.getParameter("description").getBytes("gbk"),"gbk");
			String position = new String(request.getParameter("position").getBytes("gbk"),"gbk");
			String contact = new String(request.getParameter("contact").getBytes("gbk"),"gbk");
			Employer employer = new Employer();
			employer.setEmployerId(number);
			employer.setPassword(password);
			employer.setCompany(company);
			employer.setDescription(description);
			employer.setPosition(position);
			employer.setContact(contact);
			boolean result = dao.signup2(employer);
			//�ж��û��Ƿ�ע��ɹ������ע��ɹ�����ת����¼����
			if(result)
			{
				session.setAttribute("error",null);
				session.setAttribute("number2", number);
				session.setAttribute("user2", employer);
				response.sendRedirect(path+"/publish.jsp");
				return;
			}
			else {
				//����û�ע��ʧ�ܣ�����ת��ע�����
				session.setAttribute("error","ע��ʧ��");
				response.sendRedirect(path+"/signup2.jsp");
				return;
			}
		}else if("signin".equals(from)){
			if(!randomString.equals(checkNode))
			{
				session.setAttribute("error","��֤�����");
				response.sendRedirect(path+"/signin.jsp");
				return;
			}
			String number = request.getParameter("number");
			String password = request.getParameter("password");
			String[] isRemember = request.getParameterValues("isRemember");
			//����û���Ϊ�գ���ת����¼����
			if(number == null)
			{
				response.sendRedirect(path+"/signin.jsp");
				return;
			}else{
				//�����¼��Ϣ��ƥ�䣬����ת����¼����
				if(isRemember != null && isRemember.length > 0){
					Cookie nameCookie = new Cookie("username",number);
					nameCookie.setMaxAge(60*60*24*10);
					Cookie passwordCookie = new Cookie("password",password);
					passwordCookie.setMaxAge(60*60*24*10);
					//����Cookie�ĸ�·��  
			        nameCookie.setPath(request.getContextPath()+"/");  
			        passwordCookie.setPath(request.getContextPath()+"/");
					response.addCookie(nameCookie);
					response.addCookie(passwordCookie);
				}else{
		    		Cookie[] cookies = request.getCookies();
		    		if(cookies != null && cookies.length > 0)
		    		{
		    			for(Cookie c:cookies)
		    			{
		    				if(c.getName().equals("username") || c.getName().equals("password"))
		    				{
		    					c.setMaxAge(0);//����cookie����ʧЧ
		    					c.setPath(request.getContextPath()+"/"); 
		    					response.addCookie(c);//���±���ʧЧ���cookie���󣬷��򲻻���Ч
		    				}
		    			}
		    		}
		    	}
				Employee employee = dao.login(number);
				
				if((employee != null) && (employee.getPassword().equals(password)))
				{
					session.setAttribute("error",null);
					session.setAttribute("number1", number);
					session.setAttribute("user1", employee);
					response.sendRedirect(path+"/servlet/GetJob");
					return;
				}	
				Employer employer = dao.login2(number);
				if(employer != null && (employer.getPassword().equals(password))){
					session.setAttribute("error",null);
					session.setAttribute("number2", number);
					session.setAttribute("user2", employer);
					response.sendRedirect(path+"/publish.jsp");
					return;
				}else{
					session.setAttribute("error","�˺Ż��������");
					response.sendRedirect(path+"/signin.jsp");
					return;
				}
		}
	}
	}


	public void init() throws ServletException {
		
	}

}
