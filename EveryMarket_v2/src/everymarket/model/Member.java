package everymarket.model;

public class Member {
	private String m_id;
	private String m_nick;
	private String m_name;
	private String m_pwd;
	private String m_pno;
	private String m_phone;
	private int m_cash;
	private int m_report;
	private String m_status;
	
	public int getM_report() {
		return m_report;
	}
	public void setM_report(int m_report) {
		this.m_report = m_report;
	}
	public String getM_status() {
		return m_status;
	}
	public void setM_status(String m_status) {
		this.m_status = m_status;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_pno() {
		return m_pno;
	}
	public void setM_pno(String m_pno) {
		this.m_pno = m_pno;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public int getM_cash() {
		return m_cash;
	}
	public void setM_cash(int m_cash) {
		this.m_cash = m_cash;
	}
}

