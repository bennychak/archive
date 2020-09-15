<!--#include file="Head.asp"-->
<%
dim JobID,TalentsName,BirthDate,Stature,Marriage,RegResidence,EduResume,JobResume
JobID=request.QueryString("JobID")
TalentsName=request.QueryString("JobName")
dim mMemID,mLinkman,mSex,mAddress,mZipCode,mTelephone,mMobile,mEmail
if session("MemName")<>"" and session("MemLogin")="Succeed" then 
  call MemInfo()
else
  mSex="先生"
  mMemID=0
end if
%>
  <div id="Bodyer_page">
    <div id="Bodyer_banner_page"><img src="http://dummyimage.com/850x190/fff/000.gif&text=banner" width="850" height="190" alt="<%=SiteTitle %>"/></div>
	<div id="Bodyer_left_page">
      <div class="Bodyer_left_page_title"><h2>招聘</h2></div>
	  <div class="Bodyer_left_page_menu"><%=WebMenu()%></div>
	</div>
	<div id="Bodyer_right_page">
      <div class="Bodyer_right_page_location"><%=WebLocation()%></div>
      <div class="Bodyer_right_page_content">
        <table width="100%" border="0" cellpadding="1" cellspacing="0">
          <form action="TalentSave.asp?MemberID=<%=mMemID%>&amp;JobID=<%=JobID%>" method="post" name="formWrite" id="formWrite">
            <tr>
              <td width="12%">申请职位：</td>
              <td width="88%"><input name="TalentsName" type="text" class="TextBox" id="TalentsName" value="<%=TalentsName%>" size="40" maxlength="100" />&nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td>姓　　名：</td>
              <td><input name="Linkman" type="text" class="TextBox" value="<%=mLinkman%>" size="20" maxlength="50" />&nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td>性　　别：</td>
              <td><input name="Sex" type="radio" value="先生" <%if mSex="先生" then response.write ("checked")%> />
                先生
                <input type="radio" name="Sex" value="女士" <%if mSex="女士" then response.write ("checked")%> />
                女士</td>
            </tr>
            <tr>
              <td>出生日期：</td>
              <td><input name="BirthDate" type="text" class="TextBox" id="BirthDate" size="20" maxlength="10" />
                &nbsp;<font color="#CC0000">*</font>&nbsp;格式 1978-08-18</td>
            </tr>
            <tr>
              <td>婚姻状况：</td>
              <td><input name="Marriage" type="radio" value="未婚" checked="checked" />
                未婚
                <input type="radio" name="Marriage" value="已婚" />
                已婚</td>
            </tr>
            <tr>
              <td>身　　高：</td>
              <td><input name="Stature" type="text" class="TextBox" id="Stature" size="20" maxlength="10" />
                &nbsp;<font color="#CC0000">*</font>&nbsp;cm</td>
            </tr>
            <tr>
              <td>户口地址：</td>
              <td><input name="RegResidence" type="text" class="TextBox" id="RegResidence" size="40" maxlength="100" />
                &nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td>教育经历：</td>
              <td>学历&nbsp;&nbsp;&nbsp;&nbsp;起止日期&nbsp;&nbsp;&nbsp;&nbsp;专业名称&nbsp;&nbsp;&nbsp;&nbsp;证书&nbsp;&nbsp;&nbsp;&nbsp;就读学校</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><textarea name="EduResume" rows="6" class="TextBox" style="width:518px;"></textarea></td>
            </tr>
            <tr>
              <td>工作经历：</td>
              <td>起止日期&nbsp;&nbsp;&nbsp;&nbsp;职位名称&nbsp;&nbsp;&nbsp;&nbsp;工作内容&nbsp;&nbsp;&nbsp;&nbsp;就职单位</td>
            </tr>
            
            <tr>
              <td>&nbsp;</td>
              <td><textarea name="JobResume" rows="6" class="TextBox" id="JobResume" style="width:518px;"></textarea></td>
            </tr>
            <tr>
              <td>地　　址：</td>
              <td><input name="Address" type="text" class="TextBox" value="<%=mAddress%>" size="40" maxlength="100" />
                &nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td>邮　　编：</td>
              <td><input name="ZipCode" type="text" class="TextBox" id="ZipCode" value="<%=mZipCode%>" size="20" maxlength="20" />
                &nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td>电　　话：</td>
              <td><input name="Telephone" type="text" class="TextBox" id="Telephone" value="<%=mTelephone%>" size="20" maxlength="50" /></td>
            </tr>
            <tr>
              <td>移动电话：</td>
              <td><input name="Mobile" type="text" class="TextBox" id="Mobile" value="<%=mMobile%>" size="20" maxlength="50" />
                &nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td>电子邮箱：</td>
              <td><input name="Email" type="text" class="TextBox" id="Email" value="<%=mEmail%>" size="30" maxlength="50" />
                &nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td>验证　码：</td>
              <td valign="bottom"><input name="VerifyCode" type="text" class="TextBox" size="4" maxlength="4" />
                  <img src="../Include/VerifyCode.asp" align="absmiddle" /> </td>
            </tr>
            <tr>
              <td height="30">&nbsp;</td>
              <td valign="bottom"><input name="Submit" type="submit" class="button" value=" 保存 " />
                &nbsp;
                <input name="Reset" type="reset" class="button" value=" 重置 " /></td>
            </tr>
          </form>
        </table>
      </div>
    </div>
  </div>
<%
function WebMenu()
  response.write "<a href=""JobsList.asp"">招聘信息</a><br/>"
  response.write "<a href=""MemberTalent.asp"">我的应聘</a><br/>"
end function

function WebLocation()
  WebLocation="<img src=""../Images/Arrow_02.gif"" />&nbsp;您的位置：<a href=""../index.asp"" title=""返回首页"">首页</a>" & _
              "<img src=""../Images/Arrow_03.gif"" /><a href=""jobslist.asp"" title=""招聘"">招聘</a>" & _
              "<img src=""../Images/Arrow_03.gif"" /><a href=""jobslist.asp"" title=""简历提交"">简历提交</a>"
end function

sub MemInfo()
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_Members where MemName='"&session("MemName")&"'"
  rs.open sql,conn,1,1
  if rs.bof and rs.eof then
    response.write "暂无相关信息"
  else
    mMemID=rs("ID")
	if not rs("RealName")="" then
	  mLinkman=rs("RealName")
	else 
	  mLinkman=rs("MemName")
	end if
	mSex=rs("Sex")
	mAddress=rs("Address")
	mZipCode=rs("ZipCode")
	mTelephone=rs("Telephone")
	mMobile=rs("Mobile")
	mEmail=rs("Email")
  end if
  rs.close
  set rs=nothing
end sub
%>
<!--#include file="Foot.asp"-->