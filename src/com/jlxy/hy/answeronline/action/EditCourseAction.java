package com.jlxy.hy.answeronline.action;

import java.util.*;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.*;

public class EditCourseAction extends FenYeAction {
	private String tgname; // �γ���
	private String uname; // �γ���ʦ
	private String tgid; // �γ̱��
	private String tdetail; // �γ�����

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getTgid() {
		return tgid;
	}

	public void setTgid(String tgid) {
		this.tgid = tgid;
	}

	public String getTgname() {
		return tgname;
	}

	public void setTgname(String tgname) {
		this.tgname = tgname;
	}

	public String getTdetail() {
		return tdetail;
	}

	public void setTdetail(String tdetail) {
		this.tdetail = tdetail;
	}

	public CourseItem getCourse() {
		sql = "select * from (select a.TGID,a.TGName,a.TDetail,"
				+ "ifnull(b.UID,'') UID,ifnull(b.UName,'---') UName "
				+ "from (select dtg.TGID,dtg.TGName,dtg.TDetail from "
				+ "DY_Topic_Group dtg)a left join(select dtu.TGID,"
				+ "dtu.UID,du.UName from DY_TU dtu,DY_User du where "
				+ "du.URole=1 and du.UID=dtu.UID)b on a.TGID=b.TGID)c"
				+ " where c.TGID=" + tgid;
		return dbu.getCourseInfo(sql);
	}

	@Override
	public String execute() throws Exception {
		if ("save".equals(actionStr)) {
			sql = "update DY_Topic_Group set TGName='" + tgname + "',"
					+ "TDetail='" + tdetail + "' where TGID=" + tgid;
			if (dbu.update(sql)) { // ���¿γ�����
				message = "�γ����ϱ���ɹ�<br>";
			} else {
				message = "δ֪���󣬿γ����ϱ���ʧ��<br>";
			}
			sql = "select 1 from DY_User where URole=1 and UName='" + uname
					+ "'"; // �鿴���û��Ƿ�����ʦ
			if (!dbu.isExist(sql)) { // ������û�����ʦ
				message += "Ϊ�γ�ָ����ʦʧ�ܣ���Ϊ���û�������ʦ";
			} else {
				String lastTname = ServletActionContext.getRequest().getParameter("lastTname");
				sql = "select TUID from DY_TU where TGID=" + tgid
						+ " and UID=(select UID from"
						+ " DY_User where UName='" + lastTname + "')"; // �ѳ��ÿγ̺���ʦID�Ĺ�ϵ��¼����
				String tuid = dbu.getStringInfo(sql);
				if (tuid != null) { 
					sql = "update DY_TU set UID=(select UID from DY_User where UName='"
							+ uname + "') where TUID=" + tuid;
				} else {
					tuid = dbu.getStringInfo("select UID from"
						+ " DY_User where UName='" + uname + "'");
					System.out.println(tgid+"  "+tuid);
					sql = "insert into DY_TU(UID,TGID) values ('" + tuid + "','" + tgid + "')";
				}
				if (dbu.update(sql)) {
					message += "�Ŀγ���ʦ�����޸ĳɹ�";
				} else {
					message += "δ֪������ʦ��Ϣ�޸�ʧ��";
				}
			}
		}
		if ("add".equals(actionStr)) {
			sql = "insert into DY_Topic_Group(TGName,TDetail) values ('"
					+ tgname + "','" + tdetail + "')";
			if (dbu.update(sql)) { // ����¿γ̳ɹ�
				message = "�¿γ���ӳɹ�";
			} else {
				message += "δ֪�����¿γ����ʧ��";
			}
		}
		return SUCCESS;
	}
}