<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<!-- �˾�â : ��ǰ ������â -->
	<div id="productInfo" class="popUp hidden">
		<div id="homeInfo">
			<div id="blogB_map"></div>
			<div id="blogB_content"></div>
			<div id="randomProducts"></div>
		</div>
	
		<div id="productP_img"></div>
		<div id="productP_name"></div>
		<div id="productP_price"></div>
		<div id="listJjimer"></div>
		<div id="productP_detail"></div>
		<div id="productP_date"></div>
		<div id="productComments">
			<form id="ajaxForm_registerComments" action="registerComments.do" method="post">
				��۳���: <input type="text" name="c_content" size="20">
				<input type="hidden" name="p_id" value="">
				<input type="submit" value="�ۼ��ϱ�">
			</form>
		</div>
		
		<div id="bar_button_detail"></div>
	</div>
	
	<!-- �˾�â : ��ǰ ���Ž�ûâ -->
	<div id="productPurchase" class="popUp hidden">
		<div id="productInfo_purchase">
			<div id="productP_img_purchase"></div>
			<div id="productP_name_purchase">
				<span>��ǰ��: </span>
			</div>
			<div id="productP_price_purchase">
				<span>��ǰ����: </span>
			</div>
		</div>
		
		<form id="ajaxForm_productPurchase" action="purchaseProduct.do" method="post">
			<select name="waitingTime">
				<option value="3">3��</option>
				<option value="5">5��</option>
				<option value="7">7��</option>
				<option value="10">10��</option>
				<option value="14">14��</option>
			</select>
			<input type="hidden" value="" name="p_id">
			<input type="submit" value="���Ž�û�ϱ�">
			<button>â�ݱ�</button>
		</form>
	</div>
	
	<!-- �˾�â: ��ǰ �Ű�â -->
	<div id="productReport" class="popUp hidden">
		<div id="productInfo_report">
			<div id="productP_name_report">
				<span>��ǰ��: </span>
			</div>
			<div id="productP_detail_purchase">
				<span>��ǰ�Ұ�: </span>
			</div>
		</div>
		
		<div id="notice_report">
			<h4>�Ű�� �� Ȯ�����ּ���!</h4>
			<ul>
				<li>�ش� ��ǰ�� �Ű��� ��� �����ڰ� ��ǿ��� �Ǵ� �� ��ġ�� ���մϴ�.</li>			
				<li>�Ű������ �������� ���� ��� �ش� �Ű�� �Ⱒ�� �� �ֽ��ϴ�.</li>			
				<li>���ǹ��� �Ű������� �ݺ��� �Ű����� ��������� �� �� �ֽ��ϴ�.</li>			
			</ul>		
		</div>
		
		<div id="buttonBar_report">
			<form id="form_reportProduct" action="reportProduct.do" method="post">
				<input type="hidden" name="rep_productId">
				�Ű����: 	<select name="rep_reason">	
							<option value="�������� ��ǰ">�������� ��ǰ</option>
							<option value="������">������</option>
							<option value="���༺ ����">���༺ ����</option>
						</select><br>
				�Ű���:	<br>
				<textarea rows="5" cols="50" name="rep_content"></textarea>
				<input type="submit" value="�Ű��ϱ�">
				<button>����ϱ�</button>
			</form>
		</div>
	</div>

	<div>��� �ڿ� �˾�â ����!</div>

</body>
</html>