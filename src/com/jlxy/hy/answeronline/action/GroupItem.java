package com.jlxy.hy.answeronline.action;

public class GroupItem {  //�γ�����bean
	private String gName; // �������
	private String detail; // �������
	private String topic; // ��黰������
	private String revert; // ����������
	private String uname; // ���ظ����û�
	private String lastTime; // ��󷢱�����
	private String tid; // ���ظ����ӵ�ID
	private String gid; // ���ID
	private String title; // ���ӱ���

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getLastTime() {
		return lastTime;
	}

	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getGName() {
		return gName;
	}

	public void setGName(String name) {
		gName = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getRevert() {
		return revert;
	}

	public void setRevert(String revert) {
		this.revert = revert;
	}

	@Override
	public String toString() {
		return "gName:" + gName + "\tdetail:" + detail + "\ttopic:" + topic
				+ "\nrevert:" + revert + "\tuname:" + uname + "\tlastTime:"
				+ lastTime + "\ntid:" + tid + "\tgid:" + gid + "\tTitle:"
				+ title + "\t========================================"
				+ "======================";
	}
}