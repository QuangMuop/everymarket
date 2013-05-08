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
		System.out.println("µé¾î¿È");
		ibatisTemplate.insert("registerBan", banList);
	}
}
