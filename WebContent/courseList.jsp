<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css" />
	  <link rel="stylesheet" type="text/css" href="css/style1.css" />
	  <script language="JavaScript" src="script/fenye.js"></script>
	  <script language="JavaScript" src="script/keyUp.js"></script>
	  <script language="JavaScript">
	  	function showDel(tgname,tgid){
	  		str = "ȷ��ɾ���γ�[<"+tgname+">]�𣿣���";
	  		if(confirm(str)){
	  			window.location.href="TCLAction.action?actionStr=del&tgid="+tgid;
	  		}
	  	}
	  </script>
	</head>
	<body>
	  <s:if test="content.size()!=0">
	  <h3 style="text-align:center;margin-top:1em;">�γ��б�</h3>
	  <div class="indexbox" style="margin-top:0.5em;margin-left:1em;">
	  	<table cellspacing="0" cellpadding="0" width="100%" border="1">
	  		<tr>
	  			<s:form action="TCLAction" theme="simple">
	  			<td align="right" colspan="5" style="border-top:0px;">	  				
				  	<s:radio name="key" value="'TGID'"
				  		list="#{'TGID':'���γ̺�','TGName':'���γ���'}"
				  		listKey='key'
				  		listValue='value'
				  	/>
				  	<s:textfield cssClass="input2" name="value" value="������ؼ���"
				  				 onfocus="value=''"/>
				  	 <script>
				  	 	document.all.key.onkeypress=keyUp;
				  	 </script>
				  	<s:submit id="button2" value="����"/>
	  			</td>
	  			</s:form>
	  		</tr>
	  		<tr>
	  			<th align="center">�γ̺�</th>
	  			<th align="center">�γ���</th>
	  			<th align="center">����</th>
	  			<th align="center">�γ���ʦ</th>
	  			<th align="center">�༭/ɾ��</th>
	  		</tr>
	  		<s:iterator value="content" status="st">
	  			<tr id="list<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('list<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('list<s:property value="#st.index"/>')"
	  			>
	  				<td width="20%" align="center"><s:property value="tgid"/></td>
	  				<td width="20%" align="center"><s:property value="tgname"/></td>
	  				<td width="20%" align="center"><s:property value="tdetail"/></td>
	  				<td width="20%" align="center">
	  					<s:property value="uname"/>
	  				</td>
	  				<td width="20%" align="center">
	  					<a href="ECAction.action?tgid=<s:property value='tgid'/>">
	  					<img src="images/edit.gif"/ border="0" width="15" height="15" style="vertical-align:middle;">�༭</a>
	  					
	  					<a href="JavaScript:showDel('<s:property value='tgname'/>',<s:property value='tgid'/>)">
	  					<img src="images/no.png"/ border="0" width="15" height="15" style="vertical-align:middle;">ɾ��</a>
	  				</td>
	  			</tr>
	  		</s:iterator>
	  	</table>
	  </div>
		<!-- ��ҳ������ -->
		<s:url id="target" value="TCLAction" includeParams="none"/>	  
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