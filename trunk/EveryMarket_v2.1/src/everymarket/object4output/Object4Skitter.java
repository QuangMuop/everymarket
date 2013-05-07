package everymarket.object4output;

import java.util.List;

import everymarket.model.Blog;
import everymarket.model.Product;
import everymarket.model.Review;

public class Object4Skitter {
	private String owner_m_id;
	private String owner_m_nick;
	private String owner_b_main;
	private List<Product> listRecentProduct;
	private List<Blog> listRandomDangol;
	private List<Review> listRecentReview;
	
	public String getOwner_m_id() {
		return owner_m_id;
	}
	public void setOwner_m_id(String owner_m_id) {
		this.owner_m_id = owner_m_id;
	}
	public String getOwner_m_nick() {
		return owner_m_nick;
	}
	public void setOwner_m_nick(String owner_m_nick) {
		this.owner_m_nick = owner_m_nick;
	}
	public String getOwner_b_main() {
		return owner_b_main;
	}
	public void setOwner_b_main(String owner_b_main) {
		this.owner_b_main = owner_b_main;
	}
	public List<Product> getListRecentProduct() {
		return listRecentProduct;
	}
	public void setListRecentProduct(List<Product> listRecentProduct) {
		this.listRecentProduct = listRecentProduct;
	}
	public List<Blog> getListRandomDangol() {
		return listRandomDangol;
	}
	public void setListRandomDangol(List<Blog> listRandomDangol) {
		this.listRandomDangol = listRandomDangol;
	}
	public List<Review> getListRecentReview() {
		return listRecentReview;
	}
	public void setListRecentReview(List<Review> listRecentReview) {
		this.listRecentReview = listRecentReview;
	}
}
