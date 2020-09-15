<!-- #include file="ConnStatData.asp" -->
<!-- #Include File="../System/CheckAdmin.asp"-->
<%
Response.Expires=0
Dim Percent(),BarWidth()
Dim Visit,TotalNum,Assay,MaxWidth,Rows,i

MaxWidth=270
TotalNum=0
Visit=array("","首次","二次","三次","四次","五次","六次","七次","八次","九次","十次以上")
Sql="Select * From FVisit"
Rs.Open Sql,Conn,1,1
If Not Rs.Bof And Not Rs.Eof Then
   Assay=Rs.GetRows
   Rows=10
Else
   Rows=-1
End If
Rs.Close
Conn.Close
Set Rs=Nothing
Set Conn=Nothing
For i=0 to Rows
	TotalNum=TotalNum+Assay(i,0)
Next
ReDim Percent(Rows)
ReDim BarWidth(Rows)
For i=0 to Rows
    If TotalNum>0 Then
	   Percent(i)=FormatNumber(Int(Assay(i,0)/TotalNum*10000)/100,2,-1)&"%"
       BarWidth(i)=Assay(i,0)/TotalNum*MaxWidth
	End If
Next
%>
<HTML>
<HEAD>
<TITLE>网站统计分析系统</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<link rel="stylesheet" href="images/style.css">
</HEAD>
<%
if Instr(session("AdminPurview"),"|117,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限
%>
<BODY>
<div align="center">
  <table width="720" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td height="24" colspan="8"><font color="#FFFFFF"><strong>网站流量统计：包括年，月，日，IP，浏览器类型等非常详细的分析报表</strong></font></td>
    </tr>
    <tr bgcolor="#EBF2F9">
      <td align="center"><a href="Infolist.asp">统计概况</a></td>
      <td align="center"><a href="FVisitor.asp">最近访问</a></td>
      <td align="center"><a href="StatYear.asp">年 报 表</a></td>
      <td align="center"><a href="StatMonth.asp">月 报 表</a></td>
      <td align="center"><a href="StatWeek.asp">周 报 表</a></td>
      <td align="center"><a href="StatDay.asp">日 报 表</a></td>
      <td align="center"><a href="History.asp">历史报表</a></td>
      <td align="center"><a href="Rereg.asp">修改信息</a></td>
    </tr>
    <tr bgcolor="#EBF2F9">
      <td align="center"><a href="FArea.asp">地区分析</a></td>
      <td align="center"><a href="FAddress.asp">地址分析</a></td>
      <td align="center"><a href="FIptwo.asp">IP 地 址</a></td>
      <td align="center"><a href="Fweburl.asp">链接页面</a></td>
      <td align="center"><a href="FCounter.asp">访问次数</a></td>
      <td align="center"><a href="FSystem.asp">操作系统</a></td>
      <td align="center"><a href="FBrowser.asp">浏 览 器</a></td>
      <td align="center"><a href="FScreen.asp">屏幕大小</a></td>
    </tr>
  </table>
  <br>
  <table width="720" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td height="24" colspan="4"><font color="#FFFFFF"><strong>访问次数统计分析&nbsp;</strong>(&nbsp;总量：<%=TotalNum%>&nbsp;)</font></td>
    </tr>
    <tr bgcolor="#D7E4F7">
      <td width="25%">次数分析</td>
      <td width="20%">访问人数</td>
      <td width="15%">百分比</td>
      <td width="40%">图示</td>
    </tr>
    <%for i=1 to Rows%>
    <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
      <td><%=Visit(i)%></td>
      <td><%=Assay(i,0)%></td>
      <td><%=Percent(i)%></td>
      <td><img src="Images/bar.gif" width="<%=Barwidth(i)%> "height="8"></td>
    </tr>
    <%Next%>
  </table>
</div>
</BODY>
</HTML>
