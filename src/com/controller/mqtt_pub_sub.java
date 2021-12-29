package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.paho.client.mqttv3.MqttMessage;

/**
 * Servlet implementation class mqtt_pub_sub
 */
@WebServlet("/mqtt_pub_sub")
public class mqtt_pub_sub extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		System.out.println("들어옴");
	      String topic = null;
	      MqttMessage message = null;
	     
	      /*String num1 = request.getParameter("num1");
	      String num2 = request.getParameter("num2");
	      String num3 = request.getParameter("num3");
	      String num4 = request.getParameter("num4");
	      String num5 = request.getParameter("num5");
	      String num6 = request.getParameter("num6");*/
	      
	      String num = request.getParameter("number");
	      String val = request.getParameter("value");
          System.out.println(num+":"+val);
	      
          MyMqtt_sub_client sub=(MyMqtt_sub_client)session.getAttribute("mqtt");
          if(sub==null) {
	          try {
	        	  sub = new MyMqtt_sub_client();
	        	  sub.init("tcp://211.48.228.15:1883", "webserver").subscribe("sensor/total");
	              sub.MyMqtt_pub_client();
	              session.setAttribute("mqtt", sub);
	          }catch(Exception e) {
	        	  e.printStackTrace();
	          }
          }
          if(num.equals("1")) {sub.send("sensor/sub_tol", val);
	      }
	      if(num.equals("2")) {sub.send("sensor/sub_nh4", val);
	      }
	      if(num.equals("3")) {sub.send("sensor/sub_ace", val);
		      }
	      if(num.equals("4")) {sub.send("sensor/sub_co2", val);
		      }
	      if(num.equals("5")) {
	    	  sub.send("sensor/sub_co", val);
		     }
	      if(num.equals("6")) {
		    	  sub.send("sensor/sub_form", val);
		      }
	      /*if(num1==null) {
	    	  num1="1";
	      }else {
	    	  sub.send("sensor/sub_tol", num1);
	      }
	      if(num2==null) {
	    	 num2 = "1"; 
	      }else {
	    	  sub.send("sensor/sub_nh4", num2);
	      }
	      if(num3==null) {
		    	 num3 = "1"; 
		      }else {
		    	  sub.send("sensor/sub_ace", num3);
		      }
	      if(num4==null) {
		    	 num4 = "1"; 
		      }else {
		    	  sub.send("sensor/sub_co2", num4);
		      }
	      if(num5==null) {
		    	 num5 = "1"; 
		      }else {
		    	  sub.send("sensor/sub_co", num5);
		      }
	      if(num6==null) {
		    	 num6 = "1"; 
		      }else {
		    	  sub.send("sensor/sub_form", num6);
		      }*/
         
	      /*System.out.println(num1);
	      System.out.println(num2);
	      System.out.println(num3);
	      System.out.println(num4);
	      System.out.println(num5);
	      System.out.println(num6);*/
	     
	      System.out.println(num+":"+val);
		    
	
	      
	}

}
