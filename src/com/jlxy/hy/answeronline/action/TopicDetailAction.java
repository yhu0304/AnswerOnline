package com.jlxy.hy.answeronline.action;

import java.util.*;
import com.opensymphony.xwork2.*;

public class TopicDetailAction extends FenYeAction {
	private int tid; // ����ID

	public void setTid(int tid) {
		this.tid = tid; // ��������ID��ֵ
		getSession().put("tid", tid); // ������ID�Ž�session
		this.setCurPage(1); // ���õ�ǰ��ʾ��һҳ
	}

	public int getTid() {
		return (Integer) getSession().get("tid"); // ��������ID
	}

	@Override
	public String getSql() {
		sql = "select du.UName uname,a.tag,a.gender,a.tx"
				+ ",a.zcsj,a.zhdl,b.title,b.content,b.fbsj from("
				+ "select du.UID uid,du.UGender "
				+ "gender,du.UHead tx,du.URegDate "
				+ "zcsj,ifnull(du.ULastLogin,'xx') zhdl,case "
				+ "du.URole when 0 then 'ѧ��' when 1 then '��ʦ'"
				+ " when 2 then '����Ա' end tag	from DY_User du) "
				+ "a,(select dt.UID uid,dt.TTitle title,dt.TContent"
				+ " content,dt.TDate fbsj	from DY_Topic dt where "
				+ "dt.TID="
				+ getTid()
				+ " union	select dr.UID uid,"
				+ "dr.RTitle title,dr.RContent content,dr.RDate fbsj"
				+ " from DY_Revert dr	where dr.TID="
				+ getTid()
				+ ")b,"
				+ "DY_User du where a.uid=b.uid and a.uid=du.UID order by b.fbsj"; // ����SQL����ֵ
		return sql; // ����SQL���
	}

	public List getContent() {
		return dbu.getTopicDetail(getFenYe()); // �õ�ҳ����ʾ����
	}

	public int getGid() { // �õ���ǰ���ʶ�Ӧ�Ŀγ�ID
		tempSql = "select TGID from DY_Topic where TID=" + getTid();
		return Integer.parseInt(dbu.getStringInfo(tempSql));
	}

	public String getGName() {
		tempSql = "select TGName from DY_Topic dt,DY_Topic_Group"
				+ " dtg where dt.TGID=dtg.TGID and dt.TID=" + getTid(); // �õ����ʶ�Ӧ�γ�����SQL���
		return dbu.getStringInfo(tempSql); // ִ�в�ѯ�����ؽ��
	}

	public String getTitle() {
		tempSql = "select TTitle from DY_Topic where TID=" + getTid(); // �õ����ʱ����SQL���
		return dbu.getStringInfo(tempSql); // ִ�в�ѯ���ؽ��
	}

	public String execute() throws Exception {
		String uid = (String) getSession().get("uid");// �õ���½���û�
		if ("maxPage".equals(actionStr)) { // ����������ʾ���һҳ
			this.setCurPage(getTotal()); // ������ʾ���һҳ
		}
		tempSql = "select TGID from DY_Topic where TID=" + tid;
		String tgid = dbu.getStringInfo(tempSql); // ��ѯ�õ�������������γ̺�
		if ("yz".equals(actionStr)) {
			tempSql = "select 1 from DY_TU where UID=" + uid + " and TGID="
					+ "(select TGID from DY_Topic where TID=" + tid + ")";
			if (!dbu.isExist(tempSql)) {
				tempSql = "select 1 from DY_Apply da where UID=" + uid
						+ " and AFlag=0 and TGID=" + tgid; // �鿴�Ƿ����ύ���ſε����벢��û�д���
				if (dbu.isExist(tempSql)) {
					url = "IndexAction.action?actionStr=all";
					message = "���Ѿ��ύ�˸��ſε����룬�����ĵȴ�";
				} else {
					url = "apply.jsp?tgid=" + tgid;
					message = "�Բ�����ûѡ�����ſΣ�������������ſ�";
				}
				return ERROR;
			}
		}
		tempSql = "update DY_Topic set TReadCount=TReadCount+1 where" + " TID="
				+ tid;
		dbu.update(tempSql); // ���Ķ�������һ
		return SUCCESS; // ����SUCCESS�ַ���
	}
}
