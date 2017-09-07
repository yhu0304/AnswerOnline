package com.jlxy.hy.answeronline.action;

import com.opensymphony.xwork2.*;

public class ChangePwdAction extends DYBaseAction {
	private String oldPwd;
	private String newPwd;
	private String reNewPwd;

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getReNewPwd() {
		return reNewPwd;
	}

	public void setReNewPwd(String reNewPwd) {
		this.reNewPwd = reNewPwd;
	}

	@Override
	public String execute() throws Exception {
		String uid = (String) getSession().get("uid");
		if (uid == null) {
			return LOGIN;
		}
		if (!reNewPwd.equals(newPwd)) {
			message = "�����������벻һ�£���˶�����";
			return SUCCESS;
		}
		String sql = "select 1 from DY_User where UID=" + uid + " and UPwd='"
				+ oldPwd + "'"; // �鿴�����Ƿ���ȷ��SQL���
		if (!dbu.isExist(sql)) { // ���벻��ȷ
			message = "�����벻ƥ�䣬�޸�ʧ��";
		} else {
			sql = "update DY_User set UPwd='" + newPwd + "'" + " where UID="
					+ uid;
			if (dbu.update(sql)) {
				message = "�����޸ĳɹ�����һ�ε�½����������";
			} else {
				message = "δ֪�����޸�ʧ��";
			}
		}
		return SUCCESS;
	}
}