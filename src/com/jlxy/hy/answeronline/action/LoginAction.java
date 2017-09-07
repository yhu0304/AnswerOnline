package com.jlxy.hy.answeronline.action;

import com.opensymphony.xwork2.*;

import org.springframework.jdbc.core.*;
import org.springframework.stereotype.Controller;

public class LoginAction extends UnameUniqueAction {
	@Override
	public String execute() throws Exception {
		String randNum = (String) getSession().get("randNum"); // �õ�����Session�е���֤��
		randNum = randNum.toUpperCase(); // ����֤��ת��д
		if (!randNum.equals(valcode)) {
			message = "��֤������������������룬���ڽ���ת����½ҳ";
			url = "login.jsp"; // ��֤�����
			return SUCCESS; // ���ص�¼ҳ��
		}
		sql = "select URole from DY_User where UName='" + // �����û�������������
				uname + "' and UPwd='" + pwd + "' and URole<2"; // �����û���URole����
		String role = dbu.getStringInfo(sql); // ִ�������õ���½�û���Ȩ��
		sql = "select UID from DY_User where UName='" + uname + "'"; // �õ��û���ID��SQL
		String uid = dbu.getStringInfo(sql); // ִ�в�ѯ
		if (role != null) {
			getSession().put("uname", uname); // ����½�û����Ž�session
			getSession().put("role", role); // ���û���ɫ�Ž�session
			getSession().put("uid", uid); // ���û�ID�Ž�session
			sql = "update DY_User set ULastLogin=now() where UID=" + uid;
			dbu.update(sql); // �����û�����½ʱ��
			message = "��ӭ������" + uname + "�����ڽ�Ҫ��ת����ҳ";
			url = "IndexAction.action?actionStr=all"; // ��½�ɹ�������ҳ
		} else {
			message = "�û��������벻ƥ�䣬��½ʧ��,���ڽ�Ҫ��ת����½ҳ";
			url = "login.jsp"; // �û��������벻ƥ��
		}
		return SUCCESS; // ���ؽ����ͼ
	}
}