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
	<body bgcolor="#FAFFEF">
	  <div class="regbox" style="margin-top:15em;margin-left:20em;width:60%;">
		<table cellspacing="0" cellpadding="0" width="100%" border="0" align="center">
			<s:form action="ALAction" theme="simple" onsubmit="return checkLogin()" target="_top">
				
				<tr>
					<td align="right" width="30%">����ԱID</td>
					<td>
						<s:textfield name="uname" cssClass="input" maxlength="15" value=""/>&nbsp;&nbsp;
					</td>
					</td>
				</tr>
				<tr>
					<td align="right" width="20%">����Ա����</td>
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
		<s:include value="qq.jsp"/> 
	</body>
</html>