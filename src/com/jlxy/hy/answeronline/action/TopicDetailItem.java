package com.jlxy.hy.answeronline.action;

public class TopicDetailItem {
	private String uname; // ���ӷ�����
	private String gender; // �Ա�
	private String tx; // ͷ��·��
	private String zcsj; // ע��ʱ��
	private String zhdl; // ����½ʱ��
	private String title; // ���ӱ���
	private String content; // ��������
	private String fbsj; // ���ӷ���ʱ��
	private String tag; // �ƺ�

	@Override
	public String toString() {
		return "uname:" + uname + "\tgender:" + gender + "\ntx:" + tx
				+ "\tzcsj:" + zcsj + "\tzhdl:" + zhdl + "\ntitle:" + title
				+ "\tcontent:" + content + "\tfbsj:" + fbsj + "\ntag:" + tag
				+ "========="
				+ "================================================";
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTx() {
		System.out.println("getTx:" + tx);
		return tx;
	}

	public void setTx(String tx) {
		this.tx = tx;
	}

	public String getZcsj() {
		return zcsj;
	}

	public void setZcsj(String zcsj) {
		this.zcsj = zcsj;
	}

	public String getZhdl() {
		return zhdl.substring(0, 10);
	}

	public void setZhdl(String zhdl) {
		this.zhdl = zhdl;
	}

	public String getTitle() {
		System.out.println("getTitle:" + title);
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFbsj() {
		return fbsj;
	}

	public void setFbsj(String fbsj) {
		this.fbsj = fbsj;
	}

	public String getTag() {
		System.out.println("getTag:" + tag);
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}
}