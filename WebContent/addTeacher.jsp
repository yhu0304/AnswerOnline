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
		  <th colspan="3" height="40">����û�</th>
		  <s:form action="addTeacherAction" theme="simple" onsubmit="return checkAddManage()">
		  		<tr>
		  			<td align="right" width="25%">�û���:</td>
		  			<td width="25">
		  				<s:textfield name="uname" cssClass="input"/>
		  			</td>
		  			<td width="50%"><span id="MsgUname" class="message">������Ҫ��ӵ��û���</span></td>
		  		</tr>
		  		<tr>
		  			<td align="right">����:</td>
		  			<td><s:password name="pwda" cssClass="input"/></td>
		  			<td><span id="MsgPwda" class="message">������ӵ��û�����</span></td>
		  		</tr>
		  		<tr>
		  			<td align="right">ȷ������:</td>
		  			<td><s:password name="pwdb" cssClass="input"/></td>
		  			<td><span id="MsgPwdb" class="message">�ڴ�ȷ���û�����</span></td>	  			
		  		</tr>
		  		<tr>
		  			<td align="right">����:</td>
		  			<td>
		  				<s:radio name="role" value="2"
		  					list="#{'0':'ѧ��','1':'��ʦ'}"
		  					listKey="key"
		  					listValue="value"
		  				/>
		  			</td>
		  			<td><s:hidden name="actionStr" value="add"/><span class="message">ѡ���û�����</span></td>
		  		</tr>
		  		<tr>
		  			<td colspan="2" align="right"><s:submit value="��  ��" id="button"/></td>
		  			<td>&nbsp;</td>
		  		</tr>
		  		<tr>
		  			<td colspan="3" align="center">
		  				<s:property value="message"/>
		  			</td>
		  		</tr>
		  		</s:form>
		  </table>
		 
	</body>
</html>