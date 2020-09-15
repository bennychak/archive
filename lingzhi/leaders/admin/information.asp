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
'┃广州天河区中山大道棠雅苑　　　　　200５年1月８日10:24:11┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="includes/config.asp"--> 
<%call isLogin%>
<%
dim rs,sql
sql="select * from [Config] where ID=1"
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
        <td><table width="100%" height="30"  border="1" cellpadding="3" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
          <tr align="left">
            <td width="100" align="right" bgcolor="#CCCCCC" >网站设置</td>
            <td align="right" >&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="center"><form name="form1" action="saveform.asp" method="post" ONSUBMIT="return checkForm(this)">
          <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
            <tr>
              <td align="center" bgcolor="#003366"><span class="bai">网站标题</span></td>
              <td align="left"><input name="basic_Title" type="text" id="basic_Title" size="50" value="<%=rs("Title")%>"></td>
            </tr>
            <tr>
              <td width="150" align="center" bgcolor="#003366"><span class="bai">地址</span></td>
              <td align="left"><input name="basic_Address" type="text" id="basic_Address" size="60" value="<%=rs("Address")%>"></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">联系电话</td>
              <td align="left"><input name="basic_Tel" type="text" id="basic_Tel" value="<%=rs("Tel")%>"></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">传真</td>
              <td align="left"><input name="basic_Fax" type="text" id="basic_Fax" value="<%=rs("Fax")%>"></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366"><span class="bai">电子邮件</span></td>
              <td align="left"><input name="basic_Email" type="text" id="basic_Email" value="<%=rs("Email")%>"></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366"><span class="bai">联系人</span></td>
              <td align="left"><input name="basic_ConnectMan" type="text" id="basic_ConnectMan" value="<%=rs("ConnectMan")%>"></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366"><span class="bai">最新产品</span></td>
              <td align="left"><input name="basic_NewProducts" type="text" id="basic_NewProducts" value="<%=rs("NewProducts")%>" size="110"></td>
            </tr>
            <tr>
              <td colspan="2" align="center" bgcolor="#003366"><span class="bai">公司简介</span></td>
              </tr>
            <tr>
              <td colspan="2" align="center"><textarea name="basic_Introduce" cols="100%" rows="8" id="basic_Introduce"><%=rs("Introduce")%></textarea></td>
              </tr>
          </table>
          <br>
          <input name="Submit" type="submit" class="button" value="保存"> 
		  <input type="hidden" name="table" value="Config">
		  <input type="hidden" name="returnPage" value="<%=Request.ServerVariables("URL")%>">
		  <input type="hidden" name="id" value="1">
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
<%
set rs=nothing
%>