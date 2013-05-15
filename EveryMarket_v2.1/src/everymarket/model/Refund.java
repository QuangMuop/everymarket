package everymarket.model;

import java.sql.Timestamp;

public class Refund {
	private int ref_id;
	private String m_id;
	private int ref_refundAmount;
	private int ref_refundFee;
	private String ref_bankName;
	private String ref_account;
	private String ref_accountName;
	private Timestamp ref_refundDate;
	private String ref_check;
	
	public int getRef_id() {
		return ref_id;
	}
	public void setRef_id(int ref_id) {
		this.ref_id = ref_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getRef_refundAmount() {
		return ref_refundAmount;
	}
	public void setRef_refundAmount(int ref_refundAmount) {
		this.ref_refundAmount = ref_refundAmount;
	}
	public int getRef_refundFee() {
		return ref_refundFee;
	}
	public void setRef_refundFee(int ref_refundFee) {
		this.ref_refundFee = ref_refundFee;
	}
	public String getRef_bankName() {
		return ref_bankName;
	}
	public void setRef_bankName(String ref_bankName) {
		this.ref_bankName = ref_bankName;
	}
	public String getRef_account() {
		return ref_account;
	}
	public void setRef_account(String ref_account) {
		this.ref_account = ref_account;
	}
	public String getRef_accountName() {
		return ref_accountName;
	}
	public void setRef_accountName(String ref_accountName) {
		this.ref_accountName = ref_accountName;
	}
	public Timestamp getRef_refundDate() {
		return ref_refundDate;
	}
	public void setRef_refundDate(Timestamp ref_refundDate) {
		this.ref_refundDate = ref_refundDate;
	}
	public String getRef_check() {
		return ref_check;
	}
	public void setRef_check(String ref_check) {
		this.ref_check = ref_check;
	}	
}