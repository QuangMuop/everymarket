package everymarket.model;

import java.sql.Timestamp;

public class BoardReport {
	private int rep_id;
	private String rep_reason;
	private String rep_writer;
	private String rep_content;
	private Timestamp rep_regdate;
	private int rep_productId;
	private String rep_memberId;
	private String rep_check;
	
	public int getRep_id() {
		return rep_id;
	}
	public void setRep_id(int rep_id) {
		this.rep_id = rep_id;
	}
	public String getRep_reason() {
		return rep_reason;
	}
	public void setRep_reason(String rep_reason) {
		this.rep_reason = rep_reason;
	}
	public String getRep_writer() {
		return rep_writer;
	}
	public void setRep_writer(String rep_writer) {
		this.rep_writer = rep_writer;
	}
	public String getRep_content() {
		return rep_content;
	}
	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}
	public Timestamp getRep_regdate() {
		return rep_regdate;
	}
	public void setRep_regdate(Timestamp rep_regdate) {
		this.rep_regdate = rep_regdate;
	}
	public int getRep_productId() {
		return rep_productId;
	}
	public void setRep_productId(int rep_productId) {
		this.rep_productId = rep_productId;
	}
	public String getRep_memberId() {
		return rep_memberId;
	}
	public void setRep_memberId(String rep_memberId) {
		this.rep_memberId = rep_memberId;
	}
	public String getRep_check() {
		return rep_check;
	}
	public void setRep_check(String rep_check) {
		this.rep_check = rep_check;
	}
}
