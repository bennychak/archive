<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年1月25日21:01:19 　　　　　　　　　　┃
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
'┃广州中山大道上社棠雅苑    		 2005年1月25日21:01:13 ┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>
<!--#include file="../admin/includes/config.asp"--> 
<!--#include file="../admin/includes/pager.asp"-->
<!--#include file="../admin/includes/cart.asp"-->

<%
dim rs,sql,sqll,classPager,page,rowCount
dim categoryID,categoryName,recommend,parentID
dim searchKey,isNew,keywords
dim i,j

dim thisURL
thisURL=getURL(true)

searchKey=Request("searchKey")
page=Request.QueryString("page")
categoryID=Request.QueryString("categoryID")
parentID=Request.QueryString("parentID")
recommend=Request.QueryString("recommend")
isNew=Request.QueryString("isNew")

sql="select Products.ID,Products.[NO],Products.Name,Products.Simage from Products,Category where Products.CategoryID=Category.ID  and ProductParentID=0 and instr(ShowWhere,'PL')>0"

categoryName="New Products"
titleImage = "products_title.gif"

'分类
If NOT isNE(categoryID) Then
	sql=sql&" AND Products.CategoryID="&categoryID
	'取分类名
	sqll="select Name from Category where ID="&categoryID
	keywords=conn_access.Execute (sqll) (0)
	categoryName="Category : "&keywords
	
End if

'Parent
If NOT isNE(parentID) Then
	sql=sql&" AND ParentID="&parentID
	categoryName=""
End if


'最新
If NOT isNE(isNew) Then
	sql=sql&" AND isNew="&isNew
	categoryName="What's new"
	titleImage="whatsnew_title.gif"
	If not Session("memberlogined") Then
		urlPara="products.asp?"&getURLPara(true)
		response.Redirect "login.asp?urlPara="&Server.URLEncode(urlPara)	
	else
		sql_tmp = "select WhatsNew from Members where ID="&session("userID")
		'response.write conn_access.Execute(sql_tmp)(0)
		
		If conn_access.Execute(sql_tmp)(0) <> "1" or isNE(conn_access.Execute(sql_tmp)(0)) Then
			call msgPage(14,"gourl","default.asp",10)
			response.end
		End If
		
	End If
Else
	sql=sql&" AND isNew<>1"
End if

'推荐
If NOT isNE(recommend) Then
	sql=sql&" AND Products.recommend=1 "
	categoryName="Recommend Products"
End if

'搜索
If NOT isNE(searchKey) Then
	sql=sql&"AND ( Products.Name like '%"&searchKey&"%' OR Products.[NO] like '%"&searchKey&"%' )"
	categoryName="Search Result"
End if

sql=sql&" order by Products.NO Desc"

set rs=server.createobject("ADODB.Recordset")
set classPager=new SplitPager
classPager.setConn=conn_access
classPager.setSolitudeSQL=sql
classPager.setPerPageCount=PageSize
set rs=classPager.getRecordset

dim cartKit
set cartKit=new Cart

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="all" name="robots">
<meta name="author" content="amay@amay-jewelry.com,Amay">
<meta name="Copyright" content="AMAY JEWELRY">
<meta name="description" content="<%=keywords%>">
<meta name="keywords" content="<%=keywords%>">
<title>AMAY JEWELRY</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--#include file="head.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="page_toper" >
  <tr>
    <td><table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="250" rowspan="2"><img src="images/<%=titleImage%>"></td>
          <td height="25" colspan="2" class="limap"><!--#include file="link_bar.asp"--></td>
        </tr>
        <tr>
          <td><%=categoryName%></td>
        <td align="right" style=" padding-right:40px "><a href="mycart.asp" target="_blank"></a></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" height="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="100" align="center" valign="top"><!--#include file="category.asp"--></td>
          <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="100" style="padding:10px 0 0 0 "><table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <%
dim Disabled
dim simage
'cartKit.listItem()
'cartKit.delAllItem()

For i=0 to (productsListLine-1)
If rs.eof Then exit for
%>
                    <tr align="center">
                <%
	For j=0 to 3

		If NOT rs.eof Then
			If cartKit.existsItem(rs("ID")) Then
				Disabled=" Disabled checked "
			else
				Disabled=""
			End if
%>

					  <td><table width="122" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td height="72" align="center" valign="middle" background="images/product_bg.gif">
					 	<%
						simage=rs("Simage")
						If isNE(simage) Then simage="snone.gif"
						%>
							
							<a href="product_view.asp?id=<%=rs("ID")%>" target="_blank"><img src="<%="../"&productImagePath&simage%>" border="0" onerror="src='images/logo.gif'"></a></td>
                          </tr>
                          <tr>
                            <td height="5"></td>
                          </tr>
                          <tr>
                            <td height="10" align="center" bgcolor="#FAFAFA"><img src="images/dot_03.gif" width="112" height="1"></td>
                          </tr>
                          <tr>
                            <td height="25" bgcolor="#FAFAFA" class="product_name" style="padding-left:5px "><%=rs("Name")%></td>
                          </tr>
                          <tr>
                            <td height="20" bgcolor="#FAFAFA" style="padding-left:5px ">Item No.: <%=rs("NO")%></td>
                          </tr>
                          <tr>
                            <td height="6" align="center" bgcolor="#FAFAFA"></td>
                          </tr>
						  
                        </table></td>
<%
		rs.MoveNext
		else
%>
					  <td><table width="122" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td align="center" valign="middle">&nbsp;</td>
                        </tr>
                      </table></td>
<%
		End if
	Next
%>											
                    </tr>
					<tr align="right">
                      <td height="10" colspan="4" ></td>
                    </tr>					
              <%
Next

%>					
                    <tr align="right">
                      <td height="20" colspan="4" style="padding-right:20px "><%=classPager.getBarEN%></td>
                    </tr>
                    <tr align="center" >
                      <td colspan="4">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="footer.asp"-->
</body>
</html>
