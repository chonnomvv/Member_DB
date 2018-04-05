package kr.co.bit.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.bit.database.ConnectionManager;
import kr.co.bit.vo.MemberVO;

public class MemberDAO {

	public ArrayList<MemberVO> selectAll() {
		ArrayList<MemberVO> list = null;
		// 테이블에 직접 접속하는 코드
		ConnectionManager mgr = new ConnectionManager();
		Connection con = mgr.getConnection();

		System.out.println("connected");

		Statement stmt;
		try {
			stmt = con.createStatement();
			String sql = "select * from departments";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String temp1 = rs.getString(1);
				String temp2 = rs.getString(2);
				String temp3 = rs.getString(3);
				String temp4 = rs.getString(4);
				System.out.println(temp1 + "-" + temp2 + "-" + temp3 + "-" + temp4);

			}
			mgr.connectClose(con, stmt, rs);

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}
}
