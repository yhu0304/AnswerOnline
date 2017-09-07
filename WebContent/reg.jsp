<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style1.css" />
	  <script type="text/javascript" src="script/trim.js"></script>
	  <script type="text/javascript" src="script/reg.js"></script>
	  <script type="text/javascript" src="script/showMsg.js"></script>
	</head>
	<body>
	  <s:include value="top.jsp"/>
	  <div id="nav">
	  <table>
	  	<tr>
	  		<td>
	  			<a href="IndexAction.action?actionStr=all"><s:text name="在线答疑"/></a>
	   			&raquo;&nbsp;<s:text name="注册"/>
	  		</td>
	  	</tr>
	  </table>
	  </div>
	  <div class="regbox">
		<div class="regtitle">&nbsp;&nbsp;<s:text name="注册"/></div>		
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<s:form action="Reg" theme="simple" onsubmit="return checkReg()">
				<tr>
					<th align="left" colspan="2"><s:text name="基本信息"/></th>								
				</tr>
			    <tr>
					<td align="right" width="20%">*<s:text name="用户名"/></td>
					<td>						
						<s:textfield name="uname" cssClass="input" onblur="checkUid()" maxlength="15"/>
						<span id="unameMsg" class="message">
						</span>						
					</td>
					</td>
				</tr>
				<tr>
					<td align="right" width="20%">*<s:text name="密码"/></td>
					<td>
						<s:password name="pwd" id="pwd" onblur="checkPwd()" cssClass="input"/>
						<span id="pwdMsg" class="message">您的密码可以由大小写英文字母、数字组成，长度不得小于6位。</span>
					</td>
				</tr>
				<tr>
					<td align="right" width="20%">*<s:text name="确认密码"/></td>
					<td>
						<s:password name="pwd2" onblur="checkPwd2()" cssClass="input"/>
						<span id="pwdMsg2" class="message"></span>
					</td>
				</tr>
				<tr>					
					<td align="right" width="20%"><s:text name="性别"/></td>
					<td><s:radio name="gender" value="getText('gender.male')"
							list="#{getText('gender.male'):getText('gender.male'),
									getText('gender.female'):getText('gender.female')}"							
							listKey='key'
							listValue='value'
						/>
					</td>
				</tr>
				<tr>
					<td align="right" width="20%">*<s:text name="电子邮件"/></td>
					<td>
						<s:textfield name="email" onblur="checkEmail()" cssClass="input"/>
						<span id="emailMsg" class="message"></span>
					</td>
				</tr>
				<tr>
					<td align="right" width="20%"><s:text name="输入验证码："/></td>
					<td>
						<s:textfield name="valcode" size="6" onblur="checkValCode()" id="yzm"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:reloadImage();" title="看不清？点击换一张^_^" tabindex="100">
							<img id="pic" src="yzm.jsp" border="0" style="vertical-align:middle;"/>
						</a>
						<a href="javascript:reloadImage();" tabindex="200">
	 						<font color="#bc2931" size="2" face="宋体" title="不区分大小写">看不清楚？换张图片</font>
	 					</a>&nbsp;&nbsp;
	 					<span id="codeMsg" class="message"></span>
	 				</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<s:submit id="button" value="%{getText('reg.nav')}"/> 
					</td>
				</tr>
			</s:form>
		</table>
		</div>
		<img src="images/bottom.jpg" border="0" width="100%" height="60"/>	 
		<s:include value="qq.jsp"/> 
	</body>
</html>