package vn.iotstar.model;

public class Product {
	private int productid;
	private String productname;
	private String description;
	private double price;
	private String image;
	private int cateid;
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getCateid() {
		return cateid;
	}
	public void setCateid(int cateid) {
		this.cateid = cateid;
	}
	public Product(String productname, String description, double price, String image, int cateid) {
		super();
		this.productname = productname;
		this.description = description;
		this.price = price;
		this.image = image;
		this.cateid = cateid;
	}
	public Product() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Product [productid=" + productid + ", productname=" + productname + ", description=" + description
				+ ", price=" + price + ", image=" + image + ", cateid=" + cateid + "]";
	}
	
	
	
}
