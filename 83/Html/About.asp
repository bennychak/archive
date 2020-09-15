<!--#include file="Head.asp"-->
<div class="sub">
	<div class="content">
    	<div class="left">
        	<h2>
                <div class="con" style="background-color:#397baf;"><a href="../index.asp">刘小雨儿童艺术画室</a></div>
                <div class="shadow1"></div>
                <img class="sq" src="../images/sq.gif" />
            </h2>
        	<div class="window_box">
            	<div class="window"><%=WebMenu(0,0,2)%></div>
            </div>
        </div>
        <div class="right">
            <h2 class="location"><%=WebLocation()%></h2>
        	<div class="con"><%=WebContent()%></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<%
function WebMenu(ParentID,i,level)
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_About where ViewFlag and ParentID="&ParentID&" and not ChildFlag order by Sequence asc"
  rs.open sql,conn,1,1
  if conn.execute("select ID from NwebCn_About Where ViewFlag and ParentID=0 and not ChildFlag").eof then
    response.write "暂无相关信息"
  end if
  do while not rs.eof
	if ParentID=0 then
	    if not conn.execute("select ID from NwebCn_About Where ViewFlag and ParentID="&rs("ID")&" and not ChildFlag").eof then
	      response.write "<a href=""javascript:void(null);"">"&rs("AboutName")&"</a><br/>"
		else
	      response.write "<a href=""About.asp?ID="&rs("ID")&""">"&rs("AboutName")&"</a><br/>"
		end if
	else
	  response.write string(i,"　")&"<a href=""About.asp?ID="&rs("ID")&""">"&rs("AboutName")&"</a><br/>"
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
	          "<img src=""../Images/Arrow_03.gif"" /><a href=""about.asp"" title=""关于我们"">关于我们</a>"
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  if request.QueryString("ID")="" or not IsNumeric(request.QueryString("ID")) then
	sql="select top 1 * from NwebCn_About where ViewFlag and not ChildFlag order by Sequence asc"
  else
	sql="select * from NwebCn_About where ViewFlag and ID="&request.QueryString("ID")
  end if
  rs.open sql,conn,1,1
  if rs.eof then
    WebLocation=WebLocation&"<img src=""../Images/Arrow_03.gif"" />信息ID读取错误"
  else
    WebLocation=WebLocation&"<img src=""../Images/Arrow_03.gif"" />"&rs("AboutName")
  end if
  rs.close
  set rs=nothing
end function


function WebContent()
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  if request.QueryString("ID")="" or not IsNumeric(request.QueryString("ID")) then
	sql="select top 1 * from NwebCn_About where ViewFlag and not ChildFlag order by Sequence asc"
  else
	sql="select * from NwebCn_About where ViewFlag and ID="&request.QueryString("ID")
  end if
  rs.open sql,conn,1,3
  if rs.eof then
    response.write "<div class=""Bodyer_right_page_content"">暂无相关信息</div>"
  else
    if ViewNoRight(rs("GroupID"),rs("Exclusive")) then
	  response.write "<div class=""Bodyer_right_page_content"">"&rs("Content")&"</div>"
	  response.write "<div class=""Bodyer_right_page_end"">|&nbsp;更新时间："&FormatDate(rs("UpdateTime"),13)&"</div>"
	  rs("ClickNumber")=rs("ClickNumber")+1
	else
	  response.write "<div class=""Bodyer_right_page_content""><img src=""../Images/NoRight.jpg""></div>"
	end if
	rs.update
  end if
  rs.close
  set rs=nothing
end function
%>
<!--#include file="Foot.asp"-->