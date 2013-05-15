package everymarket.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Refund;

public class RefundDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Output: max(ref_id)*/
	public int getMaxRef_id(){
		int maxRef_id = -1;
		if(ibatisTemplate.queryForObject("getMaxRef_id") != null){
			maxRef_id = (Integer)ibatisTemplate.queryForObject("getMaxRef_id");
		}
		return maxRef_id;
	}
	
	/*Input: Refund*/
	public void registerRefund(Refund refund){
		ibatisTemplate.insert("registerRefund", refund);
	}
}
