<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <link rel="stylesheet" type="text/css" href="css/style1.css"/>
	  <script language="JavaScript" src="script/fenye.js"></script>
	  <script language="JavaScript" src="script/keyUp.js"></script>
	  <script language="JavaScript">
	  	function showDel(uname,uid){
	  		var str = "ȷ��ɾ���û�[<"+uname+">]������";
	  		if(confirm(str)){
	  			window.location.href="TULAction.action?actionStr=del&uid="+uid;
	  		}
	  	}
	  	function showSetTeacher(uname,uid){
	  		var str = "ȷ�������û�[<"+uname+">]Ϊ��ʦ������";
	  		if(confirm(str)){
	  			window.location.href="TULAction.action?actionStr=setTeacher&uid="+uid;
	  		}
	  	}
	  	function showCancelTeacher(uname,uid){
	  		var str = "ȷ��ȡ���û�[<"+uname+">]����ʦ��ݣ�����";
	  		if(confirm(str)){
	  			window.location.href="TULAction.action?actionStr=cancelTeacher&uid="+uid;
	  		}
	  	}
	  </script>
	</head>
	<body>
	  <s:if test="content.size()!=0">
	  <h3 style="text-align:center;margin-top:1em;">�û��б�</h3>
	  <div class="indexbox" style="margin-top:0.5em;">
	  	<table cellspacing="0" cellpadding="0" width="100%" border="1">
	  		<tr>
	  			<s:form action="TULAction" theme="simple">
	  			<td colspan="5" valign="middle" style="border:0px;">
	  				<font size="2.8">��ѡ�����:</font>
	  				<s:select name="condition" theme="simple"			
	  						value="%{selected}"
	  						onchange="JavaScript:this.form.submit();"
	  						list="#{'all':'�����û�','stu':'ѧ���û�','teacher':'��ʦ�û�'}"
	  						listKey='key'
	  						listValue='value'
	  				/>
	  			</td>
	  			</s:form>
	  			<s:form action="TULAction" theme="simple">
	  			<td align="right" colspan="5" style="border:0px;">	  				
				  	<s:radio name="key" value="'UName'"
				  		list="#{'UID':'���û�ID','UName':'���û���'}"
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
	  			<th width="6%" align="center">�û�ID</th>
	  			<th width="6%" align="center">����</th>
	  			<th width="4%" align="center">�Ա�</th>
	  			<th width="10%" align="center">��ɫ</th>	  			
	  			<th width="10%">�����ʼ�</th>
	  			<th width="10%">ע��ʱ��</th>
	  			<th width="15%" align="center">����½</th>	  
	  			<th width="15%" align="center">��󷢱�</th>	  
	  			<th width="7%" align="center">Ȩ��</th>	  
	  			<th width="5%" align="center">ɾ��</th>
	  		</tr>  		
	  		<s:iterator value="content" status="st">
	  			<tr id="topList<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('topList<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('topList<s:property value="#st.index"/>')"
	  			>
	  				<td align="center"><s:property value="uid"/></td>
	  				<td align="center"><s:property value="uname"/></td>
	  				<td align="center"><s:property value="gender"/></td>
	  				<td align="center">
	  					<s:if test="%{role==0}">
	  						ѧ��
	  						<a href="#" onclick="JavaScript:showSetTeacher('<s:property value='uname'/>','<s:property value='uid'/>');">��Ϊ��ʦ</a>
	  					</s:if>
	  					<s:else>
	  						��ʦ
	  						<a href="#" onclick="JavaScript:showCancelTeacher('<s:property value='uname'/>','<s:property value='uid'/>');">ȡ����ʦ</a>
	  					</s:else>
	  				</td>
	  				<td align="center"><s:property value="email"/></td>
	  				<td align="center"><s:property value="regDate"/></td>
	  				<td align="center"><s:property value="lastLogin"/></td>
	  				<td align="center"><s:property value="lastEmit"/></td>
	  				<td align="center">
	  					<s:if test="%{permit==1}">
	  						��
	  						<a href="TULAction.action?actionStr=jy&uid=<s:property value='uid'/>">����</a>
	  					</s:if>	
	  					<s:else>
	  						��
	  						<a href="TULAction.action?actionStr=hf&uid=<s:property value='uid'/>">�ָ�</a>
	  					</s:else>
	  				</td>
	  				<td align="center">
	  					<a href="JavaScript:showDel('<s:property value='uname'/>','<s:property value='uid'/>')">
	  					<img src="images/no.png"/ border="0" width="15" height="15" style="vertical-align:middle;">ɾ��</a>
	  				</td>
	  			</tr>
	  		</s:iterator>
	  	</table>
	  </div>
	  <!-- ��ҳ�ĵ����� -->
	  <s:url id="target" value="TULAction" includeParams="none"/>	  
	  <s:include value="nav.jsp">
	  </s:include>
	  </s:if>
	  <s:else>
	  	<div class="personal_messagebox">
			<h1>����ѧԺ��ʾ����û�����ݿ���ʾ</h1>
			<p><s:property value="message"/></p>
			<p><a href="adminIndex.jsp target="_top"">��˴�ȥ��ҳ</a></p>
			<p><a href="JavaScript:history.back();">������ﷵ����һҳ</a></p>
		</div>
	  </s:else>
	  <script language="JavaScript">
	  	var message = "<s:property value="message"/>";
	  	if(message!=null||message!=""){
	  		eval(message);
	  	}
	  </script>
	</body>
</html>