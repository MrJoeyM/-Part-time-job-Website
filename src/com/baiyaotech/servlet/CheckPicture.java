package com.baiyaotech.servlet;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.geom.Line2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * 用于生成二维码
 * @author Seavan_CC
 *
 */
public class CheckPicture extends HttpServlet {

	public static final char[] CHARS = {'0','1','2','3','4','5','6','7','8','9'};//用于生成验证码
	
	public static Random random = new Random();//随机数
	
	public static String getRandomString(){//获取6位数随机数
		StringBuffer buffer = new StringBuffer();//字符串缓存
		//循环6次，每次去一个字符
		for (int i = 0; i < 4; i++) {
			buffer.append(CHARS[random.nextInt(CHARS.length)]);			
		}
		return buffer.toString();
	}
	
	public static Color getRandomColor(){//获取随机的颜色
		return new java.awt.Color(random.nextInt(255), random.nextInt(255),random.nextInt(255));
	}
	
	public static Color getReverseColor(Color c){//返回某颜色的反色
		return new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255));		
	}
	
	public CheckPicture() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("image/jpg");//设置输出类型，必须设置
		String randomString = getRandomString();//获取随机字符串
		request.getSession(true).setAttribute("randomString",randomString);//放到session中
		
		int width = 100;//图片宽度
		int height = 40;//图片高度
		
		Color color = getRandomColor();//随机颜色，用于背景色
		Color reverse = getReverseColor(color);//反色，用于前景色
		
		BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);//创建一个彩色图片
		
		Graphics2D graphics2d = bi.createGraphics();//获取绘图对象
		graphics2d.setFont(new Font(Font.SANS_SERIF,Font.BOLD,16));//设置字体
		graphics2d.setColor(color);//设置颜色
		graphics2d.drawString(randomString,30,25);//绘制随机字符
		for(int i = 0,n = random.nextInt(100);i < n;i++)
		{//画最多100个噪点
			graphics2d.drawRect(random.nextInt(width),random.nextInt(height),1,1);//随机噪点
		}
		ServletOutputStream out = response.getOutputStream();
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);//转换成JPEG格式
		//编码器
		encoder.encode(bi);//对图片进行编码
		out.flush();//输出到客户端
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}


	public void init() throws ServletException {

	}
}
