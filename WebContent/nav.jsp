<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
 <table width="98%" border="0" align="center" style="margin:4px 0px;">
  	<tr align="right">
  		<td align="left" style="font-size:13px;">
  			��${total}ҳ|��${curPage}ҳ
  		</td>
  		<s:form action="%{target}" theme="simple">
  		<td width="65%"><font size="2">��ҳ��Ŀ��</font>  		
	        <s:select
	           name="span"
	           list="#{'1':'ÿҳ1��','2':'ÿҳ2��','5':'ÿҳ5��','10':'ÿҳ10��','15':'ÿҳ15��','20':'ÿҳ20��'}"
	           listKey="key"
	           listValue="value"
	           onchange="this.form.submit();"
	         />
	    </td>
	    </s:form>
	   	<td width="7%">
	        <s:if test="curPage!=1">
	        	<a href="?curPage=<s:property value="curPage-1"/>">
	            	<img src="images/pre.gif" alt="��һҳ" border="0">
	          	</a>
	        </s:if>
      	</td>
  		<s:form action="%{target}" theme="simple">
  		<td width="7%">
	        <s:select
	           name="curPage"
	           list="pageList"
	           listKey="key"
	           listValue="value"
	           onchange="this.form.submit();"
	         />					
  		</td>
  		</s:form>
	   	<td width="7%">
	        <s:if test="curPage<total">
	        	<a href="?curPage=<s:property value="curPage+1"/>">
	            	<img src="images/next.gif" alt="��һҳ" border="0">
	          	</a>
	        </s:if>
      	</td>	  		
  	</tr>
</table>