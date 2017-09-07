package com.jlxy.hy.answeronline.action;

import java.util.*;
import com.opensymphony.xwork2.*;

public class FenYeAction extends DYBaseAction {
	protected int curPage = 1; // ��ǰҳ��
	protected int span = 5; // ÿҳ��ʾ��¼����
	protected String sql; // SQL�������
	protected String tempSql; // ��ʱSQL�������

	public String getSql() {
		return sql; // ����SQL���
	}

	public String getFenYe() {
		Integer a = (Integer) getSession().get("curPage");
		Integer b = (Integer) getSession().get("span");
		if (a != null) { // �����ǰҳ��Ϊ��
			curPage = a; // ��curPage���ڵ�ǰҳ��ֵ
		}
		if (b != null) { // ���ÿҳ��ʾ��¼������Ϊ��
			span = b; // ��span����ÿҳ��ʾ��¼����
		}
		int startRow = (curPage - 1) * span;// ����Ҫ��ȡ��¼����ʼ��
		String fenye = "select * from (" + getSql() + ")a limit " + startRow + "," + span;
		return fenye;
	}

	public int getTotal() {
		return dbu.getTotal(getSql(), getSpan());// ִ�в�ѯ�õ���ҳ��
	}

	public Map getPageList() {
		Map map = new HashMap(); // ����Map����
		int max = getTotal(); // �õ����ҳ��
		for (int i = 1; i <= max; i++) { // ѭ������Map�еļ���ֵ
			map.put(i, "��" + i + "ҳ"); // ������ֵ�Ž�Map��
		}
		return map; // ����Map����
	}

	public int getCurPage() { // curPage��get����
		return curPage; // ����curPage��ֵ
	}

	public void setCurPage(int curPage) {// curPage��set����
		this.curPage = curPage; // ����curPage��ֵ
		getSession().put("curPage", curPage);
	}

	public int getSpan() { // span��get����
		return span; // ����span��ֵ
	}

	public void setSpan(int span) { // span��set����
		this.span = span; // ����span��ֵ
		this.setCurPage(1); // ���õ�ǰ��ʾ��һҳ
		getSession().put("span", span);
	}

	@Override
	public String execute() throws Exception { // execute����
		return SUCCESS; // ����SUCCESS
	}
}