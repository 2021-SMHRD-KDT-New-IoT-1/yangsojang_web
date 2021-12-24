package com.model;

public class GasVO {
	
	private String Admin_id; //관리자 ID
	private String Tolueno; //톨루엔
	private String NH4; // 암모니아
	private String Acetona; //아세톤
	private String Co2; //이산화탄소
	private String Co; //일산화탄소
	private String Formalin; //포름알데히드
	private String Temp; //온도
	private String Humidity; //습도
	
	public GasVO(String admin_id, String tolueno, String nh4, String acetona, String co2, String co, String formalin,
			String temp, String humidity) {
		super();
		Admin_id = admin_id;
		Tolueno = tolueno;
		NH4 = nh4;
		Acetona = acetona;
		Co2 = co2;
		Co = co;
		Formalin = formalin;
		Temp = temp;
		Humidity = humidity;
	}

	public String getAdmin_id() {
		return Admin_id;
	}

	public void setAdmin_id(String admin_id) {
		Admin_id = admin_id;
	}

	public String getTolueno() {
		return Tolueno;
	}

	public void setTolueno(String tolueno) {
		Tolueno = tolueno;
	}

	public String getNH4() {
		return NH4;
	}

	public void setNH4(String nH4) {
		NH4 = nH4;
	}

	public String getAcetona() {
		return Acetona;
	}

	public void setAcetona(String acetona) {
		Acetona = acetona;
	}

	public String getCo2() {
		return Co2;
	}

	public void setCo2(String co2) {
		Co2 = co2;
	}

	public String getCo() {
		return Co;
	}

	public void setCo(String co) {
		Co = co;
	}

	public String getFormalin() {
		return Formalin;
	}

	public void setFormalin(String formalin) {
		Formalin = formalin;
	}

	public String getTemp() {
		return Temp;
	}

	public void setTemp(String temp) {
		Temp = temp;
	}

	public String getHumidity() {
		return Humidity;
	}

	public void setHumidity(String humidity) {
		Humidity = humidity;
	}
	
}
