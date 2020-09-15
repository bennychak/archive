<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年1月8日10:25:20  　　　　　　　　　　┃
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

<%
On Error Resume Next
set conn_access=nothing
%>

<TABLE width="100%" border="0" cellPadding=0 cellSpacing=0 class=tw>
  <TBODY>
    <TR>
      <TD bgColor=#c0c0c0 height=3></TD>
    </TR>
    <TR>
      <TD vAlign=center bgColor=#003366 height=24><TABLE cellSpacing=0 cellPadding=0 width="100%" border="0">
          <TBODY>
            <TR>
              <TD><TABLE cellSpacing=0 cellPadding=0 border="0">
                  <TBODY>
                    <TR align=middle>
                      <TD width=10></TD>
                      <TD class="fd"><%=manageFootText%></TD>
                    </TR>
                  </TBODY>
              </TABLE></TD>
              <TD align=right ><a href="/html/default.asp" target="_blank">打开网站</a></TD>
              <TD align=right class="fd"><%call showProcessTime%></TD>
            </TR>
          </TBODY>
      </TABLE></TD>
    </TR>
    <TR>
      <TD bgColor="#c0c0c0" height="2"></TD>
    </TR>
  </TBODY>
</TABLE>
<script src="/count/md_count.asp?site_id=7"></script>