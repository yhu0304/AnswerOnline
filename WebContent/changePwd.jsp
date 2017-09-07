<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <script language="JavaScript" src="script/trim.js"></script>
	  <script language="JavaScript" src="script/changePwd.js"></script>
	</head>
	<body>
	  <s:include value="top.jsp"/>
	  <div id="nav">
	  	<table border="0" cellpadding="0" cellspacing="0">
	  		<tr>
	  			<td>
	  				<a href="IndexAction.action?actionStr=all"><s:text name="���ߴ���"/></a>
	  				&raquo;&nbsp;�޸�����
	  			</td>
	  		</tr>
	  	</table>
	  </div>
	  <table class="myinfo" border="0" cellpadding="0" cellspacing="0">
	  	<tr>
	  		<td width="155">
	  			<s:if test="#session.role==0">
	  				<s:include value="stu_left_menu.jsp"/>
	  			</s:if>
	  			<s:if test="#session.role==1">
	  				<s:include value="teacher_left_menu.jsp"/>
	  			</s:if>
	  		</td>
	  		<td>
	  			<div class="changePwd">
				<h3>�޸�����</h3>
				<s:form action="CPWDAction" theme="simple" onsubmit="return checkChangePwd();">
				<table border="0" align="center">
					<tr>
						<td align="right">*������:</td>
						<td>
							<s:password name="oldPwd" onblur="checkOldPwd()" cssClass="input"/>
						</td>
						<td width="150"><span id="oldMsg" class="message"></span></td>
					</tr>
					<tr>
						<td align="right">*������:</td>
						<td>
							<s:password name="newPwd" onblur="checkNewPwd()" cssClass="input"/>
						</td>
						<td width="150"><span id="newMsg1" class="message"></span></td>
					</tr>					
					<tr>
						<td align="right">*ȷ��������:</td>
						<td>
							<s:password name="reNewPwd" onblur="checkReNewPwd()" cssClass="input"/>
						</td>
						<td width="150"><span id="newMsg2" class="message"></span></td>
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
				</div>
	  		</td>
	  	</tr>
	  </table>
	  <img src="images/bottom.jpg" border="0" width="100%" height="60"/>
	</body>
</html>