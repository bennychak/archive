<!-- #include file="ConnStatData.asp" -->
<!-- #Include File="../System/CheckAdmin.asp"-->
<%
Response.Expires=0
Dim Rows,i
Sql="Select Top 30 * From Visitor Order By Id DESC"
Rs.Open Sql,Conn,1,1
If Not Rs.Bof And Not Rs.Eof Then
   Assay=Rs.GetRows
   Rows=Ubound(Assay,2)
Else
   Rows=-1
End If
Rs.Close
Conn.Close
Set Rs=Nothing
Set Conn=Nothing
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
      <td height="24" colspan="4"><font color="#FFFFFF"><strong>最近30位访问者信息分析</strong></font></td>
    </tr>
    <tr bgcolor="#D7E4F7">
      <td width="15%">访问日期</td>
      <td width="15%">访问时间</td>
      <td width="15%">所在地址</td>
      <td width="55%">链接页面</td>
    </tr>
    <%for i=0 to Rows
	    Exfor=Exfor+1%>
    <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
      <td><%=Assay(1,i)%></td>
      <td><%=FormatDateTime(Assay(2,i),4)%></td>
      <td><%=Assay(4,i)%></td>
      <td><% If Assay(8,i)="直接输入或书签导入" Then%>
        <%=Left(Assay(8,i),56)%>
        <%Else%>
        <a href="<%=Assay(8,i)%>"><%=Left(Assay(8,i),56)%></a>
        <%End If%></td>
    </tr>
    <%If Exfor>=30 Then Exit For
	    Next%>
  </table>
</div>
</BODY>
</HTML>
