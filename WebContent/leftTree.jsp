<%@ page contentType="text/html; charset=GBK" language="java"%>  
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="css/tree.css" />
		<script language="JavaScript">
	   	    function zkhsq(root,list)
	   	    {
	   	       if(list.style.display=="none")
	   	       {
	   	          list.style.display="block";
	   	          root.innerHTML="<img src='images/open.png'/>";
	   	       }
	   	       else
	   	       {
	   	          list.style.display="none";
	   	          root.innerHTML="<img src='images/closed.png'/>";
	   	       }
	   	    }
	   	    function xz(b){
	   	    	var a = document.getElementById(a);	   	    	
	   	    	for(var i=1;i<13;i++){
	   	    		var a = document.getElementById("a"+i);
	   	    		if(i==b){
	   	    			a.className="xz";
	   	    		}
	   	    		else{
	   	    			a.className="";
	   	    		}
	   	    	}
	   	    }
	     </script>
	</head>
	<body>
	 <table border="0" class="tree">
      	<tr>
      	  <td id="root1" onclick="zkhsq(document.all.root1,document.all.list1)">
      	  	<img src='images/open.png'/>
      	  </td>	
      	  <td><a href=# onclick="zkhsq(document.all.root1,document.all.list1)">�γ̹���</a></td>	
      	</tr>
      	<tr>
      	  <td></td>	
      	  <td>
      	  	<table id="list1" border="0" style="display:block">
		      	<tr>
		      	  <td>
		      	  	<img src='images/file.gif'/>
		      	  	<a href="addCourse.jsp" id="a1" target="mainFrame" onclick="xz('1')">�����γ�</a>
		      	  </td>	
		      	</tr>    
		      	<tr>
		      	  <td>
		      	  	<img src="images/file.gif"/>
		      	  	<a href="TCLAction.action?actionStr=all" target="mainFrame" id="a2" onclick="xz('2')">�γ��б�</a>
		      	  </td>	
		      	</tr>  		      	  	  		
      	  	</table>
      	  </td>	
      	</tr>
      	<tr>
      	  <td id="root2" onclick="zkhsq(document.all.root2,document.all.list2)">
      	  	<img src='images/open.png'/>
      	  </td>	
      	  <td><a href=# onclick="zkhsq(document.all.root2,document.all.list2)">���ݹ���</a></td>	
      	</tr>
      	<tr>
      	  <td></td>	
      	  <td>
      	  	<table id="list2" border="0" style="display:block">
		      	<tr>
		      	  <td>
		      	  	<img src="images/file.gif"/>
		      	  	<a href="QLAction.action?actionStr=all" target="mainFrame" id="a3" onclick="xz('3')">���ʹ���</a>
		      	  </td>	
		      	</tr>    
		      	<tr>
		      	  <td>
		      	  	<img src="images/file.gif"/>
		      	  	<a href="TRLAction.action?actionStr=all" target="mainFrame" id="a4" onclick="xz('4')">�ظ�����</a>
		      	  </td>	
		      	</tr>  		      	  	  		
      	  	</table>
      	  </td>
      	</tr>
      	<tr>
      	  <td id="root3" onclick="zkhsq(document.all.root3,document.all.list3)">
      	  	<img src='images/open.png'/>
      	  </td>	
      	  <td><a href="#" onclick="zkhsq(document.all.root3,document.all.list3)">�û�����</a></td>	
      	</tr>
      	<tr>
      	  <td></td>	
      	  <td>
      	  	<table id="list3" border="0" style="display:block">
		      	<tr>
		      	  <td>
		      	  	<img src="images/file.gif"/>
		      	  	<a href="TULAction.action?condition=all" target="mainFrame" id="a5" onclick="xz('5')">�û��б�</a>
		      	  </td>	
		      	</tr>    
		      	<tr>
		      	  <td>
		      	  	<img src="images/file.gif"/>
		      	  	<a href="addTeacher.jsp" target="mainFrame" id="a6" onclick="xz('6')">����û�</a>
		      	  </td>	
		      	</tr>
		      	<tr>
		      	  <td>
		      	  	<img src="images/file.gif"/>
		      	  	<a href="resetStuPwd.jsp" target="mainFrame" id="a7" onclick="xz('7')">�������� </a>
		      	  </td>	
		      	</tr>
      	  	</table>
      	  </td>
      	</tr>
      	      	
      	<tr>
      	  <td id="root4" onclick="zkhsq(document.all.root4,document.all.list4)">
      	  	<img src='images/open.png'/>
      	  </td>
      	  <td><a href=# onclick="zkhsq(document.all.root4,document.all.list4)">ϵͳά��</a></td>	
      	</tr>
      	<tr>
      	  <td></td>	
      	  <td>
      	  	<table id="list4" border="0" style="display:block">
		      	<tr>
		      	  <td>
		      	  	<img src="images/file.gif"/>
		      	  	<a href="adminChangePwd.jsp" target="mainFrame" id="a8" onclick="xz('8')">�޸�����</a>
		      	  </td>	
		      	</tr>
		      	<s:if test="#session.role==3">
		      	<tr>
		      	  <td>
		      	  	<img src="images/file.gif"/>
		      	  	<a href="TMLAction.action?actionStr=all" target="mainFrame" id="a9" onclick="xz('9')">����Ա�б�</a>
		      	  </td>
		      	</tr>
		      	<tr>
		      	  <td>
		      	  	<img src="images/file.gif"/>
		      	  	<a href="addManage.jsp" target="mainFrame" id="a10" onclick="xz('10')">��ӹ���Ա</a>
		      	  </td>
		      	</tr>		      	
		      	<tr>
		      	  <td>
		      	  	<img src="images/file.gif"/>
		      	  	<a href="resetManagePwd.jsp" target="mainFrame" id="a11" onclick="xz('11')">��������</a>
		      	  </td>
		      	</tr>
		      	</s:if>
      	  	</table>
      	  </td>
      	</tr>
      	<s:if test="#session.role>1">
      	<tr>
      		<td align="right"><img src="images/cmp.gif"/></td>
      		<td>
      			<a href="DYAction.action?actionStr=logout" target="_parent" id="a12" onclick="xz('12')">�˳�ϵͳ</a>
      		</td>
      	</tr>
      	</s:if>
      </table>
	</body>
</html>