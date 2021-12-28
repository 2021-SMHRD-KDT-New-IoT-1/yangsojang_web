package com.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.MqttPersistenceException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.model.GasDAO;

import jdk.nashorn.internal.parser.JSONParser;

public class MyMqtt_sub_client implements MqttCallback {

	private MqttClient mqttclient; // 브로커와 통신하는 역할 담당- subscriber, publisher 의 역할
	private MqttConnectOptions mqttOption; // Mqtt 프로토콜을 이용해서 브로커에 연결하면서 연결 정보를 설정할 수 있는 객체
	// ClientId는 브로커가 클라이언트를 식별하기 위한 문자열 -고유

	public MyMqtt_sub_client init(String server, String clientId) {

		try {
			mqttOption = new MqttConnectOptions();
			mqttOption.setCleanSession(true);
			mqttOption.setKeepAliveInterval(15);
			mqttOption.setConnectionTimeout(30);
//         브로커에 subscribe 하기위한 클라이언트 객체 생성
			mqttclient = new MqttClient(server, clientId);
			// 클라이언트 객체에 MqttCallback 을 등록 --구독 신청후 적절한 시점에 처리하고 싶은 기능 구현하고
			// 메소드가 자동으로 그 시점에 호출되도록 할 수 있다.
			mqttclient.setCallback(this);
			mqttclient.connect(mqttOption);
		} catch (MqttException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return this;
	}

	// 커넥션이 종료되면 호출 -통신오류로 연결이 끊어지는 경우 호출
	@Override
	public void connectionLost(Throwable arg0) {
		// TODO Auto-generated method stub
		init("tcp://211.48.228.15:1883", "sensor/total").subscribe("sensor/total");
		System.out.println("연결 종료, 다시 연결합니다.");
		arg0.printStackTrace();
	}

	// 메세지의 배달이 완료되면 호출
	@Override
	public void deliveryComplete(IMqttDeliveryToken arg0) {
		// TODO Auto-generated method stub

	}

	// 메세지가 도착하면 호출되는 메소드
	@Override
	public void messageArrived(String topic, MqttMessage message) throws Exception {

		String str_msg = message.toString();
		String str_topic = topic.toString();
		
		
		System.out.println(str_msg);
		JsonObject json = (JsonObject) JsonParser.parseString(str_msg);
		float tol = json.get("tol") != null ? json.get("tol").getAsFloat() : 0;
		float nh4 = json.get("nh4")!= null ? json.get("nh4").getAsFloat() : 0;
		float ace = json.get("ace")!= null ? json.get("ace").getAsFloat() : 0;
		float co2 = json.get("co2")!= null ? json.get("co2").getAsFloat() : 0;
		float co = json.get("co")!= null ? json.get("co").getAsFloat() : 0;
		float form = json.get("form")!= null ? json.get("form").getAsFloat() : 0;
		float temp = json.get("temp")!= null ? json.get("temp").getAsFloat() : 0;
		float hum = json.get("hum")!= null ? json.get("hum").getAsFloat() : 0;
		String mid = json.get("mid").getAsString();
		
		GasDAO dao = new GasDAO();
		
		
		
		int cnt = dao.InsertSensor(tol, nh4, ace, co2, co, form, temp, hum, mid);
		
		if (cnt != 0) {
			System.out.println("DB 저장 성공!");
		}

	}

	// 구독신청
	public boolean subscribe(String... topics) {
		try {
			if (topics != null) {
				for (String topic : topics) {
					mqttclient.subscribe(topic, 0); // 구독할 주제, 숫자는 품질 값
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public void MyMqtt_pub_client() {
		try {
			// 브로커와 MQTT통신을 하며 메세지를 전송할 클라이언트 객체를 만들고 접속
			mqttclient = new MqttClient("tcp://211.48.228.15:1883", "gang");
			mqttclient.connect(); // 브로커 접속
			System.out.println("접속완료");
		} catch (MqttException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
	}

	public boolean send(String topic, int msg) {
		return this.send(topic, new Integer(msg).toString());
	}

	// 메세지 전송을 위한 메소드
	public boolean send(String topic, String msg) {
		// 브로커로 전송할 메세지를 생성 - MqttMessage
		MqttMessage message = new MqttMessage();

		try {
			message.setPayload(msg.getBytes()); // 실제 브로커로 전송할 메세지
			mqttclient.publish(topic, message);
			System.out.println("전송완료");
		} catch (MqttPersistenceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("전송실패1");
		} catch (MqttException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("전송실패2");
		}

		return true;
	}

	public static void main(String[] args) {

	}

}