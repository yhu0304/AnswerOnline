<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>  
	  <link rel="stylesheet" type="text/css" href="css/style1.css"/>
	  <script language="JavaScript" src="script/fenye.js"></script>
	  <script language="JavaScript">
	  	function showDel(title,rid){
	  		var str = "ȷ��ɾ���ظ�[<"+title+">]������";
	  		if(confirm(str)){
	  			window.location.href="TRLAction.action?actionStr=del&rid="+rid;
	  		}
	  	}
	  </script>
	</head>
	<body>
	  <s:if test="content.size()!=0">
	  <h3 style="text-align:center;margin-top:1em;">�ظ��б�</h3>
	  <div class="indexbox" style="margin-top:0.5em;margin-left:1em;">
	  	<table cellspacing="0" cellpadding="0" width="100%" border="0">
	  		<s:form action="TRLAction" theme="simple">
	  		<tr>
	  			<td colspan="6" align="right" style="border-top:0px;">
	  				<s:hidden name="actionStr" value="search"/>
	  				<s:textfield name="key" value="������ؼ��ֲ�ѯ" onmousemove="this.select()" cssClass="input"/>
	  				<s:submit id="button2" value="�� ��"/>	  				
	  			</td>
	  		</tr>
	  		</s:form>	  	
	  		<tr>
	  			<th width="10%">���</th>
	  			<th width="45%" align="center">�ظ�����</th>
	  			<th width="10%">����</th>
	  			<th width="15%">����ʱ��</th>
	  			<th width="10%">�鿴</th>
	  			<th width="10%">ɾ��</th>
	  		</tr>
	  		<s:iterator value="content" status="st">
	  			<tr id="topList<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('topList<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('topList<s:property value="#st.index"/>')"
	  			>
	  				<td align="center"><s:property value="rid"/></td>
	  				<td>
	  					<s:property value="nr"/>
	  				</td>
	  				<td align="center">
	  					<s:property value="uname"/>					
	  				</td>
	  				<td align="center">
	  					<s:property value="rdate"/>
	  				</td>
	  				<td align="center">
	  					<a href="RDAction.action?actionStr=detail&rid=<s:property value='rid'/>" target="_blank">
	  					<img src="images/look.png"/ border="0" width="15" height="15" style="vertical-align:middle;">�鿴</a>
	  				</td>
	  				<td align="center">
						<a href="JavaScript:showDel('<s:property value='nr'/>','<s:property value='rid'/>')">
	  					<img src="images/no.png"/ border="0" width="15" height="15" style="vertical-align:middle;">ɾ��</a>
	  				</td>
	  			</tr>
	  		</s:iterator>
	  	</table>
	  </div>
	  <!-- ��ҳ�ĵ����� -->
	  <s:url id="target" value="TRLAction" includeParams="none"/>	  
	  <s:include value="nav.jsp">
	  </s:include>
	  </s:if>
	  <s:else>
	  	<div class="messagebox">
			<h1>����ѧԺ��ʾ����û�����ݿ���ʾ</h1>
			<p><s:property value="message"/></p>
			<p><a href="adminIndex.jsp" target="_top">��˴�ȥ��ҳ</a></p>
			<p><a href="adminIndex.jsp" target="_top">��������û���Զ���ת�����˴�</a></p>		
		</div>
	  </s:else>
	</body>
</html>