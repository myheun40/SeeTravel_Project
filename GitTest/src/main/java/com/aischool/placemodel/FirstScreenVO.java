package com.aischool.placemodel;


public class FirstScreenVO {

	
	private String place_name;
	private String latitude;
	private String longitude;
	private String location;
	private String place_comment;
	private String place_contact;
	private String address;
	
	public FirstScreenVO() {
		
	}
	
	public FirstScreenVO(String place_name, String latitude, String longitude, String location, String place_comment,
			String place_contact, String address) {
		super();
		this.place_name = place_name;
		this.latitude = latitude;
		this.longitude = longitude;
		this.location = location;
		this.place_comment = place_comment;
		this.place_contact = place_contact;
		this.address = address;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPlace_comment() {
		return place_comment;
	}

	public void setPlace_comment(String place_comment) {
		this.place_comment = place_comment;
	}

	public String getPlace_contact() {
		return place_contact;
	}

	public void setPlace_contact(String place_contact) {
		this.place_contact = place_contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
	
	
	
	
}

	
	
	

