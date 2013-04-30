package everymarket.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class BoardReportDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}

}
