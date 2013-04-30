package everymarket.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class BoardQnaDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	
}
