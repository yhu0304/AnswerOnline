package com.jlxy.hy.answeronline.action;

public class TopicItem {
	private String ftr; // ������
	private String title; // ���ʱ���
	private String djs; // �����
	private String revert; // �ظ���
	private String ftsj; // ����ʱ��
	private String htr; // ���ش���
	private String lastTime; // ���ش�ʱ��
	private String tid; // �����ID
	private String gname; // ���������γ���

	@Override
	public String toString() { // toString����
		return "ftr:"
				+ ftr
				+ "\ttitle:"
				+ title
				+ "\tdjs:"
				+ djs
				+ "\nrevert:"
				+ revert
				+ "\tftsj:"
				+ ftsj
				+ "\thtr:"
				+ htr
				+ "\nlastTime:"
				+ lastTime
				+ "\ttid:"
				+ tid
				+ "\n==============================================================";
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getFtr() {
		return ftr;
	}

	public void setFtr(String ftr) {
		this.ftr = ftr;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDjs() {
		return djs;
	}

	public void setDjs(String djs) {
		this.djs = djs;
	}

	public String getRevert() {
		return revert;
	}

	public void setRevert(String revert) {
		this.revert = revert;
	}

	public String getFtsj() {
		return ftsj;
	}

	public void setFtsj(String ftsj) {
		this.ftsj = ftsj;
	}

	public String getHtr() {
		return htr;
	}

	public void setHtr(String htr) {
		this.htr = htr;
	}

	public String getLastTime() {
		return lastTime;
	}

	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}
}