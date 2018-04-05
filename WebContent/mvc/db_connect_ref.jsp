<%@page import="kr.co.bit.database.ConnectionManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB Connector</title>
</head>
<body>
	<%
		ConnectionManager mgr = new ConnectionManager();
		Connection con = mgr.getConnection();
		
		//String url = "jdbc:oracle:thin:@localhost:1521:xe";
		//String driver = "oracle.jdbc.OracleDriver"; //접속했을 때 준비해주는 클래스(:driver)(orcle.jtbc= 패키지. OracleDriver =패키지)
		//Class.forName(driver); //클래스를 로딩.인스턴스를 자동으로 생성.실질적인 클래스명으로 생성하지 않고 string 이름을 가지고 만들어 내는 게 특징이다. 
		//Connection con = DriverManager.getConnection(url, "hr", "1234");--//준비를 했으니 connection 을 맺어줍시다.(java.sql(데이터 베이스에 관한 컨넥션이다.) 임포트). url 결정했고 hr 계정에 비밀번호 1234
		if (con != null) {
			out.println("connected");

			Statement stmt = con.createStatement(); //	질의하는 클래스. new가 아니고 con 에서 받아서 생성한다.
			String sql = "select * from departments";
			ResultSet rs = stmt.executeQuery(sql); //	질의 결과를 받는 클래스. new 가 아니고 executeQuery 로 받아온다.
			while (rs.next()) {
				String temp1 = rs.getString(1);
				String temp2 = rs.getString(2);
				String temp3 = rs.getString(3);
				String temp4 = rs.getString(4);
				out.println(temp1 + "," + temp2 + "," + temp3 + "," + temp4 + "<br>");

			}
			mgr.connectClose(con,stmt,rs);
			//rs.close();
			//stmt.close();

			con.close(); //접속하고 작업 모두 다 마무리 한 후 close 해줘야합니다. 
		} else {
			out.print("connect failed");
		}
	%>



</body>
</html>