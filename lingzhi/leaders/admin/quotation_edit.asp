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
now_str = FormatDateTime(now,0)
dateString = Replace(now_str,"-","")
dateString = Replace(dateString," ","")
dateString = Replace(dateString,":","")
dateString = Replace(dateString,"上午","")
dateString = Replace(dateString,"下午","")


vDate = year(now_str) & "-" & month(now_str) & "-" & day(now_str)

ID=request.querystring("id")
orderID=request.querystring("orderID")
If not isNE(ID) Then
	sql="select * from Quotation where ID="&ID
	set rs=conn_access.Execute (sql)
	name = rs("QName")
	validDate = rs("ValidDate")
	message = rs("Message")
	guest=rs("Guest")
else
	name = dateString
	'validDate = vDate
End If

If not isNE(orderID) Then
	name = "ORDER-"&orderID
End IF


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
        <td>报价单资料</td>
      </tr>
      <tr>
        <td align="center"><form name="form1" action="quotation_save.asp" method="post" onsubmit="return checkForm(this)">
          <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
            <tr>
              <td width="110" align="center" bgcolor="#003366" class="bai">报价单名称</td>
              <td align="left"><input name="basic_QName" type="text" id="basic_QName" size="60" title="请输入报价单名称!~!" value="<%=name%>"></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">有效期</td>
              <td align="left"><input name="basic_ValidDate" type="text" id="basic_ValidDate" style="width: 208px" Title="请输入有效期!~date!" value="<%=validDate%>"  maxlength="30">
                格式:年-月-日 例如:2006-01-02 </td>
            </tr>
            <tr style="display:none">
              <td align="center" bgcolor="#003366" class="bai">产品</td>
              <td align="left"><input name="ProductsString" value="<%=Products%>" type="text" id="ProductsString" style="width: 208px"  maxlength="100">
                <br>
                可以用半角逗号分隔多个ID,如果是所有产品的话就直接填写ALL,如果是分类的话就用中括号把分类ID括起来,例如:[18]</td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">说明</td>
              <td align="left"><textarea name="basic_Message" cols="50" rows="7"><%=message%></textarea></td>
            </tr>          
			<tr>
              <td align="center" bgcolor="#003366" class="bai">匿名访问</td>
              <td align="left">
			  	<input name="Guest" type="checkbox" id="Guest" value="1" <%If Guest="1" Then  response.Write "checked"%>>              </td>
            </tr>
		  <%
		  If not isNE(orderID) and false Then
		  %>  			
            <tr>
              <td colspan="2" align="center" bgcolor="#003366" class="bai">邮件通知</td>
              </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">是否发送邮件</td>
              <td align="left"><input name="sendMail" type="checkbox" id="sendMail" value="1" checked <%If Guest="1" Then  response.Write "checked"%>>
                如果不发送邮件下面填写的内容均无效</td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">收件人</td>
              <td align="left"><label>
                <input name="toMail" type="text" id="toMail" size="30">
              </label></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">标题</td>
              <td align="left"><input name="mailSubject" type="text" id="mailSubject" size="60"></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">内容</td>
              <td align="left"><label>
                <textarea name="mailBody" cols="70" rows="10" id="mailBody"></textarea>
              </label></td>
            </tr>
			<%end if%>
          </table>
              <input name="Submit" type="submit" class="button" value="保存">
              <input name="SubmitNext" type="submit" class="button" value="下一步" onClick="this.form.action='quotation_save.asp?next=1'"> 
          <input name="return" type="button" class="button" id="return" onClick="location='quotation_list.asp'" value="返回">
		  <input type="hidden" name="table" value="Quotation">
		  <input type="hidden" name="returnPage" value="<%=Request.ServerVariables("URL")%>?id=<%=ID%>">
		  <input type="hidden" name="id" value="<%=ID%>">
		  <%
		  hash = md5(dateString)
		  If isNE(ID) Then
		  %>
          
		  <input name="basic_Hash" type="hidden" id="basic_Hash" value="<%=hash%>">
		  <%End If%>
		  <%
		  If not isNE(orderID) Then
		  %>
          <input name="userID" type="hidden" id="userID" value="<%=request.querystring("userID")%>">
		  <input name="basic_OrderID" type="hidden" id="basic_OrderID" value="<%=orderID%>">
		  <%End If%>		  
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
