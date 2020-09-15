<!--#include file="Head.asp"-->
<!--#include file="../Include/Md5.asp" -->
  <div id="Bodyer_page">
    <div id="Bodyer_banner_page"><img src="http://dummyimage.com/850x190/fff/000.gif&text=banner" width="850" height="190" alt="<%=SiteTitle %>"/></div>
	<div id="Bodyer_left_page">
      <div class="Bodyer_left_page_title"><h2>账户中心</h2></div>
	  <div class="Bodyer_left_page_menu"><%=WebMenu()%></div>
	</div>
	<div id="Bodyer_right_page">
      <div class="Bodyer_right_page_location"><%=WebLocation()%></div>
      <div class="Bodyer_right_page_content">
      <%=WebContent()%>
<%
function WebContent()
  dim rs,sql,NewPassword
  if request.QueryString("Step")="" then
%>
      <table width="100%" border="0" cellspacing="0" cellpadding="2">
        <form action="MemberGetPass.asp?Step=EnterNameMail" method="post" name="form" id="form">
          <tr>
            <td width="220" align="right"> 登&nbsp;录&nbsp;名： </td>
            <td width="384"><input name="MemName" type="text" class="TextBox" id="MemName" size="30" maxlength="16" /></td>
          </tr>
          <tr>
            <td align="right"> 电子邮箱： </td>
            <td><input name="Email" type="text" class="TextBox" id="Email" size="30" maxlength="50" /></td>
          </tr>
          <tr>
            <td height="60" colspan="2" align="center"><input name="Next2" type="submit" class="button" value=" 下一步 " /></td>
          </tr>
        </form>
      </table>
      <%
  elseif request.QueryString("Step")="EnterNameMail" then
    set rs = server.createobject("adodb.recordset")
    sql="select * from NwebCn_Members where MemName='"&request.form("MemName")&"' and Email='"&request.form("Email")&"'"
	rs.open sql,conn,1,1
	if rs.eof then
	  WriteMsg("·登录名和电子邮箱不存在或不对应，请返回重新输入。")
      exit function
	end if
%>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <form action="MemberGetPass.asp?Step=EnterAnswer&amp;ID=<%=rs("ID")%>" method="post" name="form" id="form">
          <tr>
            <td width="220" align="right">登&nbsp;录&nbsp;名：</td>
            <td width="384"><%=rs("MemName")%></td>
          </tr>
          <tr>
            <td align="right">电子邮箱：</td>
            <td><%=rs("Email")%></td>
          </tr>
          <tr>
            <td align="right">密码提示问题：</td>
            <td><%=rs("Question")%></td>
          </tr>
          <tr>
            <td align="right">密码提示答案：</td>
            <td><input name="Answer" type="text" class="TextBox" size="30" maxlength="100" /></td>
          </tr>
          <tr>
            <td height="60" colspan="2" align="center"><input name="Next" type="submit" class="button" value=" 下一步 " /></td>
          </tr>
        </form>
      </table>
<%
  elseif request.QueryString("Step")="EnterAnswer" then
    set rs = server.createobject("adodb.recordset")
    sql="select * from NwebCn_Members where ID="&request.QueryString("ID")
    rs.open sql,conn,1,3
	if rs.eof then
	  WriteMsg("·数据读取异常错误。")
      exit function
	end if
    if rs("Answer")<>MD5(trim(request("Answer"))) then
      WriteMsg("·输入的密码提示答案不正确。")
      exit function
    end if
    randomize timer
    NewPassword=Int(899999*Rnd() +100000)
    rs("Password")=MD5(NewPassword)
    rs.update
    rs.close
    set rs=nothing  
    WriteMsg("·您的新密码是<font color='red'>"&NewPassword&"</font>，请记住密码或登录修改成易记、安全的密码。")
    exit function
  end if
end function
%>
      </div>
	</div>
  </div>

<%
function WebMenu()
  response.write "<a href=""MemberInfo.asp"">注册资料</a><br/>"
  response.write "<a href=""MemberMessage.asp"">我的留言</a><br/>"
  response.write "<a href=""MemberOrder.asp"">我的订单</a><br/>"
  response.write "<a href=""MemberTalent.asp"">我的应聘</a><br/>"
  response.write "<a href=""MemberLogin.asp?Action=Out"">退出登录</a><br/>"
end function

function WebLocation()
  WebLocation="<img src=""../Images/Arrow_02.gif"" />&nbsp;您的位置：<a href=""../index.asp"" title=""返回首页"">首页</a>" & _
              "<img src=""../Images/Arrow_03.gif"" /><a href=""MemberCenter.asp"" title=""帐户中心"">帐户中心</a>"  &_
              "<img src=""../Images/Arrow_03.gif"" />找回密码"
end function

function MemGroup(GroupID)
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_MemGroup where GroupID='"&GroupID&"'"
  rs.open sql,conn,1,1
  MemGroup=rs("GroupName")
  rs.close
  set rs=nothing
end function
%>
<!--#include file="Foot.asp"-->