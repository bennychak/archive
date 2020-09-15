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
<!--#include file="includes/pager.asp"--> 
<%call isLogin%>
<%

dim rs,sql,classPager,page,rowCount
page=Request.QueryString("page")

sql="select * from quotation "

If NOT request.form Then
	dim searchKey
	searchKey=request("searchKey")

	If NOT isNE(searchKey) Then
		sql=sql&"and ( Members.Department like '%"&searchKey&"%' "
		sql=sql&"or Orders.Code like '%"&searchKey&"%' "
		sql=sql&"or Orders.Count like '%"&searchKey&"%' "
		sql=sql&"or Orders.InDate like '%"&searchKey&"%') "
	End if
	
End if


sql=sql&"order by ID desc"

set rs=server.createobject("ADODB.Recordset")

set classPager=new SplitPager
classPager.setConn=conn_access
classPager.setSolitudeSQL=sql
classPager.setPerPageCount=managePageSize
set rs=classPager.getRecordset

dim urlPara
urlPara=getURLPara(true)


%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="robots" none="noindex,nofollow">
<title><%=manageCenterTitle%></title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<title>记录列表</title>
<!--
<script type="text/javascript" src="js/mouse_on_title.js"></script>
 -->
<script language="JavaScript">
var default_color="#FFFFFF";
var pointer_color="#D7D7D7";
var mark_color="#FFCC99";

var marked_row = new Array;
var marked_color = new Array;
var over_color = new Array;

/*
if (document.all && window.print) {
	document.oncontextmenu = showmarked;
}
*/

function showmarked(){
	show_object(marked_row)
}

function show_object(dobject){
	var str="";
	for (var element in dobject)
		str=str+element+"="+dobject[element]+"|";
	alert(str);
}

//填充tr背景色
function setTrcolor(theCells,newColor){
	for (c=0; c < theCells.length; c++) {
		theCells[c].bgColor=newColor;
	}
}

function setPointer(theRow,theAction){
	var theRowNum =theRow.id
	var theCells = null;
	theDefaultColor=default_color
	thePointerColor=pointer_color
	theMarkColor=mark_color
	//取得所有td对像
	theCells = theRow.cells
	
	//当前背景颜色
	currentColor=theCells[0].bgColor
	switch(theAction){
	case "click":
		if((currentColor.toLowerCase()==thePointerColor.toLowerCase())&&!marked_row[theRowNum]){
			setTrcolor(theCells,thePointerColor);
			marked_row[theRowNum]=true
		}
		else{
			if(!marked_row[theRowNum]){
				setTrcolor(theCells,thePointerColor);
				marked_row[theRowNum]=true
			}else{
				setTrcolor(theCells,marked_color[theRowNum]);
				marked_row[theRowNum]=false
			}
		}
		break;

	case "over":
		if(!marked_row[theRowNum]){
			marked_color[theRowNum]=theCells[0].bgColor
			setTrcolor(theCells,thePointerColor);
		}
		break;

	case "out":
		if(!marked_row[theRowNum])
			setTrcolor(theCells,marked_color[theRowNum]);
		break;
	}
}

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
        <td><table width="100%"  border="1" cellpadding="3" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
          <tr align="left">
            <td width="100" align="right" bgcolor="#CCCCCC" >报价单管理</td>
            <td align="right" ><form action="" method="get" name="formSearch" id="formSearch">
              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                  <td align="right"><img src="img/Search_03.gif" border="0">
                    <input name="searchKey" type="text" id="searchKey" size="15">
                    <input name="Submit" type="submit" class="button" value="搜索">
                    </td>
				  <td width="100" align="right"><input name="add_product" type="button" class="button" id="add_product" onClick="location='quotation_edit.asp'" value="新增报价单"></td>					
                </tr>
              </table>
            </form></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td>
		<table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
          <tr align="center" bgcolor="#003366">
            <td width="30" class="bai">ID</td>
            <td  class="bai">名称</td>
            <td width="60" class="bai">产品数</td>
            <td width="60" class="bai">查看</td>
            <td class="bai">有效日期</td>
            <td class="bai">建立日期</td>
            <td bgcolor="#003366" class="bai">状态</td>
            <td bgcolor="#003366" class="bai">操作</td>
          </tr>
		  <%
		  rowCount=managePageSize
		  while not rs.eof and rowCount > 0
		  rowCount=rowCount-1
		  %>
          <tr style="cursor:pointer" id="<%=rs("id")%>" onmouseover="setPointer(this, 'over');" onmouseout="setPointer(this, 'out');" onmousedown="setPointer(this, 'click')">
            <td align="center"><%=rs("ID")%></td>
            <td align="center">
			
			<%If rs("QType")<>"all" Then%>
			<a href="quotation_products_list.asp?QuotationID=<%=rs("ID")%>"><%=rs("QName")%></a>
			<%Else%>
			<%=rs("QName")%>
			<%End if%>
			</td>
            <td align="center">
			<%
			If rs("QType")<>"all" Then
				response.write rs("Products")
			Else
				response.write "-"
			End if
			
			%>
			
			</td>
            <td align="center"><%=rs("Views")%></td>
            <td align="center"><%=rs("ValidDate")%></td>
            <td align="center">
			<%
			
			dateString = DatePart("yyyy",rs("indate")) & "-"
			dateString = dateString & DatePart("m",rs("indate")) & "-"
			dateString = dateString & DatePart("d",rs("indate"))
			response.write dateString
			%>			
			</td>
            <td align="center">
			
			<%
			If cstr(rs("Status"))="1" Then
				response.Write "<a href=operation.asp?status=0&action=setQuotationStatus&id="&rs("ID")&"&s=0&urlPara="&urlPara&">√</a>"
			Else
				response.Write "<a href=operation.asp?status=1&action=setQuotationStatus&id="&rs("ID")&"&s=0&urlPara="&urlPara&">×</a>"
			End if
			%>			
			
			
			</td>
            <td align="center">
			[<a href="mail_new.asp?hash=<%=rs("Hash")%>&quotationID=<%=rs("ID")%>&returnPage=quotation_list.asp">邮件</a>]
			[<a href="../html/quotation.asp?amay=king&hash=<%=rs("Hash")%>" target="_blank">查看</a>]
			<!--[<a href="mail_new.asp?userID=<%=rs("ID")%>&returnPage=<%=thisPage%>">回复</a>]-->
			<%If (rs("Guest")&"")<>"1" Then%>
			[<a href="quotation_level.asp?id=<%=rs("ID")%>">权限</a>]
			<%End if%>
			[<a href="quotation_edit.asp?id=<%=rs("ID")%>">编辑</a>]
			<%If rs("QType")<>"all" Then%>
			[<a href="operation.asp?action=delQuotation&id=<%=rs("ID")%>">删除</a>]
			<%End if%>
			</td>
          </tr>
		  <%
		  rs.movenext
		  wend
		  %>
          <tr align="center">
            <td colspan="8"> <%=classPager.getBar%></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
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
set classPager=nothing
set rs=nothing
set conn_access=nothing
%>