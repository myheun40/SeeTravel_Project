package com.aischool.model;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FirstScreenDAO {

	private PreparedStatement psmt;
	private Connection conn;
	private ResultSet rs;
	private int cnt;

	private void getConnection() {
		// 0.드라이버 파일 프로젝트에 넣어주기
		// 1.드라이버설치(드라이버 동적로딩)
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 2. connection 연결
			String db_url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
			String db_id = "Insa5_SpringA_hacksim_4";
			String db_pw = "aishcool4";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

			if (conn != null) {
				System.out.println("conn 성공");
			} else {
				System.out.println("conn 실패");
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	
	public ArrayList<FirstScreenVO> YangyangList() {
		ArrayList<FirstScreenVO> list = new ArrayList<FirstScreenVO>();

		getConnection();

		try {
			
			String sql = "SELECT PLACE_NAME, LATITUDE, LONGTITUDE FROM YANGYANG ";

			psmt = conn.prepareStatement(sql);
		
			rs = psmt.executeQuery();

			while (rs.next()) {
				String locationName = rs.getString(1);
				String latitude = rs.getString(2);
				String longitude = rs.getString(3);

				FirstScreenVO vo = new FirstScreenVO(locationName, latitude, longitude);

				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
	
	public ArrayList<FirstScreenVO> BusanList() {
		ArrayList<FirstScreenVO> list = new ArrayList<FirstScreenVO>();

		getConnection();

		try {
			
			String sql = "SELECT PLACE_NAME, LATITUDE, LONGTITUDE FROM Busan ";

			psmt = conn.prepareStatement(sql);
		
			rs = psmt.executeQuery();

			while (rs.next()) {
				String locationName = rs.getString(1);
				String latitude = rs.getString(2);
				String longitude = rs.getString(3);

				FirstScreenVO vo = new FirstScreenVO(locationName, latitude, longitude);

				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
	
	public ArrayList<FirstScreenVO> YeosuList() {
		ArrayList<FirstScreenVO> list = new ArrayList<FirstScreenVO>();

		getConnection();

		try {
			
			String sql = "SELECT PLACE_NAME, LATITUDE, LONGTITUDE FROM Yeosu ";

			psmt = conn.prepareStatement(sql);
		
			rs = psmt.executeQuery();

			while (rs.next()) {
				String locationName = rs.getString(1);
				String latitude = rs.getString(2);
				String longitude = rs.getString(3);

				FirstScreenVO vo = new FirstScreenVO(locationName, latitude, longitude);

				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
	
	


}

