<%@page contentType="text/html;charset=gbk"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<style type="text/css">
	.tip{
		color:red;
		font-size:13px;
		font-weight:bold;
	}
</style>
<div class="leftmenu">
	<h2>���˹���</h2>
	<p>
		<a href="TNAAction.action?course=all">δ�ش�</a>
		<s:if test="question!=0 && question!=null">
			<span class="tip">(<s:property value="question"/>)</span>
		</s:if>
	</p>
	<p><a href="TMAAction.action?course=all">�ѻش�</a></p>	
	<p><a href="TMCAction.action">�ҵĿγ�</a></p>
	<p>
		<a href="MyApplyAction.action?course=all">�����б�</a>
		<s:if test="apply!=null && apply!=0">
			<span class="tip">(<s:property value="apply"/>)</span>
		</s:if>
	</p>
	<p><a href="TAFAction.action?actionStr=addStu">���ѧ��</a></p>
	<p><a href="MSAction.action?course=all">ѧ������</a></p>	
	<p><a href="GMIAction.action">�ҵ�����</a></p>
	<p><a href="GTAction.action">�޸�����</a></p>
	<p><a href="CIFAction.action?actionStr=getInfo">�޸�����</a></p>
</div>