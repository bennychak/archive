<!-- #include file="ConnStatData.asp" -->
<!-- #Include File="../System/CheckAdmin.asp"-->
<%
Action=Request.Form("Rereg")
WebName=Request.Form("WebName")
WebUrl=Request.Form("WebUrl")
PassWord=Request.Form("PassWord")
Select Case Action
Case "更改信息":
     Flag=0
     Sql="Select * from InfoList"
     Rs.Open Sql,Conn,1,3
     If Rs("PassWord")<>PassWord Then Flag=2
     If Rs("PassWord")=PassWord And WebUrl<>"" And WebName<>"" Then
        Rs("Name")=WebName
        Rs("Url")=WebUrl
        StartDate=Rs("StartDate")
        Rs.Update
        Flag=1
     End If
     Rs.Close
     Conn.Close
     Set Rs=Nothing
     Set Conn=Nothing

Case "统计重置":
     Restart=0
     Sql="Select * from InfoList"
	 Rs.Open Sql,Conn,1,3
	 If Rs("PassWord")=PassWord Then
	    OldPasswd=Rs("PassWord")
		OldWebName=Rs("Name")
        OldWebUrl=Rs("Url")
		Rs.Delete
		Rs.Addnew
	    If WebName<>"" Then OldWebName=WebName		
        If WebUrl<>"" Then OldWebUrl=WebUrl
		Rs("Name")=OldWebName
		Rs("Url")=OldWebUrl
		WebName=Rs("Name")
		WebUrl=Rs("Url")
		StartDate=Cstr(Year(Date)&"-"&Month(Date)&"-"&Day(date))
		Rs("StartDate")=StartDate
		Rs("OldDay")=Cstr(Year(Date)&"-"&Month(Date)&"-"&Day(date))
        Rs("PassWord")=OldPasswd
		Restart=1
	 End If
     Rs.Update
	 Rs.Close
	 If Restart=1 Then
        Sql="Delete * from FAddress"
	    Conn.Execute(Sql)
        Sql="Delete * from FArea" 
		Conn.Execute(Sql)
		Sql="Delete * from FIpone"
		Conn.Execute(Sql)
		Sql="Delete * from FIptwo"
		Conn.Execute(Sql)
		Sql="Delete * from FBrowser"
		Conn.Execute(Sql)
		Sql="Delete * from FSystem"
		Conn.Execute(Sql)
		Sql="Delete * from FScreen"
		Conn.Execute(Sql)
		Sql="Delete * from FMozilla"
		Conn.Execute(Sql)
		Sql="Delete * from FRefer"
		Conn.Execute(Sql)
		Sql="Delete * from FWeburl"
		Conn.Execute(Sql)
		Sql="Delete * from FVisit"
		Conn.Execute(Sql)
		Sql="Delete * from StatDay"
		Conn.Execute(Sql)
		Sql="Delete * from StatMonth"
		Conn.Execute(Sql)
		Sql="Delete * from StatYear"
		Conn.Execute(Sql)
		Sql="Delete * from StatWeek"
		Conn.Execute(Sql)
		Sql="Delete * from Visitor"
		Conn.Execute(Sql)
	 End If

End Select


%>
<HTML>
<HEAD>
<TITLE>网站统计分析系统</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<link rel="stylesheet" href="images/style.css">
</HEAD>
<%
if Instr(session("AdminPurview"),"|118,")=0 then 
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
  <table border=0 cellpadding=3 cellspacing=1 width="720" bgcolor="#6298E1">
    <tbody>
      <tr>
        <td><font color="#FFFFFF"><strong>修改网站信息或统计清零</strong></font></td>
      </tr>

      <%
		  If Action="更改信息" Then
		  %>
      <tr bgcolor="#FFFFFF">
        <td align=left bgcolor="#EBF2F9"><table width="40%" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr valign="middle" align="center">
              <td colspan="3"><%
					If Flag=1 Then
                       Response.write("<br><br><div align='left'>操作状态：<img src='Images/Success.gif' align='absmiddle'>&nbsp;修改成功</div><br>")
					   Response.write("<div align='left'>网站名称："&WebName&"</div><br>")
					   Response.write("<div align='left'>网站网址："&WebUrl&"</div><br>")
				       Response.write("<div align='left'>开始日期："&StartDate&"</div><br>")
					   Response.write("<div align='left'>继续操作：<a href='Rereg.asp'>返回查看</a></div><br>")				   
                    Else
					   Response.write("<br><br><div align='left'>操作状态：<img src='Images/Failure.gif' align='absmiddle'>&nbsp;修改失败</div><br>")
					   If WebName="" Then Response.write("<div align='left'>网站名称：未输入</div><br>")
                       If WebUrl="" Then Response.write("<div align='left'>网站网址：未输入</div><br>")
					   If Flag=2 Then Response.write("<div align='left'>确 认 码：不正确或未输入</div><br>")
					   Response.write("<div align='left'>继续操作：<a href='javascript:history.back();'>返回重新输入</a></div><br>")
					End If
					%>              </td>
            </tr>
        </table></td>
      </tr>
      <%
		  End if
          If Action="统计重置" Then
		  %>
      <tr bgcolor="#FFFFFF">
        <td align=left bgcolor="#EBF2F9"><table width="40%" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr valign="middle" align="center">
              <td colspan="3"><% If Restart=1 Then
                       Response.write("<br><br><div align='left'>操作状态：<img src='Images/Success.gif' align='absmiddle'>&nbsp;统计重置成功</div><br>")
					   Response.write("<div align='left'>网站名称："&WebName&"</div><br>")
					   Response.write("<div align='left'>网站网址："&WebUrl&"</div><br>")
				       Response.write("<div align='left'>开始日期："&StartDate&"</div><br>")
					   Response.write("<div align='left'>继续操作：<a href='Rereg.asp'>返回查看</a></div><br>")
					 Else
					   Response.write("<br><br><div align='left'>操作状态：<img src='Images/Failure.gif' align='absmiddle'>&nbsp;统计重置失败</div><br>")
					   Response.write("<div align='left'>确 认 码：不正确或未输入</div><br>")
					   Response.write("<div align='left'>继续操作：<a href='javascript:history.back();'>返回重新输入</a></div><br>")
					 End If


                 %>              </td>
            </tr>
        </table></td>
      </tr>
      <%End If%>
    </tbody>
  </table>
  <br>
</div>
</BODY>
</HTML>
