package everymarket.model;

import java.sql.Timestamp;

public class BanList {
	private String m_id;
	private int rep_id;
	private Timestamp judgeTime;
	private Timestamp releaseTime;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getRep_id() {
		return rep_id;
	}
	public void setRep_id(int rep_id) {
		this.rep_id = rep_id;
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
}
