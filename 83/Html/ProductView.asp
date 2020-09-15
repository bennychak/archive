<!--#include file="Head.asp"-->
  <div id="Bodyer_page">
    <div id="Bodyer_banner_page"><img src="http://dummyimage.com/850x190/fff/000.gif&text=banner" width="850" height="190" alt="<%=SiteTitle %>"/></div>
	<div id="Bodyer_left_page">
      <div class="Bodyer_left_page_title"><h2>产品中心</h2></div>
	  <div class="Bodyer_left_page_menu"><%=WebMenu(0,0,2)%></div>
	</div>
	<div id="Bodyer_right_page">
      <div class="Bodyer_right_page_location"><%=WebLocation()%></div>
      <%=WebContent("NwebCn_Products",request.QueryString("ID"))%>
	</div>
  </div>
<%
function WebMenu(ParentID,i,level)
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_ProductSort where ViewFlag and ParentID="&ParentID&" order by Sequence asc"
  rs.open sql,conn,1,1
  if conn.execute("select ID from NwebCn_ProductSort Where ViewFlag and ParentID=0").eof then
    response.write "暂无相关信息"
  end if
  do while not rs.eof
	if ParentID=0 then
	  response.write "<a href=""ProductList.asp?SortID="&rs("ID")&""">"&rs("SortName")&"</a><br/>"
	else
	  response.write string(i,"　")&"<a href=""ProductList.asp?SortID="&rs("ID")&""">"&rs("SortName")&"</a><br/>"
		             
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
	          "<img src=""../Images/Arrow_03.gif"" /><a href=""ProductList.asp"" title=""产品中心"">产品中心</a>"
  if request.QueryString("ID")="" then
    WebLocation=WebLocation
  elseif not IsNumeric(request.QueryString("ID")) then
    WebLocation=WebLocation&"<img src=""../Images/Arrow_03.gif"" />信息ID读取错误"
  elseif conn.execute("select * from NwebCn_Products Where ViewFlag and  ID="&request.QueryString("ID")).eof then
    WebLocation=WebLocation&"<img src=""../Images/Arrow_03.gif"" />信息ID读取错误"
  else
    dim rs,sql
    set rs = server.createobject("adodb.recordset")
	sql="select * from NwebCn_Products where ViewFlag and ID="&request.QueryString("ID")
    rs.open sql,conn,1,1
	WebLocation=WebLocation&SortPathTXT("NwebCn_ProductSort",rs("SortID"))
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
	SortPathTXT=SortPathTXT(DataFrom,rs("ParentID"))&"<img src=""../Images/Arrow_03.gif"" /><a href=""ProductList.asp?SortID="&rs("ID")&""">"&rs("SortName")&"</a>"
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
	  response.write "<div class=""Bodyer_right_page_content"">"
	  response.write "<div class=""Bodyer_right_page_content_pro1"">" & _
				     "<img src="""&HtmlSmallPic(rs("GroupID"),rs("BigPic"),rs("Exclusive"))&""" title="""&rs("ProductName")&""" onload=""javascript:DrawImage(this,176,220);""  border=""0"" width=""176"" height=""220"">" & _
					 "</div>"
	  response.write "<div class=""Bodyer_right_page_content_pro2"">" & _	
					 "<font color=""#ff3300"">产品名称："&rs("ProductName")&"</font><br />" & _
					 "编　　号："&rs("ProductNo") &"<br />"& _
					 "型　　号："&rs("ProductModel") &"<br />"& _
					 "标准价格：<span style=""text-decoration: line-through;"">"&rs("N_Price")&"元/"&rs("Unit")&"</span><br />"& _
					 "<font color=""#ff3300"">促销价格："&rs("P_Price")&"元/"&rs("Unit")&"</font><br />"& _
					 "更新时间："&FormatDate(rs("Addtime"),13)&"<br />"& _
					 "出品单位："&rs("Maker") &"<br />"
	  if rs("BigPic")<>"" then
	    response.write "<a href="""&rs("BigPic")&""" title=""点击查看大图片"" target=""_blank""><img src=""../Images/Page_zoom.gif"" />&nbsp;点击查看大图片</a><br>"
	  end if
	  response.write "<a href=""ProductBuy.asp?ProductNo="&rs("ProductNo")&""" title=""将"&rs("ProductName")&"加入订购列表"" target=""_blank"" ><img src=""../Images/Page_buy.gif"" /></a>" &_
	                 "</div>" &_
				  	 "<div class=""Bodyer_right_page_content_pro3""><h2>详细说明</h2>"&rs("Content")&"</div>" &_
					 "</div>"
	  response.write "<div class=""Bodyer_right_page_end"">|&nbsp;查看次数："&rs("ClickNumber")&"</div>"
	  rs("ClickNumber")=rs("ClickNumber")+1
    else
	  WebContent="<div class=""Bodyer_right_page_content""><h2>产品名称："&rs("ProductName")&"</h2><img src=""../Images/NoRight.jpg""><br/><br/></div>"
	end if
	rs.update
    rs.close
    set rs=nothing
  end if
end function
%>
<!--#include file="Foot.asp"-->