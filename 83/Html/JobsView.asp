<!--#include file="Head.asp"-->
  <div id="Bodyer_page">
    <div id="Bodyer_banner_page"><img src="http://dummyimage.com/850x190/fff/000.gif&text=banner" width="850" height="190" alt="<%=SiteTitle %>"/></div>
	<div id="Bodyer_left_page">
      <div class="Bodyer_left_page_title"><h2>招聘</h2></div>
	  <div class="Bodyer_left_page_menu"><%=WebMenu()%></div>
	</div>
	<div id="Bodyer_right_page">
      <div class="Bodyer_right_page_location"><%=WebLocation()%></div>
      <%=WebContent("NwebCn_Jobs",request.QueryString("ID"))%>
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
              "<img src=""../Images/Arrow_03.gif"" /><a href=""jobslist.asp"" title=""职位信息"">职位信息</a>"
end function


function WebContent(DataFrom,ID)
  if ID="" or not IsNumeric(ID) then
    response.write "<div class=""Bodyer_right_page_content"">信息ID读取错误</div>"
  elseif conn.execute("select * from "&DataFrom&" Where ViewFlag and  ID="&ID).eof then
    response.write "<div class=""Bodyer_right_page_content"">信息ID读取错误</div>"
  else
	dim rs,sql
    set rs = server.createobject("adodb.recordset")
	sql="select * from "&DataFrom&" where ViewFlag and ID="&ID
    rs.open sql,conn,1,3
	response.write "<div class=""Bodyer_right_page_content""><h2>"&rs("JobName")&"</h2>" &_
	               "工作地点："&rs("JobAddress")&"<br/>" &_
	               "招聘人数："&rs("JobNumber")&"人<br/>" &_
	               "薪酬待遇："&rs("Emolument")&"<br/>" &_
	               "有效时间："&FormatDate(rs("StartDate"),13)&"&nbsp;-&nbsp;"&FormatDate(rs("EndDate"),13)&"<br/>" &_
	               "招聘单位："&rs("eEmployer")&"<br/>" &_
	               "联系　人："&rs("eContact")&"<br/>" &_
	               "电　　话："&rs("eTel")&"<br/>" &_
	               "地址邮编："&rs("eAddress")&"&nbsp;/&nbsp;"&rs("ePostCode")&"<br/>" &_
	               "电子邮箱："&rs("eEmail")&"<br/><br/>" &_
	               "<font color=""#ff3300"">工作职责：</font><br/>"&HtmlStrReplace(rs("Responsibility"))&"<br/><br/>" &_
	               "<font color=""#ff3300"">职位要求：</font><br/>"&HtmlStrReplace(rs("Requirement"))&"<br/><br/>" &_
	               "<a href=""TalentWrite.asp?JobID="&ID&"&JobName="&server.urlencode(rs("JobName"))&""" title=""提交简历"" ><img src=""../Images/Page_resume.gif"" /></a>" &_
				   "</div>" &_
				   "<div class=""Bodyer_right_page_end"">" &_
		           "|&nbsp;更新时间："&FormatDate(rs("UpdateTime"),13)&"&nbsp;&nbsp;&nbsp;&nbsp;查看次数："&rs("ClickNumber")&_
				   "</div>"
	  rs("ClickNumber")=rs("ClickNumber")+1
	rs.update
    rs.close
    set rs=nothing
  end if  
end function
%>
<!--#include file="Foot.asp"-->