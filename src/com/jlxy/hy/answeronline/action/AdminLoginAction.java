package com.jlxy.hy.answeronline.action;

import com.opensymphony.xwork2.*;
import org.springframework.jdbc.core.*;

public class AdminLoginAction extends UnameUniqueAction {
	public String execute() throws Exception {
		sql = "select URole from DY_User where UName='" + uname
				+ "' and UPwd='" + pwd + "' and URole>1";
		String randNum = (String) getSession().get("randNum"); // �õ�����Session�е���֤��
		randNum = randNum.toUpperCase(); // ����֤��ת��д
		if (!randNum.equals(valcode)) {
			message = "��֤��������󣬵�½ʧ�ܣ����ڽ���ת����½ҳ";
			url = "adminLogin.jsp";
			return SUCCESS;
		}
		String role = dbu.getStringInfo(sql); // ִ�������õ���½�û���Ȩ��
		sql = "select UID from DY_User where UName='" + uname + "'"; // �õ��û���ID��SQL
		String uid = dbu.getStringInfo(sql); // ִ�в�ѯ
		if (role != null) {
			getSession().put("uname", uname); // ����½�û����Ž�session
			getSession().put("role", role); // ���û���ɫ�Ž�session
			getSession().put("uid", uid); // ���û�ID�Ž�session
			sql = "update DY_User set ULastLogin=now() where UID=" + uid;
			dbu.update(sql); // �����û�����½ʱ��
			message = "��ӭ������" + uname + "�����ڽ�Ҫ��ת��������ҳ";
			url = "adminIndex.jsp";
		} else {
			message = "�û��������벻ƥ�䣬��½ʧ��,���ڽ�Ҫ��ת����½ҳ";
			url = "adminLogin.jsp";
		}
		return SUCCESS;
	}
}