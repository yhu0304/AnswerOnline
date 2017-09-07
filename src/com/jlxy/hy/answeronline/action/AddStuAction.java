package com.jlxy.hy.answeronline.action;

import java.util.Vector;
import com.opensymphony.xwork2.*;

public class AddStuAction extends TipAndFenYeAction {
	private String course; // �γ̺�
	private String stuNO; // ѧ��ѧ��

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getStuNO() {
		return stuNO;
	}

	public void setStuNO(String stuNO) {
		this.stuNO = stuNO;
	}

	@Override
	public String execute() throws Exception {
		Vector<String> v = new Vector<String>(); // ����SQL�������
		StringBuilder sba = new StringBuilder(); // �������ڼ�¼����ɹ�ѧ��ѧ�ŵ��ַ���
		StringBuilder sbb = new StringBuilder(); // ��¼�Ѿ��ڸÿγ��µ�ѧ��ѧ��
		StringBuilder sbc = new StringBuilder(); // ��¼ѧ�Ų����ڵ��ַ���
		String sno[] = stuNO.split(";"); // ��ѧ�Ű��ֺŷֿ�
		int size = sno.length;
		for (int i = 0; i < size; i++) {
			String no = sno[i].trim();
			String sql = "select 1 from DY_User where UID=" + no;// ��ѯ��ѧ�Ŷ�Ӧѧ���Ƿ����
			if (dbu.isExist(sql)) {
				sql = "select 1 from DY_TU where UID=" + no + " and TGID="
						+ course;
				if (dbu.isExist(sql)) { // ��������Ѿ��ڸÿγ���
					sbb.append(no + ";");
				} else {
					sba.append(no + ";"); // ���������������
					v.add("insert into DY_TU(UID,TGID) values (" + no + ","
							+ course + ")");// �����ڵ�ѧ�Ų������ݿ��SQL���
				}
			} else { // ѧ�Ų����ڵļ�¼
				sbc.append(no + ";");
			}
		}
		if (dbu.update(v)) { // ִ�и��²������ݿ�
			message = sba.length() > 0 ? "ѧ��[" + sba.toString()
					+ "]��ѧ������ɹ�<br>" : "";
		}
		message += sbb.length() > 0 ? "ѧ��[" + sbb.toString()
				+ "]��ѧ���Ѿ��ڸÿγ���<br>" : "";
		message += sbc.length() > 0 ? "ѧ��[" + sbc.toString()
				+ "]��ѧ�������ڣ���˶�����<br>" : "";
		return SUCCESS;
	}
}