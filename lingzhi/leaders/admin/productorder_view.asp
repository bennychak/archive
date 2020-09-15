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

sql="select * from Purchasing,Members where Purchasing.UserID=Members.ID and Purchasing.ID="&ID
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
        <td>订做内容</td>
      </tr>
      <tr>
        <td align="center">
          <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
            <tr>
              <td width="150" align="center" bgcolor="#003366"><span class="bai">名称</span></td>
              <td align="left"><%=rs("Name")%></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">日期</td>
              <td align="left"><%=rs("InDate")%></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366"><span class="bai">详细要求</span></td>
              <td align="left"><%=rs("Request")%>
              </td>
            </tr>
<%
If NOT isNE(rs("Image")) Then
%>
            <tr bgcolor="#003366">
              <td colspan="2" align="center"><span class="bai">图片</span></td>
              </tr>
            <tr>
              <td colspan="2" align="center">
			  <img src="<%="../"&purchasingImagePath&rs("Image")%>" id="image_view">
			  </td>
            </tr>
<%
End If
%>	
            <tr bgcolor="#003366">
              <td colspan="2" align="center" class="bai">客户资料</td>
              </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">姓名</td>
              <td align="left"><%=rs("UserName")%></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">Email</td>
              <td align="left"><%=rs("Email")%></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">公司名称</td>
              <td align="left"><%=rs("Department")%></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366"><span class="bai">地址</span></td>
              <td align="left"><%=rs("Address")%></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366"><span class="bai">邮编</span></td>
              <td align="left"><%=rs("ZIP")%></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366"><span class="bai">电话</span></td>
              <td align="left"><%=rs("TEL")%></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366"><span class="bai">传真</span></td>
              <td align="left"><%=rs("FAX")%></td>
            </tr>
            
          </table>
              <br>
          <input name="return" type="button" class="button" id="return" onClick="location='productorder_list.asp'" value="返回">
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
