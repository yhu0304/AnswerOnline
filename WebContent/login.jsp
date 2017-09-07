<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style1.css" />
	  <script type="text/javascript" src="script/trim.js"></script>
	  <script type="text/javascript" src="script/showMsg.js"></script>
	  <script language="JavaScript">
	  	function checkLogin(){
	  		var login = /^\w+$/;
			var uname = document.all.uname.value.trim();
			var code = document.all.valcode.value.trim();
			var pwd = document.all.pwd.value.trim();
			if(code==""){
				showMsg("��֤�벻��Ϊ�գ����������롣","yzm");
				return false;
			}
			if(code.length!=4){
				showMsg("��֤�볤�Ȳ���ȷ����˶����롣","yzm");
				return false;
			}	
			if(!login.test(code)){
				showMsg("��֤��ֻ�������ֺ���ĸ����˶����롣","yzm");
				return false;
			}
			if(uname==""){
				showMsg("�û�������Ϊ�գ���˶�����","uname");
				return false;
			}		
			if(pwd.length<6||pwd==""){
				showMsg("�Բ������벻��Ϊ�ղ����Ȳ���С��6����˶����롣","pwd");
				return false;
			}
			if(!login.test(pwd)){
				showMsg("�Բ�����������Ƿ��ַ�����˶����롣","pwd");
				return false;
			}
			return true;
	  	}
	  </script>
	</head>
	<body>
	  	<s:include value="top.jsp"/>
	  	<div id="nav">
	  	<table>
	  		<tr>
	  			<td>
  					<a href="IndexAction.action?actionStr=all"><s:text name="���ߴ���"/></a>
   					&raquo;&nbsp;��¼
	  			</td>
	  		</tr>
	  	</table>	  
	   	</div>
	   	</div>
	  <div class="regbox">
		<div class="regtitle">&nbsp;&nbsp;��¼</div>		
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<s:form action="Login" theme="simple" onsubmit="return checkLogin()" >
				
				<tr>
					<td align="right" width="30%"><s:text name="�û���"/></td>
					<td>
						<s:textfield name="uname" cssClass="input" maxlength="15" value=""/>&nbsp;&nbsp;
						<a href="reg.jsp" tabindex="100">����ע��</a>
					</td>
					</td>
				</tr>
				<tr>
					<td align="right" width="20%"><s:text name="����"/></td>
					<td>
						<s:password name="pwd" id="pwd" cssClass="input" value="871216"/>
					</td>
				</tr>
				<tr>
					<td align="right" width="30%"><s:text name="��֤��"/></td>
					<td>
						<s:textfield name="valcode" size="6" id="yzm"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<a  tabindex="200" href="javascript:reloadImage();" title="�����壿�����һ��^_^">
							<img id="pic" src="yzm.jsp" border="0" style="vertical-align:middle;"/>
						</a>
						<a href="javascript:reloadImage();" tabindex="150">
	 						<font color="#bc2931" size="2" face="����" title="�����ִ�Сд">�������������ͼƬ</font>
	 					</a>&nbsp;&nbsp;
	 				</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<s:submit id="button" value="��¼"/> 
					</td>
				</tr>
			</s:form>
		</table>
		</div>
		<img src="images/bottom.jpg" border="0" width="100%" height="70"/>
		<s:include value="qq.jsp"/> 
	</body>
</html>