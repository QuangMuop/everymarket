package everymarket.dwr;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import everymarket.dao.BoardReportDao;

public class BoardReportDwr {
	private BoardReportDao daoBR;

	public void setDaoBR(BoardReportDao daoBR) {
		this.daoBR = daoBR;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=(Exception.class))
	public void reportAction(String r_id, String actionCode)throws Exception{
		System.out.println("�Ű�۹�ȣ:" + r_id + " / " + "�Ű�ó��:" + actionCode);
		
		/*actionCode�� ���� ��ġ*/
		switch (actionCode) {
		case "actionForProduct_1":
			System.out.println("actionForProduct_1");
			break;
		case "actionForProduct_2":
			System.out.println("actionForProduct_2");
			break;
		case "actionForProduct_3":
			System.out.println("actionForProduct_3");
			break;
		case "actionForMember_1":
			System.out.println("actionForMember1");
			break;
		case "actionForMember_2":
			System.out.println("actionForMember2");
			break;
		case "actionForMember_3":
			System.out.println("actionForMember3");
			break;
		}
		
		/*r_id�� �ش��ϴ� �Ű�� Checkó��*/
		daoBR.checkReportStatus(r_id);
	}
}