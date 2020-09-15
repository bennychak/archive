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
<%
dim rs,action,sql,classPager,page,rowCount
page=Request.QueryString("page")
sql="select id,newstitle,indate,Content from news order by indate desc"
set rs=server.createobject("ADODB.Recordset")

set classPager=new SplitPager
classPager.setConn=conn_access
classPager.setSolitudeSQL=sql
classPager.setPerPageCount=8
set rs=classPager.getRecordset
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
</head>
<body>
<!--#include file="head.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="page_toper">
  <tr>
    <td><table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="250"><img src="images/aboutus_title.gif" width="172" height="52"></td>
          <td class="limap"><!--#include file="link_bar.asp"--></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" height="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="100" align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="10">&nbsp;</td>
                <td><table cellspacing=0 cellpadding=0 width=172 background="images/bg_leftmenu01.gif" border=0>
                    <tr>
                      <td width=6 height=22 id="menu_left_1"></td>
                      <td style="padding-left: 15px; cursor:pointer" width="166" id="menu_1"><a href="about_us.asp">Corporate Information</a></td>
                    </tr>
                    <tr>
                      <td height="1"></td>
                      <td bgcolor="#bdbdbd"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td width="10">&nbsp;</td>
                <td><table cellspacing=0 cellpadding=0 width=172 background="images/bg_leftmenu01.gif" border=0>
                    <tr>
                      <td width=6 height=22 class="menu_on_left" id="menu_left_2"></td>
                      <td style="padding-left: 15px; cursor:pointer" width="166" id="menu_2"><a href="news.asp">Amay News</a></td>
                    </tr>
                    <tr>
                      <td height="1"></td>
                      <td bgcolor="#bdbdbd"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr bgcolor="#efefef">
                <td height="8" colspan="2"></td>
              </tr>
            </table></td>
          <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="100px" align="center" valign="top" style="padding:10px 20px 0 20px "><table border="0" cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                        <td colspan="2" bgcolor="#cccccc" height="2px"></td>
                      </tr>
                      <tr>
                        <td colspan="2" bgcolor="#ffffff" height="2px"></td>
                      </tr>
<%
rowCount=8
while not rs.eof and rowCount > 0
rowCount=rowCount-1
%>
                      
					  <tr>
                        <td class="table_title" valign="top" width="126px"><%=rs("InDate")%></td>
                        <td class="table_text" width="450px"><p class="b"><a href="news_view.asp?id=<%=rs("ID")%>" ><%=rs("NewsTitle")%></a></p>
						<p><%=substr(rs("Content"),270)%></p>
						</td>
                      </tr>
                      <tr>
                        <td colspan="2" background="images/contents_line_dot.gif" height="5px"></td>
                      </tr>
<%
rs.MoveNext
Wend
%>

                      <tr align="center">
                        <td colspan="2" bgcolor="#f7f7f7" height="20px"><%=classPager.getBarEN%></td>
                      </tr>
                      <tr>
                        <td colspan="2" bgcolor="#ffffff" height="2px"></td>
                      </tr>
                      <tr>
                        <td colspan="2" bgcolor="#cccccc" height="2px"></td>
                      </tr>
                  </table>
                <p></p></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="footer.asp"-->
</body>
</html>
