package com.jlxy.hy.answeronline.action;

import java.util.*;
import com.opensymphony.xwork2.*;

public class ManageStuAction extends TipAndFenYeAction {
	private List content; // ��ʾ����
	private String tuid;

	public String getTuid() {
		return tuid;
	}

	public void setTuid(String tuid) {
		this.tuid = tuid;
	}

	@Override
	public String getSql() {
		String uid = (String) getSession().get("uid"); // �õ���¼�˵�ID
		sql = "select dtu.TUID,dtu.UID,du.UName,du.UGender,"
				+ "du.UEmail,du.URegDate,du.ULastLogin,"
				+ "du.UPermit,du.ULastEmit,dtg.TGName from"
				+ " DY_TU dtu,DY_User du,DY_Topic_Group dtg"
				+ " where du.URole=0 and dtu.UID=du.UID and " + "dtu.UID!="
				+ uid + " and dtu.TGID=dtg.TGID " + "and dtu.TGID "
				+ getCourse();
		System.out.println(sql);
		return sql;
	}

	public List getContent() {
		return content;
	}

	@Override
	public String execute() throws Exception {
		if ("del".equals(actionStr)) {
			sql = "delete from DY_TU where TUID=" + tuid;
			if (dbu.update(sql)) {
				message = "alert('ɾ�������ɹ�');";
			} else {
				message = "alert('δ֪����ɾ��ʧ��');";
			}
		}
		content = dbu.getStuList(getFenYe()); // ��ѯ���ݿ�õ���ʾ����
		return SUCCESS;
	}
}