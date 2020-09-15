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
<%
dim ID,rs,sql
ID=request("id")
sql="select * from News where ID="&ID
set rs=conn_access.Execute (sql)
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
                  <tbody>
                    <tr>
                      <td colspan="2" bgcolor="#cccccc" height="2"></td>
                    </tr>
                    <tr>
                      <td colspan="2" bgcolor="#ffffff" height="2"></td>
                    </tr>
                    <tr valign="top">
                      <td colspan="2" class="table_title"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <!-- image -->
                          <tbody>
                            <tr>
                              <td valign="top"><span class="title_orange_l"><%=rs("InDate")%></span><br><br>
                                <span class="table_title"><%=rs("NewsTitle")%></span> </td>
                              </tr>
                          </tbody>
                      </table></td>
                    </tr>
                    <tr>
                      <td colspan="2" background="images/contents_line_dot.gif" height="5"></td>
                    </tr>
                    <tr>
                      <td colspan="2" class="table_text" style="line-height: 18px;">
					  <%If NOT isNE(rs("Image")) Then%>
					  <div style="float:left "><img src="../images/news/<%=rs("Image")%>" ></div>
					  <%End if%>
					  <%=htmlencode(rs("Content"))%>
					  </td>
                    </tr>
                    <tr>
                      <td colspan="2" background="images/contents_line_dot.gif" height="5"></td>
                    </tr>

                    <tr>
                      <td class="table_title" width="126">Content list</td>
                      <td class="table_text" width="450">
					  <%
					  dim sql_1,sql_2,rs_1,rs_2
					  sql_1="select top 1 ID,NewsTitle from news where ID < "&ID&"  order by ID desc"
					  sql_2="select top 1 ID,NewsTitle from news where ID > "&ID&"  order by ID asc"
					  
					  set rs_1=conn_access.Execute (sql_1)
					  set rs_2=conn_access.Execute (sql_2)
					  
					  if not (rs_1.eof and rs_1.bof) then
					  %>
                      <img src="images/ico_leftarrow.gif" height="7" width="11"> Prev &nbsp;&nbsp;<a href="news_view.asp?id=<%=rs_1("ID")%>" title="<%=rs_1("NewsTitle")%>"><%=substr(rs_1("NewsTitle"),60)%></a><br>
                      <%
					  end if
                      if not (rs_2.eof and rs_2.bof) then
					  %>
                      <img src="images/ico_rightarrow.gif" height="7" width="11"> Next &nbsp;&nbsp;<a href="news_view.asp?id=<%=rs_2("ID")%>" title="<%=rs_2("NewsTitle")%>"><%=substr(rs_2("NewsTitle"),60)%></a>
					  <%
					  end if
					  rs_1.close
					  rs_2.close
					  set rs_1=nothing
					  set rs_2=nothing
					  
					  %>
					  </td>
                    </tr>
                    <tr>
                      <td colspan="2" bgcolor="#ffffff" height="2"></td>
                    </tr>
                    <tr>
                      <td colspan="2" bgcolor="#cccccc" height="2"></td>
                    </tr>
                  </tbody>
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
