package com.baiyaotech.connection;
/**
 * 连接数据库
 * @author Seavan_CC
 *
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleConnection {
	private Connection con;
	private String user = "root";
	private String password = "CHANGCHUAN?";
	private String className = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/PartTimeJob";
	//用户加载数据库驱动
	public OracleConnection(){
		try {
			Class.forName(className);
			System.out.println("加载数据库驱动成功！");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("加载数据库驱动失败！");
			e.printStackTrace();
		}
	}
	//用于获取oracle数据库的连接
	public Connection getCon()
	{
		try {
			con = DriverManager.getConnection(url,user,password);
			System.out.println("数据库连接成功");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(con);
			System.out.println("数据库连接失败");
			con = null;
			e.printStackTrace();
		}
		return con;
	}
	//用户关闭数据库
	public void closed(){
		try {
			if(con != null)
			{
				con.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("关闭con对象失败！");
			e.printStackTrace();
		}
	}
}
