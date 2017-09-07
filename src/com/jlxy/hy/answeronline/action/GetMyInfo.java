package com.jlxy.hy.answeronline.action;

public class GetMyInfo extends GetTipAction {
	private User user;

	public void setUser(User user) {
		this.user = user; // user���Ե�setter����
	}

	public User getUser() {
		return user;
	}

	@Override
	public String execute() throws Exception {
		String uid = (String) getSession().get("uid"); // �õ���½�û���ID
		String sql = "select UID,UName,UGender,UEmail,URole"
				+ ",UHead,URegDate,ULastLogin,ULastEmit,UPermit"
				+ " from DY_User where UID=" + uid; // �����û����ϵ�SQL���
		this.setUser(dbu.getUserInfo(sql));
		return SUCCESS;
	}
}