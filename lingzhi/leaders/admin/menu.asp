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

<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
	<TBODY>
	<TR>
	  <TD bgColor="#c0c0c0" height="1"></TD>
	</TR>
<%
dim rsMenu,sqlMenu
sqlMenu="select * from SysMenu order by [order] asc"
set rsMenu=conn_access.Execute (sqlMenu)
While(not rsMenu.eof)
%>
	<TR>
	  <TD height="26" align="right" background="img/menu.gif" style="padding-right:20px ">
	  <a href="<%=rsMenu("Link")%>"><%=rsMenu("MenuName")%></a>
	  </TD>
	</TR>
<%
rsMenu.MoveNext
Wend
%>
	</TBODY>
</TABLE>
<%
rsMenu.close
set rsMenu=nothing
%>