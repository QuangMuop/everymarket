package everymarket.model;

public class Category {
	private int ct_id;
	private String ct_large, ct_small;
	
	public int getCt_id() {
		return ct_id;
	}
	public void setCt_id(int ct_id) {
		this.ct_id = ct_id;
	}
	public String getCt_large() {
		return ct_large;
	}
	public void setCt_large(String ct_large) {
		this.ct_large = ct_large;
	}
	public String getCt_small() {
		return ct_small;
	}
	public void setCt_small(String ct_small) {
		this.ct_small = ct_small;
	}
}
