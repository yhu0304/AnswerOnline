package com.jlxy.hy.answeronline.action;

import com.opensymphony.xwork2.*;

public class ApplyAction extends DYBaseAction {
	private String tgid; // ����γ̵ı��
	private String reason; // ����γ̵�ԭ��

	public void setTgid(String tgid) {
		this.tgid = tgid;
	}

	public String getTgid() {
		return tgid;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getReason() {
		return reason;
	}

	@Override
	public String execute() throws Exception {
		System.out.println(tgid + "====" + reason);
		String sql = "select 1 from DY_Topic_Group where TGID=" + getTgid();
		if (!dbu.isExist(sql)) {
			url = "apply.jsp"; // �˿β�������ת����ҳ
			message = "�ÿγ̺Ŷ�Ӧ�Ŀγ̲����ڣ����ڽ���ת������ҳ";
			return SUCCESS;
		}
		String uid = (String) getSession().get("uid");
		sql = "select 1 from DY_Apply where TGID=" + tgid + " and UID='" + uid
				+ "'" + " and AFlag=0"; // ������ڸ�ѧ���Ը��ſ�û�д��������ʱ
		if (dbu.isExist(sql)) {
			url = "apply.jsp";
			message = "���Ѿ�������ÿγ̣������ĵȴ�����";
			return SUCCESS;
		}
		sql = "select 1 from DY_TU where TGID=" + tgid + " and UID='" + uid
				+ "'";
		if (dbu.isExist(sql)) {
			url = "apply.jsp";
			message = "���Ѿ��Ǹÿγ�ѧ������������";
			return SUCCESS;
		}
		String role = (String) getSession().get("role");
		if (!"0".equals(role)) { // Ŀǰ��½�Ĳ���ѧ��
			url = "IndexAction.action";
			message = "�����ݲ���ѧ��������Ҫ����γ̣����ڽ�Ҫ��ת����ҳ";
			return SUCCESS;
		}
		sql = "insert into DY_Apply(TGID,UID,AReason)values (" + tgid + ",'"
				+ uid + "','" + reason + "')";
		if (dbu.update(sql)) {
			url = "IndexAction.action";
			message = "�����ύ�ɹ��������ĵȴ������ڽ�Ҫ��ת����ҳ";
			return SUCCESS;
		} else {
			url = "apply.jsp";
			message = "δ֪���������ύʧ�ܣ����ڽ�Ҫ��ת������ҳ��";
			return SUCCESS;
		}
	}
}