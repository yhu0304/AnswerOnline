package com.jlxy.hy.answeronline.action;

import java.util.*;
import com.opensymphony.xwork2.*;

public class ToMyApplayAction extends TipAndFenYeAction {
	private List content; // ��ʾ����
	private String aid;

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	@Override
	public String getSql() {
		String uid = (String) getSession().get("uid"); // �õ���¼�˵�ID
		String role = (String) getSession().get("role");
		if (role.equals("1")) { // ��¼������ʦ
			sql = "select da.AID,da.UID,du.UName,da.TGID,"
					+ "dtg.TGName,da.AReason,da.AFlag,da.AStatus"
					+ " from DY_Apply da,DY_Topic_Group dtg,"
					+ "DY_User du where da.UID=du.UID and da.TGID"
					+ "=dtg.TGID and da.AFlag=0 and da.TGID " + getCourse();// �ѳ�δ���������
		}
		if (role.equals("0")) { // ��½����ѧ��
			sql = "select da.AID,da.UID,du.UName,da.TGID,"
					+ "dtg.TGName,da.AReason,da.AFlag,da.AStatus"
					+ " from DY_Apply da,DY_Topic_Group dtg,"
					+ "DY_User du where da.UID=du.UID and da.TGID"
					+ "=dtg.TGID and da.UID=" + uid + " order by "
					+ "da.AID desc";
		}
		return sql;
	}

	public List getContent() {
		return content;
	}

	public String getLabel() {
		String role = (String) getSession().get("role");
		return role.equals("0") ? "�ҵ�����" : "�����б�";
	}

	@Override
	public String execute() throws Exception {
		Vector<String> v = new Vector<String>(); // ��������SQL������
		if ("cancel".equals(actionStr)) { // ����ĳһ�����������
			tempSql = "delete from DY_Apply where AID=" + aid; // ɾ����SQL���
			dbu.update(tempSql); // ִ�и���
		}
		if ("agree".equals(actionStr)) {
			tempSql = "update DY_Apply set AFlag=1,AStatus="
					+ "'ͬ������' where AID=" + aid; // ���¸������״̬��SQL���
			v.add(tempSql); // ��SQL�����ӽ�����
			tempSql = "select 1 from DY_TU where UID=(select "
					+ "UID from DY_Apply where AID=" + aid + ") and TGID"
					+ "=(select TGID from DY_Apply where AID=" + aid + ")";
			if (!dbu.isExist(tempSql)) { // �������ڸ��ſγ���
				tempSql = "insert into DY_TU(UID,TGID)  select "
						+ "UID,TGID from DY_Apply where AID=" + aid; // ���ϵ���в�������͸ÿεĹ�ϵ
				v.add(tempSql);
			}
			if (dbu.update(v)) { // ��������·������и���
				message = "alert('���봦��ɹ�')";
			} else {
				message = "alert('λ�ô������봦��ʧ��')";
			}
		}
		if ("refuse".equals(actionStr)) {
			tempSql = "update DY_Apply set AFlag=1,AStatus="
					+ "'�ܾ�����' where AID=" + aid;
			if (dbu.update(tempSql)) {
				message = "alert('���봦��ɹ�')";
			} else {
				message = "alert('δ֪�������봦��ʧ��')";
			}
		}
		content = dbu.getApplyContent(getFenYe()); // ��ѯ���ݿ�õ���ҳ��ʾ����
		return SUCCESS;
	}
}
