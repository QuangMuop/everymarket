<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<!-- �˾�â : ��ǰ ������â -->
	<div id="productInfo" class="popUp hidden">
		<div id="market_info_box">
			<div id="homeInfo">
				<div id="blogB_map"></div>
				<a>���� ��ġ</a>
				<div id="blogB_content">
				</div>
				<a>�Ǹ����� �ٸ� ��ǰ</a>
				<div id="randomProducts"></div>
			</div>
			<div id="p_detail">
				<div id="productP_img"></div>
				<div id="p_detail_top">	
					<div id="p_detail_top_name">
					<p id="productP_name"></p>
					����� :
					<a id="productP_date"></a>
					</div>
					<div id="bar_button_detail"></div>
					<div id="p_price_img">
					<a id="productP_price"></a>
					<img class="coin" alt="" src="images/smarket/coin.png">
					</div>
					<div id="productP_detail"></div>
					<div id="jjim_box">
						<div id="listJjimer">
							<a>���߾��! : </a>
						</div>
					</div>
				</div>
				<div id="productComments">
					<form id="ajaxForm_registerComments" action="registerComments.do" method="post">
						<input type="text" id="p_comment_input" name="c_content" size="20" placeholder="������ �����ּ���!">
						<input type="hidden" name="p_id" value="">
						<input type="submit" id="p_comment_submit" value="�ۼ��ϱ�">
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- �˾�â : ��ǰ ���Ž�ûâ -->
	<div id="productPurchase" class="popUp hidden">
		<div id="productInfo_purchase">
			<div id="productP_name_purchase">
				<span></span>
			</div>
			<div id="productP_img_purchase"></div>
			<form id="ajaxForm_productPurchase" action="purchaseProduct.do" method="post">
			<table>
				<colgroup>
					<col width="40%">
					<col width="60%">
				</colgroup>
				<tr>
					<th>�ǸŰ�</th>
					<td>
						<div id="productP_price_purchase">
						<span></span>
						<img class="coin" alt="" src="images/smarket/coin.png">
						</div>
					</td>
				</tr>
				<tr>
					<th>���Ŵ��Ⱓ</th>
					<td>
						<select name="waitingTime" id="w_select">
							<option value="3">3��</option>
							<option value="5">5��</option>
							<option value="7">7��</option>
							<option value="10">10��</option>
							<option value="14">14��</option>
						</select>
					</td>
				</tr>
			</table>	
					
			<input type="hidden" value="" name="p_id">
			<input type="submit" id="buy_submit" value="���Ž�û�ϱ�">
			<button id="buy_close">â�ݱ�</button>
			
			</form>
		</div>
	</div>
	
	<!-- �˾�â: ȸ�� �Ű�â -->
	<div id="memberReport" class="popUp hidden">
		<div id="p_r_content">
		<img alt="" id="main_report_title" src="image_trade/report_title_img.png">
		<div id="memberInfo_report">
			<span id="memberM_nick_report"></span>
				(<span id="memberM_id_report"></span>)
				���� ������ ������ �Ű��Ϸ��� �մϴ�.
		</div>		
		
		<div class="notice_report">
			<p>�Ű�� �� Ȯ�����ּ���!</p>
			<ul>
				<li>�ش� ȸ���� �Ű��� ��� �����ڰ� ��ǿ��� �Ǵ� �� ��ġ�� ���մϴ�.</li>			
				<li>�Ű������ �������� ���� ��� �ش� �Ű�� �Ⱒ�� �� �ֽ��ϴ�.</li>			
				<li>���ǹ��� �Ű������� �ݺ��� �Ű����� ��������� �� �� �ֽ��ϴ�.</li>			
			</ul>		
		</div>
		
		<div id="buttonBar_reportMember">
			<form id="form_reportMember" action="reportMember.do" method="post">
				<input type="hidden" name="rep_memberId">
				<div id="r_reason_box">
					�Ű����: 
					<select name="rep_reason">	
						<option value="���� �� �Խ�">���� �� �Խ�</option>
						<option value="���ǹ��� ����">���ǹ��� ����</option>
						<option value="�ŷ����">�ŷ����</option>
					</select><br>
				</div>
				
				<textarea rows="5" cols="50" name="rep_content" placeholder="�������� �Ű����̳�, Ÿ������ ���� ������ �ۼ��� ��� ������ �Ǵ��Ͽ� ���簡 ������ �� �ֽ��ϴ�."></textarea>
				<input type="submit" id="r_reason_btn" value="�Ű��ϱ�">
				<button id="r_reason_cencle">����ϱ�</button>
					
				</form>
			</div>
		</div>
	</div>
	
	<!-- �˾�â: ��ǰ �Ű�â -->
	<div id="productReport" class="popUp hidden">
		<div id="p_r_content">
		<div id="productInfo_report">
			<div id="productP_name_report">
				<span>�Ű��ǰ��: </span>
			</div>		
		</div>
		
		<div class="notice_report">
			<p>�Ű�� �� Ȯ�����ּ���!</p>
			<ul>
				<li>�ش� ��ǰ�� �Ű��� ��� �����ڰ� ��ǿ��� �Ǵ� �� ��ġ�� ���մϴ�.</li>			
				<li>�Ű������ �������� ���� ��� �ش� �Ű�� �Ⱒ�� �� �ֽ��ϴ�.</li>			
				<li>���ǹ��� �Ű������� �ݺ��� �Ű����� ��������� �� �� �ֽ��ϴ�.</li>			
			</ul>		
		</div>
		
		<div id="buttonBar_reportProduct">
			<form id="form_reportProduct" action="reportProduct.do" method="post">
				<input type="hidden" name="rep_productId">
				<input type="hidden" name="rep_memberId">
				<div id="r_reason_box">
					�Ű����: 	
					<select name="rep_reason">	
						<option value="�������� ��ǰ">�������� ��ǰ</option>
						<option value="������">������</option>
						<option value="���༺ ����">���༺ ���幰ǰ</option>
					</select><br>
				</div>
				<textarea rows="5" cols="50" name="rep_content" placeholder="�������� �Ű����̳�, Ÿ������ ���� ������ �ۼ��� ��� ������ �Ǵ��Ͽ� ���簡 ������ �� �ֽ��ϴ�."></textarea>
				<input type="submit" id="r_reason_btn" value="�Ű��ϱ�">
				<button id="r_reason_cencle">����ϱ�</button>
			</form>
		</div>
		</div>
	</div>

</body>
</html>