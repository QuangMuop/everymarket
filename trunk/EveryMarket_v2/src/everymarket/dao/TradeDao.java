package everymarket.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Product;
import everymarket.object4output.JjimResult;

public class TradeDao {

	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}

	// 내가 산 목록
	public ArrayList<JjimResult> buyList(String m_id) {
		JjimResult jjimresult = new JjimResult();

		Product p = null;
		int jjim = 0;
		int comment = 0;

		// 내가 산 물건객체들
		ArrayList<Product> p_list = new ArrayList();

		// 내가 산 물건들의 찜 횟수
		ArrayList<Integer> jjim_list = new ArrayList();

		// 내가 산 물건들의 comment수
		ArrayList<Integer> comment_list = new ArrayList();

		// 위에 것들을 다 합친 리스트
		ArrayList<JjimResult> listBuy = new ArrayList();

		List<Integer> p_id_list = ibatisTemplate.queryForList("buyList_p_id",
				m_id);

		for (int i = 0; i < p_id_list.size(); i++) {

			p = (Product) ibatisTemplate.queryForObject("buyList_product",
					p_id_list.get(i));

			jjim = (int) ibatisTemplate.queryForObject("buyList_Jjim",
					p_id_list.get(i));

			comment = (int) ibatisTemplate.queryForObject("buyList_Jjim",
					p_id_list.get(i));

			p_list.add(p);
			jjim_list.add(jjim);
			comment_list.add(comment);
		}

		for (int i = 0; i < p_id_list.size() - 1; i++) {

			jjimresult.setP_id(p_list.get(i).getP_id());
			jjimresult.setJ_price(p_list.get(i).getP_price());
			jjimresult.setJ_img(p_list.get(i).getP_img());
			jjimresult.setJ_commentcount(jjim_list.get(i));
			jjimresult.setJ_jjimcount(jjim_list.get(i));
			listBuy.add(jjimresult);

		}

		return listBuy;

	}

	// 내가 판 목록
	public ArrayList<JjimResult> SellList(String m_id) {

		JjimResult jjimresult = new JjimResult();

		Product p = null;
		int jjim = 0;
		int comment = 0;

		// 내가 판 물건객체들
		ArrayList<Product> p_list2 = new ArrayList();

		// 내가 산 물건들의 찜 횟수
		ArrayList<Integer> jjim_list2 = new ArrayList();

		// 내가 산 물건들의 comment수
		ArrayList<Integer> comment_list2 = new ArrayList();

		// 위에 것들을 다 합친 리스트
		ArrayList<JjimResult> listSell = new ArrayList();

		List<Integer> p_id_list = ibatisTemplate.queryForList("sellList_p_id",
				m_id);

		for (int i = 0; i < p_id_list.size(); i++) {

			p = (Product) ibatisTemplate.queryForObject("buyList_product",
					p_id_list.get(i));

			jjim = (int) ibatisTemplate.queryForObject("buyList_Jjim",
					p_id_list.get(i));

			comment = (int) ibatisTemplate.queryForObject("buyList_Jjim",
					p_id_list.get(i));

			p_list2.add(p);
			jjim_list2.add(jjim);
			comment_list2.add(comment);
		}

		for (int i = 0; i < p_id_list.size() - 1; i++) {

			jjimresult.setP_id(p_list2.get(i).getP_id());
			jjimresult.setJ_price(p_list2.get(i).getP_price());
			jjimresult.setJ_img(p_list2.get(i).getP_img());
			jjimresult.setJ_commentcount(jjim_list2.get(i));
			jjimresult.setJ_jjimcount(jjim_list2.get(i));
			listSell.add(jjimresult);
		}

		return listSell;

	}

}
