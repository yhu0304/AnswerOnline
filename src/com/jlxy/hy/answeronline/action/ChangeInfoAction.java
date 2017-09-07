package com.jlxy.hy.answeronline.action;

import java.io.*;
import org.apache.struts2.*;
import com.opensymphony.xwork2.*;

public class ChangeInfoAction extends GetTipAction {
	private String email; // �����ʼ�
	private String savePath; // �ϴ�ͼ�񱣴��ַ
	private File pic; // �ϴ����ļ�����
	private String picContentType; // �ϴ��ļ�����
	private String picFileName; // �ϴ��ļ�������
	private String head; // ����ͼ��·��
	private String sql; // SQL�������

	public String getEmail() {
		return email == null ? "" : email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public File getPic() {
		return pic;
	}

	public void setPic(File pic) {
		this.pic = pic;
	}

	public String getSavePath() {
		return ServletActionContext.getRequest().getRealPath(savePath);
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getPicContentType() {
		return (this.picContentType);
	}

	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}

	public String getPicFileName() {
		return (this.picFileName);
	}

	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	@Override
	public String execute() throws Exception {
		String result = SUCCESS;
		String uid = (String) getSession().get("uid"); //�õ���½��UID
		if ("changeInfo".equals(actionStr)) {
			if (this.getPicFileName() != null) {// �ϴ����ļ�
				int length = this.getPicFileName().length(); // �õ��ϴ��ļ����ַ�������
				int begin = this.getPicFileName().lastIndexOf("."); // �õ��ļ���׺��.����ʼ�±�
				picFileName = (uid + this.getPicFileName().substring(begin,
						length));// �����Լ����ļ���
				picFileName = picFileName.toUpperCase();
				try {
					FileOutputStream fos = // �����ϴ��ļ������
					new FileOutputStream(this.getSavePath() + "\\"
							+ picFileName);
					FileInputStream fis = new FileInputStream(this.getPic()); // �����ļ��ϴ���
					byte[] buffer = new byte[1024]; // ������������
					length = 0;
					while ((length = fis.read(buffer)) > 0) {
						fos.write(buffer, 0, length);
					}
				} catch (Exception e) {
					message = "δ֪���󣬱���ʧ��";
				}
				head = "UserHead/" + picFileName;
				sql = "update DY_User set UHead='" + head + "',UEmail='"
						+ email + "' where UID=" + uid;
			} else { // ֻ�޸���email
				sql = "update DY_User set UEmail='" + email + "' where UID="
						+ uid;
			}
			if (dbu.update(sql)) {
				message = "���ϱ���ɹ�"; // ִ�и���
			} else {
				message = "δ֪���󣬱���ʧ��"; // ����ʧ�ܵ���Ϣ
			}
			// result = SUCCESS;
		}
		// if("getInfo".equals(actionStr)){
		sql = "select UEmail from DY_User where UID=" + uid; // ��ѯEmail��SQL���
		this.email = dbu.getStringInfo(sql); // ִ�в�ѯ�õ�Email
		sql = "select UHead from DY_User where UID=" + uid; // �õ�ͼ��·����SQL���
		this.head = dbu.getStringInfo(sql); // ִ�в�ѯ�õ�ͼ���ַ
		// }
		return result;
	}
}