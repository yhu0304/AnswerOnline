package com.jlxy.hy.answeronline.action;

import java.util.List;
import com.opensymphony.xwork2.*;
import org.springframework.jdbc.core.*;

public class IndexAction extends FenYeAction {
	private String condition; // ��������
	private String key; // ���ҹؼ���
	private List content; // ��ҳ��ʾ����

	public void setCondition(String condition) {
		this.condition = condition; // ���ò�ѯ��������ֵ
		this.setCurPage(1); // ���õ�ǰ��ʾ��һҳ
		getSession().put("condition", condition);// ����ѯ�����Ž�session
	}

	public void setKey(String key) {
		this.key = key; // ���ò�ѯ�ؼ��ֵ�����ֵ
		this.setCurPage(1); // ������ʾ��һҳ
		getSession().put("key", key); // ����ѯ�ؼ��ַŽ�session
	}

	@Override
	public String getSql() {
		sql = "select dtg.TGID gid,dtg.TGName gname,dtg.TDetail"
				+ " detail,count(a.TID) topic,sum(ifnull(a.revert,0))"
				+ " revert,ifnull(a.uname,'') uname,ifnull(a.tid,'') "
				+ "tid,ifnull(a.title,'') title,ifnull(a.lastTime,'')"
				+ " lastTime from DY_Topic_Group dtg left join(select"
				+ " du.UName uname,d.gid,d.tid,d.revert,d.title,"
				+ "d.lastTime from DY_User du,(select dtb.TGID gid,"
				+ "dtb.TID tid,dtb.TTitle title,ifnull(b.revert,0) "
				+ "revert,ifnull(b.uid,dtb.UID) UID,"
				+ "ifnull(b.lastTime,dtb.TDate) lastTime from DY_Topic"
				+ " dtb left join(select c.tid,c.revert,dra.UID uid,"
				+ "dra.RDate lastTime from(select TID tid,max(RID) RID"
				+ ",count(RID) revert from DY_Revert group by TID)c,"
				+ "DY_Revert dra where c.RID=dra.RID)b on dtb.TID=b.tid"
				+ " order by gid asc,lastTime desc)d where du.UID=d.UID"
				+ ")a on dtg.TGID=a.gid"; // ��������ҳ��ʾ���ݵ�SQL���
		String role = (String) getSession().get("role"); // �õ���½�˵Ľ�ɫ
		String uid = (String) getSession().get("uid"); // �õ���¼�˵�ID
		if ("all".equals(actionStr)) { // ��ʾ���пγ̵�����
			getSession().put("key", ""); // ���������ؼ���Ϊ��
		}
		if (getSession().get("condition") != null) {
			sql = sql + " where " + getSession().get("condition") + " like '%"
					+ getSession().get("key") + "%'"; // ƴװ����SQL���
		}
		sql = sql + " group by dtg.TGID";
		if ("1".equals(role)) { // ��½������ʦ
			sql = "select * from (" + sql + ")f,DY_TU dtu where f.gid"
					+ "=dtu.TGID and dtu.UID=" + uid; // �ѳ���ʦ�Ŀγ�
		}
		return sql; // ����SQL�ַ���
	}

	public List getIndexList() {
		return content; // ��ʾ���ݵ�getter����
	}

	@Override
	public String execute() throws Exception {
		content = dbu.getIndexContent(getFenYe()); // ��ѯ���ݿ�õ���ҳ��ʾ����
		return SUCCESS;
	}
}