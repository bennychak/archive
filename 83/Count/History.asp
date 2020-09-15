<!-- #Include File="../System/CheckAdmin.asp"-->
<%
FType=Request("Type")
Fyear=Request("QYear")
FMonth=Request("QMonth")
FDay=Request("QDay")
Select Case FType
Case 1:
     Response.Redirect "StatDay.asp?QDay="&FYear&"-"&FMonth&"-"&FDay
Case 2:
     Response.Redirect "StatMonth.asp?QMonth="&FYear&"-"&FMonth
Case 3:
     Response.Redirect "StatYear.asp?QYear="&FYear
End Select
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
      <td width="100%" height="24"><font color="#FFFFFF"><strong>历吏报表查询</strong></font></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#EBF2F9">
	  <br>
	  <form name="form1" action="History.asp" >
      <table width="50%" border="0" cellspacing="0" cellpadding="0">
         <tr> 
           <td width="23%">报表类型：</td>
           <td width="77%"> 
           <select name="Type" size="1">
             <option value="1" selected>日报表</option>
             <option value="2">月报表</option>
             <option value="3">年报表</option>
           </select>
           </td>
         </tr>
         <tr> 
           <td width="23%">&nbsp;</td>
           <td width="77%">&nbsp;</td>
         </tr>
         <tr> 
           <td width="23%">报表日期：</td>
           <td width="77%"> 
           <select name="QYear" size="1" class="Select">
             <option value="2006" selected>2006</option>
             <option value="2007">2007</option>
             <option value="2008">2008</option>
             <option value="2009">2009</option>
             <option value="2010">2010</option>
           </select>
           年 
           <select name="QMonth" size="1">
              <option value="1" selected>1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>
            </select>
            月 
            <select name="QDay" size="1">
              <option value="1" selected>1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>
              <option value="13">13</option>
              <option value="14">14</option>
              <option value="15">15</option>
              <option value="16">16</option>
              <option value="17">17</option>
              <option value="18">18</option>
              <option value="19">19</option>
              <option value="20">20</option>
              <option value="21">21</option>
              <option value="22">22</option>
              <option value="23">23</option>
              <option value="24">24</option>
              <option value="25">25</option>
              <option value="26">26</option>
              <option value="27">27</option>
              <option value="28">28</option>
              <option value="29">29</option>
              <option value="30">30</option>
              <option value="31">31</option>
            </select>
            日
			</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr> 
            <td>查&nbsp;&nbsp;&nbsp;&nbsp;询：</td>
            <td> 
            <input type="submit" name="Query" value="开始查询" class="Button">
            &nbsp;&nbsp; 
            <input type="reset" name="Clear" value="清除重写" class="Button">
            </td>
          </tr>
        </table>
        </form>
      </td>
    </tr>
  </table>
</div>
</BODY>
</HTML>
