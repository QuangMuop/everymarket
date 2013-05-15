package everymarket.dao;

import java.util.List;

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
	
	/*Output: Refund(ref_refundDate == null)*/
	public List<Refund> getUncheckedRefundList(){
		return ibatisTemplate.queryForList("getUncheckedRefundList");
	}
	
	/*Output: Refund(ref_refundDate != null)*/
	public List<Refund> getCheckedRefundList(){
		return ibatisTemplate.queryForList("getCheckedRefundList");
	}
	
	/*Output: sum(ref_refundFee)(ref_refundDate != null)*/
	public int getTotalFee(){
		if(ibatisTemplate.queryForObject("getTotalFee") == null){
			return 0;
		}else{
			return (Integer)ibatisTemplate.queryForObject("getTotalFee"); 
		} 
	}
	
	/*Input: Refund*/
	public void registerRefund(Refund refund){
		ibatisTemplate.insert("registerRefund", refund);
	}
	
	/*Input: ref_id*/
	public void confirmRefund(int ref_id){
		ibatisTemplate.update("confirmRefund", ref_id);
	}
}
