<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年3月5日14:45:35  　　　　　　　　　　┃
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
<%
isNew=Request.QueryString("isNew")
If NOT isNE(isNew) Then
	extra_para = "&isNew=1"
Else
	extra_para = ""
End If
categoryPageURL="products.asp"
set categoryRs=server.createobject("ADODB.Recordset")
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<%
sql="select ID,Name from Category where ParentID=0"
categoryRs.open sql,conn_access,1,1
If not (categoryRs.bof and categoryRs.eof) Then
	level_1=categoryRs.GetRows()
	categoryRs.Close
	For gi=0 to ubound(level_1,2)
%>              
			  <tr>
                <td width="10">&nbsp;</td>
                <td><table cellspacing=0 cellpadding=0 width=172 background="images/bg_leftmenu01.gif" border=0>
                    <tr>
                      <td width=6 height=22></td>
                      <td style="padding-left: 15px" width="166"><b><%=level_1(1,gi)%></b></td>
                    </tr>
                    <tr>
                      <td height="1"></td>
                      <td bgcolor="#bdbdbd"></td>
                    </tr>
                  </table></td>
              </tr>
<%
		sql="select ID,Name from Category where ParentID="&level_1(0,gi)
		categoryRs.open sql,conn_access,1,1
		If not (categoryRs.bof and categoryRs.eof) Then
			level_2=categoryRs.GetRows()
			categoryRs.Close
			For gj=0 to ubound(level_2,2)
%>			  
              <tr>
                <td width="10">&nbsp;</td>
                <td><table cellspacing=0 cellpadding=0 width=172 background="images/bg_leftmenu03.gif" border=0>
                    <tr>
                      <td width=6 height=22></td>
                      <td style="padding-left: 20px" width="166"><a href="<%=categoryPageURL&"?categoryID="&level_2(0,gj)&extra_para%>"><%=level_2(1,gj)%></a></td>
                    </tr>
                    <tr>
                      <td height="1"></td>
                      <td bgcolor="#bdbdbd"></td>
                    </tr>
                  </table></td>
              </tr>
<%
			Next
		Else
			categoryRs.Close
		End if
%>

<%
	Next
Else
	categoryRs.Close
End if

set categoryRs=nothing

%>			  
              <tr bgcolor="#bdbdbd">
                <td height="1" colspan="2"></td>
              </tr>
              <tr bgcolor="#efefef">
                <td height="8" colspan="2"></td>
              </tr>
            </table>
