package com.jlxy.hy.answeronline.action;

import java.util.*;
import com.opensymphony.xwork2.*;

public class TopicListAction extends FenYeAction {
	private int tgid;

	public void setTgid(int tgid) { // tgid���Ե�set����
		this.tgid = tgid; // ����tgid��ֵ
		getSession().put("tgid", tgid); // ����ֵ�Ž�session��
		this.setCurPage(1); // ���õ�ǰҳ��ʾ��һҳ
	}

	public int getTgid() { // �õ��γ�ID
		return (Integer) getSession().get("tgid");
	}

	@Override
	public String getSql() {
		sql = "select a.tid,a.gname,a.ftr,a.title,a.djs,a.ftsj,"
				+ "ifnull(c.htr,a.ftr) htr,ifnull(c.htsj,a.ftsj) htsj,"
				+ "ifnull(c.revert,0) revert from(select dta.TID tid,"
				+ "dtg.TGName gname,du.UName ftr,dta.TTitle title,"
				+ "dta.TReadCount djs,dta.TDate ftsj from DY_Topic "
				+ "dta,DY_User du,DY_Topic_Group dtg where dta.TGID="
				+ "dtg.TGID and du.UID=dta.UID and dta.TGID=" + getTgid()
				+ ")a left join(select b.tid,du.UName htr,dra.RDate htsj,"
				+ "b.revert from (select TID tid,max(RID) RID,count(RID)"
				+ " revert from DY_Revert group by TID order by TID)b,"
				+ "DY_Revert dra,DY_User du where b.RID=dra.RID and "
				+ "du.UID=dra.UID)c on a.tid=c.tid order by htsj desc";
		return sql;
	}

	public List getContent() {
		return dbu.getGroupContent(getFenYe());// �õ�ҳ����ʾ����
	}

	public String getGName() {
		tempSql = "select TGName from DY_Topic_Group where" + " TGID="
				+ getTgid();
		return dbu.getStringInfo(tempSql);
	}

	@Override
	public String execute() throws Exception {
		String role = (String) getSession().get("role");
		String uid = (String) getSession().get("uid");
		if ("0".equals(role)) {
			tempSql = "select 1 from DY_TU where UID=" + uid + " and TGID="
					+ getTgid();
			if (!dbu.isExist(tempSql)) { // ��ѧ�����������ſ�
				tempSql = "select 1 from DY_Apply da where UID=" + uid
						+ " and AFlag=0 and TGID=" + getTgid(); // �鿴�Ƿ����ύ���ſε����벢��û�д���
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
		return SUCCESS; // ����SUCCESS�ַ���
	}
}