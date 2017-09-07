package com.jlxy.hy.answeronline.action;

import java.util.*;
import com.opensymphony.xwork2.*;

public class AdminManageAction extends FenYeAction {
	private List content; // ��ʾ����
	private String uid; // ����ԱID

	private String uname; // ����Ա��
	private String pwda; // ����Ա����
	private String pwdb; // ȷ������
	private String role; // ����Ա����

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPwda() {
		return pwda;
	}

	public void setPwda(String pwda) {
		this.pwda = pwda;
	}

	public String getPwdb() {
		return pwdb;
	}

	public void setPwdb(String pwdb) {
		this.pwdb = pwdb;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String getSql() {
		sql = " select UID,UName,URole from DY_User where URole>1";
		return sql;
	}

	public List getContent() {
		return content;
	}

	@Override
	public String execute() throws Exception {
		if ("del".equals(actionStr)) {
			sql = "delete from DY_User where UID=" + uid;
			if (dbu.update(sql)) {
				message = "alert('�ɹ�ɾ������Ա')";
			} else {
				message = "alert('δ֪����ɾ��ʧ��')";
			}
			this.setCurPage(1);
		}
		if ("add".equals(actionStr)) { // ��ӹ���Ա
			if (!pwda.equals(pwdb)) { // �������벻��ͬ
				message = "�����������벻һ������˶�����";
			}
			sql = "select 1 from DY_User where UName='" + uname + "'";// ��֤�û����Ƿ����
			if (dbu.isExist(sql)) { // �û����Ѿ�����
				message = "�������ѱ�ռ�ã�������ѡ��һ��";
				return SUCCESS;
			}
			sql = "insert into DY_User(UName,UPwd,URole) value" + "('" + uname
					+ "','" + pwda + "'," + role + ")";
			if (dbu.update(sql)) { // ִ����Ӷ���
				message = "����Ա��ӳɹ�";
			} else {
				message = "δ֪�������ʧ��"; // ���ʧ�ܵ���Ϣ
			}
		}
		if ("resetPwd".equals(actionStr)) {
			if (!pwda.equals(pwdb)) { // �������벻��ͬ
				message = "�����������벻һ������˶�����";
			}
			sql = "select 1 from DY_User where UName='" + uname + "'";// ��֤�û����Ƿ����
			if (!dbu.isExist(sql)) { // �û����Ѿ�����
				message = "û�и����ֵ��˺�";
				return SUCCESS;
			}
			sql = "update DY_User set UPwd='" + pwda + "' where UName='"
					+ uname + "'";
			if (dbu.update(sql)) { // ִ����Ӷ���
				message = "�������óɹ�";
			} else {
				message = "δ֪��������ʧ��"; // ���ʧ�ܵ���Ϣ
			}
		}
		if ("all".equals(actionStr)) {
			this.setCurPage(1);
		}
		content = dbu.getManageList(getFenYe()); // ��ѯ���ݿ�õ���ҳ��ʾ����
		System.out.println(content.size());
		return SUCCESS;
	}
}