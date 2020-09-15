<!-- #include file="ConnStatData.asp" -->
<!-- #Include File="../System/CheckAdmin.asp"-->
<%
Response.Expires=0
Sql="Select * From InfoList"
Rs.Open Sql,Conn,1,1
On Error Resume Next
Name=Rs("Name")
Url=Rs("Url")
DayNum=Rs("DayNum")
TotalNum=Rs("TotalNum")
MonthMaxNum=rs("MonthMaxNum")
MonthMaxDate=Rs("MonthMaxDate")
DayMaxNum=Rs("DayMaxNum")
DayMaxDate=Rs("DayMaxDate")
HourMaxNum=Rs("HourMaxNum")
HourMaxTime=Rs("HourMaxTime")
LiaoningNum=Rs("LiaoningNum")
ChinaNum=Rs("ChinaNum")
OtherNum=Rs("OtherNum")
StartDate=Rs("StartDate")
StatDayNum=DateDiff("D",StartDate,Date)+1
If StatDayNum<=0 Then
   AveDayNum=StatDayNum
Else
   AveDayNum=Cint(TotalNum/StatDayNum)
End If
Rs.Close
Sql="Select Top 1 * From FBrowser Order By TBrwNum DESC"
Rs.Open Sql,Conn,1,1
If Not Rs.Bof And Not Rs.Eof Then
MaxBrw=Rs("TBrowser")
MaxBrwNum=Rs("TBrwNum")
End If
Rs.Close
Sql="Select Top 1 * From FSystem Order By TSysNum DESC"
Rs.Open Sql,Conn,1,1
If Not Rs.Bof And Not Rs.Eof Then
MaxSys=Rs("TSystem")
MaxSysNum=Rs("TSysNum")
End If
Rs.Close
Sql="Select Top 1 * From FScreen Order By TScrNum DESC"
Rs.Open Sql,Conn,1,1
If Not Rs.Bof And Not Rs.Eof Then
MaxScr=Rs("TScreen")
MaxScrNum=Rs("TScrNum")
End If
Rs.Close
Sql="Select Top 1 * From FArea Order By TAreNum DESC"
Rs.Open Sql,Conn,1,1
If Not Rs.Bof And Not Rs.Eof Then
MaxAre=Rs("TArea")
MaxAreNum=Rs("TAreNum")
End If
Rs.Close
Sql="Select Top 1 * From FWeburl Order By TWebNum DESC"
Rs.Open Sql,Conn,1,1
If Not Rs.Bof And Not Rs.Eof Then
MaxWeb=Rs("TWeburl")
MaxWebNum=Rs("TWebNum")
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
<link rel="stylesheet" href="Images/Style.css">
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
      <td align="center"><a href="FScreen.asp">屏幕大小</a></td>
    </tr>
    <tr bgcolor="#EBF2F9">
      <td align="center"><a href="FArea.asp">地区分析</a></td>
      <td align="center"><a href="FAddress.asp">地址分析</a></td>
      <td align="center"><a href="FIptwo.asp">IP 地 址</a></td>
      <td align="center"><a href="Fweburl.asp">链接页面</a></td>
      <td align="center"><a href="FCounter.asp">访问次数</a></td>
      <td align="center"><a href="FSystem.asp">操作系统</a></td>
      <td align="center"><a href="FBrowser.asp">浏 览 器</a></td>
      <td align="center"><a href="Rereg.asp">修改信息</a></td>
    </tr>
  </table>
  <br>
  <table width="720" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
        <tr>
          <td height="24" colspan="2"><font color="#FFFFFF"><strong>网站流量统计概况</strong></font></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td width="50%">网站名称</td>
          <td width="50%"><%=Name%></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>网站网址</td>
          <td><a href="<%=Url%>"><%=Url%></a></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>总统计天数</td>
          <td><%=StatDayNum%></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>开始统计日期</td>
          <td><%=StartDate%></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>总访问量</td>
          <td><%=AveDayNum%></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>平均日访量</td>
          <td><%=AveDayNum%></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>今日访问量</td>
          <td><%=DayNum%></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>最高月访量</td>
          <td><%=MonthMaxNum%></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>最高月访量月份</td>
          <td><%=MonthMaxDate%></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>最高日访量</td>
          <td><%=DayMaxNum%></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>最高日访量日期</td>
          <td><%=DayMaxDate%></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>最高时访量</td>
          <td><%=HourMaxNum%></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>最高时访量时间</td>
          <td><%=HourMaxTime%></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>省内访问人数</td>
          <td><%=LiaoningNum%></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>国内访问人数</td>
          <td><%=ChinaNum%></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>国外访问人数</td>
          <td><%=OtherNum%></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>最常用浏览器</td>
          <td><%=MaxBrw%> (<%=MaxBrwNum%>)</td>
        </tr>
		
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>最常用操作系统</td>
          <td><%=MaxSys%> (<%=MaxSysNum%>)</td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>常用屏幕分辨率</td>
          <td><%=MaxScr%> (<%=MaxScrNum%>)</td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>访问最多的地区</td>
          <td><%=MaxAre%> (<%=MaxAreNum%>)</td>
        </tr>
        <tr bgcolor="#EBF2F9" onMouseOver = 'this.style.backgroundColor = "#FFFFFF"' onMouseOut = 'this.style.backgroundColor = ""' style="cursor:hand">
          <td>访问最多的页面</td>
          <td><% If MaxWeb="直接输入或书签导入" Then%>
            <%=Left(MaxWeb,40)%> (<%=MaxWebNum%>)
            <%Else%>
            <a href="<%=MaxWeb%>"><%=Left(MaxWeb,40)%></a> (<%=MaxWebNum%>)
          <%End If%></td>
        </tr>
  </table>
<br>
<!--<Script language="javascript" src="Stat.asp"></Script>-->
</div>
</BODY>
</HTML>
