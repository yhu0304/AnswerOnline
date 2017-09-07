<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <script language="JavaScript" src="script/fenye.js"></script>
	</head>
	<body>
	  <s:include value="top.jsp"/>
	  <div id="nav">
	  <table border="0">
	  	<tr>
	  		<td>
	  			<a href="IndexAction.action?actionStr=all"><s:text name="���ߴ���"/></a>
	  			&raquo;&nbsp;<s:property value="gName"/>
	  		</td>
	  		<td align="right">
	  		<input type="button" id="button3" value="��Ҫ����" onclick="window.location.href='GMCAction.action'"/>
	  		</td>
	  	</tr>
	  </table>	  	
	  </div>
	  <s:if test="content.size()!=0">
	  <div class="indexbox">
	  	<div class="indextitle">__&nbsp;&nbsp;</div>
	  	<table cellspacing="0" cellpadding="0" width="100%" border="0">
	  		<tr>
	  			<th width="5%">&nbsp;</th>
	  			<th width="45%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����</th>
	  			<th width="20%">����</th>	  			
	  			<th width="8%">�鿴/�ظ�</th>
	  			<th width="25%">��󷢱�</th>
	  		</tr>  		
	  		<s:iterator value="content" status="st">
	  			<tr id="topList<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('topList<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('topList<s:property value="#st.index"/>')"
	  			>
	  				<td align="center">
	  					<a href="TTDAction.action?tid=<s:property value="tid"/>&actionStr=yz" target="_blank">
	  						<img src="images/tz.gif" alt="�´��ڴ�" border="0"/>
	  					</a>
	  				</td>
	  				<td>&nbsp;&nbsp;					
	  					<a href="TTDAction.action?tid=<s:property value="tid"/>&actionStr=yz">
	  						<s:property value="title"/>		  						
	  					</a>
	  				</td>
	  				<td align="left">
	  					<s:property value="ftr"/>&nbsp;&nbsp;������<s:property value="ftsj"/>					
	  				</td>
	  				<td align="center">
	  					<s:property value="djs"/>/<s:property value="revert"/>
	  				</td>
	  				<td align="center">
	  				<s:if test="topic==0">
	  					��������������������
	  				</s:if>
	  				<s:else>
	  					<s:property value="htr"/>-<s:property value="lastTime"/>
	  				</s:else>
	  				</td>
	  			</tr>
	  		</s:iterator>
	  	</table>
	  </div>
	  <!-- ��ҳ�ĵ����� -->
	  <s:url id="target" value="TTLAction" includeParams="none"/>	  
	  <s:include value="nav.jsp">
	  </s:include>
	  </s:if>
	  <s:else>
	  	<div class="messagebox">
			<h1>����ѧԺ��ʾ����û�����ݿ���ʾ</h1>
			<p><s:property value="message"/></p>
			<p><a href="IndexAction.action">��˴�ȥ��ҳ</a></p>
			<p><a href="<s:property value="url"/>">��������û���Զ���ת�����˴�</a></p>		
		</div>
	  </s:else>
	  <img src="images/bottom.jpg" border="0" width="100%" height="60"/>
	</body>
</html>