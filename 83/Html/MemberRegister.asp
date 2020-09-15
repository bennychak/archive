<!--#include file="Head.asp"-->
  <div id="Bodyer_page">
    <div id="Bodyer_banner_page"><img src="http://dummyimage.com/850x190/fff/000.gif&text=banner" width="850" height="190" alt="<%=SiteTitle %>"/></div>
	<div id="Bodyer_left_page">
      <div class="Bodyer_left_page_title"><h2>账户中心</h2></div>
	  <div class="Bodyer_left_page_menu"><%=WebMenu()%></div>
	</div>
	<div id="Bodyer_right_page">
      <div class="Bodyer_right_page_location"><%=WebLocation()%></div>
      <div class="Bodyer_right_page_content">
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <form action="MemberSaveReg.asp" method="post" name="formReg" id="formReg">
            <tr>
              <td width="200" align="right">登录名：</td>
              <td width="400"><input name="MemName" type="text" class="TextBox" id="MemName" size="20" maxlength="16" />
                &nbsp;<font color="#CC0000">*</font>&nbsp;不可更改</td>
            </tr>
            <tr>
              <td align="right">真实姓名：</td>
              <td><input name="RealName" type="text" class="TextBox" id="RealName" size="20" maxlength="50" /></td>
            </tr>
            <tr>
              <td align="right">性别：</td>
              <td><input name="Sex" type="radio" value="先生" checked="checked" />
                先生
                <input type="radio" name="Sex" value="女士" />
                女士</td>
            </tr>
            <tr>
              <td align="right">设置密码：</td>
              <td><input name="Password" type="password" class="TextBox" id="Password" size="20" maxlength="16" />
                &nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td align="right">确定密码：</td>
              <td><input name="vPassword" type="password" class="TextBox" id="vPassword" size="20" maxlength="16" />
                &nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td align="right">密码提示问题：</td>
              <td><input name="Question" type="text" class="TextBox" id="Question" size="40" maxlength="100" />
                &nbsp;<font color="#CC0000">*</font>&nbsp;不可更改</td>
            </tr>
            <tr>
              <td align="right">密码提示答案：</td>
              <td><input name="Answer" type="text" class="TextBox" id="Answer" size="40" maxlength="100" />
                &nbsp;<font color="#CC0000">*</font>&nbsp;不可更改</td>
            </tr>
            <tr>
              <td align="right">单位名称：</td>
              <td><input name="Company" type="text" class="TextBox" id="Company" size="40" maxlength="100" /></td>
            </tr>
            <tr>
              <td align="right">地址：</td>
              <td><input name="Address" type="text" class="TextBox" id="Address" size="40" maxlength="100" /></td>
            </tr>
            <tr>
              <td align="right">邮编：</td>
              <td><input name="ZipCode" type="text" class="TextBox" id="ZipCode" size="20" maxlength="20" /></td>
            </tr>
            <tr>
              <td align="right">电话：</td>
              <td><input name="Telephone" type="text" class="TextBox" id="Telephone" size="20" maxlength="50" /></td>
            </tr>
            <tr>
              <td align="right">传真：</td>
              <td><input name="Fax" type="text" class="TextBox" id="Fax" size="20" maxlength="50" /></td>
            </tr>
            <tr>
              <td align="right">移动电话：</td>
              <td><input name="Mobile" type="text" class="TextBox" id="Mobile" size="20" maxlength="50" /></td>
            </tr>
            <tr>
              <td align="right">电子邮箱：</td>
              <td><input name="Email" type="text" class="TextBox" id="Email" size="30" maxlength="50" />
                &nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td align="right">网址：</td>
              <td><input name="HomePage" type="text" class="TextBox" id="HomePage" size="30" maxlength="50" /></td>
            </tr>
            <tr>
              <td align="right">验证码：</td>
              <td valign="bottom"><input name="VerifyCode" type="text" class="TextBox" size="4" maxlength="4" />
                  <img src="../Include/VerifyCode.asp" align="absmiddle" /> </td>
            </tr>
            <tr>
              <td height="30" align="right">&nbsp;</td>
              <td valign="bottom"><input name="Submit" type="submit" class="button" value=" 保存 " />
                &nbsp;
                <input name="Reset" type="reset" class="button" value=" 重置 " />
              </td>
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
              "<img src=""../Images/Arrow_03.gif"" />帐户注册"
end function
%>
<!--#include file="Foot.asp"-->