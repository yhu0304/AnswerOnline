package com.jlxy.hy.answeronline.action;

import com.opensymphony.xwork2.*;
import org.springframework.jdbc.core.*;

public class RegAction extends UnameUniqueAction {
	private String gender; // �û��Ա�
	private String email; // �����ʼ�

	public String getGender() {
		return gender; // �Ա����Ե�get����
	}

	public void setGender(String gender) {
		this.gender = gender; // �Ա����Ե�set����
	}

	public String getEmail() {
		return email; // �����ʼ���get����
	}

	public void setEmail(String email) {
		this.email = email; // �����ʼ����Ե�set����
	}

	public String execute() throws Exception {
		String randNum = (String) getSession().get("randNum"); // �õ�����Session�е���֤��
		randNum = randNum.toUpperCase(); // ����֤��ת��д
		if (!randNum.equals(valcode)) { // �����֤�벻��ͬ
			message = "��֤���������ע��ʧ�ܣ����������롣��" + "�ڽ�Ҫ��ת��ע��ҳ��"; // ������ʾ��Ϣ
			url = "reg.jsp";
			return SUCCESS;
		}
		if (this.getFlag()) { // ע�����Ѿ�����
			message = "����ע����û����Ѿ����ڣ����������롣��" + "�ڽ�Ҫ��ת��ע��ҳ��"; // ������ʾ��Ϣ
			url = "reg.jsp";
			return SUCCESS;
		}
		sql = "insert into DY_USer(UName,UPwd,UGender,UEmail,"
				+ "URegDate,ULastLogin,ULastEmit) values('" + uname + "','"
				+ pwd + "','" + gender + "','" + email + "',now(),now(),now())"; // �������û���SQL
		if (dbu.update(sql)) {
			message = "��ϲ����ע��ɹ�����ӭ��������ѧԺ��" + "���ڽ�Ҫ��ת����ҳ"; // ע��ɹ�����ʾ��Ϣ
			url = "IndexAction.action?actionStr=all"; // ��ת����ҳ
		} else {
			message = "δ֪����ע��ʧ�ܡ����ڽ�Ҫ��ת��ע��ҳ��"; // ע��ʧ����Ϣ
			url = "reg.jsp"; // ����ע��ҳ��
		}
		return SUCCESS;
	}
}