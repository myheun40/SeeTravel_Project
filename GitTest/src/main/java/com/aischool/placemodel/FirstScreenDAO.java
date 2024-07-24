package com.aischool.placemodel;


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
	

	public ArrayList<FirstScreenVO> infoSelect() {
		ArrayList<FirstScreenVO> list = new ArrayList<FirstScreenVO>();
		getConnection();
		
		try {
			String sql = "Select PLACE_NAME, ADDRESS, CONTACT FROM BUSAN";
			psmt = conn.prepareStatement(sql);
			rs= psmt.executeQuery();
			
			while(rs.next()) {
				String place_name = rs.getString(1);
				String address = rs.getString(2);
				String contact = rs.getString(3);
				
				FirstScreenVO info = new FirstScreenVO();
				info.setPlace_name(place_name);
				info.setAddress(address);
				info.setPlace_contact(contact);
				
				list.add(info);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	
	
	

//	public int delete(String id) {
//
//		getConnection();
//		try {
//			// 3.sql문 작성 및 실행
//			String sql = "DELETE FROM MEMBER WHERE ID=?";
//
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1, id);
//
//			cnt = psmt.executeUpdate();
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//
//		return cnt;
//	}
//
	
//

//
//	public int update(FirstScreenVO vo) {
//
//		getConnection();
//		try { // 3.sql문 작성 및 실행
//			String sql = "UPDATE MEMBER SET NICK=? WHERE ID=? AND PW=?";
//
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1, vo.getNick());
//			psmt.setString(2, vo.getTrip());
//			psmt.setString(3, vo.getPw());
//
//			cnt = psmt.executeUpdate();
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//
//		return cnt;
//	}

}

