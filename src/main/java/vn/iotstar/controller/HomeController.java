package vn.iotstar.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.model.User;

@WebServlet(urlPatterns = {"/hi","/home"})
public class HomeController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		PrintWriter pw = resp.getWriter();
		
		HttpSession session = req.getSession(false); // Chỉ lấy session chứ không tạo
		if (session != null) {
			User user = (User) session.getAttribute("account");
			if (user != null) {
				pw.print("Hello " + user.getFullname() + "!!!<br>");
				pw.print("Thông tin cá nhân:<br>");
				pw.print("Tài khoản: " + user.getUsername() + "<br>");
				pw.print("Số điện thoại: " + user.getPhone() + "<br>");
				pw.print("Ngày tạo: " + user.getCreatedDate().toString() + "<br>");

			}else {
				pw.print("Please login again");
				resp.sendRedirect("login.jsp");
			}
		}else {
			pw.print("Please login again");
			resp.sendRedirect("login.jsp");
		}
		pw.close();
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
}
