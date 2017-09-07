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
	  <script language="JavaScript">
	  function checkCourse(){
	  	var gname = document.all.tgname.value.trim();
	  	var detail = document.all.tdetail.value.trim();
	  	if(gname==""){
	  		document.all.MsgTname.innerHTML="<img src='images/check_error.gif'/>�γ�������Ϊ�ա�";
			return false;
	  	}
	  	if(detail==""){
	  		document.all.MsgDetail.innerHTML="<img src='images/check_error.gif'/>�γ���������Ϊ�ա�";
			return false;
	  	}
	  	return true;
	  }
	 </script>
	</head>
	<body>	  	
		  <table width="75%" border="0" align="center"
		  style="border:1px solid #D1E7A9;margin-top:20px;">
		  <th colspan="3" height="40">����¿γ�</th>
		  <s:form action="ACAction" theme="simple" onsubmit="return checkCourse()">
		  		<tr>
		  			<td align="right" width="25%">�γ���:</td>
		  			<td width="25">
		  				<input type="text" name=tgname class="input4">
		  			</td>
		  			<td width="50%"><span id="MsgTname" class="message">������γ�����</span></td>
		  		</tr>
		  		<tr>
		  			<td vlign="top" align="right" style="vertical-align:top;">�γ�����:</td>
		  			<td>
		  				<s:textarea name="tdetail" cssClass="textarea" rows="4" cols="30"/>
		  			</td>
		  			<td><span id="MsgDetail" class="message">������ÿγ�����Ժϵ</span></td>
		  		</tr>
		  		<tr>
		  			<td colspan="2" align="right"><s:submit value="��  ��" id="button"/></td>
		  			<td>
		  				<s:hidden name="actionStr" value="add"/>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td></td>
		  			<td colspan="2" align="left">
		  				${message}
		  			</td>
		  		</tr>
		  		</s:form>
		  </table>
	</body>
</html>