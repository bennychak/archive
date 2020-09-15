<!-- #include file="ConnStatData.asp" -->
<!-- #Include File="../System/CheckAdmin.asp"-->
<%
Sql="Select * from InfoList"
Rs.Open Sql,Conn,1,3
WebName=Rs("Name")
WebUrl=Rs("Url")
Rs.Close
Conn.Close
Set Rs=Nothing
Set Conn=Nothing

%>
<script>
function delall()
{
  if(confirm("真的将所有统计数据全部清零吗？")){return true}
  else {return false}
}
</script>
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
  <table width="720" border=0 cellpadding=3 cellspacing=1 bgcolor="#6298E1">
    <tbody>

      <tr>
        <td align=left><font color="#FFFFFF"><strong>网站信息</strong></font></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td height="186" align=left bgcolor="#EBF2F9"><form method="post" action="Modify.asp" name="frmmodi">
            <table width="68%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td width="16%" height="27">&nbsp;</td>
                <td width="55%" height="27">&nbsp;</td>
                <td width="29%" height="27">&nbsp;</td>
              </tr>
              <tr>
                <td width="16%" height="27">网站名称：</td>
                <td width="55%" height="27"><input name="WebName" type="text" class="textfield" value=<%=WebName%> maxlength="30" style="WIDTH: 240;" ></td>
                <td width="29%" height="27">*&nbsp;统计网站的名称 </td>
              </tr>
              <tr>
                <td width="16%" height="18">网站网址：</td>
                <td width="55%"><input name="WebUrl" type="text" class="textfield" value=<%=WebUrl%>  maxlength="30"  style="WIDTH: 240;">                </td>
                <td width="29%">*&nbsp;统计网站的网址 </td>
              </tr>
              <tr>
                <td width="16%">确 认 码：</td>
                <td width="55%"><input name="PassWord" type="text" class="textfield" style="WIDTH: 240;" maxlength="20">                </td>
                <td width="29%">*&nbsp;操作时确认码为[&nbsp;<font color="#FF0000">YES</font>&nbsp;]</td>
              </tr>

              <tr>
                <td width="16%">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
              </tr>
              <tr>
                <td width="16%">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
              </tr>
              <tr align="center">
                <td colspan="3"><input type="submit" name="Rereg" value="更改信息" class="Button">
                    <input type="reset" name="Clear" value="清除重写" class="Button">
                    <input type="submit" name="Rereg" value="统计重置" class="Button" onClick="return delall()")>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
              </tr>
            </table>
        </form></td>
      </tr>
    </tbody>
  </table>
  <br>
</div>
</BODY>
</HTML>
