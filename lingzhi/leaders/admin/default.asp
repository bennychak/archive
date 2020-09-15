<%@ LANGUAGE="VBScript" CODEPAGE="65001" %>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2004年12月25日10:27:48　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　        　│EMAIL:chenwenj@gmail.com　　　　　　　　　┃
'┃　联系方式　│MSN  :oking@live.com  　　　　　　　　　　┃
'┃　　　　　　│QQ   :168909　ICQ:45318946　　　　　　　　┃
'┃　　　　　　│http://kingchan.net       　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　　　　　　│　　　　　　　　　　　　　　　　　　　　　┃
'┃　记    事　│　　　　　　　　　　　　　　　　　　　　　┃
'┃　　　　　　│　　　　　　　　　　　　　　　　　　　　　┃
'┣━━━━━━┷━━━━━━━━━━━━━━━━━━━━━┫
'┃南京汉中门大街康怡花园汉佳办事处　2004年12月25日10:24:11┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="includes/config.asp"-->
<!--#include file="includes/md5.asp"--> 
<%

If not isempty(request.form()) Then
	dim rs,user,psw,sql,checkcode
	dim log,userid

	user=request("name")&""
	user = Replace(user,"'","''")
	psw = request("psw")&""
	
	psw = Replace(psw,"'","''")
	
	psw=md5(psw)
	
	checkcode = request("checkcode")&""
	checkcode = Replace(checkcode,"'","''")
	checkcode = ucase(checkcode)
	sql="select id from admin where name='"&user&"' and psw='"&psw&"'"
	set rs=conn_access.execute (sql)
	If (rs.bof and rs.eof) or (Session("check_code")<>checkcode) Then
		call msgPage(2,"gourl","default.asp",5)
		rs.close
		set rs=nothing
		response.end
	else
		session.Timeout = 60
		session("logined")=true
		session("name")=user
		rs.close
		set rs=Nothing
		
		
		'日志记录
		
		'log=Now & ", SID " & session.sessionid & ")" & " 从 " & Request.ServerVariables("REMOTE_ADDR") & " 登录"
		'call writelog(log)
		
		response.Redirect "product_list.asp"
		response.end
	End if
End if

'************************
'子函数名:日志记录
'************************
Sub writelog(str)
	dim fso,file,ts,logfile
	set fso=CreateObject("Scripting.FileSystemObject")
	logfile = server.mappath("\logs") & "\Err" & DateDiff("s", "2000/1/1", Now) & ".log"
	set file=fso.OpenTextFile(logfile, 8, true)
	file.writeline str
	file.close

	set file=nothing
	set fso=nothing
End Sub
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="robots" none="noindex,nofollow">
<title><%=manageCenterTitle%></title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<!--#include file="head.asp"-->
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="300" align="center" valign="middle">
	<form name="form_login" method="post" action="default.asp" >
      <table  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
        <tr>
          <td width="100" align="center" bgcolor="#003366" class="bai">用户</td>
          <td ><input name="name" type="text" id="name" size="25"></td>
        </tr>
        <tr align="left">
          <td align="center" bgcolor="#003366" class="bai">密码</td>
          <td ><input name="psw" type="password" id="psw" size="25" ></td>
        </tr>
        <tr align="left">
          <td align="center" bgcolor="#003366"><span class="bai">验证码</span></td>
          <td align="center"><img src="checkcode.asp">
            <input name="checkcode" type="text" id="checkcode" size="10" >            </td>
        </tr>		
        <tr align="left">
          <td colspan="2" align="center"><input type="submit" name="Submit" value="提交"></td>
          </tr>
      </table>
      <br>
      </form>	  </td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
