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
<%
'检查是否登陆
call isLogin
%>
<%
dim content,rs,sql,page,title
page=request.querystring("page")

set rs=server.createobject("ADODB.Recordset")
with rs
	If not isempty(request.form()) Then
		title=request("title")
		content=request("content")
		If content="" Then
			set rs=nothing
			response.end
		End if

		sql="select * from page where page='"&page&"'"
		If page="" Then 
			set rs=nothing
			response.end
		end if
		.open sql,conn_access,1,3
		.fields("content")=content
		.update()
		.close
		set rs=nothing
		call msgBox("操作成功!","GoUrl","content.asp?page="&page)
		response.end
	End if

	If page="" Then 
		set rs=nothing
		response.end
	end if

	sql="select * from page where page='"&page&"'"
	.open sql,conn_access,1,1
	If not(.bof and .eof) Then
		content=.fields("content")
		title=.fields("title")
	else
		.close
		set rs=nothing
		response.end
	end if
	.close
	set rs=nothing
end with

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="robots" none="noindex,nofollow">
<title><%=manageCenterTitle%></title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/check_form.js"></script>
<script type="text/javascript">
   _editor_url = "./HTMLArea";
   _editor_lang = "en";
</script>
<script type="text/javascript" src="HTMLArea/htmlarea.js"></script>
<script type="text/javascript" defer="1">
	HTMLArea.replace('content')
</script>

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
        <td><%=title%></td>
      </tr>
      <tr>
        <td align="center"><form name="form1" method="post" action="" ONSUBMIT="return checkForm(this)">
          <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
            
            <tr align="left">
              <td ><textarea name="content" cols="100%" rows="40" id="content" title="请输入内容!~3000:!"><%=content%></textarea></td>
              </tr>
            
          </table>
          （注意输入所有内容完全支持HTML）<br>
          <input type="submit" name="Submit" value="保存"> 
          <input name="Return" type="button" id="Return" value="返回" onClick="location='news_list.asp'">
        </form></td>
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
