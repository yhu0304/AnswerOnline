<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>  
	  <link rel="stylesheet" type="text/css" href="css/style1.css"/>
	</head>
	<body>
		
	  	<table style="margin-top:4em;" width="60%" border="1" align=center>
	  	<caption>��������</caption>
	  		<tr>
	  			<td align="right" width="100">
	  				����:
	  			</td>
	  			<td>
	  				<s:if test="title==''">&nbsp;</s:if>
	  				<s:property value="title"/>
	  			</td>	  			
	  		</tr>
	  		<tr>
	  			<td style="vertical-align:top;" align="right">
	  				����:
	  			</td>
	  			<td>
	  				<s:property value="nr"/>
	  			</td>	  			
	  		</tr>	  		
	  	</table>
	  </div>
	</body>
</html>