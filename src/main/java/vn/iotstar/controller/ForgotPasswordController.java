package vn.iotstar.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = {"/forgot-password"})
public class ForgotPasswordController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		resp.setContentType("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String alertMsg = "";
		
		String email = req.getParameter("email");
		String newPass = req.getParameter("new-pass");
		
		UserService service = new UserServiceImpl();
		User user = service.findByEmail(email);
		
		if (user != null) {
			service.updatePassword(user.getId(), newPass);
			alertMsg = "Thay đổi mật khẩu thành công!";
			req.setAttribute("message", alertMsg);
			req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
		}
		else {
			alertMsg = "Tài khoản không có trong hệ thống!";
			req.setAttribute("alert", alertMsg);
		}
	}
	
}
