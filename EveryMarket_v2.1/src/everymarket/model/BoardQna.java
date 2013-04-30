package everymarket.model;

import java.sql.Timestamp;

public class BoardQna {
	private int qna_id;
	private String qna_title;
	private String qna_writer;
	private String qna_contents;
	private Timestamp qna_regdate;
	private int qna_hitcount;
	private String qna_answer;
	private String qna_check;
	
	public int getQna_id() {
		return qna_id;
	}
	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public String getQna_contents() {
		return qna_contents;
	}
	public void setQna_contents(String qna_contents) {
		this.qna_contents = qna_contents;
	}
	public Timestamp getQna_regdate() {
		return qna_regdate;
	}
	public void setQna_regdate(Timestamp qna_regdate) {
		this.qna_regdate = qna_regdate;
	}
	public int getQna_hitcount() {
		return qna_hitcount;
	}
	public void setQna_hitcount(int qna_hitcount) {
		this.qna_hitcount = qna_hitcount;
	}
	public String getQna_answer() {
		return qna_answer;
	}
	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}
	public String getQna_check() {
		return qna_check;
	}
	public void setQna_check(String qna_check) {
		this.qna_check = qna_check;
	}
}
