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
	  		if(rcontent==""){
	  			alert("�ش����ݲ���Ϊ��");
	  			return false;
	  		}
	  		if(rcontent.length<8){
	  			alert("�ش��������ݳ��Ȳ���С��8");
	  			return false;
	  		}
	  		document.all.button.disabled=true;
			return true;
	  	}
	  	function setTitle(title){
	  		document.all.bt.value=title;
	  	}
	  </script>
	</head>
	<body>
	  <s:include value="top.jsp"/>
	  <div id="nav">
	  <table>
	  	<tr>
	  		<td>
	  			<a href="IndexAction.action?actionStr=all"><s:text name="msg.nav"/></a>&nbsp;&raquo;	  	
			  	<a href="TTLAction.action?tgid=<s:property value="gid"/>">
			  		<s:property value="gName"/>
			  	</a>&nbsp;&raquo;
			  	<s:property value="title"/>
	  		</td>
	  		<td align="right">
	  		<s:if test="#session.uid!=null">
	  			<input type="button" id="button3" value="��Ҫ����" onclick="window.location.href='GMCAction.action'"/>
	  			<input type="button" id="button3" value="��Ҫ�ش�" 
	  				onclick="window.location.href='#1';document.all.nr.focus();"/>
	  			</s:if>
	  		</td>
	  	</tr>
	  </table>	  	
	  </div>
	  <s:iterator value="content" status="st">
	  <div class="revert">
		  <s:if test="#st.first">
		  	<h1><s:property value="title"/></h1>
		  </s:if>
	  		<table cellpadding="0" cellspacing="0">
	  			<tr>
	  				<td class="author" height="200">
	  					<span>&nbsp;<s:property value="uname"/></span>
	  					<div class="tx">
							<img src="<s:property value="tx"/>" border="0" width="150" height="200"/>
						</div>
						<p><em><s:property value="tag"/></em></p>
						<p>ע��ʱ��&nbsp;<s:property value="zcsj"/></p>
						<p>����½&nbsp;<s:property value="zhdl"/></p>
	  				</td>
	  				<td class="nr">
	  					<span>
	  						<em>
	  							<s:if test="#st.first">
	  								¥��
	  							</s:if>
	  							<s:else>
	  								<s:property value="#st.index"/>¥
	  							</s:else>	  												
	  						</em>
	  						&nbsp;������&nbsp;<s:property value="fbsj"/>
	  					</span>
	  					<h2><s:property value="title"/></h2>
	  					<h3><s:property value="content"/></h3>
	  				</td>
	  			</tr>
	  			<tr>
	  				<td class="author"></td>
	  				<td>
	  					<div class="operate">	
	  					<span style="valign=middle;">  						
	  						<p><a href="#" onclick="scroll(0,0)">TOP</a></p>
	  						<s:if test="!#session.uname.equals(uname)"><!-- �ûظ����Լ��ظ���ʱ�� -->
	  						<p><a href="#1" onclick="setTitle('�ش� <s:property value="uname"/>')">�ظ�</a></p>
	  						</s:if>
	  					</span>
	  					</div>
	  				</td>
	  			</tr>
	  		</table>
	  </div>
	  </s:iterator>
	  <!-- ��ҳ������ -->
	  <s:url id="target" value="TTDAction" includeParams="none"/>	  
	  <s:include value="nav.jsp">
	  </s:include>
	  <!-- �ظ����ӵı� -->
	  <div class="hf">
	  	<h4><a name="#1"></a>�ظ�������</h4>
	  	<div class="notice">
	  		����ע�����
	  		<p>1.�����Ϊ��</p>
	  		<p>2.���÷���Υ������</p>
	  		<p>3.�ش�����������������8</p>
	  		<p>4.��Ҫ�ظ��뱾�����޹صĶ���</p>
	  	</div>
	  	<s:form action="EAction" theme="simple" onsubmit="return checkRevert()">
	  		<table>
	  			<tr>
	  				<td>���⣺</td>
	  				<td><s:textfield name="bt" cssClass="htbt"/></td>
	  			</tr>
	  			<tr>
	  				<td>���ݣ�</td>
	  				<td><s:textarea name="nr" rows="5" cols="80" cssClass="textarea" /></td>
	  			</tr>
	  			<tr>
	  				<td>
	  					<s:hidden name="actionStr" value="hftz"/>
	  					<s:hidden name="tid"/>
	  				</td>
	  				<td>
	  					<s:submit id="button" value="��������"/>
	  				</td>
	  			</tr>
	  		</table>
	  	</s:form>
	  </div>
	  <img src="images/bottom.jpg" border="0" width="100%" height="60"/>
	</body>
</html>