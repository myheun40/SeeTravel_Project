package com.select;

public class place_info {
 private int place_Id;
 private String place_Name;
 private String place_Location;
 private String place_Tag;
 private double place_Latitude;
 private double place_Longtitude;
 private String place_Img;
 private String place_Url;
 private String place_Comment;
 private String place_Contact;
 private String place_Address;
 private String Region;

 
 public place_info() {};
 
 
 public place_info(int place_Id, String place_Name, String place_Location, String place_Tag, double place_Latitude,
		double place_Longtitude, String place_Img, String place_Url, String place_Comment, String place_Contact,
		String place_Address, String region) {
	super();
	this.place_Id = place_Id;
	this.place_Name = place_Name;
	this.place_Location = place_Location;
	this.place_Tag = place_Tag;
	this.place_Latitude = place_Latitude;
	this.place_Longtitude = place_Longtitude;
	this.place_Img = place_Img;
	this.place_Url = place_Url;
	this.place_Comment = place_Comment;
	this.place_Contact = place_Contact;
	this.place_Address = place_Address;
	this.Region = region;
}





public int getPlace_Id() {
	return place_Id;
}





public void setPlace_Id(int place_Id) {
	this.place_Id = place_Id;
}





public String getPlace_Name() {
	return place_Name;
}





public void setPlace_Name(String place_Name) {
	this.place_Name = place_Name;
}





public String getPlace_Location() {
	return place_Location;
}





public void setPlace_Location(String place_Location) {
	this.place_Location = place_Location;
}





public String getPlace_Tag() {
	return place_Tag;
}





public void setPlace_Tag(String place_Tag) {
	this.place_Tag = place_Tag;
}





public double getPlace_Latitude() {
	return place_Latitude;
}





public void setPlace_Latitude(double place_Latitude) {
	this.place_Latitude = place_Latitude;
}





public double getPlace_Longtitude() {
	return place_Longtitude;
}





public void setPlace_Longtitude(double place_Longtitude) {
	this.place_Longtitude = place_Longtitude;
}





public String getPlace_Img() {
	return place_Img;
}





public void setPlace_Img(String place_Img) {
	this.place_Img = place_Img;
}





public String getPlace_Url() {
	return place_Url;
}





public void setPlace_Url(String place_Url) {
	this.place_Url = place_Url;
}





public String getPlace_Comment() {
	return place_Comment;
}





public void setPlace_Comment(String place_Comment) {
	this.place_Comment = place_Comment;
}





public String getPlace_Contact() {
	return place_Contact;
}





public void setPlace_Contact(String place_Contact) {
	this.place_Contact = place_Contact;
}





public String getPlace_Address() {
	return place_Address;
}





public void setPlace_Address(String place_Address) {
	this.place_Address = place_Address;
}





public String getRegion() {
	return Region;
}





public void setRegion(String region) {
	Region = region;
}
 
}
