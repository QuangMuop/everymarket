package everymarket.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.BoardQna;

public class BoardQnaDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Output: max(Qna_id)*/
	public int getMaxQna_id(){
		int maxQna_id = -1;
		if(ibatisTemplate.queryForObject("getMaxQna_id") != null){
			maxQna_id = (Integer)ibatisTemplate.queryForObject("getMaxQna_id");
		}
		return maxQna_id;
	}
	
	/*Input: BoardQna*/
	public void insertQna(BoardQna boardQna){
		ibatisTemplate.insert("insertQna", boardQna);
	}
	
	/*Input: qna_id, qna_contents*/
	public void updateQna(BoardQna boardQna){
		ibatisTemplate.update("updateQna", boardQna);
	}
	
	/*Input: qna_id, qna_answer*/
	public void insertQnaAnswer(BoardQna boardQna){
		ibatisTemplate.update("insertQnaAnswer", boardQna);
	}
	
	public void deleteQna(int qna_id){
		ibatisTemplate.delete("deleteQna", qna_id);
	}
	
	/*Output: List<BoardQna>*/
	public List<BoardQna> getQnaList(){
		return ibatisTemplate.queryForList("getQnaList");
	}
}
