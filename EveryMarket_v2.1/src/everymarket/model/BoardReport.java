package everymarket.model;

import java.sql.Timestamp;

public class BoardReport {
	private int r_id;
	private String r_reason;
	private String r_writer;
	private String r_contents;
	private Timestamp r_regdate;
	private String r_target;
	private String r_check;
	
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public String getR_reason() {
		return r_reason;
	}
	public void setR_reason(String r_reason) {
		this.r_reason = r_reason;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public String getR_contents() {
		return r_contents;
	}
	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}
	public Timestamp getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Timestamp r_regdate) {
		this.r_regdate = r_regdate;
	}
	public String getR_target() {
		return r_target;
	}
	public void setR_target(String r_target) {
		this.r_target = r_target;
	}
	public String getR_check() {
		return r_check;
	}
	public void setR_check(String r_check) {
		this.r_check = r_check;
	}
}
