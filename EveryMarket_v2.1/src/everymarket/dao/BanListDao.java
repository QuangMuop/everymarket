package everymarket.dao;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.BanList;

public class BanListDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Output: max(bl_id)*/
	public int getMaxBl_id(){
		int maxBl_id = -1;
		if(ibatisTemplate.queryForObject("getMaxBl_id") != null){
			maxBl_id = (Integer)ibatisTemplate.queryForObject("getMaxBl_id");
		}
		return maxBl_id;
	}
	
	/*Input: m_id, day*/
	public void registerBan(BanList banList){
		ibatisTemplate.insert("registerBan", banList);
	}
	
	/*Input: m_id / Output: BanList*/
	public BanList getBanListByM_id(String m_id){
		return (BanList)ibatisTemplate.queryForObject("getBanListByM_id", m_id);
	}
	
	/*Input: m_id / Output: releaseTime*/
	public Timestamp getRemaningTimeByM_id(String m_id){
		return (Timestamp)ibatisTemplate.queryForObject("getRemaningTimeByM_id", m_id);
	}
	
	/*Input: BanList*/
	public void renewReleaseTime(BanList existingBanList){
		ibatisTemplate.update("renewReleaseTime", existingBanList);
	}
	
	public void deleteExpiredBanList(){
		List<String> listM_id = (List<String>)ibatisTemplate.queryForList("getExpiredBanListM_id");
		if(listM_id.size() > 0){
			ibatisTemplate.update("recoverM_status", listM_id);
			ibatisTemplate.delete("deleteExpiredBanList");
		}
	}
}
