<!--#include file="Head.asp"-->
  <div id="Bodyer_page">
    <div id="Bodyer_banner_page"><img src="http://dummyimage.com/850x190/fff/000.gif&text=banner" width="850" height="190" alt="<%=SiteTitle %>"/></div>
	<div id="Bodyer_left_page">
      <div class="Bodyer_left_page_title"><h2>搜索</h2></div>
	  <div class="Bodyer_left_page_menu"><%=WebMenu(0,0,2)%></div>
	</div>
	<div id="Bodyer_right_page">
      <div class="Bodyer_right_page_location"><%=WebLocation()%></div>
      <%=WebContent(trim(request("Keyword")),request("Range"))%>
	</div>
  </div>
<%
function WebMenu(ParentID,i,level)
  if request("Range")="Void" then
	 response.write "暂无相关信息"
     exit function
  end if
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_"&request("Range")&"Sort where ViewFlag and ParentID="&ParentID&" order by ID asc"
  rs.open sql,conn,1,1
  if conn.execute("select ID from NwebCn_"&request("Range")&"Sort Where ViewFlag and ParentID=0").eof then
    response.write "暂无相关信息"
  end if
  do while not rs.eof
	if ParentID=0 then
	  response.write "<a href="""&request("Range")&"List.asp?SortID="&rs("ID")&""">"&rs("SortName")&"</a><br/>"
	else
	  response.write string(i,"　")&"<a href="""&request("Range")&"List.asp?SortID="&rs("ID")&""">"&rs("SortName")&"</a><br/>"
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
              "<img src=""../Images/Arrow_03.gif"" />搜索"
  if request("Range")="Void" then
	WebLocation=WebLocation&"<img src=""../Images/Arrow_03.gif"" />未指定范围"
    exit function
  elseif request("Range")="Product" then
    WebLocation=WebLocation&"产品<img src=""../Images/Arrow_03.gif"" />关键字[<font color=""red"">"&trim(request("Keyword"))&"</font>]"
  elseif request("Range")="News" then
    WebLocation=WebLocation&"新闻<img src=""../Images/Arrow_03.gif"" />关键字[<font color=""red"">"&trim(request("Keyword"))&"</font>]"
  elseif request("Range")="Down" then
    WebLocation=WebLocation&"下载<img src=""../Images/Arrow_03.gif"" />关键字[<font color=""red"">"&trim(request("Keyword"))&"</font>]"
  elseif request("Range")="Others" then
    WebLocation=WebLocation&"其他<img src=""../Images/Arrow_03.gif"" />关键字[<font color=""red"">"&trim(request("Keyword"))&"</font>]"
  end if
end function

function WebContent(Keyword,Range)
  if Range="Void" then
	 response.write "<div class=""Bodyer_right_page_content"">错误：未指定需要搜索的范围</div>"
     exit function
  end if
  dim idCount'记录总数
  dim pages'每页条数
      pages=20
  dim pagec'总页数
  dim page'页码
      page=clng(request("Page"))
  dim pagenc'每页显示的分页页码数量=pagenc*5+1
      pagenc=5
  dim pagenmax'每页显示的分页的最大页码
  dim pagenmin'每页显示的分页的最小页码
  dim pageprevious'上一相邻的页码
  dim pagenext '下一相邻的页码
  dim datafrom'数据表名
  dim datawhere'数据条件
  	  select case Range
	  case "Product"
        datafrom="NwebCn_Products"
        datawhere="where ViewFlag and ProductName like '%"&KeyWord&"%'"
	  case "News"
        datafrom="NwebCn_News"
        datawhere="where ViewFlag and NewsName like '%"&KeyWord&"%'"
	  case "Down"
        datafrom="NwebCn_Download"
        datawhere="where ViewFlag and DownName like '%"&KeyWord&"%'"
	  case "Others"
        datafrom="NwebCn_Others"
        datawhere="where ViewFlag and OthersName like '%"&KeyWord&"%'"
      end select
  dim sqlid'本页需要用到的id
  dim Myself,PATH_INFO,QUERY_STRING'本页地址和参数
      PATH_INFO = request.servervariables("PATH_INFO")
	  QUERY_STRING = request.ServerVariables("QUERY_STRING")'
      if QUERY_STRING = "" then
	    Myself = PATH_INFO & "?"
	  elseif Instr(PATH_INFO & "?" & QUERY_STRING,"Page=")=0 then
	    Myself= PATH_INFO & "?" & QUERY_STRING & "&"
	  else
	    Myself = Left(PATH_INFO & "?" & QUERY_STRING,Instr(PATH_INFO & "?" & QUERY_STRING,"Page=")-1)
	  end if
  dim taxis'排序的语句 asc,desc
      taxis="order by id desc "
  dim i'用于循环的整数
  '获取记录总数
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select count(ID) as idCount from ["& datafrom &"]" & datawhere
  set rs=server.createobject("adodb.recordset")
  rs.open sql,conn,0,1
  idCount=rs("idCount")
  '获取记录总数
  if(idcount>0) then'如果记录总数=0,则不处理
    if(idcount mod pages=0)then'如果记录总数除以每页条数有余数,则=记录总数/每页条数+1
	  pagec=int(idcount/pages)'获取总页数
   	else
      pagec=int(idcount/pages)+1'获取总页数
    end if
	'获取本页需要用到的id============================================
    '读取所有记录的id数值,因为只有id所以速度很快
    sql="select id from ["& datafrom &"] " & datawhere & taxis
    set rs=server.createobject("adodb.recordset")
    rs.open sql,conn,1,1
    rs.pagesize = pages '每页显示记录数
    if page < 1 then page = 1
    if page > pagec then page = pagec
    if pagec > 0 then rs.absolutepage = page  
    for i=1 to rs.pagesize
	  if rs.eof then exit for  
	  if(i=1)then
	    sqlid=rs("id")
	  else
	    sqlid=sqlid &","&rs("id")
	  end if
	  rs.movenext
    next
  '获取本页需要用到的id结束============================================
  end if
  if(idcount>0 and sqlid<>"") then'如果记录总数=0,则不处理
    '用in刷选本页所语言的数据,仅读取本页所需的数据,所以速度快
    sql="select * from ["& datafrom &"] where id in("& sqlid &") "&taxis
    set rs=server.createobject("adodb.recordset")
    rs.open sql,conn,0,1
    response.write "<div class=""Bodyer_right_page_content"">"
	response.write "<div class=""Bodyer_right_page_content_infolist"">"
    while not rs.eof '填充数据到表格
  	  select case Range
	  case "Product"
        response.write "·<a href=""ProductView.asp?ID="&rs("ID")&""">"&rs("ProductName")&"</a>&nbsp;<span class=""Black-bbb"">"&FormatDate(rs("UpdateTime"),13)&"</span><br />"
	  case "News"
        response.write "·<a href=""NewsView.asp?ID="&rs("ID")&""">"&rs("NewsName")&"</a>&nbsp;<span class=""Black-bbb"">"&FormatDate(rs("Addtime"),13)&"</span><br />"
	  case "Down"
      response.write "·<a href=""DownView.asp?ID="&rs("ID")&""">"&rs("DownName")&"</a>&nbsp;&nbsp;<span class=""Black-222"">"&rs("FileSize")&"</span>&nbsp;&nbsp;<span class=""Black-bbb"">"&FormatDate(rs("Updatetime"),13)&"</span><br />"
	  case "Others"
        response.write "·<a href=""OtherView.asp?ID="&rs("ID")&""">"&rs("OthersName")&"</a>&nbsp;<span class=""Black-bbb"">"&FormatDate(rs("UpdateTime"),13)&"</span><br />"
      end select
	  rs.movenext
    wend
    response.write "</div>"
    response.write "</div>"
  else
    response.write "<div class=""Bodyer_right_page_content"">暂无相关信息</div>"
	exit function
  end if
  response.write "<div class=""Bodyer_right_page_end"">" & vbCrLf
  Response.Write "|&nbsp;共计：<font color=""#ff6600"">"&idcount&"</font>条记录&nbsp;&nbsp;页次：<font color=""#ff6600"">"&page&"</font></strong>/"&pagec&"&nbsp;&nbsp;每页：<font color=""#ff6600"">"&pages&"</font>条&nbsp;&nbsp;&nbsp;&nbsp;" & vbCrLf
  pagenmin=page-pagenc '计算页码开始值
  pagenmax=page+pagenc '计算页码结束值
  if(pagenmin<1) then pagenmin=1 '如果页码开始值小于1则=1
  if(page>1) then response.write ("<a href="""& myself &"Page=1"" title=""跳到第1页""><img src=""../Images/Arrow_08_first.gif"" width=""9"" height=""8"" /></a>&nbsp;&nbsp;") '如果页码大于1则显示(第一页)
  if page-(pagenc*2+1)<=0 then
	pageprevious=1
  else
	pageprevious=page-(pagenc*2+1)
  end if
  if(pagenmin>1) then response.write ("<a href="""& myself &"Page="& pageprevious &""" title=""第"& pageprevious &"页""><img src=""../Images/Arrow_08_Previous.gif"" width=""8"" height=""8"" /></a>&nbsp;&nbsp;") '如果页码开始值大于1则显示(更前)
  if(pagenmax>pagec) then pagenmax=pagec '如果页码结束值大于总页数,则=总页数
  for i = pagenmin to pagenmax'循环输出页码
	if(i=page) then
	  response.write ("&nbsp;<font color=""#ff6600"">"& i &"</font>&nbsp;")
	else
	  response.write ("[<a href="""& myself &"Page="& i &""">"& i &"</a>]")
	end if
  next
  if page+(pagenc*2+1)>=pagec then
    pagenext=pagec
  else
    pagenext=page+(pagenc*2+1)
  end if
  if(pagenmax<pagec) then response.write ("&nbsp;&nbsp;<a href="""& myself &"Page="& pagenext &""" title=""跳到第"&pagenext&"页""><img src=""../Images/Arrow_08_next.gif"" width=""8"" height=""8"" /></a>&nbsp;") '如果页码结束值小于总页数则显示(更后)
  if(page<pagec) then response.write ("&nbsp;<a href="""& myself &"Page="& pagec &""" title=""跳到第"&pagec&"页""><img src=""../Images/Arrow_08_last.gif"" width=""9"" height=""8"" /></a>") '如果页码小于总页数则显示(最后页)	
  response.write "</div>" & vbCrLf
  rs.close
  set rs=nothing
end function 
%>
<!--#include file="Foot.asp" -->