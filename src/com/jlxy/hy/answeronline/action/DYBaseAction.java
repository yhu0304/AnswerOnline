package com.jlxy.hy.answeronline.action;

import java.util.Map;
import com.opensymphony.xwork2.*;

public class DYBaseAction extends ActionSupport {
	protected DBUtil dbu; // ����DBUtil��������
	protected String message; // ������Ϣ
	protected String url; // Ҫ��ת����URL
	protected String actionStr; // ������־

	public void setDbu(DBUtil dbu) {
		this.dbu = dbu; // dbu��setter����
	}

	public Map getSession() { // �õ�Struts��ģ��HttpSession��ʵ��
		return ActionContext.getContext().getSession();
	}

	public String getMessage() {
		return message; // message���Ե�getter����
	}

	public String getUrl() { // url���Ե�getter����
		return url;
	}

	public String getActionStr() { // actionStr��getter����
		return actionStr;
	}

	public void setActionStr(String actionStr) {
		this.actionStr = actionStr; // actionStr��setter����
	}

	@Override
	public String execute() throws Exception {
		String result = SUCCESS;
		if ("logout".equals(actionStr)) { // ע������
			String role = (String) getSession().get("role"); // �õ��û���ɫ
			getSession().clear(); // ��session���
			System.out.println("role:==" + role);
			if ("0".equals(role) || "1".equals(role)) { // �����½������ʦ������ѧ��
				url = "IndexAction.action";
				message = "�˳��ɹ������ڽ���ת����ҳ"; // ������ʾ��Ϣ
			} else { // ��½�����ǹ���Ա
				url = "adminLogin.jsp";
				message = "�˳��ɹ������ڽ�Ҫ��ת����½ҳ"; // ������ʾ��Ϣ
				result = LOGIN; // ����LOGIN��ͼ
			}
		}
		return result;
	}
}