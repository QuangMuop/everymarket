package everymarket.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Member;

public class MemberDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Output: List<Member>*/
	public List<Member> getMemberList(){
		System.out.println("called:memberDao");
		return ibatisTemplate.queryForList("getMemberList");
	}
	
	/*Input: m_id / Output: Member*/
	public Member getMemberByM_id(String m_id){
		return (Member)ibatisTemplate.queryForObject("getMemberById", m_id);
	}
}
