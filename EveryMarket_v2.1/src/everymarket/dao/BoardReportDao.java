package everymarket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.BoardReport;

public class BoardReportDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}

	/*Input: BoardReport*/
	public void registerReport(BoardReport boardReport){
		ibatisTemplate.insert("registerReport", boardReport);
	}
	
	/*Output: max(rep_id)*/
	public int getMaxRep_id(){
		return (Integer)ibatisTemplate.queryForObject("getMaxRep_id");
	}
	
	/*Input: rep_id / Output: rep_reason*/
	public String getRep_reasonByRep_id(int rep_id){
		return (String)ibatisTemplate.queryForObject("getRep_reasonByRep_id", rep_id);
	}
	
	/*Input: BoardReport / Output: rep_id*/
	public BoardReport getBoardReportByRep_id(int rep_id){
		return (BoardReport)ibatisTemplate.queryForObject("getBoardReportByRep_id", rep_id);
	}
	
	/*Output: List<BoardReport>(r_productId != null and r_check == 'n')*/
	public List<BoardReport> getReportedProduct(){
		return ibatisTemplate.queryForList("getReportedProduct");
	}
	
	/*Output: List<BoardReport>(r_productId == null and r_check == 'n')*/
	public List<BoardReport> getReportedMember(){
		return ibatisTemplate.queryForList("getReportedMember");
	}
	
	/*Output: List<BoardReport>(r_check == 'n')*/
	public List<BoardReport> getUncheckedReportList(){
		return ibatisTemplate.queryForList("getUncheckedReportList");
	}
	
	/*Oubput: List<BoardReport>(rep_type == "t")*/
	public List<BoardReport> callUncheckedTradeReportList(){
		return ibatisTemplate.queryForList("callUncheckedTradeReportList");
	}
	
	/*Output: List<BoardReport>(r_check != 'n')*/
	public List<BoardReport> getCheckedReportList(){
		return ibatisTemplate.queryForList("getCheckedReportList");
	}
	
	/*Input: m_id*/
	public void checkReportStatus(Map<String, Object> paramMap){
		ibatisTemplate.update("checkReportStatus", paramMap);
	}
	
	/*Input: rep_writer, rep_memberId / Output: BoardReport*/
	public BoardReport checkAlreadyReported(Map<String, Object> paramMap){
		return (BoardReport)ibatisTemplate.queryForObject("checkAlreadyReported", paramMap);
	}
}
