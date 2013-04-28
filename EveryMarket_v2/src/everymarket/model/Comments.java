package everymarket.model;

import java.sql.Timestamp;

public class Comments {
	private int c_id;
	private String c_thumb;
	private String c_name;
	private Timestamp c_date;
	private String c_content;
	private int p_id;
	private String m_id;
	
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_thumb() {
		return c_thumb;
	}
	public void setC_thumb(String c_thumb) {
		this.c_thumb = c_thumb;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public Timestamp getC_date() {
		return c_date;
	}
	public void setC_date(Timestamp c_date) {
		this.c_date = c_date;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	@Override
	public String toString() {
		return "Comments [c_id=" + c_id + ", c_thumb=" + c_thumb + ", c_name="
				+ c_name + ", c_date=" + c_date + ", c_content=" + c_content
				+ ", p_id=" + p_id + ", m_id=" + m_id + "]";
	}
}
