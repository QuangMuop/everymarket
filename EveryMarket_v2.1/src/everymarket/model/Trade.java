package everymarket.model;

import java.sql.Timestamp;

public class Trade {

	int t_id;
	String t_buyer;
	int p_id;
	Timestamp t_date;
	int t_status;
	int t_del_number;
	String p_name;
	int p_price;

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

	public int getT_id() {
		return t_id;
	}

	public void setT_id(int t_id) {
		this.t_id = t_id;
	}

	public String getT_buyer() {
		return t_buyer;
	}

	public void setT_buyer(String t_buyer) {
		this.t_buyer = t_buyer;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public Timestamp getT_date() {
		return t_date;
	}

	public void setT_date(Timestamp t_date) {
		this.t_date = t_date;
	}

	public int getT_status() {
		return t_status;
	}

	public void setT_status(int t_status) {
		this.t_status = t_status;
	}

	public int getT_del_number() {
		return t_del_number;
	}

	public void setT_del_number(int t_del_number) {
		this.t_del_number = t_del_number;
	}

}
