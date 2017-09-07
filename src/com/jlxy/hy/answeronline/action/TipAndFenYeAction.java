package com.jlxy.hy.answeronline.action;

import java.util.Map;
import java.util.HashMap;
import com.opensymphony.xwork2.*;

public class TipAndFenYeAction extends FenYeAction {
	protected String selected; // ��ѯ����

	public void setCourse(String course) {
		this.selected = course; // �����б���ѡ������
		String uid = (String) getSession().get("uid"); // �õ���¼�˵�ID
		this.setCurPage(1); // ������ʾ��һҳ
		if ("all".equals(course)) {
			course = "in (select TGID from DY_TU dtu" + " where dtu.UID=" + uid
					+ ")"; // ����ƴ��SQL�����־�
		} else { // ��ʾ��ĳһ�γ��µ�����
			course = "=" + course; // �����������嵽ĳһ�γ�ID
		}
		System.out.println("=====" + course + "======" + selected);
		getSession().put("course", course);
	}

	public String getCourse() {
		return (String) getSession().get("course");
	}

	public String getSelected() {
		return selected;
	}

	public String getApply() {
		String uid = (String) getSession().get("uid");// �õ���½���˵�UID
		String sql = "select count(*) from (select 1 from"
				+ " DY_Apply da,DY_Topic_Group dtg,DY_User du "
				+ "where da.UID=du.UID and da.TGID=dtg.TGID and"
				+ " da.AFlag=0 and da.TGID in(select TGID from "
				+ "DY_TU dtu where dtu.UID=" + uid + "))a"; // �ѳ�δ����������Ŀ��SQL���
		return dbu.getStringInfo(sql);
	}

	public String getQuestion() {
		String uid = (String) getSession().get("uid");// �õ���½���˵�UID
		String sql = "select count(*) from (select dta.TID"
				+ " tid from DY_Topic dta,DY_User du,DY_Topic_Group"
				+ " dtg where du.UID=dta.UID and dta.TGID=dtg.TGID "
				+ "and dta.TID not in (select distinct TID from "
				+ "DY_Revert where UID=" + uid + ") and dtg.TGID in "
				+ "(select TGID from DY_TU dtu where dtu.UID=" + uid + "))a";
		return dbu.getStringInfo(sql);
	}

	public Map getCourseList() {
		Map map = new HashMap(); // ����һHashMap����
		map.put("all", "���пγ�"); // Ϊmap������пγ�ѡ��
		String uid = (String) getSession().get("uid"); // �õ���½�û���ID
		String sql = "select dtg.TGID tgid,TGName gname from "
				+ "DY_Topic_Group dtg,DY_TU dt where dt.TGID="
				+ "dtg.TGID and dt.UID=" + uid; // �õ��û�ѡ���б��SQL���
		map.putAll(dbu.getCourse(sql)); // ִ�в�ѯ�õ�Map�γ��б�
		return map;
	}

	@Override
	public String execute() throws Exception {
		if ("addStu".equals(actionStr)) {
			this.url = "addStu.jsp";
		}
		return SUCCESS;
	}
}