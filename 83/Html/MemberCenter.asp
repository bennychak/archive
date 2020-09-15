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
        <% if session("MemName")="" or session("GroupID")="" or session("MemLogin")<>"Succeed" then %>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%" valign="top"><font style="font-family:Arial;font-size:15px;color:#FF0000;font-weight:bold"><img src="../Images/Page_error.gif" width="112" height="112" /></font></td>
            <td width="75%" valign="top"><font style="font-family:Arial;font-size:15px;color:#FF0000;font-weight:bold">感谢关注我们的网站，您还没有登录/注册？</font> <br />
              您现在的身份是<font color="#1874CD">临时游客</font>，如果花10秒钟注册成为我们的会员并登录，将享有意想不到的便利和特权，例如：<br />
              <br />
              1.使用本站的留言、订购、应聘等功能时，不用再填写相关的联系信息；<br />
              2.在帐户员中心，集中查看与相关自己的历史信息，如留言、订购单的状态等；<br />
              3.拥有更高内容浏览权限值(部分内容限制浏览对象，权限值越高浏览内容越多)；<br />
              4.反馈信息我们将更加认真对待；<br />
              ……</td>
          </tr>
        </table>
        <% else %>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%" valign="top"><font style="font-family:Arial;font-size:15px;color:#FF0000;font-weight:bold"><img src="../Images/Page_ok.gif" width="112" height="112" /></font></td>
            <td width="75%" valign="top"><p><font style="font-family:黑体;font-size:16px;color:#FF0000;">感谢关注我们的网站，您已成功登录！<br />
                </font>您现在的身份是<font color="#1874CD"><%=MemGroup(session("GroupID"))%></font>，将享有如下的操作便利和特权：<br />
                <br />
              1.使用本站的留言、订购、应聘等功能时，不用再填写相关的联系信息；<br />
              2.在帐户中心，集中查看与相关自己的历史信息，如留言、订购单的状态等；<br />
              3.拥有浏览权限值内的内容查看权限； <br />
              4.您的反馈信息我们将更加认真对待； <br />
              ……</p></td>
          </tr>
        </table>
        <% end if %>
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
              "<img src=""../Images/Arrow_03.gif"" /><a href=""MemberCenter.asp"" title=""帐户中心"">帐户中心</a>"
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