package everymarket.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.BanList;

public class BanListDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Input: m_id, day*/
	public void registerBan(BanList banList){
		ibatisTemplate.insert("registerBan", banList);
	}
	
	/*Input: m_id / Output: BanList*/
	public BanList getBanListByM_id(String m_id){
		return (BanList)ibatisTemplate.queryForObject("getBanListByM_id", m_id);
	}
	
	public void deleteExpiredBanList(){
		ibatisTemplate.delete("deleteExpiredBanList");
	}
}
