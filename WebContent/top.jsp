<%@page contentType="text/html;charset=gbk"%>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<%@taglib uri="/struts-tags" prefix="s" %>
<link rel="stylesheet" type="text/css" href="css/style1.css"/>
<script language="JavaScript" src="script/showMsg.js"></script>
<a href="IndexAction.action" title="<s:text name='index.title'/>">
	<img src="images/top.jpg" border="0" width="100%" height="120"/>
</a>
<div id="menu">
	<ul>
	<s:if test="#session.role==null||#session.role>1">
		<li><a href="reg.jsp"><s:text name="ע��"/></a></li>
		<li><a href="login.jsp"><s:text name="��½"/></a></li>	
	</s:if>
	<s:else>
		<li><a href="GMIAction.action">${sessionScope.uname}��</a></li>
		<li>
			<s:if test="#session.role==1">
				<a href="#" id="my" onmousemove="showMenu('lsMenu')" onmouseout="hideMenu('lsMenu')">
				�ҵ�&nbsp;<img src="images/down.gif"/ border="0"></a>
			</s:if>
			<s:else>
				<a href="#" id="my" onmousemove="showMenu('xsMenu')" onmouseout="hideMenu('xsMenu')">
				�ҵ�&nbsp;<img src="images/down.gif"/ border="0"></a>
			</s:else>
		</li>
		<li><a href="DYAction.action?actionStr=logout">�˳�</a></li>
	</s:else>
	</ul>
</div>
<div class="hidmenu" id="xsMenu" style="position:absolute;visibility:hidden;" 
	onmouseout="hideMenu('xsMenu')" onmousemove="showMenu('xsMenu')">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<a href="TMAAction.action" onclick="hideMenu('xsMenu')">�ҵĲ���</a>
			</td>
			<td>
				<a href="TMQAction.action" onclick="hideMenu('xsMenu')">�ҵ�����</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="TMCAction.action" onclick="hideMenu('xsMenu')">�ҵĿγ�</a>
			</td>
			<td>
				<a href="MyApplyAction.action?course=all" onclick="hideMenu('xsMenu')">�ҵ�����</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="applyCourse.jsp">����γ�</a>
			</td>
			<td>
				<a href="GTAction.action">�޸�����</a>
			</td>
		</tr>		
		<tr>
			<td>
				<a href="GMIAction.action" onclick="hideMenu('xsMenu')">�ҵ�����</a>
			</td>
			<td>
				<a href="CIFAction.action?actionStr=getInfo">�޸�����</a>
			</td>			
		</tr>		
	</table>
</div>

<div class="hidmenu" id="lsMenu" style="position:absolute;visibility:hidden;" 
	onmouseout="hideMenu('lsMenu')" onmousemove="showMenu('lsMenu')">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<a href="TMAAction.action?course=all" onclick="hideMenu('lsMenu')">�ѻش�</a>
			</td>
			<td>
				<a href="TNAAction.action?course=all" onclick="hideMenu('lsMenu')">δ�ش�</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="TAFAction.action?actionStr=manageStu" onclick="hideMenu('lsMenu')">ѧ������</a>
			</td>
			<td>
				<a href="TAFAction.action?actionStr=addStu" onclick="hideMenu('lsMenu')">���ѧ��</a>
			</td>
		</tr>		
		<tr>
			<td>
				<a href="TMCAction.action" onclick="hideMenu('lsMenu')">�ҵĿγ�</a>
			</td>
			<td>
				<a href="MyApplyAction.action?course=all" onclick="hideMenu('lsMenu')">�����б�</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="CIFAction.action?actionStr=getInfo" onclick="hideMenu('lsMenu')">�޸�����</a>
			</td>	
			<td>
				<a href="GTAction.action" onclick="hideMenu('lsMenu')">�޸�����</a>
			</td>
		</tr>
	</table>
</div>