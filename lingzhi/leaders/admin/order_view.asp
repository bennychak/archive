<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2004年12月25日10:27:48　　　　　　　　　　┃
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
'┃南京汉中门大街康怡花园汉佳办事处　2004年12月25日10:24:11┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="includes/config.asp"--> 
<%call isLogin%>

<%
dim rs,rss,sql,ID
ID=request.querystring("id")

'更新状态
sql="update Orders set Status=1 where ID="&Id
conn_access.Execute (sql) 

sql="select * from Orders,Members where Orders.UserID=Members.ID and Orders.ID="&ID
set rs=conn_access.Execute (sql)
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="robots" none="noindex,nofollow">
<title><%=manageCenterTitle%></title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
   _editor_url = "./HTMLArea";
   _editor_lang = "en";
</script>


<script type="text/javascript" src="HTMLArea/htmlarea.js"></script>

<script type="text/javascript" defer="1">
	//HTMLArea.replace('basic_content')
</script>

<script type="text/javascript" src="../js/check_form.js"></script>
</head>

<body>
<!--#include file="head.asp"-->
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="157" valign="top">
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border="0">
      <TBODY>
        <TR>
          <TD vAlign=top>
		    <!--#include file="menu.asp"--></TD>
        </TR>
      </TBODY>
    </TABLE>
	</td>
    <td width="84%" rowspan="2" valign="top"><table width="100%"  border="0" cellspacing="5" cellpadding="5">
      <tr>
        <td>订单内容</td>
      </tr>
      <tr>
        <td align="center">
          <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
            <tr>
              <td width="80" align="right" bgcolor="#003366"><span class="bai">订单号</span></td>
              <td width="695" align="left"><%=rs("Code")%></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#003366"><span class="bai">日期</span></td>
              <td align="left"><%=rs("InDate")%>
              </td>
            </tr>
            <tr bgcolor="#003366">
              <td colspan="2" align="center"><span class="bai">订购产品</span></td>
              </tr>
            <tr>
              <td colspan="2" align="center">
			  <table width="100%"  border="1" cellpadding="4" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
                <tr align="center">
                  <td bgcolor="#EFEFEF">产品名</td>
                  <td bgcolor="#EFEFEF">产品编号</td>
                  <td width="70" bgcolor="#EFEFEF">最少订货量</td>
                  <td bgcolor="#EFEFEF">客户要求</td>
                  <td width="70" bgcolor="#EFEFEF">订货数量</td>
                </tr>
<%
sql="select * from OrderProducts,Products where "
sql=sql&"Products.ID=OrderProducts.ProductID and OrderID="&rs("orders.ID")
set rss=conn_access.Execute(sql)
while not rss.eof
%>				
                <tr>
                  <td><%=rss("Name")%></td>
                  <td><%=rss("NO")%></td>
                  <td><%=rss("Qqmini")%></td>
                  <td><p class="order_p"><%=rss("Magnetics")%></p>
                    <p class="order_p"><%=rss("Platings")%></p>
                    <p class="order_p"><%=rss("Sizes")%></p></td>
                  <td><span class="menu_off"><%=rss("Quantity")%></span></td>
                </tr>
<%
rss.MoveNext
Wend
%>
              </table></td>
              </tr>
            <tr bgcolor="#003366">
              <td colspan="2" align="center" class="bai">客户资料</td>
              </tr>
            <tr>
              <td align="right" bgcolor="#003366" class="bai">Name</td>
              <td align="left"><%=rs("FirstName")%>&nbsp;&nbsp;<%=rs("LastName")%></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#003366" class="bai">Email</td>
              <td align="left"><%=rs("Email")%></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#003366" class="bai">Company</td>
              <td align="left"><%=rs("Company")%></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#003366"><span class="bai">Address</span></td>
              <td align="left">
			  <%=rs("City")%>&nbsp;<%=rs("Address")%>&nbsp;<%=rs("Province")%>&nbsp;<%=rs("Country")%>
			  
			  </td>
            </tr>
            <tr>
              <td align="right" bgcolor="#003366"><span class="bai">邮编</span></td>
              <td align="left"><%=rs("ZIP")%></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#003366"><span class="bai">电话</span></td>
              <td align="left"><%=rs("PhoneCountry")%> - <%=rs("PhoneArea")%> - <%=rs("PhoneNumber")%> </td>
            </tr>
            <tr>
              <td align="right" bgcolor="#003366"><span class="bai">传真</span></td>
              <td align="left"><%=rs("FaxCountry")%> - <%=rs("FaxArea")%> - <%=rs("FaxNumber")%></td>
            </tr>
            
          </table>
              <br>
              <input name="return2" type="button" class="button" id="return2" onClick="onClick=window.open('member_edit.asp?id=<%=rs("Members.ID")%>')"  value="查看此客户详细资料">
              <input name="return" type="button" class="button" id="return" onClick="location='order_list.asp'" value="返回">
		  </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="bottom"><IMG src="img/left_end.gif" width="157" height="160" border="0"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
<%
set rs=nothing
%>
