package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.paho.client.mqttv3.MqttMessage;

/**
 * Servlet implementation class mqtt_pub_sub
 */
@WebServlet("/mqtt_pub_sub")
public class mqtt_pub_sub extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	      String topic = null;
	      MqttMessage message = null;
	      String num = request.getParameter("num");
	      MyMqtt_sub_client sub = new MyMqtt_sub_client();
	      
	      sub.init("tcp://211.48.228.15:1883", "sensor/total").subscribe("sensor/total");
	      System.out.println(num);
	      sub.MyMqtt_pub_client();
	      sub.send("minTopic", num);

	}

}
