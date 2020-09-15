<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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
'检查是否登陆
call isLogin
%>
<%
If not isempty(request.form()) Then
	dim rs,sql
	dim old_psw,new_psw,re_new_psw,user
	old_psw=md5(request("old_psw")&"")
	new_psw=request("new_psw")&""
	re_new_psw=request("re_new_psw")&""
	user=session("name")

	sql="select id from admin where name='"&user&"' and psw='"&old_psw&"'"
	
	set rs=conn_access.execute(sql)
	If rs.bof and rs.eof Then
		set rs=nothing
		call msgBox("旧密码不对!","Back","none")
		response.end
	else
		If new_psw=re_new_psw Then
			sql="update admin set psw='"&md5(new_psw)&"' where id="&rs("id")
			rs.close
			conn_access.execute(sql)
			set rs=nothing
			call msgBox("密码修改成功,新密码在下次登录时生效!","GoUrl","user.asp")
			response.end
		else
			set rs=nothing
			call msgBox("两次输入的新密码不一致!","Back","none")
			response.end
		End if
	End if
	
End if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="robots" none="noindex,nofollow">
<title><%=manageCenterTitle%></title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/check_form.js"></script>

</head>

<body>
<!--#include file="head.asp"-->
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="157" valign="top">
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border="0">
      <TBODY>
        <TR>
          <TD vAlign=top>
		    <!--#include file="menu.asp"--></TD>
        </TR>
      </TBODY>
    </TABLE>
	</td>
    <td width="84%" rowspan="2" valign="top"><table width="100%"  border="0" cellspacing="5" cellpadding="5">
      <tr>
        <td>修改管理员密码</td>
      </tr>
      <tr>
        <td align="center">
		<form name="form1" method="post" action="" ONSUBMIT="return checkForm(this)">
            <table  border="1" align="center" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
              <tr>
                <td align="center" bgcolor="#003366"><span class="bai">旧密码</span></td>
                <td><input name="old_psw" type="password" id="old_psw" title="请输入旧密码!~16:!"></td>
              </tr>
              <tr>
                <td align="center" bgcolor="#003366" class="bai">新密码</td>
                <td><input name="new_psw" type="password" id="new_psw" title="请输入新密码!~16:!"></td>
              </tr>
              <tr>
                <td align="center" bgcolor="#003366" class="bai">重复新密码</td>
                <td><input name="re_new_psw" type="password" id="re_new_psw" title="请重复新密码!~16:!"></td>
              </tr>
            </table>
            <br>
            <input name="Submit" type="submit" class="button" value="保存">
        </form></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="bottom"><img src="img/left_end.gif" width="157" height="160" border="0"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
