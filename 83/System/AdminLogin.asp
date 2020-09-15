<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┌┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┐
'┊　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　┊
'┊　　　　　　　刘小雨儿童艺术画室网站管理系统（ＮＷＥＢ）　　　　　　　┊
'┊　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　┊
' 　 版权所有　Nweb.cn
'
'　　程序制作　万博工作室
'　　　　　　　Add:中国四川成都彭州市/611930
'　　　　　　　Tel:0-13348927760 028-88079088
'　　　　　　　Fax:83708850
'　　　　　　　E-m:duolaimi-123@163.com
'　　　　　　　Q Q:59309100
'
'　　官方网址　http://www.Nweb.cn
'┊　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　┊
'└┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┘
%>
<% Option Explicit %>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8" />
<META NAME="copyright" CONTENT="Copyright 2004-2008 - NWEB.CN-STUDIO" />
<META NAME="Author" CONTENT="万博网络技术工作室,www.Nweb.cn" />
<META NAME="Keywords" CONTENT="" />
<META NAME="Description" CONTENT="" />
<TITLE>管理员登录</TITLE>
<script language="javascript" src="../Script/Admin.js"></script>
</HEAD>

<BODY style="margin-top:100px;font-size:12px;">
<div align="center"><img src="Images/Login_Top.jpg" width="530" height="150"></div>
<div align="center">
  <table width="530" height="100" border="0" cellpadding="0" cellspacing="0" background="Images/Login_Bottom.jpg">
	<form action="CheckLogin.asp" method="post" name="AdminLogin" id="AdminLogin"  onSubmit="return CheckAdminLogin()">
    <tr>
      <td width="70" height="46" rowspan="2">&nbsp;</td>
      <td width="132" rowspan="2" valign="bottom">
      <input name="LoginName" type="text" id="LoginName" maxlength="12" style="width:94px; BORDER-RIGHT: #F7F7F7 0px solid; BORDER-TOP: #F7F7F7 0px solid; FONT-SIZE: 9pt; BORDER-LEFT: #F7F7F7 0px solid; BORDER-BOTTOM: #c0c0c0 1px solid; HEIGHT: 16px; BACKGROUND-COLOR: #F7F7F7" onMouseOver="this.style.background='#ffffff'" onMouseOut="this.style.background='#F7F7F7'" onFocus="this.select();"></td>
      <td width="131" rowspan="2" valign="bottom">
      <input name="LoginPassword" type="password" id="LoginPassword" maxlength="12" style="width:94px; BORDER-RIGHT: #F7F7F7 0px solid; BORDER-TOP: #F7F7F7 0px solid; FONT-SIZE: 9pt; BORDER-LEFT: #F7F7F7 0px solid; BORDER-BOTTOM: #c0c0c0 1px solid; HEIGHT: 16px; BACKGROUND-COLOR: #F7F7F7" onMouseOver="this.style.background='#ffffff'" onMouseOut="this.style.background='#F7F7F7'" onFocus="this.select();"></td>
      <td width="60" rowspan="2" valign="bottom">
      <input name="VerifyCode" type="text" id="5F1147E8746A5084FA" maxlength="4" style="width:60px; BORDER-RIGHT: #F7F7F7 0px solid; BORDER-TOP: #F7F7F7 0px solid; FONT-SIZE: 9pt; BORDER-LEFT: #F7F7F7 0px solid; BORDER-BOTTOM: #c0c0c0 1px solid; HEIGHT: 16px; BACKGROUND-COLOR: #F7F7F7" onMouseOver="this.style.background='#ffffff'" onMouseOut="this.style.background='#F7F7F7'" onFocus="this.select();">	  </td>
      <td width="62" height="25" valign="bottom"><img src="../Include/VerifyCode.asp" align="absmiddle"></td>
      <td width="75" valign="bottom">
	  <input name="submitLogin" type="image" src="images/Login_Submit.jpg" width="40" height="34"></td>
    </tr>
	</form>
    <tr>
      <td height="1" valign="bottom"></td>
      <td width="75" valign="bottom"></td>
    </tr>
    <tr>
      <td height="54" colspan="6">&nbsp;</td>
    </tr>
  </table>
</div>
</BODY>
</HTML>
