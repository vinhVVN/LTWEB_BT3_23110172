package vn.iotstar.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.iotstar.model.Category;
import vn.iotstar.model.Product;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = {"/admin/product/add"})
@MultipartConfig
public class ProductAddController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	ProductService productService = new ProductServiceImpl();
	CategoryService cateService = new CategoryServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Category> cateList = cateService.getAll();
		req.setAttribute("cateList", cateList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/add-product.jsp");
		dispatcher.forward(req, resp);
	} 
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        
        Product product = new Product();
        try {
        	product.setProductname(req.getParameter("productname"));
        	product.setDescription(req.getParameter("description"));
        	product.setPrice(Double.parseDouble(req.getParameter("price")));
        	product.setCateid(Integer.parseInt(req.getParameter("cateid")));
        	
        	Part filePart = req.getPart("image");
            
            if (filePart != null && filePart.getSize() > 0) {
                String originalFileName = filePart.getSubmittedFileName();
                String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
                String fileName = System.currentTimeMillis() + "." + ext;

                String appPath = req.getServletContext().getRealPath("");
                java.nio.file.Path uploadPath = java.nio.file.Paths.get(appPath, "upload", "product");

                if (!java.nio.file.Files.exists(uploadPath)) {
                    java.nio.file.Files.createDirectories(uploadPath);
                }

                java.nio.file.Path filePath = uploadPath.resolve(fileName);
                filePart.write(filePath.toString());

                product.setImage(fileName);
            }
            else {
                // Người dùng không upload file mới
                product.setImage(null);
            }
            
            productService.insert(product);
            resp.sendRedirect(req.getContextPath() + "/admin/product/list");
        	
        }
        catch (Exception e) {
        	e.printStackTrace();
        	// Gửi lại cateList khi có lỗi
            List<Category> cateList = cateService.getAll();
            req.setAttribute("cateList", cateList);
            req.setAttribute("message", "Có lỗi: " + e.getMessage());
            RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/add-product.jsp");
            dispatcher.forward(req, resp);
        }
        
	}
}
