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
 * �������ɶ�ά��
 * @author Seavan_CC
 *
 */
public class CheckPicture extends HttpServlet {

	public static final char[] CHARS = {'0','1','2','3','4','5','6','7','8','9'};//����������֤��
	
	public static Random random = new Random();//�����
	
	public static String getRandomString(){//��ȡ6λ�������
		StringBuffer buffer = new StringBuffer();//�ַ�������
		//ѭ��6�Σ�ÿ��ȥһ���ַ�
		for (int i = 0; i < 4; i++) {
			buffer.append(CHARS[random.nextInt(CHARS.length)]);			
		}
		return buffer.toString();
	}
	
	public static Color getRandomColor(){//��ȡ�������ɫ
		return new java.awt.Color(random.nextInt(255), random.nextInt(255),random.nextInt(255));
	}
	
	public static Color getReverseColor(Color c){//����ĳ��ɫ�ķ�ɫ
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

		response.setContentType("image/jpg");//����������ͣ���������
		String randomString = getRandomString();//��ȡ����ַ���
		request.getSession(true).setAttribute("randomString",randomString);//�ŵ�session��
		
		int width = 100;//ͼƬ���
		int height = 40;//ͼƬ�߶�
		
		Color color = getRandomColor();//�����ɫ�����ڱ���ɫ
		Color reverse = getReverseColor(color);//��ɫ������ǰ��ɫ
		
		BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);//����һ����ɫͼƬ
		
		Graphics2D graphics2d = bi.createGraphics();//��ȡ��ͼ����
		graphics2d.setFont(new Font(Font.SANS_SERIF,Font.BOLD,16));//��������
		graphics2d.setColor(color);//������ɫ
		graphics2d.drawString(randomString,30,25);//��������ַ�
		for(int i = 0,n = random.nextInt(100);i < n;i++)
		{//�����100�����
			graphics2d.drawRect(random.nextInt(width),random.nextInt(height),1,1);//������
		}
		ServletOutputStream out = response.getOutputStream();
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);//ת����JPEG��ʽ
		//������
		encoder.encode(bi);//��ͼƬ���б���
		out.flush();//������ͻ���
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}


	public void init() throws ServletException {

	}
}
