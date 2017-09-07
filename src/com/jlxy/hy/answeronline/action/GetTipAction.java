package com.jlxy.hy.answeronline.action;

import com.opensymphony.xwork2.*;

public class GetTipAction extends DYBaseAction {
	private String apply; // δ�����������Ŀ
	private String question; // δ�ش���������Ŀ

	public String getApply() {
		String uid = (String) getSession().get("uid");// �õ���½���˵�UID
		String sql = "select count(*) from (select 1 from"
				+ " DY_Apply da,DY_Topic_Group dtg,DY_User du "
				+ "where da.UID=du.UID and da.TGID=dtg.TGID and"
				+ " da.AFlag=0 and da.TGID in(select TGID from "
				+ "DY_TU dtu where dtu.UID=" + uid + "))a"; // �ѳ�δ����������Ŀ��SQL���
		return dbu.getStringInfo(sql);
	}

	public String getQuestion() {
		String uid = (String) getSession().get("uid");// �õ���½���˵�UID
		String sql = "select count(*) from (select dta.TID"
				+ " tid from DY_Topic dta,DY_User du,DY_Topic_Group"
				+ " dtg where du.UID=dta.UID and dta.TGID=dtg.TGID "
				+ "and dta.TID not in (select distinct TID from "
				+ "DY_Revert where UID=" + uid + ") and dtg.TGID in "
				+ "(select TGID from DY_TU dtu where dtu.UID=" + uid + "))a";
		return dbu.getStringInfo(sql);
	}

	@Override
	public String execute() throws Exception {
		if (getSession().get("uid") == null) { // ����û�û�е�½
			return LOGIN; // ����LOGIN��ͼ
		}
		return SUCCESS;
	}
}