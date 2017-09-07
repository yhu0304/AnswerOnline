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
	  	function checkApp(){
	  		var reg = /^\d+$/;	  		
	  		var reason = document.all.reason.value.trim();
	  		var kh = document.all.tgid.value.trim();
	  		if(kh==""){
	  			showMsg("�γ̺Ų���Ϊ�գ���Ϊ�������","tgid");
	  			return false;
	  		}
	  		if(!reg.test(kh)){
	  			showMsg("�γ̺Ÿ�ʽ����ȷ��ӦΪ�������","tgid");
	  			return false;
	  		}
	  		if(reason==""){	  			
	  			showMsg("����ԭ�򲻵�Ϊ�գ�һ����д�Լ����Ϻͼ���ԭ��","reason");
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
	  			<a href="IndexAction.action"><s:text name="���ߴ���"/></a>
	   			&raquo;&nbsp;����γ�
	  		</td>
	  	</tr>
	  </table>
	  </div>
	  <div class="regbox">
		<div class="regtitle">&nbsp;&nbsp;����γ�</div>		
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<s:form action="AAction" theme="simple" onsubmit="return checkApp()">
			<tr>
				<td align="right" width="40%">�γ̱�ţ�</td>
				<td><s:textfield name="tgid" cssClass="input"/></td>
				<script>
					var gid = ${param.tgid}+"";
					if(gid!=""){
						document.all.tgid.value = gid;
					}
				</script>
			</tr>
			<tr>
				<td align="right">�������ɣ�</td>
				<td><s:textarea name="reason" cssClass="textarea" rows="4" cols="30"/></td>
			</tr>
			<tr>
				<td align="center">&nbsp;</td>
				<td style="padding-left:11em;"><s:submit id="button" value="�ύ����"/></td>
			</tr>
			</s:form>
		</table>
		</div>
		<img src="images/bottom.jpg" border="0" width="100%" height="60"/>	 
		<s:include value="qq.jsp"/>
	</body>
</html>