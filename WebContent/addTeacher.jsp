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
		  <th colspan="3" height="40">添加用户</th>
		  <s:form action="addTeacherAction" theme="simple" onsubmit="return checkAddManage()">
		  		<tr>
		  			<td align="right" width="25%">用户名:</td>
		  			<td width="25">
		  				<s:textfield name="uname" cssClass="input"/>
		  			</td>
		  			<td width="50%"><span id="MsgUname" class="message">请输入要添加的用户名</span></td>
		  		</tr>
		  		<tr>
		  			<td align="right">密码:</td>
		  			<td><s:password name="pwda" cssClass="input"/></td>
		  			<td><span id="MsgPwda" class="message">输入添加的用户密码</span></td>
		  		</tr>
		  		<tr>
		  			<td align="right">确认密码:</td>
		  			<td><s:password name="pwdb" cssClass="input"/></td>
		  			<td><span id="MsgPwdb" class="message">在此确认用户密码</span></td>	  			
		  		</tr>
		  		<tr>
		  			<td align="right">级别:</td>
		  			<td>
		  				<s:radio name="role" value="2"
		  					list="#{'0':'学生','1':'教师'}"
		  					listKey="key"
		  					listValue="value"
		  				/>
		  			</td>
		  			<td><s:hidden name="actionStr" value="add"/><span class="message">选择用户类型</span></td>
		  		</tr>
		  		<tr>
		  			<td colspan="2" align="right"><s:submit value="添  加" id="button"/></td>
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