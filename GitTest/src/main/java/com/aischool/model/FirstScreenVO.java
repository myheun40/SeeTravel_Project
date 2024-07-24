package com.aischool.model;


public class FirstScreenVO {
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private String locationName;
	private String latitude;
	private String longitude;
	private String location;
	

	

	public FirstScreenVO() {
		
	}
	public FirstScreenVO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}




	public FirstScreenVO(String locationName, String latitude, String longitude) {
		this.locationName = locationName;
		this.latitude= latitude;
		this.longitude= longitude;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
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

	
}

