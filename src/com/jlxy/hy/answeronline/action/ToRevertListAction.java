package com.jlxy.hy.answeronline.action;

import java.util.*;
import com.opensymphony.xwork2.*;

public class ToRevertListAction extends FenYeAction {
	private List content; // ��ʾ����
	private String rid;
	private String title; // ĳһ���ʵı���
	private String nr; // ĳһ���ʵ�����
	private String key; // �����ؼ���

	public void setKey(String key) {
		key = " and RContent like '%" + key + "%'";
		getSession().put("key", key);
		this.setCurPage(1);
	}

	public String getKey() {
		return (String) getSession().get("key");
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getTitle() {
		return title;
	}

	public String getNr() {
		return nr;
	}

	@Override
	public String getSql() {
		if ("all".equals(actionStr)) {
			getSession().put("key", "");
		}
		sql = "select dr.RID,dr.RContent,du.UName,RDate "
				+ "from DY_User du,DY_Revert dr where du.UID=" + "dr.UID"
				+ getKey();
		System.out.println(sql);
		return sql;
	}

	public List getContent() {
		return content;
	}

	@Override
	public String execute() throws Exception {
		if ("del".equals(actionStr)) { // ɾ���ظ�
			sql = "delete from DY_Revert where RID=" + rid;
			dbu.update(sql);
		}
		if ("detail".equals(actionStr)) { // �鿴����
			sql = "select RTitle from DY_Revert where RID=" + rid;
			title = dbu.getStringInfo(sql); // ִ�������õ��ظ�����
			sql = "select RContent from DY_Revert where RID=" + rid;
			nr = dbu.getStringInfo(sql);
		}
		content = dbu.getRevertList(getFenYe()); // ��ѯ���ݿ�õ���ҳ��ʾ����
		return SUCCESS;
	}
}