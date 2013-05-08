package everymarket.dao;

import java.util.List;

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
	
	/*Output: List<BoardReport>(r_productId != null and r_check == 'n')*/
	public List<BoardReport> getReportedProduct(){
		return ibatisTemplate.queryForList("getReportedProduct");
	}
	
	/*Output: List<BoardReport>(r_productId == null and r_check == 'n')*/
	public List<BoardReport> getReportedMember(){
		return ibatisTemplate.queryForList("getReportedMember");
	}
	
	/*Output: List<BoardReport>(r_check = 'n')*/
	public List<BoardReport> getUncheckedReportList(){
		return ibatisTemplate.queryForList("getUncheckedReportList");
	}
	
	/*Input: m_id*/
	public void checkReportStatus(String r_id){
		ibatisTemplate.update("checkReportStatus", r_id);
	}
}
