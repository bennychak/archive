<!--#include file="Head.asp"-->
<div class="sub">
	<div class="content">
    	<div class="left">
        	<h2>
                <div class="con" style="background-color:#06945b;"><a href="../index.asp">刘小雨儿童艺术画室</a></div>
                <div class="shadow1"></div>
                <img class="sq" src="../images/sq.gif" />
            </h2>
        	<div class="window_box">
            	<div class="window"><%=WebMenu(0,0,2)%></div>
            </div>
        </div>
        <div class="right">
            <h2 class="location"><%=WebLocation()%></h2>
        	<div class="con"><%=WebContent("NwebCn_News",request.QueryString("ID"))%></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<%
function WebMenu(ParentID,i,level)
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_NewsSort where ViewFlag and ParentID="&ParentID&" order by ID asc"
  rs.open sql,conn,1,1
  if conn.execute("select ID from NwebCn_NewsSort Where ViewFlag and ParentID=0").eof then
    response.write "暂无相关信息"
  end if
  do while not rs.eof
	if ParentID=0 then
	  response.write "<a href=""NewsList.asp?SortID="&rs("ID")&""">"&rs("SortName")&"</a><br/>"
	else
	  response.write string(i,"　")&"<a href=""NewsList.asp?SortID="&rs("ID")&""">"&rs("SortName")&"</a><br/>"
		             
	end if
    i=i+1
	if i<level then call WebMenu(rs("ID"),i,level)
	i=i-1
	rs.movenext
  loop 
  rs.close
  set rs=nothing
end function

function WebLocation()
  WebLocation="<img src=""../Images/Arrow_02.gif"" />&nbsp;您的位置：<a href=""../index.asp"" title=""返回首页"">首页</a>" & _
	          "<img src=""../Images/Arrow_03.gif"" /><a href=""NewsList.asp"" title=""新闻动态"">新闻动态</a>"
  if request.QueryString("ID")="" then
    WebLocation=WebLocation
  elseif not IsNumeric(request.QueryString("ID")) then
    WebLocation=WebLocation&"<img src=""../Images/Arrow_03.gif"" />信息ID读取错误"
  elseif conn.execute("select * from NwebCn_News Where ViewFlag and  ID="&request.QueryString("ID")).eof then
    WebLocation=WebLocation&"<img src=""../Images/Arrow_03.gif"" />信息ID读取错误"
  else
    dim rs,sql
    set rs = server.createobject("adodb.recordset")
	sql="select * from NwebCn_News where ViewFlag and ID="&request.QueryString("ID")
    rs.open sql,conn,1,1
	WebLocation=WebLocation&SortPathTXT("NwebCn_NewsSort",rs("SortID"))
    rs.close
    set rs=nothing
  end if
end function
function SortPathTXT(DataFrom,ID)
  dim rs,sql
  Set rs=server.CreateObject("adodb.recordset")
  sql="Select * From "&DataFrom&" where ViewFlag and ID="&ID
  rs.open sql,conn,1,1
  if not rs.eof then
	SortPathTXT=SortPathTXT(DataFrom,rs("ParentID"))&"<img src=""../Images/Arrow_03.gif"" /><a href=""NewsList.asp?SortID="&rs("ID")&""">"&rs("SortName")&"</a>"
  end if
  rs.close
  set rs=nothing
end function

function WebContent(DataFrom,ID)
  if ID="" or not IsNumeric(ID) then
    response.write "<div class=""Bodyer_right_page_content"">暂无相关信息</div>"
  elseif conn.execute("select * from "&DataFrom&" Where ViewFlag and  ID="&ID).eof then
    response.write "<div class=""Bodyer_right_page_content"">暂无相关信息</div>"
  else
	dim rs,sql
    set rs = server.createobject("adodb.recordset")
	sql="select * from "&DataFrom&" where ViewFlag and ID="&ID
    rs.open sql,conn,1,3
    if ViewNoRight(rs("GroupID"),rs("Exclusive")) then
	  response.write "<div class=""Bodyer_right_page_content""><h1>"&rs("NewsName")&"</h1>"&rs("Content")&"</div>" &_
					 "<div class=""Bodyer_right_page_end"">" &_
					 "|&nbsp;发布时间："&FormatDate(rs("Addtime"),13)&"&nbsp;&nbsp;&nbsp;&nbsp;来源："&rs("Source")&"&nbsp;&nbsp;&nbsp;&nbsp;查看次数："&rs("ClickNumber")&_
					 "</div>"
	  rs("ClickNumber")=rs("ClickNumber")+1
	else
	  WebContent="<div class=""Bodyer_right_page_content""><h2>"&rs("NewsName")&"</h2><img src=""../Images/NoRight.jpg""><br/><br/></div>"
	end if
	rs.update
    rs.close
    set rs=nothing
  end if
end function
%>
<!--#include file="Foot.asp"-->