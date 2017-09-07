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
	  			<a href="IndexAction.action?actionStr=all"><s:text name="���ߴ���"/></a>
	   			&raquo;&nbsp;<s:text name="ע��"/>
	  		</td>
	  	</tr>
	  </table>
	  </div>
	  <div class="regbox">
		<div class="regtitle">&nbsp;&nbsp;<s:text name="ע��"/></div>		
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<s:form action="Reg" theme="simple" onsubmit="return checkReg()">
				<tr>
					<th align="left" colspan="2"><s:text name="������Ϣ"/></th>								
				</tr>
			    <tr>
					<td align="right" width="20%">*<s:text name="�û���"/></td>
					<td>						
						<s:textfield name="uname" cssClass="input" onblur="checkUid()" maxlength="15"/>
						<span id="unameMsg" class="message">
						</span>						
					</td>
					</td>
				</tr>
				<tr>
					<td align="right" width="20%">*<s:text name="����"/></td>
					<td>
						<s:password name="pwd" id="pwd" onblur="checkPwd()" cssClass="input"/>
						<span id="pwdMsg" class="message">������������ɴ�СдӢ����ĸ��������ɣ����Ȳ���С��6λ��</span>
					</td>
				</tr>
				<tr>
					<td align="right" width="20%">*<s:text name="ȷ������"/></td>
					<td>
						<s:password name="pwd2" onblur="checkPwd2()" cssClass="input"/>
						<span id="pwdMsg2" class="message"></span>
					</td>
				</tr>
				<tr>					
					<td align="right" width="20%"><s:text name="�Ա�"/></td>
					<td><s:radio name="gender" value="getText('gender.male')"
							list="#{getText('gender.male'):getText('gender.male'),
									getText('gender.female'):getText('gender.female')}"							
							listKey='key'
							listValue='value'
						/>
					</td>
				</tr>
				<tr>
					<td align="right" width="20%">*<s:text name="�����ʼ�"/></td>
					<td>
						<s:textfield name="email" onblur="checkEmail()" cssClass="input"/>
						<span id="emailMsg" class="message"></span>
					</td>
				</tr>
				<tr>
					<td align="right" width="20%"><s:text name="������֤�룺"/></td>
					<td>
						<s:textfield name="valcode" size="6" onblur="checkValCode()" id="yzm"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:reloadImage();" title="�����壿�����һ��^_^" tabindex="100">
							<img id="pic" src="yzm.jsp" border="0" style="vertical-align:middle;"/>
						</a>
						<a href="javascript:reloadImage();" tabindex="200">
	 						<font color="#bc2931" size="2" face="����" title="�����ִ�Сд">�������������ͼƬ</font>
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