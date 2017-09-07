<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <link rel="stylesheet" type="text/css" href="css/style1.css"/>
	  <script type="text/javascript" src="script/trim.js"></script>
	  <script language="JavaScript">
	  	function checkRevert(){
	  		var rcontent = document.all.nr.value.trim();
	  		var rtitle = document.all.bt.value.trim();
	  		if(rtitle==""){
	  			alert("���ʱ��ⲻ��Ϊ��");
	  			return false;
	  		}
	  		if(rtitle.length<2){
	  			alert("������ⳤ�Ȳ���С��2");
	  			return false;
	  		}
	  		if(rcontent==""){
	  			alert("�������ݲ���Ϊ��");
	  			return false;
	  		}
	  		if(rcontent.length<8){
	  			alert("�������ݳ��Ȳ���С��8");
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
				&raquo;&nbsp����������			  	
	  		</td>
	  	</tr>
	  </table>
	  </div>
	  <!-- ����������ı� -->
	  <div class="tw">
	  	<div class="left">
		  	<h4>���������</h4>
		  	<div class="notice2">
		  		��ע�⣺
		  		<p>1.����á������</p>
		  		<p>2.���ⳤ�Ȳ��õ���2</p>
		  		<p>3.�������ݲ�������8</p>
		  		<p>4.���÷���Υ������</p>
		  		<p>5.��Ҫ�����뱾�γ��޹ص�����</p>
		  	</div>
	  	</div>
	  	<s:form action="EAction" theme="simple" onsubmit="return checkRevert()">
	  		<table>
	  			<tr>
	  				<td>�γ̣�</td>
	  				<td>
	  					<s:select
	  						name="tgid"
	  						list="course"
	  						listKey='key'
	  						listValue='value'
	  					/>
	  					<script language="JavaScript">
	  						var gid = ${sessionScope.tgid};
	  						if(gid!=null){
	  							document.all.tgid.value=gid;
	  						}
	  					</script>
	  				</td>
	  			</tr>
	  			<tr>
	  				<td>���⣺</td>
	  				<td><s:textfield name="bt" cssClass="wtbt"/></td>
	  			</tr>
	  			<tr>
	  				<td>���ݣ�</td>
	  				<td><s:textarea name="nr" rows="8" cols="80" cssClass="textarea" /></td>
	  			</tr>
	  			<tr>
	  				<td>
	  					<s:hidden name="actionStr" value="fqwt"/>
	  				</td>
	  				<td>
	  					<s:submit id="button4" value="��������"/>
	  				</td>
	  			</tr>
	  		</table>
	  	</s:form>
	  </div>
	  <img src="images/bottom.jpg" border="0" width="100%" height="60"/>
	</body>
</html>