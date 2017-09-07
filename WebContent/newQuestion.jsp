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
	  			alert("提问标题不得为空");
	  			return false;
	  		}
	  		if(rtitle.length<2){
	  			alert("问题标题长度不得小于2");
	  			return false;
	  		}
	  		if(rcontent==""){
	  			alert("问题内容不得为空");
	  			return false;
	  		}
	  		if(rcontent.length<8){
	  			alert("问题内容长度不得小于8");
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
	  			<a href="IndexAction.action?actionStr=all"><s:text name="在线答疑"/></a>	  	
				&raquo;&nbsp发起新问题			  	
	  		</td>
	  	</tr>
	  </table>
	  </div>
	  <!-- 发起新问题的表单 -->
	  <div class="tw">
	  	<div class="left">
		  	<h4>提出新问题</h4>
		  	<div class="notice2">
		  		请注意：
		  		<p>1.不得谩骂他人</p>
		  		<p>2.标题长度不得低于2</p>
		  		<p>3.问题内容不得少于8</p>
		  		<p>4.不得发表违规内容</p>
		  		<p>5.不要发表与本课程无关的问题</p>
		  	</div>
	  	</div>
	  	<s:form action="EAction" theme="simple" onsubmit="return checkRevert()">
	  		<table>
	  			<tr>
	  				<td>课程：</td>
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
	  				<td>标题：</td>
	  				<td><s:textfield name="bt" cssClass="wtbt"/></td>
	  			</tr>
	  			<tr>
	  				<td>内容：</td>
	  				<td><s:textarea name="nr" rows="8" cols="80" cssClass="textarea" /></td>
	  			</tr>
	  			<tr>
	  				<td>
	  					<s:hidden name="actionStr" value="fqwt"/>
	  				</td>
	  				<td>
	  					<s:submit id="button4" value="发起问题"/>
	  				</td>
	  			</tr>
	  		</table>
	  	</s:form>
	  </div>
	  <img src="images/bottom.jpg" border="0" width="100%" height="60"/>
	</body>
</html>