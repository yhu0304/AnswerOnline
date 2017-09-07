<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <script language="JavaScript" src="script/trim.js"></script>
	  <script language="JavaScript">
		function checkAddStu(){
			var stu = document.getElementById('stuNO').value.trim();
			var course = document.all.course.value;
			var reg = /^(\d+)(;\d+)*;?$/;
			if(course=="all"){
				alert("��ѡ�����ĳһ�ſγ�");
				return false;
			}
			if(stu==""){
				alert("ѧ�Ų���Ϊ��");
				return false;
			}
			if(!reg.test(stu)){
				alert("�����ѧ�Ÿ�ʽ����ȷ�����ѧ������Ӣ�ĸ�ʽ���Ÿ���");
				return false;
			}
			return true;
		}
	  </script>
	</head>
	<body>
	  <s:include value="top.jsp"/>
	  <div id="nav">
	  	<table border="0" cellpadding="0" cellspacing="0">
	  		<tr>
	  			<td>
	  				<a href="IndexAction.action?actionStr=all"><s:text name="msg.nav"/></a>
	  				&raquo;&nbsp;���ѧ��
	  			</td>
	  		</tr>
	  	</table>
	  </div>
	  <table class="myinfo" border="0" cellpadding="0" cellspacing="0">
	  	<tr>
	  		<td width="155" style="vertical-align:top;">
	  			<s:if test="#session.role==0">
	  				<s:include value="stu_left_menu.jsp"/>
	  			</s:if>
	  			<s:if test="#session.role==1">
	  				<s:include value="teacher_left_menu.jsp"/>
	  			</s:if>	  		
	  		</td>
	  		<td>
	  			<div class="changeInfo">
				<h3>���ѧ��</h3>
				  	<table width="50%" border="0" align=center style="margin-top:4em;">
				  		<s:form action="ASAction" theme="simple" onsubmit="JavaScript:return checkAddStu();">
				  		<tr>
				  			<td valign="top" align="right" width="30%">��ѡ��γ�:
				  			</td>
				  			<td>
				  				<s:select name="course" theme="simple"			
				  						value="%{selected}"
				  						list="courseList"
				  						listKey='key'
				  						listValue='value'
				  				/>
				  			</td>
				  		</tr>
				  		<tr>
				  			<td valign="top" align="right">������ѧ��:</td>
				  			<td>
				  				<s:textarea id="stuNO" name="stuNO" cssClass="textarea" rows="5" cols="40"  
				  					onclick="JavaScript:this.value=''"	value="���ѧ������Ӣ�ķֺŸ���"/>
				  			</td>
				  		</tr>
				  		<tr>
				  			<td colspan="2" align="center"><s:submit value="��  ��" id="button"/></td>
				  		</tr>
				  		</s:form>
				  		<tr><td></td><td>${message}</td></tr>
				  	</table>
	  			</div>
	  		</td>
	  	</tr>
	  </table>
	  <img src="images/bottom.jpg" border="0" width="100%" height="60"/>
	</body>
</html>