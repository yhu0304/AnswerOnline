<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<title>������ɹ�������</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<s:if test="#session.role>1">
<frameset rows="20%,*" bordercolor="#CCFFFF" frameborder="1" >
	<frame name="topFrame" scrolling="no" src="adminTop.jsp"/>
	<frameset cols="20%,*" noresize="true">
		<frame name="leftFrame" src="leftTree.jsp">
		<frame name="mainFrame" src="welcome.jsp">
	</frameset>
</frameset>
<body>
<p>�ܱ�Ǹ������һ����֡ҳ�棬����������������֧�֣����Բ�������� </p>
<p>Sorry!This page uses frames,but your browser doesn't support them .</p>
</body></noframes>
</s:if>
<s:else>
	<script language="JavaScript">
		window.location.href="adminLogin.jsp"	//���û�й���Ա��½����ת����½ҳ
	</script>
</s:else>
</html>