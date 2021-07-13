package test;

import dao.ManageDAO;

public class Test {
	public static void main(String args[]) {
		try {
			Class.forName("org.h2.Driver");
			System.out.println("OK");
			ManageDAO m = new ManageDAO();
			boolean success = m.insert(1, "Taro");
			System.out.println(success);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
