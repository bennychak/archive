<!--#include file="Head.asp"-->
<%
if not (session("MemName")<>"" and session("MemLogin")="Succeed") then 
  response.redirect "MemberCenter.asp"
  response.end
end if
dim MemID,mMemName,mGroupIdName,mRealName,mSex,mQusetion
dim mCompany,mAddress,mZipCode,mTelephone,mFax,mMobile,mEmail,mHomepage,mAddTime,mLoginTimes,mLastLoginTime,mLastLoginIP
call MemInfo() 
%>
  <div id="Bodyer_page">
    <div id="Bodyer_banner_page"><img src="http://dummyimage.com/850x190/fff/000.gif&text=banner" width="850" height="190" alt="<%=SiteTitle %>"/></div>
	<div id="Bodyer_left_page">
      <div class="Bodyer_left_page_title"><h2>账户中心</h2></div>
	  <div class="Bodyer_left_page_menu"><%=WebMenu()%></div>
	</div>
	<div id="Bodyer_right_page">
      <div class="Bodyer_right_page_location"><%=WebLocation()%></div>
      <div class="Bodyer_right_page_content">
        <table width="100%" border="0" cellspacing="0" cellpadding="1">
          <form action="MemberSaveInfo.asp?ID=<%=MemID%>" method="post" name="formInfo" id="formInfo">
            <tr>
              <td align="right">登录名：</td>
              <td style="font-family:Arial;color:red;font-weight:bold"><% =mMemName %></td>
            </tr>
            <tr>
              <td width="200" align="right">所属组别：</td>
              <td width="400"><font color="#ff6600">
                <% =mGroupIdName %>
              </font></td>
            </tr>
            <tr>
              <td align="right">真实姓名：</td>
              <td><input name="RealName" type="text" class="TextBox" id="RealName" value="<%=mRealName%>" size="20" maxlength="50" /></td>
            </tr>
            <tr>
              <td align="right">性别：</td>
              <td><input name="Sex" type="radio" value="先生" <%if mSex="先生" then response.write ("checked")%> />
                先生
                <input type="radio" name="Sex" value="女士" <%if mSex="女士" then response.write ("checked")%> />
                女士</td>
            </tr>
            <tr>
              <td align="right">设置密码：</td>
              <td><input name="Password" type="password" class="TextBox" id="Password" size="20" maxlength="16" />
                &nbsp;空表示不修改</td>
            </tr>
            <tr>
              <td align="right">确定密码：</td>
              <td><input name="vPassword" type="password" class="TextBox" id="vPassword" size="20" maxlength="16" />
                &nbsp;</td>
            </tr>
            <tr>
              <td align="right">密码提示问题：</td>
              <td><% =mQusetion %></td>
            </tr>
            <tr>
              <td align="right">密码提示答案：</td>
              <td>********</td>
            </tr>
            <tr>
              <td align="right">单位名称：</td>
              <td><input name="Company" type="text" class="TextBox" id="Company" value="<% =mCompany %>" size="40" maxlength="100" /></td>
            </tr>
            <tr>
              <td align="right">地址：</td>
              <td><input name="Address" type="text" class="TextBox" id="Address" value="<% =mAddress %>" size="40" maxlength="100" /></td>
            </tr>
            <tr>
              <td align="right">邮编：</td>
              <td><input name="ZipCode" type="text" class="TextBox" id="ZipCode" value="<% =mZipCode %>" size="20" maxlength="20" /></td>
            </tr>
            <tr>
              <td align="right">电话：</td>
              <td><input name="Telephone" type="text" class="TextBox" id="Telephone" value="<% =mTelephone %>" size="20" maxlength="50" /></td>
            </tr>
            <tr>
              <td align="right">传真：</td>
              <td><input name="Fax" type="text" class="TextBox" id="Fax" value="<% =mFax %>" size="20" maxlength="50" /></td>
            </tr>
            <tr>
              <td align="right">移动电话：</td>
              <td><input name="Mobile" type="text" class="TextBox" id="Mobile" value="<% =mMobile %>" size="20" maxlength="50" /></td>
            </tr>
            <tr>
              <td align="right">电子邮箱：</td>
              <td><input name="Email" type="text" class="TextBox" id="Email" value="<% =mEmail %>" size="30" maxlength="50" /></td>
            </tr>
            <tr>
              <td align="right">网址：</td>
              <td><input name="HomePage" type="text" class="TextBox" id="HomePage" value="<% =mHomePage %>" size="30" maxlength="50" /></td>
            </tr>
            <tr>
              <td align="right">验证码：</td>
              <td valign="bottom"><input name="VerifyCode" type="text" class="TextBox" size="4" maxlength="4" />
                  <img src="../Include/VerifyCode.asp" align="absmiddle" /> </td>
            </tr>
            <tr>
              <td align="right">注册时间：</td>
              <td ><% =mAddTime %></td>
            </tr>
            <tr>
              <td align="right">登录次数：</td>
              <td ><% =mLoginTimes %></td>
            </tr>
            <tr>
              <td align="right">最后登录时间：</td>
              <td ><% =mLastLoginTime %></td>
            </tr>
            <tr>
              <td align="right">最后登录IP：</td>
              <td ><% =mLastLoginIP %></td>
            </tr>
            <tr>
              <td height="30" align="right">&nbsp;</td>
              <td valign="bottom"><input name="Submit" type="submit" class="button" value=" 保存 " />
                &nbsp;
                <input name="Reset" type="reset" class="button" value=" 重置 " />
              </td>
            </tr>
            <tr>
              <td height="30" align="right">&nbsp;</td>
              <td valign="bottom">&nbsp;</td>
            </tr>
          </form>
        </table>
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
              "<img src=""../Images/Arrow_03.gif"" />注册资料"
end function

sub MemInfo()
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_Members where MemName='"&session("MemName")&"'"
  rs.open sql,conn,1,1
  if rs.eof then
    response.write "暂无相关信息"
  else
    MemID=rs("ID")
	mMemName=rs("MemName")
	mGroupIdName=GroupName(rs("GroupID"))
	mRealName=rs("RealName")
	mSex=rs("Sex")
	mQusetion=rs("Question")
	mCompany=rs("Company")
	mAddress=rs("Address")
	mZipCode=rs("ZipCode")
	mTelephone=rs("Telephone")
	mFax=rs("Fax")
	mMobile=rs("Mobile")
	mEmail=rs("Email")
	mHomePage=rs("HomePage")
	mAddTime=rs("AddTime")
	mLoginTimes=rs("LoginTimes")
	mLastLoginTime=rs("LastLoginTime")
	mLastLoginIP=rs("LastLoginIP")
  end if
  rs.close
  set rs=nothing
end sub

function GroupName(GroupID)
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_MemGroup where GroupID='"&GroupID&"'"
  rs.open sql,conn,1,1
  GroupName=rs("GroupName")
  rs.close
  set rs=nothing
end function
%>
<!--#include file="Foot.asp"-->