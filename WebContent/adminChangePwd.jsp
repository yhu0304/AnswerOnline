<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <link rel="stylesheet" type="text/css" href="css/style1.css"/>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <script language="JavaScript" src="script/trim.js"></script>
	  <script language="JavaScript" src="script/changePwd.js"></script>
	</head>
	<body bgcolor="#FAFFEF" style="margin-top:3em;">
		<s:form action="ChangePwdAction" theme="simple" onsubmit="return checkChangePwd();">
		<table width="75%" border="0" align="center"
		  style="border:1px solid #D1E7A9;margin-top:20px;">
		  <th colspan="3" height="40">�޸�����</th>
			<tr>
				<td align="right">*������:</td>
				<td>
					<s:password name="oldPwd" onblur="checkOldPwd()" cssClass="input"/>
				</td>
				<td><span id="oldMsg" class="message">�������ľ�����</span></td>
			</tr>
			<tr>
				<td align="right">*������:</td>
				<td>
					<s:password name="newPwd" onblur="checkNewPwd()" cssClass="input"/>
				</td>
				<td><span id="newMsg1" class="message">���������ֺ���ĸ��ɣ����Ȳ�С��6λ��</span></td>
			</tr>					
			<tr>
				<td align="right">*ȷ��������:</td>
				<td>
					<s:password name="reNewPwd" onblur="checkReNewPwd()" cssClass="input"/>
				</td>
				<td><span id="newMsg2" class="message">�ٴ�����������</span></td>
			</tr>
			<tr>
				<td></td>
				<td align="center">
					<s:submit value="��  ��" id="button"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td align="center" colspan="3"><s:property value="message"/></td>
			</tr>
		</table>
		</s:form>
	</body>
</html>