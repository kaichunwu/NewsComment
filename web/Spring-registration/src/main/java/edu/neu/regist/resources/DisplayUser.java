package edu.neu.regist.resources;

import edu.neu.regist.domain.Userinfo;

public class DisplayUser {
	public static String display(Userinfo userinfo) {
		String information = "<br><br>";
		information = information + "<table><tr><td>Username:  </td><td>"
						+ userinfo.getUsername() + "</td></tr>"
						+ "<tr><td>Firstname:  </td><td>"
						+ userinfo.getFirstName() + "</td></tr>"
						+ "<tr><td>LastName:  </td><td>"
						+ userinfo.getLastName() + "</td></tr>"
						+ "<tr><td>BirthDate:  </td><td>"
						+ userinfo.getBirthDate() + "</td></tr>"
						+ "<tr><td>Email:  </td><td>"
						+ userinfo.getEmail() + "</td></tr>"
						+ "<tr><td>Address:  </td><td>"
						+ userinfo.getAddress() + "</td></tr>"
						+ "<tr><td>Phone number:  </td><td>"
						+ userinfo.getPhone() + "</td></tr>"
						+ "</table>";
		return information;
	}
}
