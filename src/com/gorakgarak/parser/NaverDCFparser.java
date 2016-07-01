package com.gorakgarak.parser;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.List;
//
//import org.apache.http.client.HttpClient;
//import org.apache.http.client.methods.HttpGet;
//import org.apache.http.impl.client.DefaultHttpClient;
//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//import org.jsoup.select.Elements;
//
//import financialstatement_parser.util.DBUtil;
//import financialstatement_parser.vo.DCF;
//
public class NaverDCFparser {
//
//	static int cursor = 0;
//	static int cursor2 = 0;
//	public static java.sql.Connection conn = DBUtil.getConnection(); //DB접속
//
//	public static void main(String[] args) {
//		System.out.println("------start-----------");
//		
////		getDCFFromGeneral("000040",1);
//		
//		for(int a = 0 ; a < BSmapNew.COMPANY_COUNT ; a++) {
//		
//		getDCFFromGeneral(BSmapNew.codeForCompany[a],a);
//		
//		}
//
//	}// end main
//
//	public static List<DCF> getDCFFromGeneral(String code, int index) {
//
//		String rev;
//		String cogs;
//		String sga;
//		String tax;
//		String capex;
//		String outstand;
//		String debt;
//		String asset;
//		String equity;
//
//		DCF dcf2010 = new DCF();
//		DCF dcf2011 = new DCF();
//		DCF dcf2012 = new DCF();
//		DCF dcf2013 = new DCF();
//		DCF dcf2014 = new DCF();
//
//		
//		
//		try {
//			Document document = Jsoup
//					.connect(
//							"http://companyinfo.stock.naver.com/v1/company/cF3002.aspx?"
//									+ "cmp_cd=" + code + "&frq=0" + "&rpt=1"
//									+ "&finGubun=IFRSS").maxBodySize(0).get();
//			Elements element = null;
//			Elements tds = null;
//			double number = 0;
//			// 여기 체인지해줘야하는부분
//			
//			element = document.getElementsContainingOwnText("매출액(수익)");
//			
//			try{
//			tds = element.get(0).parent().select("td");
//
//			number = Double.parseDouble(tds.get(1).text().replace(",", ""));
//			dcf2010.setRev(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(2).text().replace(",", ""));
//			dcf2011.setRev(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(3).text().replace(",", ""));
//			dcf2012.setRev(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(4).text().replace(",", ""));
//			dcf2013.setRev(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(5).text().replace(",", ""));
//			dcf2014.setRev(number); // 여기 체인지 해줘야하는부븐
//			}catch (NumberFormatException ne){
//				dcf2014.setRev(0);
//				ne.printStackTrace();
//			}
//			
//			try{
//			element = document.getElementsContainingOwnText("매출원가");
//			tds = element.get(0).parent().select("td");
//			number = Double.parseDouble(tds.get(1).text().replace(",", ""));
//			dcf2010.setCogs(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(2).text().replace(",", ""));
//			dcf2011.setCogs(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(3).text().replace(",", ""));
//			dcf2012.setCogs(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(4).text().replace(",", ""));
//			dcf2013.setCogs(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(5).text().replace(",", ""));
//			dcf2014.setCogs(number); // 여기 체인지 해줘야하는부븐
//			}catch (NumberFormatException ne){
//				dcf2014.setCogs(0);
//				ne.printStackTrace();
//			}
//			
//			try{
//			element = document.getElementsContainingOwnText("판매비와관리비");
//			tds = element.get(0).parent().select("td");
//			number = Double.parseDouble(tds.get(1).text().replace(",", ""));
//			dcf2010.setSga(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(2).text().replace(",", ""));
//			dcf2011.setSga(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(3).text().replace(",", ""));
//			dcf2012.setSga(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(4).text().replace(",", ""));
//			dcf2013.setSga(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(5).text().replace(",", ""));
//			dcf2014.setSga(number); // 여기 체인지 해줘야하는부븐
//			}catch (NumberFormatException ne){
//				dcf2014.setSga(0);
//				ne.printStackTrace();
//			}
//
//			try{
//			element = document.getElementsContainingOwnText("법인세비용");
//			tds = element.get(1).parent().select("td");
//			number = Double.parseDouble(tds.get(1).text().replace(",", ""));
//			dcf2010.setTax(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(2).text().replace(",", ""));
//			dcf2011.setTax(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(3).text().replace(",", ""));
//			dcf2012.setTax(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(4).text().replace(",", ""));
//			dcf2013.setTax(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(5).text().replace(",", ""));
//			dcf2014.setTax(number); // 여기 체인지 해줘야하는부븐
//			}catch (NumberFormatException ne){
//				dcf2014.setTax(0);
//				ne.printStackTrace();
//			}
//
//
//			// /////////////////////////////////////////////////////
//			try{
//			element = document.getElementsContainingOwnText("자산총계");
//			tds = element.get(0).parent().select("td");
//			number = Double.parseDouble(tds.get(1).text().replace(",", ""));
//			dcf2010.setAsset(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(2).text().replace(",", ""));
//			dcf2011.setAsset(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(3).text().replace(",", ""));
//			dcf2012.setAsset(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(4).text().replace(",", ""));
//			dcf2013.setAsset(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(5).text().replace(",", ""));
//			dcf2014.setAsset(number); // 여기 체인지 해줘야하는부븐
//			}catch (NumberFormatException ne){
//				dcf2014.setAsset(0);
//				ne.printStackTrace();
//			}
//			//
//			// Document document =
//			// Jsoup.connect("http://companyinfo.stock.naver.com/v1/company/cF3002.aspx?"
//			// + "cmp_cd="
//			// + code
//			// + "&frq=0"
//			// + "&rpt=1"
//			// + "&finGubun=IFRSS").get();
//			//
//			//
//			
//			try{
//			element = document.getElementsContainingOwnText("부채총계");
//			tds = element.get(0).parent().select("td");
//			number = Double.parseDouble(tds.get(1).text().replace(",", ""));
//			dcf2010.setDebt(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(2).text().replace(",", ""));
//			dcf2011.setDebt(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(3).text().replace(",", ""));
//			dcf2012.setDebt(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(4).text().replace(",", ""));
//			dcf2013.setDebt(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(5).text().replace(",", ""));
//			dcf2014.setDebt(number); // 여기 체인지 해줘야하는부븐
//			}catch (NumberFormatException ne){
//				dcf2014.setDebt(0);
//				ne.printStackTrace();
//			}
//
//			try{
//			element = document.getElementsContainingOwnText("자본총계");
//			tds = element.get(0).parent().select("td");
//			number = Double.parseDouble(tds.get(1).text().replace(",", ""));
//			dcf2010.setEquity(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(2).text().replace(",", ""));
//			dcf2011.setEquity(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(3).text().replace(",", ""));
//			dcf2012.setEquity(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(4).text().replace(",", ""));
//			dcf2013.setEquity(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(5).text().replace(",", ""));
//			dcf2014.setEquity(number); // 여기 체인지 해줘야하는부븐
//			}catch (NumberFormatException ne){
//				dcf2014.setEquity(0);
//				ne.printStackTrace();
//			}
//			
//			try{
//			element = document.getElementsContainingOwnText("*CAPEX");
//			tds = element.get(0).parent().select("td");
//			number = Double.parseDouble(tds.get(1).text().replace(",", ""));
//			dcf2010.setCapex(-number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(2).text().replace(",", ""));
//			dcf2011.setCapex(-number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(3).text().replace(",", ""));
//			dcf2012.setCapex(-number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(4).text().replace(",", ""));
//			dcf2013.setCapex(-number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(5).text().replace(",", ""));
//			dcf2014.setCapex(-number); // 여기 체인지 해줘야하는부븐
//			}catch (NumberFormatException ne){
//				dcf2014.setCapex(0);
//				ne.printStackTrace();
//			}
//			
//			try{
//			element = document.getElementsContainingOwnText("발행주식수");
//			tds = element.get(0).parent().select("td");
//			number = Double.parseDouble(tds.get(1).text().replace(",", ""));
//			dcf2010.setOutstand(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(2).text().replace(",", ""));
//			dcf2011.setOutstand(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(3).text().replace(",", ""));
//			dcf2012.setOutstand(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(4).text().replace(",", ""));
//			dcf2013.setOutstand(number); // 여기 체인지 해줘야하는부븐
//			number = Double.parseDouble(tds.get(5).text().replace(",", ""));
//			dcf2014.setOutstand(number); // 여기 체인지 해줘야하는부븐
//			}catch (NumberFormatException ne){
//				dcf2014.setOutstand(0);
//				ne.printStackTrace();
//			}
//			
//
//			dcf2010.setYear(2010);
//			dcf2011.setYear(2011);
//			dcf2012.setYear(2012);
//			dcf2013.setYear(2013);
//			dcf2014.setYear(2014);
//
//			dcf2010.setCode(code);
//			dcf2011.setCode(code);
//			dcf2012.setCode(code);
//			dcf2013.setCode(code);
//			dcf2014.setCode(code);
//			
//			dcf2010.setName(BSmapNew.nameForCompany[index]);
//			dcf2011.setName(BSmapNew.nameForCompany[index]);
//			dcf2012.setName(BSmapNew.nameForCompany[index]);
//			dcf2013.setName(BSmapNew.nameForCompany[index]);
//			dcf2014.setName(BSmapNew.nameForCompany[index]);
//			
//
//			HttpClient client = new DefaultHttpClient();
//			HttpGet get = new HttpGet();
//
//			System.out.println(dcf2010);
//			System.out.println(dcf2011);
//			System.out.println(dcf2012);
//			System.out.println(dcf2013);
//			System.out.println(dcf2014);
//			
//			java.sql.PreparedStatement stmt = conn.prepareStatement("INSERT INTO DCF VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
//			stmt.setDouble(1, dcf2014.getRev()*100000000);
//			stmt.setDouble(2, dcf2014.getCogs()*100000000);
//			stmt.setDouble(3, dcf2014.getSga()*100000000);
//			stmt.setDouble(4, dcf2014.getTax()*100000000);
//			stmt.setDouble(5, dcf2014.getCapex()*100000000);
//			stmt.setInt(6, dcf2014.getYear());
//			stmt.setString(7, dcf2014.getName());
//			stmt.setDouble(8, dcf2014.getOutstand()*1000000);
//			stmt.setDouble(9, dcf2014.getBeta());
//			stmt.setDouble(10, dcf2014.getKd());
//			stmt.setDouble(11, dcf2014.getGrow());
//			stmt.setDouble(12, dcf2014.getDebt()*100000000);
//			stmt.setDouble(13, dcf2014.getAsset()*100000000);
//			stmt.setDouble(14, dcf2014.getEquity()*100000000);
//			stmt.setString(15, dcf2014.getCode());
//			stmt.setDouble(16, dcf2014.getScore());
//			stmt.setLong(17, dcf2014.getIndCode());
//			stmt.setString(18, dcf2014.getIndName());
//			
//			
//			stmt.executeUpdate();
//			
//			java.sql.PreparedStatement stmt2 = conn.prepareStatement("SELECT beta, kd, indcode, indname from DCF where year = '2013' and code = ?");
//			stmt2.setString(1, code);
//			ResultSet rs = stmt2.executeQuery();
//			rs.next();
//			double beta = rs.getDouble(1);
//			double kd   = rs.getDouble(2);
//			String indcode   = rs.getString(3);
//			String indname   = rs.getString(4);
//			
//			
//			java.sql.PreparedStatement stmt3 = conn.prepareStatement("update DCF set beta=?, kd=?, indcode=?, indname=? where year='2014' and code = ?");
//			stmt3.setDouble(1,beta);
//			stmt3.setDouble(2,kd);
//			stmt3.setString(3,indcode);
//			stmt3.setString(4,indname);
//			stmt3.setString(5,code);
//			stmt3.executeUpdate();
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			
//			e.printStackTrace();
//		}
//
//		return null;
//
//	}// end getGeneral
//	
//	
//	public static double getBeta(int code) {
////		try {
////			Document d = Jsoup.connect("http://companyinfo.stock.naver.com/v1/"
////					+ "company/c1010001.aspx?cmp_cd="
////					+ code).get();
////			Element element = document.getElementsContainingOwnText("52주베타");
////			
////			
////		} catch (IOException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		}
//		return 0;
//	}
//	
//	public static double getKd(int code){
//		return 0;
//	}
//	
//	public static double indInfo(int code){
//		return 0;
//	}
//
//	public static Connection getConnection() {
//
//		Connection conn = null;
//		try {
//			conn = DriverManager.getConnection("jdbc:mysql://14.52.4.160:8080",
//					"bluebull", "bluebull");
//
//			return conn;
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		return null;
//	}// end public class
//
}// end public class
//
