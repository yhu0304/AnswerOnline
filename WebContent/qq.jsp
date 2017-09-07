<!-- 用来浮动显示提示信息的容器 -->
<table 
  id="myerr" 
  width="120"
  border="0" 
  class="jd" 
  bgcolor="black" 
  cellspacing="1" 
  onclick="hideErr();"
>
<tr bgcolor="white"  valign="bottom">
   <td id="myerrs" align="center"></td>
</tr>
</table>
<!-- 错误信息气球的尖角 -->
<img class="jd" src="images/up.gif" id="myup" onclick="hideErr();" /> 	  
<!-- 错误信息气球逐渐出现的遮挡物 -->
<span id="errzd"/>