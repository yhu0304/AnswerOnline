package com.jlxy.hy.answeronline.action;

import java.net.*;
import com.opensymphony.xwork2.*;

public class UnameUniqueAction extends DYBaseAction {
	protected String uname; // 要验证的用户名
	protected String pwd; // 用户注册的密码
	protected String sql; // 声明SQL语句引用
	protected String valcode; // 用户输入的验证码

	public void setUname(String uname) {
		try {
			this.uname = URLDecoder.decode(uname, "utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getUname() {
		return uname;
	}

	public String getValcode() {
		return valcode; // 验证码属性的getter方法
	}

	public void setValcode(String valcode) { // 验证码属性的setter方法
		this.valcode = valcode.toUpperCase(); // 并转大写
	}

	public String getPwd() {
		return pwd; // 密码属性的getter方法
	}

	public void setPwd(String pwd) {
		this.pwd = pwd; // 密码属性的set方法
	}

	public boolean getFlag() { // 返回是否可注册的标志位
		sql = "select UID from DY_User where UName='" + uname + "'";// true为用户不存在
		return dbu.isExist(sql);
	}

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
}