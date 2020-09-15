<!--#include file="Head.asp"-->
<%
dim MesName,Content,SecretFlag,mMemID,mLinkman,mSex,mCompany,mAddress,mZipCode,mTelephone,mFax,mMobile,mEmail
if session("MemName")<>"" and session("MemLogin")="Succeed" then 
  call MemInfo()
else
  mSex="先生"
  mMemID=0
  SecretFlag="<font color=""#ff6600"">会员功能</font>"
end if
%>
  <div id="Bodyer_page">
    <div id="Bodyer_banner_page"><img src="http://dummyimage.com/850x190/fff/000.gif&text=banner" width="850" height="190" alt="<%=SiteTitle %>"/></div>
	<div id="Bodyer_left_page">
      <div id="Bodyer_left_page_title"><h2>留言反馈</h2></div>
	  <div class="Bodyer_left_page_menu"><%=WebMenu()%></div>
	</div>
	<div id="Bodyer_right_page">
      <div class="Bodyer_right_page_location"><%=WebLocation()%></div>
      <div class="Bodyer_right_page_content">
        <table width="100%"  cellpadding="2" cellspacing="0" >
          <tr>
            <td bgcolor="#FFFFFF"><span style="font-weight: bold">亲爱的客户：</span> <br />
              如果您对产品或服务有任何意见、建议和问题，请及时告诉我们，您将得到满意答复。<br />
              1.仅用10秒钟注册一个会员号，以后每次留言时只要登录再不用重复填写你的联系信息了，并且通过帐户管理可集中查看只属于您的留言、订单状态。<br />
              2.网站内部分信息为不对临时访客开放，注册会员可查看。<br />
              3.我们将不定期向注册用户提供实用户，让您快人一步。</td>
          </tr>
        </table>
        <br />
        <table width="100%"  cellpadding="2" cellspacing="0" >
          <form action="MessageSave.asp?MemberID=<%=mMemID%>" method="post" name="formWrite" id="formWrite">
            <tr>
              <td width="13%">主　　题：</td>
              <td width="87%"><input name="MesName" type="text" class="TextBox" id="MesName" size="40" maxlength="100" />&nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td>留言内容：</td>
              <td><textarea name="Content" cols="90" rows="8" class="TextBox"></textarea>
              &nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td>留言　人：</td>
              <td><input name="Linkman" type="text" class="TextBox" id="Linkman" value="<%=mLinkman%>" size="20" maxlength="50" />&nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td>性　　别：</td>
              <td><input name="Sex" type="radio" value="先生" <%if mSex="先生" then response.write ("checked")%> />
                先生
                <input type="radio" name="Sex" value="女士" <%if mSex="女士" then response.write ("checked")%> />
                女士</td>
            </tr>
            <tr>
              <td>单位名称：</td>
              <td><input name="Company" type="text" class="TextBox" value="<%=mCompany%>" size="40" maxlength="100" /></td>
            </tr>
            <tr>
              <td>地　　址：</td>
              <td><input name="Address" type="text" class="TextBox" value="<%=mAddress%>" size="40" maxlength="100" /></td>
            </tr>
            <tr>
              <td>邮　　编：</td>
              <td><input name="ZipCode" type="text" class="TextBox" value="<%=mZipCode%>" size="20" maxlength="20" /></td>
            </tr>
            <tr>
              <td>电　　话：</td>
              <td><input name="Telephone" type="text" class="TextBox" id="Telephone" value="<%=mTelephone%>" size="20" maxlength="50" /></td>
            </tr>
            <tr>
              <td>传　　真：</td>
              <td><input name="Fax" type="text" class="TextBox" id="Fax" value="<%=mFax%>" size="20" maxlength="50" /></td>
            </tr>
            <tr>
              <td>移动电话：</td>
              <td><input name="Mobile" type="text" class="TextBox" id="Mobile" value="<%=mMobile%>" size="20" maxlength="50" /></td>
            </tr>
            <tr>
              <td>电子邮箱：</td>
              <td><input name="Email" type="text" class="TextBox" id="Email" value="<%=mEmail%>" size="30" maxlength="50" />&nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td>悄悄　话：</td>
              <td><%=SecretFlag%></td>
            </tr>
            <tr>
              <td>验证　码：</td>
              <td valign="bottom"><input name="VerifyCode" type="text" class="TextBox" size="4" maxlength="4" />
                  <img src="../Include/VerifyCode.asp" align="absmiddle" /> </td>
            </tr>
            <tr>
              <td height="40">&nbsp;</td>
              <td><input name="Submit" type="submit" class="button" value=" 保存 " />
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
  response.write "<a href=""MessageWrite.asp"">签写留言</a><br/>"
  response.write "<a href=""MessageList.asp"">所有留言</a><br/>"
  response.write "<a href=""MemberMessage.asp"">我的留言</a><br/>"
end function

function WebLocation()
  WebLocation="<img src=""../Images/Arrow_02.gif"" />&nbsp;您的位置：<a href=""../index.asp"" title=""返回首页"">首页</a>" & _
              "<img src=""../Images/Arrow_03.gif"" /><a href=""MessageList.asp"" title=""留言反馈"">留言反馈</a>"  &_
              "<img src=""../Images/Arrow_03.gif"" />签写留言"
end function

sub MemInfo()
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_Members where MemName='"&session("MemName")&"'"
  rs.open sql,conn,1,1
  if rs.eof then
    response.write "信息ID读取错误"
  else
    mMemID=rs("ID")
	if not rs("RealName")="" then
	  mLinkman=rs("RealName")
	else 
	  mLinkman=rs("MemName")
	end if
	mSex=rs("Sex")
	mCompany=rs("Company")
	mAddress=rs("Address")
	mZipCode=rs("ZipCode")
	mTelephone=rs("Telephone")
	mFax=rs("Fax")
	mMobile=rs("Mobile")
	mEmail=rs("Email")
	SecretFlag="<input type=""checkbox"" name=""SecretFlag"" value=""1"">"
  end if
  rs.close
  set rs=nothing
end sub
%>
<!--#include file="Foot.asp"-->