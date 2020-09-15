<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│#　　　　　　　　    　　　　　　　　 　　┃
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
'┃广州六运二街53号                　2006年9月14日0:13:52  ┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="includes/config.asp"--> 
<!--#include file="includes/md5.asp"--> 
<%call isLogin%>

<%
'日期串
ID=request.querystring("id")
If not isNE(ID) Then
	sql="select * from QuotationProducts where ID="&ID
	set rs=conn_access.Execute (sql)
	price = rs("NewPrice")
	desc = rs("QDescription")
	qid = rs("QuotationID")
	set rs = nothing
End If




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
        <td>报价单产品资料</td>
      </tr>
      <tr>
        <td align="center"><form name="form1" action="saveform.asp" method="post" onsubmit="return checkForm(this)">
          <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
            <tr>
              <td width="110" align="center" bgcolor="#003366" class="bai">价格</td>
              <td align="left"><input name="basic_NewPrice" type="text" id="basic_NewPrice" size="60" title="请输入价钱!~!" value="<%=price%>"></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">说明</td>
              <td align="left"><textarea name="basic_QDescription" cols="50" rows="7" id="basic_QDescription"><%=desc%></textarea></td>
            </tr>
          </table>
              <br>
              <input name="Submit" type="submit" class="button" value="保存">
              <input name="return" type="button" class="button" id="return" onClick="location='quotation_products_list.asp?QuotationID=<%=qid%>'" value="返回">
		  <input type="hidden" name="table" value="QuotationProducts">
		  <input type="hidden" name="returnPage" value="quotation_products_list.asp?QuotationID=<%=qid%>">
		  <input type="hidden" name="id" value="<%=ID%>">

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
