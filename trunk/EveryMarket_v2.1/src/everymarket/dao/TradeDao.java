package everymarket.dao;

import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import oracle.sql.ARRAY;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Trade;

public class TradeDao {

	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}

	// 구매요청 시 거래 내역 생성
	public void insertTrade(HashMap map) {
		ibatisTemplate.insert("insertTrade", map);
	}

	// 판매자 아이디 업데이트
	public void update_t_seller(int p_id) {
		ibatisTemplate.update("update_t_seller", p_id);
	}

	// 구매요청 거절시 거래테이블에서 정보 삭제
	public void deleteTrade(int p_id) {
		ibatisTemplate.delete("deleteTrade", p_id);
	}

	// 구매요청 승인시 승인날짜와 거래상태 1(배송준비중)로 변경
	public void update_approve(int p_id) {
		ibatisTemplate.update("update_approve", p_id);
	}

	/* Input: p_id / Output: m_name */
	public String getM_nameByP_id(int p_id) {
		return (String) ibatisTemplate.queryForObject("getM_nameByP_id", p_id);
	}

	// 거래중인 물건 가져오기
	public List<Trade> getBuyingTrade(String m_id) {
		return ibatisTemplate.queryForList("getBuyingTrade", m_id);
	}

	public List<Trade> getSellingTrade(String m_id) {
		return ibatisTemplate.queryForList("getSellingTrade", m_id);
	}

	// 완료된 산 물건 가져오기
	public List<Trade> getBCompleteList(String m_id) {

		return ibatisTemplate.queryForList("getBCompleteList", m_id);
	}

	// 완료된 판 물건 가져오기
	public List<Trade> getSCompleteList(String m_id) {

		return ibatisTemplate.queryForList("getSCompleteList", m_id);
	}

	// Dwr용 메서드
	// 운송번호넣고 status바꾸기
	public String update_db_status(int db_nb, int t_id, int t_status) {
		HashMap map = new HashMap();
		map.put("t_status", t_status);
		map.put("d_number", db_nb);
		map.put("t_id", t_id);

		ibatisTemplate.update("update_deliver_number", map);

		return "redirect:/trade_list.do";
	}

	// 배송완료시에 update해주기
	public void update_status(int t_id, int t_status) {
		HashMap map = new HashMap();
		map.put("t_status", t_status);
		map.put("t_id", t_id);

		ibatisTemplate.update("update_deliver_ok", map);
	}

	// 남은 배송번호 입력 날짜
	public String db_number_remainday(int t_id) {

		return (String) ibatisTemplate.queryForObject("db_number_remainday",
				t_id);
	}

	// 배송날짜 지난거 삭제해주기
	public void trade_delete(int t_id) {

		ibatisTemplate.delete("trade_delete", t_id);
	}

	// 수취확인 눌렀을시
	public void trade_ok(int t_id) {

		ibatisTemplate.update("trade_ok", t_id);
	}

	// 트레이드 객체 한개 뽑아내기
	public Trade getTrade(int t_id) {

		return (Trade) ibatisTemplate.queryForObject("getT_instance", t_id);
	}
	
	// 포인트 비교해서 거래가능 여부 확인하기
	public int member_point(String m_id){
		return (Integer)ibatisTemplate.queryForObject("member_point", m_id);
	}
	
	public int trade_point(String m_id){
		int trade_point = 0;
		if(ibatisTemplate.queryForObject("trade_point", m_id) != null){
			trade_point = (Integer)ibatisTemplate.queryForObject("trade_point", m_id);
		}
		return trade_point;		
	}
	
	public int product_price(int p_id){
		return (Integer)ibatisTemplate.queryForObject("product_price", p_id);
	}
	
	//리뷰쓰면 t_status 바꿔주기
	public int update_status_review(int p_id){
		return ibatisTemplate.update("review_update", p_id);
	}
	
	
	

}
