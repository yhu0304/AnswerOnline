package com.jlxy.hy.answeronline.action;

import java.util.*;
import com.opensymphony.xwork2.*;

public class ToUserListAction extends FenYeAction {
	private List content; // ��ʾ����
	private String key; // ��������
	private String value; // ���ҹؼ���
	private String condition; // ����
	private String selected; // ����ѡ��
	private String uid; // �û�ID����

	public void setCondition(String condition) {
		this.selected = condition;
		if ("all".equals(condition)) { // ��ʾ�����û�
			condition = " where URole<2";
		}
		if ("stu".equals(condition)) { // ��ʾѧ���û�
			condition = " where URole=0";
		}
		if ("teacher".equals(condition)) { // ��ʾ��ʦ�û�
			condition = " where URole=1";
		}
		this.setCurPage(1); // ������ʾ��һҳ
		getSession().put("condition", condition);
	}

	public String getSelected() {
		return selected;
	}

	public String getCondition() {
		return (String) getSession().get("condition");
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		condition = " where " + getKey() + " like '%" + value
				+ "%' and URole<2";
		this.setCurPage(1);
		getSession().put("condition", condition);
		this.value = value;
	}

	@Override
	public String getSql() {
		sql = "select UID,UName,UGender,UEmail,URegDate,"
				+ "ULastLogin,ULastEmit,UPermit,URole from DY_User"
				+ getCondition();
		return sql;
	}

	public List getContent() {
		return content;
	}

	@Override
	public String execute() throws Exception {
		if ("del".equals(actionStr)) { // ɾ���û��Ķ���
			sql = "delete from DY_User where UID=" + uid;
			if (dbu.update(sql)) {
				message = "alert('ɾ��IDΪ" + uid + "�û��ɹ�')";
			} else {
				message = "alert('δ֪����ɾ��ʧ��')";
			}
			this.setCurPage(1);
		}
		if ("jy".equals(actionStr)) { // ����ĳ���û�
			sql = "update DY_User set UPermit=0 where UID=" + uid;
			dbu.update(sql); // ִ�и���
		}
		if ("hf".equals(actionStr)) {
			sql = "update DY_User set UPermit=1 where UID=" + uid;
			dbu.update(sql); // ִ�и���
		}
		if ("setTeacher".equals(actionStr)) {
			sql = "select 1 from DY_TU where UID=" + uid; // �鿴���û��Ƿ�����ĳ�γ�
			if (dbu.isExist(sql)) { // ������û�����ĳ�γ̣���Ϊѧ���û�
				message = "alert('IDΪ[" + uid + "]���û�Ϊѧ���û�������ָ��Ϊ��ʦ')";
			} else {
				sql = "update DY_User set URole=1 where UID=" + uid;
				dbu.update(sql);
			}
		}
		if ("cancelTeacher".equals(actionStr)) {
			sql = "update DY_User set URole=0 where UID=" + uid;
			dbu.update(sql);
		}
		content = dbu.getUserList(getFenYe()); // ��ѯ���ݿ�õ���ʾ����
		return SUCCESS;
	}
}