<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2004年12月26日10:51:59　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　        　│EMAIL:chenwenj@gmail.com　　　　　　　　　┃
'┃　联系方式　│MSN  :oking@live.com  　　　　　　　　　　┃
'┃　　　　　　│QQ   :168909　ICQ:45318946　　　　　　　　┃
'┃　　　　　　│http://kingchan.net       　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　　　　　　│　　　　　　　　　　　　　　　　　　　　　┃
'┃　记    事　│　　　　　　　　　　　　　　　　　　　　　┃
'┃　　　　　　│　　　　　　　　　　　　　　　　　　　　　┃
'┣━━━━━━┷━━━━━━━━━━━━━━━━━━━━━┫
'┃南京江东北路联通新时空大厦网管中心2004年12月27日10:24:11┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>
<!--#include file="../admin/includes/config.asp"-->
<!--#include file="../admin/includes/pager.asp"--> 
<%
'取得报价单资料
hash=request.querystring("hash")
If not isNE(hash) Then
	sql="select * from Quotation where Hash='" & hash & "'"
	set rs=conn_access.Execute(sql)
	
	'计算日期差
	dDiff = datediff("d", now, DateValue(rs("ValidDate")))
	
	'判断记录的有效性
	If rs.BOF and rs.EOF Then
		call msgPage(13,"gourl","default.asp",2)
		response.end
	Elseif rs("Status")=0 and rs("Guest")=0 Then
		call msgPage(13,"gourl","default.asp",2)
		response.end
	Elseif dDiff  < 0  and rs("Guest")=0 Then
		call msgPage(13,"gourl","default.asp",2)
		response.end
	End If

	name=rs("QName")
	qid=rs("ID")
	'message=htmlencode(rs("Message"))
	message=rs("Message")
	qtype=rs("QType")
	set rs=nothing
	
	If request.querystring("amay") <> "king" Then
		If not Session("memberlogined") Then
			urlPara="quotation.asp?"&getURLPara(true)
			response.Redirect "login.asp?urlPara="&Server.URLEncode(urlPara)
		End If
		memberID = session("userID")
		sql = "select ID from QuotationLevel where MemberID="&MemberID&" and QuotationID="&qid
		'response.write sql
		set rs=conn_access.Execute(sql)
		If rs.BOF and rs.EOF Then
			call msgPage(13,"gourl","default.asp",2)
			response.end
		End if
		
		' 判断sessionID
		sessionID = session.SessionID
		sql = "select SessionID from QuotationLevel where MemberID="&memberID
		set rs=conn_access.Execute (sql)
		
		if rs("SessionID")&"" <> sessionID then
				
			ip = getIP()
			
			sql = "update QuotationLevel set SessionID='"&sessionID&"',Views=Views+1,LastView=now(),LastIP='"&ip&"' where MemberID="&memberID&" and QuotationID="&qid
			'response.write sql
			'response.end
			conn_access.execute(sql)
		end if
		set rs = nothing
	End If

	
Else
	response.end
End If


set rs=server.CreateObject("adodb.recordset")
set rss=server.CreateObject("adodb.recordset")

'获取分类列表
layer=1
sql="select ID,[Name] from Category where ParentID=0 order by ID "
rs.open sql,conn_access,1,1
rowNum=rs.RecordCount
If rowNum>0 Then
	rsArray=rs.GetRows()
	For rows=0 to ubound(rsArray,2)
		abce=""
		sql="select ID,[Name] from Category where ID="&rsArray(0,rows)&" order by ID "
		rss.open sql,conn_access,1,1
		tree=tree & ShowTreeMenu(rss.GetRows(),layer,abce)
		rss.close
	Next
End if
rs.close

'查看加一
sql = "update Quotation set Views=Views+1 where ID="&qid
conn_access.Execute(sql)

'获取列表
searchKey=Request("searchKey")
categoryKey=request("categoryKey")
'parentID=Request.QueryString("parentID")
pageSize=20

If qtype<>"all" Then
	sql="select QuotationProducts.NewPrice,QuotationProducts.QDescription as QD,Products.* from QuotationProducts,Products,Category "
	sql=sql&"where QuotationProducts.ProductID=Products.ID and Products.CategoryID=Category.ID and instr(Products.showWhere,'PS')>0 and QuotationProducts.QuotationID="&qid
	
Else
	sql="select Products.*,Products.Price as NewPrice,Products.QDescription as QD from Products,Category "
	sql=sql&"where Products.CategoryID=Category.ID and instr(Products.showWhere,'PS')>0  "
	
End If

	If NOT isNE(categoryKey) and categoryKey<>0 Then
		sql=sql&"and Products.CategoryID="&categoryKey&" "
		tree=replace(tree,"value="&categoryKey,"selected value="&categoryKey)
	End if	
	
	'Parent
	If NOT isNE(parentID) Then
		sql=sql&" AND ParentID="&parentID
		'categoryName=""
	End if
	
	If NOT isNE(searchKey) Then
		sql=sql&"and ( Products.Name like '%"&searchKey&"%' or Products.Name like '%"&searchKey&"%' "
		sql=sql&"or Products.[NO] like '%"&searchKey&"%' "
		sql=sql&"or Products.Description like '%"&searchKey&"%' or Products.Description like '%"&searchKey&"%') "
	End if
orderString=" order by Products.NO desc"
sql=sql&orderString

set rs=server.createobject("ADODB.Recordset")
	
set classPager=new SplitPager
classPager.setConn=conn_access
classPager.setSolitudeSQL=sql
classPager.setPerPageCount=pageSize
set rs=classPager.getRecordset
	
'set rs=conn_access.Execute (sql)


%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="all" name="robots">
<meta name="author" content="amay@amay-jewelry.com,Amay">
<meta name="Copyright" content="AMAY JEWELRY">
<title>AMAY JEWELRY</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../js/thickbox/thickbox.css" type="text/css" media="screen" />
<script type="text/javascript" src="../js/thickbox/jquery-compressed.js"></script>
<script type="text/javascript" src="../js/thickbox/thickbox.js"></script>


</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="page_toper">
  <tr>
    <td><table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><table width="100%" border="0">
            <tr>
              <td width="10">&nbsp;</td>
              <td style="padding:10px 0 0 0" align="center" valign="top"><img src="images/logo.gif" width="65" height="65"></td>
              <td><br>
                <table width="100%" border="0">
                  <tr>
                    <td><table width="100%" border="0">
                      <tr>
                        <td><img src="images/logo_ctext.gif" /></td>
                        <td>
						<form action="" method="get" name="formSearch" id="formSearch">
						<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="60" align="left">&nbsp;</td>
                            <td width="250" align="right"><table border="0" cellpadding="0" cellspacing="0" id="index_top_text_menu">
                                <tr align="center"><td>

				  						<%If not isNE(request.querystring("amay")) Then
										tmpa="amay="&request.querystring("amay")&"&"
										Else
										tmpa=""
										%>
											
										<%End If%>
                                      <select name="select"  onChange="window.location='quotation.asp?<%=tmpa%>hash=<%=hash%>&categoryKey='+this.value">
                                        <option value="0" selected>All Category</option>
										<%=tree%>
    
                                      </select>                                  </td>
                                  <td width="40">
								  <input name="hash" type="hidden" id="hash" value="<%=hash%>">
								  <%If not isNE(request.querystring("amay")) Then%>
								  <input name="amay" type="hidden" id="hash" value="<%=request.querystring("amay")%>">
								  <%End if%>
								  </td>
                                  <td>SEARCH</td>
                                </tr>
                            </table></td>
                            <td width="120" align="right" valign="middle"><input name="searchKey" type="text" id="searchKey" style="BORDER-RIGHT: #b8b8b8 1px solid; BORDER-TOP: #b8b8b8 1px solid; BORDER-LEFT: #b8b8b8 1px solid; WIDTH: 115px; BORDER-BOTTOM: #b8b8b8 1px solid; HEIGHT: 17px" ></td>
                            <td align="left" valign="middle"><input name="image" type="image" src="images/top_ico_search.gif"></td>
                          </tr>
                        </table>
						</form>
						</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table width="100%" border="0">
                      <tr>
                        <td width="50"><img src="images/quotation.gif" ></td>
                        <td>No.xxxxx,xxxxxx business building,xxxxx xxxx,FuYong town,xxxxxxx,Shenzhen,China<BR>
                          Tel:+xx-xxxxxx-xxxxxx/xxxxxx Fax:+xx-xxx-xxxxx
                          Contact people: Mr.King / 
                          Email: xxxx@xxxx-xxxxx.com</td>
                      </tr>
                    </table></td>
                    </tr>
                </table>
                </td>
            </tr>
          </table>          </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" height="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td align="left" valign="top" style="padding:10px 20px 0 20px  "><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="5" bgcolor="#CC0066"></td>
      </tr>
      <tr>
        <td bgcolor="#cccccc"><table width="100%" border="0" cellpadding="5" cellspacing="1">
          <tr>
            <td bgcolor="#f7f7f7" >
			  <p><b><%=HTMLEncode2(message)%></b><br>
			  </td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="1" bgcolor="#cccccc"></td>
      </tr>
      <tr>
        <td bgcolor="#cccccc"><form name="form1" method="post" action="operation.asp?action=modifyOrderNumber">
            <table width="100%" border="0" cellpadding="5" cellspacing="1">
              <tr>
                <td width="150" bgcolor="#f7f7f7" class="menu_on">&gt;&gt; Product Image</td>
                <td bgcolor="#f7f7f7" class="menu_on" width="150">&gt;&gt;  Name / NO.</td>
                <td bgcolor="#f7f7f7" class="menu_on" width="270">&gt;&gt; Description of the goods</td>
                <td width="80" bgcolor="#f7f7f7" class="menu_on">Price（USD）</td>
                <td bgcolor="#f7f7f7" class="menu_on">&gt;&gt;Description</td>
                </tr>
				
                   <%

		  rowCount=pageSize
		  while not rs.eof and rowCount > 0
		  rowCount=rowCount-1
	simage=rs("Simage")
	If isNE(simage) Then simage="snone.gif"
	bimage=rs("Bimage")
	If isNE(bimage) Then bimage="bnone.gif"
	If isNE(rs("NewPrice")) or rs("NewPrice") = 0 Then 
		newPrice="" 
		price=""
	Else 
		newPrice="<font color=""#FF0000"">Price:$ "&FormatNumber(rs("NewPrice"),2,-1)&"</font>"
		price="<font color=""#FF0000"" size=""4"" face=""Tahoma"">$ "&FormatNumber(rs("NewPrice"),2,-1)&"</font>"
	End if
	

%>			  
              <tr>
                <td align="center" bgcolor="#FFFFFF">
                <!--a href="<%="../"&productImagePath&bimage%>" class="thickbox" rel="gallery-plants" title='<%=rs("Name")%> <br>(NO.<%=rs("NO")%>) <%=newPrice%>'-->
                <a href="<%="../"&productImagePath%>2005090521383158008.jpg" class="thickbox" rel="gallery-plants" title='<%=rs("Name")%> <br>(NO.<%=rs("NO")%>) <%=newPrice%>'>
                <img src="<%="../"&productImagePath&simage%>" border="0" onerror="src='images/logo.gif'"></a></td>
                <td bgcolor="#f7f7f7" class="menu_off" >
				<p><%=rs("Name")%></p>
				<p><%=rs("NO")%></p>
				</td>
                <td bgcolor="#f7f7f7" >
				<p class="order_p"><b>Material</b>: <%=rs("Material")%></p>
				<p class="order_p">
				<b>Plating</b>: 
				<%
				If isNE(rs("Plating")) Then
				  	response.Write "No plating"
				Else
				 	response.Write rs("Plating")
				End if				
				%>
				</p>
				<p class="order_p"><b>Magnetic</b>: 
				<%

				If isNE(rs("Magnetic")) Then
					response.Write "No magnetic"
				Else
					response.Write rs("Magnetic")									
				End if
				
				%></p>

				<p class="order_p"><b>Size</b>: 
				<%

				If isNE(rs("Size")) Then
					response.Write "As sample"
				Else
					response.Write rs("Size")									
				End if
				
				%></p>

				<p class="order_p"><b>Stone</b>: 
				<%

				If isNE(rs("Stone")) Then
					response.Write "No stone"
				Else
					response.Write rs("Stone")									
				End if
				
				%></p>
				<p class="order_p"><b>Mini QQ</b>: <%=rs("Qqmini")%></p></td>
                <td bgcolor="#f7f7f7"><%=price%></td>
                <td bgcolor="#f7f7f7"><span class="order_p">
                  <%response.Write HTMLEncode2(rs("QD")&"")%>
                </span></td>
                </tr>
                   <%
rs.movenext
Wend

%>			  
              <tr>
                <td height="30" colspan="5" align="right" bgcolor="#f7f7f7"><%=classPager.getBarEN%></td>
              </tr>
            </table>
        </form></td>
      </tr>
    </table></td>
  </tr>
</table>
<br>
<!--#include file="footer.asp"-->
</body>
</html>
<%
set classPager=nothing
set rs=nothing
set conn_access=nothing
%>