package everymarket.model;

import java.sql.Timestamp;

public class Message {
	private int msg_id;
	private String m_id;
	private String m_nick;
	private int p_id;
	private String p_name;
	private Timestamp msg_date;
	private String msg_due;
	public int getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(int msg_id) {
		this.msg_id = msg_id;
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
	public Timestamp getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(Timestamp msg_date) {
		this.msg_date = msg_date;
	}
	public String getMsg_due() {
		return msg_due;
	}
	public void setMsg_due(String msg_due) {
		this.msg_due = msg_due;
	}
	
	
}
