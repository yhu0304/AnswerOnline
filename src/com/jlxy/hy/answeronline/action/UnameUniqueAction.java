package com.jlxy.hy.answeronline.action;

import java.net.*;
import com.opensymphony.xwork2.*;

public class UnameUniqueAction extends DYBaseAction {
	protected String uname; // Ҫ��֤���û���
	protected String pwd; // �û�ע�������
	protected String sql; // ����SQL�������
	protected String valcode; // �û��������֤��

	public void setUname(String uname) {
		try {
			this.uname = URLDecoder.decode(uname, "utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getUname() {
		return uname;
	}

	public String getValcode() {
		return valcode; // ��֤�����Ե�getter����
	}

	public void setValcode(String valcode) { // ��֤�����Ե�setter����
		this.valcode = valcode.toUpperCase(); // ��ת��д
	}

	public String getPwd() {
		return pwd; // �������Ե�getter����
	}

	public void setPwd(String pwd) {
		this.pwd = pwd; // �������Ե�set����
	}

	public boolean getFlag() { // �����Ƿ��ע��ı�־λ
		sql = "select UID from DY_User where UName='" + uname + "'";// trueΪ�û�������
		return dbu.isExist(sql);
	}

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
}