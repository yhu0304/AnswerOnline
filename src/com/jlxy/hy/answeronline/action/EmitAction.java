package com.jlxy.hy.answeronline.action;

import com.opensymphony.xwork2.*;

public class EmitAction extends DYBaseAction {
	private String bt; // �������
	private String nr; // ��������
	private int tid; // ���ظ�����ID
	private int tgid; // ��������Ŀγ�

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		System.out.println("set:" + tid);
		this.tid = tid;
	}

	public int getTgid() {
		return tid;
	}

	public void setTgid(int tgid) {
		this.tgid = tgid;
	}

	public String getBt() {
		return bt;
	}

	public void setBt(String bt) {
		this.bt = bt;
	}

	public String getNr() {
		return nr;
	}

	public void setNr(String nr) {
		this.nr = nr;
	}

	@Override
	public String execute() throws Exception {
		String sql = "";
		String uid = (String) getSession().get("uid");
		sql = "select UPermit from DY_User where UID=" + uid;
		String permit = dbu.getStringInfo(sql);
		if (actionStr.equals("hftz")) { // �����ǻظ�����
			if (permit.equals("0")) { // û��Ȩ��
				message = "�Բ�����û�з����Ȩ�ޣ�����ϵ����Ա���";
				url = "TTDAction.action?tid=" + tid + "&actionStr=maxPage";
				return SUCCESS;
			}
			sql = "select 1 from DY_Topic where TID=" + tid;
			if (!dbu.isExist(sql)) {
				message = "�Բ�����ظ������ⲻ����";
				url = "IndexAction.action?actionStr=all";
				return SUCCESS;
			}
			sql = "insert into DY_Revert(TID,UID,RTitle,"
					+ "RContent,RDate) values('" + tid + "','" + uid + "','"
					+ bt + "','" + nr + "',now())";
			if (dbu.update(sql)) {
				message = "�ظ��ɹ������ڽ�Ҫ��ת������ҳ��";
				url = "TTDAction.action?tid=" + tid;
			}
		}
		if (actionStr.equals("fqwt")) { // ����������
			if (permit.equals("0")) { // û��Ȩ��
				message = "�Բ�����û�з����Ȩ�ޣ�����ϵ����Ա���";
				url = "TTLAction.action?tgid=" + tgid;
				return SUCCESS;
			}
			sql = "insert into DY_Topic(UID,TGID,TTitle,"
					+ "TContent,TDate)values ('" + uid + "'," + tgid + ",'"
					+ bt + "','" + nr + "',now())";
			if (dbu.update(sql)) { // �ɹ�����������
				message = "�����ⷢ��ɹ������ڽ�Ҫ��ת���ÿγ������б�ҳ��";
				url = "TTLAction.action?tgid=" + tgid;
			}
		}
		sql = "update DY_User set ULastEmit=now() where UID=" + uid;
		dbu.update(sql); // �����û���󷢱��ʱ��
		return SUCCESS;
	}
}