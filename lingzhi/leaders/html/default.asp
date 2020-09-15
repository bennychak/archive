<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年1月9日16:05:14  　　　　　　　　　　┃
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
'┃广州天河中山大道棠雅苑          　  2005年1月9日16:05:19┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="../admin/includes/config.asp"-->
<!--#include file="../admin/includes/cart.asp"-->

<%
dim bannerFlash(2),randIndex
dim thisURL
dim thisPage,thisPath
thisPath=Request.ServerVariables("URL")
thisPage=split(thisPath,"/")(ubound(split(thisPath,"/")))


thisURL=getURL(true)

bannerFlash(0)="site_01.swf"
bannerFlash(1)="site_02.swf"

Randomize
randIndex = Int((ubound(bannerFlash) * Rnd) + 0)

dim rs,sql
dim cartKit
set cartKit=new Cart

sql = "update [config] set [Count]=[Count]+1 where ID=1"
conn_access.Execute(sql)

sql="select Title,Address,Tel,Fax,Email,ConnectMan,Introduce,NewProducts,[Count] from config where ID=1"
set rs=conn_access.Execute (sql)
'Title=rs("Title")
'Address=rs("Address")
Tel=rs("Tel")
Fax=rs("Fax")
Email=rs("Email")
ConnectMan=rs("ConnectMan")
NewProducts=rs("NewProducts")
Count=rs("Count")

'Introduce=rs("Introduce")
set rs=nothing

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="all" name="robots">
<meta name="author" content="amay@amay-jewelry.com,Amay">
<meta name="Copyright" content="AMAY JEWELRY">
<meta name="description" content="amay jewelry corporation. was founded in 2002, Shenzhen. It produces and exports high quality stainless steel, titanium, magnetic, and bowlder ornaments.">
<meta name="keywords" content="amay jewelry,titanium jewelry,titanium jewellery,titanium bracelet,titanium ring,titanium pendant,titanium necklace,titanium cuff link,titanium earring,titanium tie clip,titanium money clip,stainless steel jewelry,stainless steel jewellery,stainless steel bracelet,stainless steel bangle,stainless steel ring, stainless steel necklace,stainless steel pendant,stianless steel earring,stainless steel tie clip,stainless steel money clip,stainless steel cuff link,magnetic jewelry,magnetic jewellery,magnetic bracelet,magnetic necklace,magnetic earring,Germanium bracelets,china jewelry,china jewellery,jewelry manufacturer,jewellery manufacturer,stainless steel jewelry manufacturer,stainless steel jewellery manufacturer,tianium jewelry manufacturer,titanium jewellery manufacturer,magnetic jewellery manufacturer,stainless steel jewelry manufacturer,china jewelry exporter,china jewellery exporter,jewelry,jewellery,jade jewelry,jade jewellery,agate jewelry,agate jewellery,health jewelry,health jewellery"> 
<title>AMAY JEWELRY</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<!--#include file="head.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="index_banner">
  <tr>
    <td align="left">
	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="742" height="203" title="Banner">
      <param name="movie" value="flash/banner_2.swf">
      <param name="quality" value="high">
	  <param name="base" value="flash/" />
      <embed src="flash/banner_2.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="742" height="203"></embed>
    </object>	
	</td>
  </tr>
</table>
<table width="100%" height="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="240" align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding-left:5px " >
         
		  <form action="operation.asp" method="post">
            <tr>
              <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="30" colspan="2"  style=" padding: 0 0 0 5px ">

				  <table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><img src="images/icon_ball.gif" width="13" height="14"></td>
                        <td align="left" style="padding-right:4px ">
						<span class="title_contentb">
						<%If not session("memberlogined") Then%>
						Sign into Amay!
						<%Else%>
						Welcome <%=session("userCode")%>
						<%End if%>
						</span></td>
                      </tr>
                  </table>				  </td>
                </tr>
                <tr>
                  <td height="2" bgcolor="#bd0052"></td>
                  <td bgcolor="#efefef"></td>
                </tr>
              </table></td>
            </tr>
			<%If not session("memberlogined") Then%>
            <tr>
              <td valign="top" ><table width="99%" border="0" cellpadding="2" cellspacing="2" bgcolor="#f7f7f7">
                <tr>
                  <td width="60" align="right">Amay! ID: </td>
                  <td><input name="LoginId" type="text" style=" width: 85px; padding: 2px; height: 22px; color: #990000 " onFocus="this.value=''"></td>
                <td rowspan="2"><input type="image" src="images/login_btn.gif"></td>
                </tr>
                <tr>
                  <td align="right">Password:</td>
                  <td><input type="password" name="UserPassword" style=" width: 85px; padding: 2px; height: 22px; color: #990000 " onFocus="this.value=''"></td>
                </tr>
                <tr align="left">
                  <td colspan="3"><div style=" padding: 8px 0 3px 10px "><img src="images/id_text.gif" width="10" height="14" align="absmiddle"> <a href="register.asp" class="style1">Join Us </a><span class="td center">
                    <input name="action" type="hidden" id="action" value="memberLogin">
                  </span></div>
                    <div style=" padding: 5px 0 3px 10px "><img src="images/id_text.gif" width="10" height="14" align="absmiddle"> <a href="forget_password.asp" class="style1">Forgot your password?</a></div></td>
                  </tr>
                <tr align="left">
                  <td height="5" colspan="3"></td>
                </tr>
              </table></td>
            </tr>
			<%Else%>
            <tr>
              <td valign="top" ><table width="99%" border="0" cellpadding="2" cellspacing="2" bgcolor="#F7F7F7">
                <tr>
                  <td align="left" style="padding-left:20px ">&nbsp;</td>
                </tr>
                <tr>
                  <td align="left" style="padding-left:20px "><img src="images/id_text.gif" width="10" height="14" align="absmiddle"><a href="myorders.asp" class="style1">MY ORDERS</a></td>
                </tr>
                <tr>
                  <td align="left" style="padding-left:20px "><img src="images/id_text.gif" width="10" height="14" align="absmiddle"><a href="edit_profile.asp" class="style1">MY CART</a></td>
                </tr>
                <tr>
                  <td align="left" style="padding-left:20px "><img src="images/id_text.gif" width="10" height="14" align="absmiddle"><a href="edit_profile.asp" class="style1">MY AMAY</a></td>
                </tr>
                <tr>
                  <td align="left" style="padding-left:20px "><img src="images/id_text.gif" width="10" height="14" align="absmiddle"><a href="myquotation.asp" class="style1">MY QUOTATION </a></td>
                </tr>
                <tr>
                  <td align="left" style="padding-left:20px "><img src="images/id_text.gif" width="10" height="14" align="absmiddle"><a href="operation.asp?action=memberLogout" class="style1">LOGOUT</a></td>
                </tr>				
                <tr>
                  <td align="left">&nbsp;</td>
                </tr>
              </table></td>
            </tr>
			<%End if%>
            <tr>
              <td valign="top" ><table width="99%" border="0" cellpadding="2" cellspacing="2" bgcolor="#e8e8e8">
                <tr>
                  <td colspan="3" align="left" style="padding-left:15px ">
				  <%
				  sql="select ID,Name from Category where ParentID=0 order by ID Desc"
				  set rs=conn_access.Execute (sql) 
				  %>
				  <select name="select" style="width:150px " onChange="window.location='products.asp?parentID='+this.value">
  				    <option value="0" selected>=Category select</option>
				  <%while not rs.eof%>
				    <option value="<%=rs("ID")%>" ><%=rs("Name")%></option>
				  <%
				  rs.movenext
				  wend
				  rs.close
				  set rs=nothing
				  %>	
                  </select>				  </td>
                  </tr>
              </table>                </td>
            </tr>
          </form> 
          <tr>
            <td height="30"><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/icon_ball.gif" width="13" height="14"></td>
                <td align="left" style="padding-right:4px "><span class="title_contentb"> Amay Bulletin</span></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td><table width="99%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f7f7f7">
                <%
				sql="select top 4 ID,NewsTitle,InDate,Content from News where Category=1 order by InDate Desc"
				dim news_i
				news_i = 0
				set rs=conn_access.Execute (sql) 
				While(not rs.eof)
				news_i=news_i+1
				If news_i = 1 Then
				%>

			  <tr align="left">
                <td height="130" valign="top" style="padding:5px 0 0 10px"><%=rs("Content")%></td>
              </tr>
			  <%Else%>
              <tr align="left">
                <td>
				<div style=" padding: 3px 0 0px 10px "><img src="images/id_text.gif" width="10" height="14" align="absmiddle">
				<a href="news_view.asp?id=<%=rs("ID")%>" ><%=rs("NewsTitle")%></a>
                </div>
				</td>
              </tr>
				<%
				End if
				rs.MoveNext
				Wend
				rs.close
				set rs=nothing
				%>
            </table></td>
          </tr>
          <tr>
            <td height="30"><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/icon_ball.gif" width="13" height="14"></td>
                <td align="left" style="padding-right:4px "><span class="title_contentb"> Online contact </span></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td><table width="99%" border="0" cellpadding="2" cellspacing="2" bgcolor="#f7f7f7">
			  <tr align="left">
                <td><div class="button" style=" padding: 8px 0 3px 10px "><img src="images/id_text.gif" width="10" height="14" align="absmiddle"> EMAIL: <a href="mailto:<%=Email%>"><%=Email%></a><br>
                </div></td>
              </tr>              

			  <tr align="left">
                <td><div class="button" style=" padding: 8px 0 3px 10px "><img src="images/id_text.gif" width="10" height="14" align="absmiddle"> TEL.: <%=Tel%><br>
                </div></td>
              </tr>
              <tr align="left">
                <td><div class="button" style=" padding: 8px 0 3px 10px "><img src="images/id_text.gif" width="10" height="14" align="absmiddle"> Contact man: <%=ConnectMan%> <br>
                </div></td>
              </tr>
			  
            </table></td>
          </tr>
		  <tr>
            <td height="30"><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/icon_ball.gif" width="13" height="14"></td>
                <td align="left" style="padding-right:4px "><span class="title_contentb"> Partner </span></td>
              </tr>
            </table></td>
          </tr>	
          <tr>
            <td><table width="100%" border="0" align="center" cellpadding="2" cellspacing="5">
			  <tr align="left">
                <td style="padding:0 0 0 10px"><a href="http://www.searchbridal.com/" target="_blank"><img src="images/links/SearchBridae.gif" width="107" height="41"></a></td>
			  </tr>              

			  <tr align="left">
                <td style="padding:0 0 0 10px"><a href="http://www.jewelryadvertise.com/" target="_blank"><img src="images/links/JewelryAdvertise.gif" width="103" height="38"></a></td>
			  </tr>
              <tr align="left">
                <td style="padding:0 0 0 10px"><a href="http://www.jewelrylist.com/" target="_blank"><img src="images/links/JewelryList.com.gif" width="126" height="38"></a></td>
              </tr>
              <tr align="left">
                <td style="padding:0 0 0 10px"><a href="http://www.jewelry5.com/" target="_blank"><img src="images/links/Jewelry5.gif" width="120" height="39"></a></td>
              </tr>
              <tr align="left">
                <td style="padding:0 0 0 10px"><a href="http://www.jewelrymagazine.com"><img src="images/links/JewelryMagazine.gif" width="84" height="38" border="0"></a></td>
              </tr>
              <tr align="left">
                <td class="title_orange_l" style="padding:20px 0 0 10px">Visitors: <%=Count%></td>
              </tr>
			  
            </table></td>
          </tr>		  	  
          <tr>
            <td align="center">&nbsp;</td>
          </tr>
        </table></td>
        <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td style="padding:0 0 0 1px"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="30" colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="title_contentb">New Products </td>
                      <td align="right" style="padding:15px 40px 0 0 "><a href="products.asp"><a href="products.asp">More...</a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td height="2" bgcolor="#bd0052"></td>
                <td bgcolor="#efefef"></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td style="padding:10px 0 0 0">
			<div id=demo style="overflow:hidden;height:20px">
			<div id=demo1>
			<table width="100%" border="0">
                <%
				sql="select top 10 ID,NewsTitle,InDate,Content from News where Category=2 order by InDate Desc"
				set rs=conn_access.Execute (sql) 
				While(not rs.eof)
				%>
              
			  <tr>
                <td width="20" align="right"><img src="images/bullet_01.gif" width="14" height="5"></td>
                <td><a href="news_view.asp?id=<%=rs("ID")%>" ><%=substr(rs("NewsTitle"),60)%></a></td>
              </tr>
				<%
				rs.MoveNext
				Wend
				rs.close
				set rs=nothing
				%>
			  
            </table>
			</div>
			<div id=demo2></div>
			</div>
			</td>
          </tr>
          <tr>
            <td style="padding:10px 0 0 0"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <%
		dim simage,orderedImage
		sql="select top 8 ID,[NO],Name,Description,Simage,Material from Products where [NO] in("&NewProducts&") order by ID Desc"
		
		set rs=conn_access.Execute (sql) 
		dim Disabled,i,j

		'cartKit.listItem()
		'cartKit.delAllItem()

		For i=0 to 1

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
			simage=rs("Simage")
			If isNE(simage) Then simage="snone.gif"

			%>
                <td><table width="122" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="72" align="center" valign="middle" background="images/product_bg.gif"><a href="product_view.asp?id=<%=rs("ID")%>"><img src="<%="../"&productImagePath&simage%>" alt="Clicks on the examination to be detailed" border="0" onerror="src='images/logo.gif'"></a></td>
                    </tr>
                    <tr>
                      <td height="5"></td>
                    </tr>
                    <tr>
                      <td height="10" align="center" bgcolor="#FAFAFA"><img src="images/dot_03.gif" width="112" height="1"></td>
                    </tr>
                    <tr>
                      <td height="25" valign="top" bgcolor="#FAFAFA" class="product_name" style="padding-left:5px;"><%=rs("Name")%></td>
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
            </table></td>
          </tr>
          <tr>
            <td style="padding:0 0 0 10px"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="30" colspan="2" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="title_contentb">Recommend</td>
                      <td align="right" style="padding:15px 40px 0 0 "><a href="products.asp?recommend=1">More...</a></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="2" bgcolor="#bd0052"></td>
                  <td bgcolor="#efefef"></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td style="padding:10px 0 0 0 "><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <%

		sql="select top 8 ID,[NO],Name,Description,Simage,Material from Products where Recommend=1  and ProductParentID=0 order by ID Desc"
		set rs=conn_access.Execute (sql) 
For i=0 to 1
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
			simage=rs("Simage")
			If isNE(simage) Then simage="snone.gif"
			%>
                <td><table width="122" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="72" align="center" valign="middle" background="images/product_bg.gif"><a href="product_view.asp?id=<%=rs("ID")%>"><img src="<%="../"&productImagePath&simage%>" alt="Clicks on the examination to be detailed" border="0" onerror="src='images/logo.gif'"></a></td>
                    </tr>
                    <tr>
                      <td height="5"></td>
                    </tr>
                    <tr>
                      <td height="10" align="center" bgcolor="#FAFAFA"><img src="images/dot_03.gif" width="112" height="1"></td>
                    </tr>
                    <tr>
                      <td height="25" valign="top" bgcolor="#FAFAFA" class="product_name" style="padding-left:5px "><%=rs("Name")%></td>
                    </tr>
                    <tr>
                      <td height="20" bgcolor="#FAFAFA" style="padding-left:5px ">Model: <%=rs("NO")%></td>
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
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<script language="javascript">
var speed=120;
demo2.innerHTML=demo1.innerHTML;
function Marquee(){
	if(demo2.offsetTop-demo.scrollTop<=0)
		demo.scrollTop-=demo1.offsetHeight;
	else{
		demo.scrollTop+=1;
	}
}
var MyMar=setInterval(Marquee,speed)
demo.onmouseover=function() {clearInterval(MyMar)}
demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
</script>			

<!--#include file="footer.asp"-->
</body>
</html>
