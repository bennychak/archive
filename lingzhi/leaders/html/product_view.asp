<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年3月27日16:22:36 　　　　　　　　　　┃
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
'┃广州中山大道上社棠雅苑    		 2005年3月27日16:22:36 ┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>
<!--#include file="../admin/includes/config.asp"-->
<!--#include file="../admin/includes/pager.asp"-->
<!--#include file="../admin/includes/cart.asp"-->
<%
dim ID,rs,rss,sql
dim action
dim bimage,bbimage,categoryID,parentID,parentName

ID=Request.QueryString("id")

If ID="" or (not IsNumeric(ID)) Then response.end

action=Request.QueryString("action")


dim thisURL
thisURL=getURL(false)

sql="select top 1 Products.*,Category.Name as CategoryName,ParentID "
sql=sql&"from Products,Category where Products.CategoryID=Category.ID "

Select Case (action) 
	Case "up":
		sql=sql&"and Products.ID<"&ID
		sql=sql&" order by Products.ID desc"
	Case "down":
		sql=sql&"and Products.ID>"&ID
		sql=sql&" order by Products.ID asc"
	Case Else
		sql=sql&"and Products.ID="&ID
End Select

'response.Write sql

set rs=conn_access.Execute (sql) 

If rs.eof and rs.bof Then
	sql="select Products.*,Category.Name as CategoryName,ParentID "
	sql=sql&"from Products,Category where Products.CategoryID=Category.ID order by Products.ID asc"
	set rs=conn_access.Execute (sql) 
End if

bimage=rs("Bimage")
categoryID=rs("CategoryID")
parentID=rs("ParentID")

sql="select Name from category where ID="&parentID
parentName = conn_access.Execute (sql) (0)

dim cartKit
set cartKit=new Cart


If isNE(bimage) Then bimage="bnone.gif"
If isNE(bbimage) Then bbimage="bnone.gif"

dim spid,pid
pid=rs("ID")
spid=Request.QueryString("pid")
'If spid="" or (not IsNumeric(spid)) Then response.end

sql="select ID,Name,Simage "
If NOT isNE(spid) Then
	pid=spid
	sql=sql&"from Products where( ProductParentID="&spid
	sql=sql&" or ID="&spid
	sql=sql&" ) and ID<>"&rs("ID")
else
	If rs("ProductParentID") <> 0 Then
		
		sql=sql&"from Products where ( ProductParentID="&rs("ProductParentID")
		sql=sql&" or ID="&rs("ProductParentID")
		sql=sql&" ) and ID<>"&rs("ID")		
		
		pid=rs("ProductParentID")
	else
		sql=sql&"from Products where ProductParentID="&rs("ID")
	End if
	
	
End if
'response.Write(sql)
'response.End()
set rss=conn_access.Execute (sql)

'查看加一
sql = "update Products set views=views+1 where ID="&rs("ID")
conn_access.Execute(sql)

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="all" name="robots">
<meta name="author" content="amay@amay-jewelry.com,Amay">
<meta name="Copyright" content="AMAY JEWELRY">
<meta name="description" content="<%=rs("Name")%>">
<meta name="keywords" content="<%=rs("NO")%>,<%=rs("Name")%>">
<title>AMAY JEWELRY</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/product_order.js"></script>
<script language="javascript">
function checkOrder()
{
	var magnetic=document.getElementById("magnetic");
	var plating=document.getElementById("plating");
	var size=document.getElementById("size");
	var quantity=document.getElementById("quantity");
	var miniqq=<%=rs("QqminiNumber")%>;

	if(quantity.value!=""){			
		if(quantity.value.match(/^\d+$/)==null){
			alert("The order quantity only can be filled in the numeral.");
			quantity.value="";
			quantity.focus();
			return false;
		}else if(quantity.value<miniqq){
			alert("This product Mini quantity is "+miniqq+" please reinputs.");
			quantity.focus();
			return false;		
		}
	}else{
		alert("Please enter Quantity.");
		return false;
	}	
	
	
	if(magnetic!=null && magnetic.value==0){
		alert("Please select Magnetic.");
		return false;
	}

	if(plating!=null && plating.value==0){
		alert("Please select  Plating.");
		return false;
	}

	if(size!=null && size.value==0){
		alert("Please select Size.");
		return false;
	}
	
	return true;
	
}
</script>
</head>
<body>
<!--#include file="head.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="page_toper">
  <tr>
    <td><table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="250" rowspan="2"><img src="images/products_title.gif" width="172" height="52"></td>
          <td height="25" class="limap"><!--#include file="link_bar.asp"-->
          </td>
        </tr>
        <tr>
          <td><a href="products.asp?parentID=<%=parentID%>"><%=parentName%></a> -> <a href="products.asp?categoryID=<%=rs("CategoryID")%>"><%=rs("CategoryName")%></a></td>
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
                <td height="100" align="center" valign="top" style="padding:10px 0 0 10px "><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="492" align="center"><img src="../images/product/<%=bimage%>" border="0" onerror="src='images/logo.gif'"></td>
                            <td width="15" rowspan="2" background="images/line_dot_back.gif">&nbsp;</td>
                            <td rowspan="2" align="left" valign="top"><table width="100%" border="0" cellspacing="2" cellpadding="4">
                                <tr align="center">
                                  <td colspan="2" class="product_field"><a href="?id=<%=rs("id")%>&action=down">&lt;&lt; Previous product</a> | <a href="?id=<%=rs("id")%>&action=up">Next product &gt;&gt; </a></td>
                                </tr>
                                <tr align="center">
                                  <td height="5" colspan="2" class="product_field"></td>
                                </tr>
                                <tr>
                                  <td align="left" class="product_field"><img src="images/sidemenu_bullet.gif" width="15" height="6">Model:</td>
                                  <td><%=rs("NO")%></td>
                                </tr>
                                <tr>
                                  <td width="110" align="left" class="product_field"><img src="images/sidemenu_bullet.gif" width="15" height="6">Product name:</td>
                                  <td><%=rs("Name")%></td>
                                </tr>
                                <tr>
                                  <td align="left" class="product_field"><img src="images/sidemenu_bullet.gif" width="15" height="6">Material:</td>
                                  <td><%=rs("Material")%></td>
                                </tr>
                                <tr>
                                  <td align="left" class="product_field"><img src="images/sidemenu_bullet.gif" width="15" height="6">Plating:<br>
                                  </td>
                                  <td><%
								  If isNE(rs("Plating")) Then
								  	response.Write "No plating"
								  Else
								  	response.Write rs("Plating")
								  End if
								  %>
                                  </td>
                                </tr>
                                <tr>
                                  <td align="left" class="product_field"><img src="images/sidemenu_bullet.gif" width="15" height="6">Magnetic:<br></td>
                                  <td><%
								  If isNE(rs("Magnetic")) Then
								  	response.Write "No magnetic"
								  Else
								  	response.Write rs("Magnetic")									
								  End if
								  %>
                                  </td>
                                </tr>
                                <tr>
                                  <td align="left" class="product_field"><img src="images/sidemenu_bullet.gif" width="15" height="6">Size:<br></td>
                                  <td>
								  <%
								  If isNE(rs("Size")) Then
								  	response.Write "As sample"
								  Else
								  	response.Write rs("Size")									
								  End if
								  %>
								  </td>
                                </tr>
                                <tr>
                                  <td align="left" class="product_field"><img src="images/sidemenu_bullet.gif" width="15" height="6">Stone:<br></td>
                                  <td><%
								  If isNE(rs("Stone")) Then
								  	response.Write "No stone"
								  Else
								  	response.Write rs("Stone")																		
								  End if
								  %>
                                  </td>
                                </tr>
                                <tr>
                                  <td align="left" class="product_field"><img src="images/sidemenu_bullet.gif" width="15" height="6">Mini QQ:</td>
                                  <td><%=rs("Qqmini")%></td>
                                </tr>
                                <tr>
                                  <td align="left" class="product_field"><img src="images/sidemenu_bullet.gif" width="15" height="6">Description:</td>
                                  <td>&nbsp;</td>
                                </tr>
                                <tr>
                                  <td colspan="2" align="left" style="padding-left:20px "><%=HTMLEncode2(rs("Description"))%></td>
                                </tr>
                              </table></td>
                          </tr>
                          <%If not (rss.bof and rss.eof) Then%>
                          <tr>
                            <td align="center"><table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <%
						dim k
						while not rss.eof
						k=k+1
					  	%>
                                  <td width="130" align="center"><table width="122" height="72" border="0" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td align="center" valign="middle" background="images/product_bg.gif"><a href="product_view.asp?pid=<%=pid%>&id=<%=rss("ID")%>" ><img src="<%="../"&productImagePath&rss("Simage")%>" alt="Clicks on the examination to be detailed" onerror="src='images/logo.gif'"></a></td>
                                      </tr>
                                    </table></td>
                                  <%
						rss.movenext
						If (k mod 4)=0 Then
						%>
                                </tr>
                                <tr>
                                  <%
						End if
						wend						
						%>
                                </tr>
                              </table></td>
                          </tr>
                          <%End if%>
                        </table></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td bgColor="#cfcfcf" height="1"></td>
                    </tr>
                    <tr>
                      <td height="30" align="right" bgcolor="#efefef" style="padding: "><form name="form2" method="post" action="operation.asp" onSubmit="return checkOrder()">
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td align="right"><table border="0" cellspacing="5" cellpadding="0">
                                  <tr>
                                    <%If NOT isNE(rs("Magnetic")) Then%>
                                    <td>&nbsp;</td>
                                    <td valign="top"><select name="magnetic" id="magnetic">
                                        <option value="0">Select Magnetic</option>
                                        <option value="No magnetic">No magnetic</option>
                                        <option value="With magnetic">With magnetic</option>
                                      </select></td>
                                    <%End if%>
                                    <%If NOT isNE(rs("Plating")) Then%>
                                    <td><select name="plating" id="plating">
                                        <option value="0" selected>Select Plating</option>
                                        <option value="No plating">No plating</option>
                                        <option value="IPG gold plating">IPG gold plating</option>
                                        <option value="IPB black plating">IPB black plating</option>
                                      </select>
                                    </td>
                                    <%End if%>
                                    <%If NOT isNE(rs("Size")) Then%>
                                    <td><select name="size" id="size">
                                        <option selected value="0">Select Size</option>
                                        <%
										dim tmp_size,size_start,size_end,size_flag,step
										tmp_size=Split(trim(rs("Size")), "-")
										If UBound(tmp_size)>0 Then
											size_flag= mid(trim(rs("Size")),1,1)
											If size_flag="#" or size_flag="mm" Then
												step=1
												size_start=replace(tmp_size(0),size_flag,"")
												size_end=replace(tmp_size(1),size_flag,"")
												size_start=CInt(size_start)
												size_end=CInt(size_end)
												For i=size_start to size_end Step step
													response.Write "<option value="""&size_flag&i&""">"&size_flag&i&"</option>"
												Next

											Else
												step=0.5
												size_flag="&quot;"
												size_start=replace(tmp_size(0),size_flag,"")
												size_end=replace(tmp_size(1),size_flag,"")
												For i=size_start to size_end Step step
													response.Write "<option value="""&i&size_flag&""">"&i&size_flag&"</option>"
												Next
											End If
										Else
											response.Write "<option value="""&rs("Size")&""">"&rs("Size")&"</option>"
										End If
									


									  %>
                                      </select></td>
                                    <%End if%>
                                    <td>Quantity:
                                      <input name="quantity" type="text" id="quantity" value="<%=rs("QqminiNumber")%>" size="5" >
                                      <input type="hidden" name="action" value="orderProduct">
                                      <input type="hidden" name="orderProductID" value="<%=rs("ID")%>">
                                      <input type="hidden" name="returnPage" value="<%=thisURL%>">
                                    </td>
                                  </tr>
                                </table></td>
                              <td width="250"><input type="submit" name="Submit" value="Add to Basket">
                                <input type="button" name="Submit" value="Inquire Now" onClick="window.location='mycart.asp'">
                              </td>
                            </tr>
                          </table>
                        </form></td>
                    </tr>
                    <tr>
                      <td bgColor="#cfcfcf" height="1"></td>
                    </tr>
                    <tr>
                      <td style="padding-top:10px "><table width="100%" border="0" cellpadding="0" cellspacing="0">
<%
dim simage,orderedImage
sql="select top 9 ID,[NO],Name,Description,Simage from Products where CategoryID="&categoryID&" and ID<>"&ID
If session("whatsNew") <> "1" Then
	sql=sql&" and isNew<>1"
End If
sql=sql&" order by rnd(ID) "
set rs=conn_access.Execute (sql) 
dim Disabled,i,j
'cartKit.listItem()
'cartKit.delAllItem()
For i=0 to 3
If rs.eof Then exit for
%>
                          <tr align="center">
<%
	For j=0 to 2

		If NOT rs.eof Then
			If cartKit.existsItem(rs("ID")) Then
				Disabled=" Disabled checked "
			else
				Disabled=""
			End if
			simage=rs("Simage")
			If isNE(simage) Then simage="snone.gif"

%>
                            <td><table border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td height="100" align="center"><a href="product_view.asp?id=<%=rs("ID")%>"><img src="<%="../"&productImagePath&simage%>" alt="Clicks on the examination to be detailed" onerror="src='images/logo.gif'"></a></td>
                                  <td align="center" valign="middle"><table width="100%" border="0" cellspacing="2" cellpadding="2">
                                      <tr>
                                        <td><span class="product_name"><%=rs("Name")%></span></td>
                                      </tr>
                                      <tr>
                                        <td>Model: <%=rs("NO")%></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                            <%
		rs.MoveNext
		else
%>
                            <td><table border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td width="120" height="100" align="center">&nbsp;</td>
                                  <td width="106" align="center" valign="top">&nbsp;</td>
                                </tr>
                              </table></td>
                            <%
		End if
	Next
%>
                          </tr>
                          <%
Next

%>
                        </table></td>
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
