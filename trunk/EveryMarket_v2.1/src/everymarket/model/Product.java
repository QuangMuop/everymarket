package everymarket.model;

import java.sql.Timestamp;

public class Product {
	private int p_id;
	private String p_name;
	private int p_price;
	private String p_img;
	private String p_detail;
	private Timestamp p_date;
	private String m_id;
	private int ct_id;
	private String p_status;
	private int p_report;
	
	public int getP_report() {
		return p_report;
	}
	public void setP_report(int p_report) {
		this.p_report = p_report;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getP_detail() {
		return p_detail;
	}
	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}
	public Timestamp getP_date() {
		return p_date;
	}
	public void setP_date(Timestamp p_date) {
		this.p_date = p_date;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getCt_id() {
		return ct_id;
	}
	public void setCt_id(int ct_id) {
		this.ct_id = ct_id;
	}
	public String getP_status() {
		return p_status;
	}
	public void setP_status(String p_status) {
		this.p_status = p_status;
	}
	
	@Override
	public String toString() {
		return "Product [p_id=" + p_id + ", p_name=" + p_name + ", p_price="
				+ p_price + ", p_img=" + p_img + ", p_detail=" + p_detail
				+ ", p_date=" + p_date + ", m_id=" + m_id + ", ct_id=" + ct_id
				+ ", p_status=" + p_status + "]";
	}
}