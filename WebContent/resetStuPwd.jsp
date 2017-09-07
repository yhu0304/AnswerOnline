<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style1.css"/>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <script language="JavaScript" src="script/trim.js"></script>
	  <script language="JavaScript" src="script/addManage.js"></script>
	</head>
	<body>
		  <table width="75%" border="0" align="center"
		  style="border:1px solid #D1E7A9;margin-top:20px;">
		  <th colspan="3" height="40">�����û�����</th>
		  <s:form action="RUPwdAction" theme="simple" onsubmit="return checkAddManage()">
		  		<tr>
		  			<td align="right" width="25%">�û���:</td>
		  			<td width="25">
		  				<s:textfield name="uname" cssClass="input"/>
		  			</td>
		  			<td width="50%"><span id="MsgUname" class="message">����Ҫ����������û���</span></td>
		  		</tr>
		  		<tr>
		  			<td align="right">����:</td>
		  			<td><s:password name="pwda" cssClass="input"/></td>
		  			<td><span id="MsgPwda" class="message">���������ֺ���ĸ��ɣ����Ȳ�С��6λ��</span></td>
		  		</tr>
		  		<tr>
		  			<td align="right">ȷ������:</td>
		  			<td><s:password name="pwdb" cssClass="input"/></td>
		  			<td><span id="MsgPwdb" class="message">ȷ����������</span></td>	  			
		  		</tr>
		  		<tr>
		  			<td colspan="2" align="right"><s:submit value="��  ��" id="button"/></td>
		  			<td><s:hidden name="actionStr" value="resetPwd"/></td>
		  		</tr>
		  		</s:form>
		  		<tr>
		  			<td colspan="2" align="center">
		  				<s:property value="message"/>
		  			</td><td>&nbsp;</td>
		  		</tr>		  		
		  </table>
	</body>
</html>