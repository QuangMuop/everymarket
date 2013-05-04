package everymarket.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Jjim;
import everymarket.model.Product;
import everymarket.object4output.JjimResult;

public class JjimDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}

	/* Output: max(j_id) */
	public int getMaxJ_id() {
		int maxJ_id = -1;
		if (ibatisTemplate.queryForObject("getMaxJ_id") != null) {
			maxJ_id = (Integer) ibatisTemplate.queryForObject("getMaxJ_id");
		}
		return maxJ_id;
	}

	/* Input: Map(m_id, p_id) */
	public void deleteJjim(Map<String, Object> paramMap) {
		ibatisTemplate.delete("deleteJjim", paramMap);
	}

	/* Input: Jjim */
	public void registerJjim(Jjim jjim) {
		ibatisTemplate.insert("registerJjim", jjim);
	}

	/* Input: p_id / Output: List<Jjim> */
	public List<String> getB_thumbByP_id(int p_id) {
		return ibatisTemplate.queryForList("getB_thumbByP_id", p_id);
	}

	/* Input: Map(m_id, p_id) / Output: boolean */
	public boolean checkJjim(Map<String, Object> paramMap) {
		int result = (Integer) ibatisTemplate.queryForObject("checkJjim",
				paramMap);
		if (result == 0) {
			return false;
		} else {
			return true;
		}
	}

	// ���� ���
	public ArrayList<JjimResult> JjimList(String m_id) {
		JjimResult jjimresult = new JjimResult();

		Product p = null;
		int jjim = 0;
		int comment = 0;

		// ���� ���� ���ǰ�ü��
		ArrayList<Product> p_list3 = new ArrayList();
		// ���� ���� ���ǵ��� �� Ƚ��
		ArrayList<Integer> jjim_list3 = new ArrayList();
		// ���� ���� ���ǵ��� comment��
		ArrayList<Integer> comment_list3 = new ArrayList();
		// ���� �͵��� �� ��ģ ����Ʈ
		ArrayList<JjimResult> listJjim = new ArrayList();

		List<Integer> p_id_list = ibatisTemplate.queryForList("sellList_p_id",
				m_id);

		for (int i = 0; i < p_id_list.size(); i++) {
			p = (Product) ibatisTemplate.queryForObject("buyList_product",
					p_id_list.get(i));
			jjim = (int) ibatisTemplate.queryForObject("buyList_Jjim",
					p_id_list.get(i));
			comment = (int) ibatisTemplate.queryForObject("buyList_Jjim",
					p_id_list.get(i));

			p_list3.add(p);
			jjim_list3.add(jjim);
			comment_list3.add(comment);
		}

		for (int i = 0; i < p_id_list.size() - 1; i++) {
			jjimresult.setP_id(p_list3.get(i).getP_id());
			jjimresult.setJ_price(p_list3.get(i).getP_price());
			jjimresult.setJ_img(p_list3.get(i).getP_img());
			jjimresult.setJ_commentcount(jjim_list3.get(i));
			jjimresult.setJ_jjimcount(jjim_list3.get(i));
			listJjim.add(jjimresult);
		}

		return listJjim;
	}

	public ArrayList<JjimResult> buyList(String m_id) {
		JjimResult jjimresult = new JjimResult();

		Product p = null;
		int jjim = 0;
		int comment = 0;

		// ���� �� ���ǰ�ü��
		ArrayList<Product> p_list = new ArrayList();

		// ���� �� ���ǵ��� �� Ƚ��
		ArrayList<Integer> jjim_list = new ArrayList();

		// ���� �� ���ǵ��� comment��
		ArrayList<Integer> comment_list = new ArrayList();

		// ���� �͵��� �� ��ģ ����Ʈ
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

	// ���� �� ���
	public ArrayList<JjimResult> SellList(String m_id) {

		JjimResult jjimresult = new JjimResult();

		Product p = null;
		int jjim = 0;
		int comment = 0;

		// ���� �� ���ǰ�ü��
		ArrayList<Product> p_list2 = new ArrayList();

		// ���� �� ���ǵ��� �� Ƚ��
		ArrayList<Integer> jjim_list2 = new ArrayList();

		// ���� �� ���ǵ��� comment��
		ArrayList<Integer> comment_list2 = new ArrayList();

		// ���� �͵��� �� ��ģ ����Ʈ
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
