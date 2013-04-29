package everymarket.model;

public class Jjim {
	private int j_id;
	private int p_id;
	private String m_id;
	private String b_thumb;
	
	public int getJ_id() {
		return j_id;
	}
	public void setJ_id(int j_id) {
		this.j_id = j_id;
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
	public String getB_thumb() {
		return b_thumb;
	}
	public void setB_thumb(String b_thumb) {
		this.b_thumb = b_thumb;
	}
	
	@Override
	public String toString() {
		return "Jjim [j_id=" + j_id + ", p_id=" + p_id + ", m_id=" + m_id
				+ ", b_thumb=" + b_thumb + "]";
	}
}
