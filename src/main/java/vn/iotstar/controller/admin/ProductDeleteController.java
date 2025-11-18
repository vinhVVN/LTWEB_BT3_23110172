package vn.iotstar.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.model.Product;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = {"/admin/product/delete"})
public class ProductDeleteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	ProductService productService = new ProductServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
        try {
            // 1. Lấy thông tin sản phẩm để biết đường dẫn ảnh
            Product product = productService.get(Integer.parseInt(id));
            
            // 2. Xóa file ảnh trên server
            if (product.getImage() != null && !product.getImage().isEmpty()) {
                String appPath = req.getServletContext().getRealPath("");
                java.nio.file.Path uploadPath = java.nio.file.Paths.get(appPath, "upload", "product", product.getImage());

                if (java.nio.file.Files.exists(uploadPath)) {
                    java.nio.file.Files.delete(uploadPath);
                }
            }
            
            // 3. Xóa sản phẩm khỏi CSDL
            productService.delete(Integer.parseInt(id));
            
            resp.sendRedirect(req.getContextPath() + "/admin/product/list");

        } catch (Exception e) {
            e.printStackTrace();
            // (Có thể thêm trang báo lỗi)
        }
	}
}
