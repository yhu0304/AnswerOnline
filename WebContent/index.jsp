<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css" />
	  <script language="JavaScript" src="script/fenye.js"></script>
	  <script language="JavaScript" src="script/keyUp.js"></script>
	</head>
	<body>
	  <s:include value="top.jsp"/>
	  <div id="nav">
	  	<table border="0" cellpadding="0" cellspacing="0">
	  		<tr>
	  			<td>
	  				<a href="IndexAction.action?actionStr=all"><s:text name="在线答疑"/></a>
	  			</td>
	  		
	  		</tr>
	  	</table>
	  </div>
	  <s:if test="indexList.size()!=0">
	  <div class="indexbox">
	  	<div class="indextitle">课程列表&nbsp;&nbsp;</div>
	  	<table cellspacing="0" cellpadding="0" width="100%" border="0">
	  		<tr>
	  			<th width="33%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;课程</th>
	  			<th width="5%">问题</th>
	  			<th width="5%">&nbsp;</th>
	  			<th width="5%">回复</th>
	  			<th width="2%">&nbsp;</th>
	  			<th width="50%">最后发表</th>
	  		</tr>
	  		<s:iterator value="indexList" status="st">
	  			<tr id="list<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('list<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('list<s:property value="#st.index"/>')"
	  			>
	  				<td>&nbsp;&nbsp;
	  					<a href="TTLAction.action?tgid=<s:property value="gid"/>" style="font-weight:bold;">
	  						<s:property value="gName"/></a><br>&nbsp;&nbsp;
	  					课程号：[<s:property value="gid"/>]
	  					－－－<s:property value="detail"/>
	  				</td>
	  				<td align="center">
	  					<s:property value="topic"/>
	  				</td>
	  				<td>&nbsp;</td>
	  				<td align="center">
	  					<s:property value="revert"/>
	  				</td>
	  				<td>&nbsp;</td>
	  				<td align="center">
	  				<s:if test="topic==0">
	  					－－－－－－－－－－－－－－－
	  				</s:if>
	  				<s:else>
		  					<a href="TTDAction.action?tid=<s:property value='tid'/>"><s:property value="title"/>
		  					by&nbsp<s:property value="uname"/>&nbsp-<s:property value="lastTime"/></a>
	  				</s:else>
	  				</td>
	  			</tr>
	  		</s:iterator>
	  	</table>
	  </div>
		<!-- 分页导航条 -->
		<s:url id="target" value="IndexAction" includeParams="none"/>	  
		<s:include value="nav.jsp">
		</s:include>
	  </s:if>
	  <s:else>
	  	<div class="messagebox">
			<h1>金陵学院提示您：没有内容可显示</h1>
			<p><s:property value="message"/></p>
			<p><a href="IndexAction.action">点此处去主页</a></p>
			<p><a href="<s:property value="url"/>">如果浏览器没有自动跳转，请点此处</a></p>		
		</div>
	  </s:else>
	  <img src="images/bottom.jpg" border="0" width="100%" height="60"/>
	</body>
</html>