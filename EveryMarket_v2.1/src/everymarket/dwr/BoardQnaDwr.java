package everymarket.dwr;

import everymarket.dao.BoardQnaDao;
import everymarket.model.BoardQna;

public class BoardQnaDwr {
	private BoardQnaDao daoBQ;

	public void setDaoBQ(BoardQnaDao daoBQ) {
		this.daoBQ = daoBQ;
	}
	
	public BoardQna getBoardQnaByQna_id(int qna_id){
		return daoBQ.getBoardQnaByQna_id(qna_id);
	}
	
	public int hitBoardQna(int qna_id){
		daoBQ.hitBoardQna(qna_id);
		
		return daoBQ.getHitCountByQna_id(qna_id);
	}
}
