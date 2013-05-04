package everymarket.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Member;

public class MemberDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Input: m_id, m_pwd / Output : Member*/
	public Member loginMember(HashMap<String, String> member_map){
		return (Member)ibatisTemplate.queryForObject("loginMember", member_map);
	}
	
	/*회원가입 Validation 메서드*/
	public Member idConfirm (String m_id){
		Member member = getMemberByM_id(m_id);
		if(member != null){
			return member;
		}else{
			return null;
		}
	}
	
	/*회원가입 메서드 - Input: Member*/
	public void registerMember(Member member){
		ibatisTemplate.insert("registerMember", member);
	}
	
	/*캐쉬 충전 - Input: HashMap*/
	public void chargeCash(HashMap<String, Object> cash_map){
		ibatisTemplate.update("chargeCash", cash_map);
	}
	
	/*Output: List<Member>*/
	public List<Member> getMemberList(){
		return ibatisTemplate.queryForList("getMemberList");
	}
	
	/*Input: m_id / Output: Member*/
	public Member getMemberByM_id(String m_id){
		return (Member)ibatisTemplate.queryForObject("getMemberById", m_id);
	}
	
	/*Input: b_thumb / Output: Member*/
	public Member getMemberByB_thumb(String b_thumb){
		return (Member)ibatisTemplate.queryForObject("getMemberByB_thumb", b_thumb);
	}
}
