<%
Response.Charset="utf-8"
'判断是否登录或登录超时===============================================================
dim AdminAction
AdminAction=request.QueryString("AdminAction")
select case AdminAction
  case "Out"
    call OutLogin()
  case else
    call Login()
end select
'========
sub Login()
  if session("AdminName")="" or session("UserName")="" or session("AdminPurview")="" or session("LoginSystem")<>"Succeed" then
     response.write "您还没有登录或登录已超时，请<a href='../System/AdminLogin.asp' target='_parent'><font color='red'>返回登录</font></a>!"
     response.end
  end if
end sub
'========
sub OutLogin()
  session.contents.remove "AdminName"
  session.contents.remove "UserName"
  session.contents.remove "AdminPurview"
  session.contents.remove "LoginSystem"
  session.contents.remove "VerifyCode"
  response.write "<script language=javascript>top.location.replace('AdminLogin.asp');</script>"
end sub
%>