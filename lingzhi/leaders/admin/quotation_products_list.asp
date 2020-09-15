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
' 获取报价单的基本信息
ID=request.querystring("QuotationID")
If not isNE(ID) Then
	sql="select * from Quotation where ID="&ID
	set rs=conn_access.Execute (sql)
	name=rs("QName")
	hash=rs("Hash")
	set rs=nothing
End If


page=Request.QueryString("page")

sql="select QuotationProducts.NewPrice,QuotationProducts.ID,Products.Name,Products.NO,Products.ID as PID,Products.InDate,Products.CategoryID from QuotationProducts,Products "
sql=sql&"where QuotationProducts.ProductID=Products.ID and QuotationProducts.QuotationID="&ID

sql=sql&" order by QuotationProducts.ID desc"

'response.Write sql
'response.end

set rs=server.createobject("ADODB.Recordset")

set classPager=new SplitPager
classPager.setConn=conn_access
classPager.setSolitudeSQL=sql
classPager.setPerPageCount=managePageSize
set rs=classPager.getRecordset



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
<script type="text/javascript" src="../js/prototype.js"></script>
<script language="javascript">
var debug = true;
var operation_url = "operation.asp";

// 删除评论请求
function set_price(id, price)
{

	var para = "action=setQuotationProductPrice&ID="+id+"&newPrice="+price;
	var events = {
		method:'get',
		parameters: para,
		onFailure: function(){
			// CommentAreaCtrl(false, "确定", "操作失败，请重试!");
		},
		onException: function(request, ex){
			var msg = "操作失败!\n";
			msg+= "错误代码:" + ex.number;
			msg+= "\n错误描述:\n" + ex.description;
		},
		onComplete:	function(o){
			// alert(o.responseText);
			set_display_price(id, price);
			price_input(id, "out");
		},
		onLoading: function(){
			price_input(id, "out");
			$("price_"+id).innerHTML = "Waiting..";
		}
	}
	var ajax = new Ajax.Request(operation_url, events);
}

function test(o)
{
	
}

function set_display_price(id, price)
{
	// alert($("price_"+id).innerHTML);
	$("price_"+id).innerHTML = price;
	$("price_"+id).style.display = "none";
}


function price_input(id, type)
{
	switch(type){
		case "over":
			$("price_input_"+id).style.display = "";
			$("price_"+id).style.display = "none";
			$("price_input_"+id).value = $("price_"+id).innerHTML;
			$("price_input_"+id).select();
			$("price_input_"+id).onkeydown = function(){
				// 检测按键
				var nbr;
				var nbr = (window.event)?event.keyCode:evt.which;
				if(nbr == 27){
					price_input(id, "out");
					$("price_tr_"+id).onmouseover = function(){
						price_input(id, 'over');
					}
					$("price_tr_"+id).onmouseout = function(){
						price_input(id, 'out');
					}
				}
				
				if(nbr == 13){
				//浮点数
					var floatVal=parseFloat($("price_input_"+id).value);
					if(isNaN(floatVal)||floatVal!=$("price_input_"+id).value)
					{
						alert("输入不正确！");
						// $("price_input_"+id).focus();
						return false;
					}				
					set_price(id, floatVal);
				}
			}		
		
		break;
		
		case "out":
			$("price_input_"+id).style.display = "none";
			$("price_"+id).style.display = "";		
		break;
		
		case "cdown":
			$("price_input_"+id).style.display = "";
			$("price_"+id).style.display = "none";
					
			$("price_tr_"+id).onmouseover = "";
			$("price_tr_"+id).onmouseout = "";
		break;

	}
	
}
</script>
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
	return false;
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
		return;
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
        <td><table width="100%"  border="1" cellpadding="3" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
          <tr align="left">
            <td width="60" align="right" bgcolor="#CCCCCC" >报价单</td>
            <td align="right" >
			
			<table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><%=name%></td>
                <td align="right">
				  
				  <input name="return23" type="button" class="button"  value="查看" onClick="window.open('../html/quotation.asp?amay=king&hash=<%=hash%>')">
                  <input name="return23" type="button" class="button" onClick="location='operation.asp?ID=<%=ID%>&action=clearQuotationProducts'" value="清空">
                  <input name="return2" type="button" class="button" onClick="location='quotation_list.asp'" value="返回"></td>
                </tr>
              
            </table>
			</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="right"><table width="100%"  border="0" cellspacing="0" cellpadding="0">

          <tr>
            <td align="right">
			<form action="operation.asp?action=addQuotationProduct&ID=<%=ID%>" method="post" name="form" id="form" onsubmit="return checkForm(this)">
			<input name="productString" type="text" id="productString" size="60" title="请输产品ID或者编号!~!" >
            <input name="Submit2" type="submit" class="button" value="添加产品">
			</form>	
			</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td>
		<table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
          <tr align="center" bgcolor="#003366">
            <td width="50" class="bai">产品ID</td>
            <td  class="bai">产品名</td>
            <td width="80" class="bai">产品编号</td>
            <!--<td width="60" class="bai">所属分类</td>-->
            <td width="90" class="bai">价钱</td>
            <td width="150" class="bai">发布日期</td>
            <td width="140" bgcolor="#003366" class="bai">操作</td>
          </tr>
		  <%
		  rowCount=managePageSize
		  while not rs.eof and rowCount > 0
		  rowCount=rowCount-1
		  %>
          <tr style="cursor:pointer" id="<%=rs("ID")%>" onmouseover="setPointer(this, 'over');" onmouseout="setPointer(this, 'out');" onmousedown="setPointer(this, 'click')">
            <td align="center"><%=rs("PID")%></td>
           <td align="left" title="<%=rs("Name")%>"><%=substr(rs("Name"),30)%></td>
            <td align="left"><%=rs("NO")%></td>
            <!--<td align="center"><%=rs("CategoryID")%></td>-->
            
			<td align="center" id="price_tr_<%=rs("ID")%>" onMouseOver="price_input(<%=rs("ID")%>,'over')" onMouseOut="price_input(<%=rs("ID")%>,'out')" onMouseDown="price_input(<%=rs("ID")%>,'cdown')">
			<p style="margin:0; padding:0" id="price_<%=rs("ID")%>"><%=rs("NewPrice")%></p>
            <input name="newPrice" id="price_input_<%=rs("ID")%>" style="display:none" type="text" size="10" >			</td>
            
			<td align="center"><%=rs("InDate")%></td>
            <td align="center">
			[<a href="quotation_products_edit.asp?ID=<%=rs("ID")%>">编辑</a>][<a href="operation.asp?action=delQuotationProducts&ID=<%=rs("ID")%>">移除</a>]</td>
          </tr>
		  <%
		  rs.movenext
		  wend
		  %>
          <tr align="center">
            <td colspan="7"> <%=classPager.getBar%></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td align="right" class="red2">添加产品可以用半角逗号分隔多个ID,如果是所有产品的话就直接填写ALL,如果是分类的话就用中括号把分类ID括起来,例如:[18]</td>
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