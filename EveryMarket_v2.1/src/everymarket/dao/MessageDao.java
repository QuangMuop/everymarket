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
	
	////////////////////���ſ�û///////////////////////
	
	//���Ź�ư ������ ���� ��û�� �ʿ��� ������ DB�� �����
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
	
	//������ �г��� ������Ʈ
	public void update_nick(String m_id){
		ibatisTemplate.update("update_nick", m_id);
	}
	
	//������ǰ�� ������Ʈ
	public void update_pname(int p_id){
		ibatisTemplate.update("update_pname", p_id);
	}
	
	//���ſ�ûȮ�α��� ��ٸ� �Ⱓ�� �����ؼ� DB�� ����
	public void updateMessage(HashMap map3){
		ibatisTemplate.update("updateMessage", map3);
	}
	
	//���ſ�û �ϸ� ��ǰ���� w�� ����
	public void update_p_status(int p_id){
		ibatisTemplate.update("update_p_status", p_id);
	}
	
	
	/////////////////���� ��û Ȯ��///////////////////////
	
	//������ �� �޼��� ����ϱ�
	public List<Message> list(String m_id){
		return ibatisTemplate.queryForList("listMessage", m_id);
	}
	
	//������ �г��� ����ϱ�
	public String buyerInfo(String m_id){
		return (String)ibatisTemplate.queryForObject("buyerInfo", m_id);
	}
}
