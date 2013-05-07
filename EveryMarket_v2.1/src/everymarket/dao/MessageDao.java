package everymarket.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Message;

public class MessageDao {

	private SqlMapClientTemplate ibatisTemplate;
	
	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate){
		this.ibatisTemplate = ibatisTemplate;
	}
	
	////////////////////구매요청///////////////////////
	
	//구매버튼 누르면 구매 요청시 필요한 정보가 DB에 저장됨
	public HashMap insert(HashMap map){
		ibatisTemplate.insert("insertMessage", map);
		
		int p_id = (int)map.get("p_id");
		
		int msg_id=(Integer)ibatisTemplate.queryForObject("get_msg_id", p_id);
		Date msg_date = (Date)ibatisTemplate.queryForObject("get_msg_date", p_id);
		
		HashMap map2 = new HashMap<>();
		map2.put("msg_id", msg_id);
		map2.put("msg_date", msg_date);
		
		return map2;
	}
	
	//구매자 닉네임 업데이트
	public void update_nick(String m_id){
		ibatisTemplate.update("update_nick", m_id);
	}
	
	//구매제품명 업데이트
	public void update_pname(int p_id){
		ibatisTemplate.update("update_pname", p_id);
	}
	
	//구매요청확인까지 기다릴 기간을 지정해서 DB에 저장
	public void updateMessage(HashMap map3){
		ibatisTemplate.update("updateMessage", map3);
	}
	
	//구매요청 하면 제품상태 w로 변경
	public void update_p_status(int p_id){
		ibatisTemplate.update("update_p_status", p_id);
	}
	
	
	/////////////////구매 요청 확인///////////////////////
	
	//나에게 온 메세지 출력하기
	public List<Message> list(String m_id){
		return ibatisTemplate.queryForList("listMessage", m_id);
	}
	
	//구매자 닉네임 출력하기
	public String buyerInfo(String m_id){
		return (String)ibatisTemplate.queryForObject("buyerInfo", m_id);
	}
}
