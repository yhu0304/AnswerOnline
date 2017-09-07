<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <script language="JavaScript" src="script/fenye.js"></script>
	  <script language="JavaScript">
	  	function showDel(tgname,uname,tuid){
	  		var str = "ȷ��ɾ��[<"+tgname+">]�γ��µ�[<"+uname+">]ѧ��������";
	  		if(confirm(str)){
	  			window.location.href="MSAction.action?actionStr=del&tuid="+tuid;
	  		}
	  	}
	  </script>
	</head>
	<body>
	  <s:include value="top.jsp"/>
	  <div id="nav">
	  	<table border="0" cellpadding="0" cellspacing="0">
	  		<tr>
	  			<td>
	  				<a href="IndexAction.action?actionStr=all"><s:text name="���ߴ���"/></a>
	  				&raquo;&nbsp;ѧ������
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
				<h3>ѧ������</h3>
	  
	  <s:if test="content.size()!=0">
	  <div class="indexbox">
	  	<table cellspacing="0" cellpadding="0" width="100%" border="0">
	  		<tr>
	  			<s:form action="MSAction" theme="simple">
	  			<td colspan="10" valign="middle">
	  				<font size="2.8">��ѡ��γ̷���:</font>
	  				<s:select name="course" theme="simple"			
	  						value="%{selected}"
	  						onchange="JavaScript:this.form.submit();"
	  						list="courseList"
	  						listKey='key'
	  						listValue='value'
	  				/>
	  			</td>
	  			</s:form>
	  		</tr>
	  		<tr>
	  			<th width="15%" align="center">�γ�����</th>	  
	  			<th width="8%" align="center">ѧ��</th>
	  			<th width="8%" align="center">����</th>
	  			<th width="5%" align="center">�Ա�</th>	  			
	  			<th width="10%">�����ʼ�</th>
	  			<th width="10%">ע��ʱ��</th>
	  			<th width="15%" align="center">����½</th>	  
	  			<th width="15%" align="center">��󷢱�</th>	  
	  			<th width="7%" align="center">Ȩ��</th>	  
	  			<th width="7%" align="center">ɾ��</th>	  
	  		</tr>  		
	  		<s:iterator value="content" status="st">
	  			<tr id="topList<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('topList<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('topList<s:property value="#st.index"/>')"
	  			>
	  				<td align="center"><s:property value="tgname"/></td>
	  				<td align="center"><s:property value="uid"/></td>
	  				<td align="center"><s:property value="uname"/></td>
	  				<td align="center"><s:property value="gender"/></td>
	  				<td align="center"><s:property value="email"/></td>
	  				<td align="center"><s:property value="regDate"/></td>
	  				<td align="center"><s:property value="lastLogin"/></td>
	  				<td align="center"><s:property value="lastEmit"/></td>
	  				<td align="center">
	  					<s:if test="%{user.permit==1}">��</s:if>
						<s:else>��</s:else>
	  				</td>
	  				<td align="center">
	  					<a href="JavaScript:showDel('<s:property value='tgname'/>','<s:property value='uname'/>','<s:property value='tuid'/>')">
	  					<img src="images/no.png"/ border="0" width="15" height="15" style="vertical-align:middle;">ɾ��</a>
	  				</td>
	  			</tr>
	  		</s:iterator>
	  	</table>
	  </div>
	  <!-- ��ҳ�ĵ����� -->
	  <s:url id="target" value="MSAction" includeParams="none"/>	  
	  <s:include value="nav.jsp">
	  </s:include>
	  </s:if>
	  <s:else>
	  	<div class="personal_messagebox">
			<h1>����ѧԺ��ʾ����û�����ݿ���ʾ</h1>
			<p><s:property value="message"/></p>
			<p><a href="IndexAction.action">��˴�ȥ��ҳ</a></p>
			<p><a href="JavaScript:history.back();">������ﷵ����һҳ</a></p>
		</div>
	  </s:else>
	  <script language="JavaScript">
	  	var message = "<s:property value="message"/>";
	  	if(message!=null||message!=""){
	  		eval(message);
	  	}
	  </script>
	  
	  
	  
	  			</div>
	  		</td>
	  	</tr>
	  </table>
	  <img src="images/bottom.jpg" border="0" width="100%" height="60"/>
	</body>
</html>