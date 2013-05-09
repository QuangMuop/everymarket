package everymarket.object4output;

import java.sql.Timestamp;

public class BannedMember {
	private String m_id;
	private String m_name;
	private String rep_reason;
	private Timestamp judgeTime;
	private Timestamp releaseTime;
	private int m_report;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getRep_reason() {
		return rep_reason;
	}
	public void setRep_reason(String rep_reason) {
		this.rep_reason = rep_reason;
	}
	public Timestamp getJudgeTime() {
		return judgeTime;
	}
	public void setJudgeTime(Timestamp judgeTime) {
		this.judgeTime = judgeTime;
	}
	public Timestamp getReleaseTime() {
		return releaseTime;
	}
	public void setReleaseTime(Timestamp releaseTime) {
		this.releaseTime = releaseTime;
	}
	public int getM_report() {
		return m_report;
	}
	public void setM_report(int m_report) {
		this.m_report = m_report;
	}	
}