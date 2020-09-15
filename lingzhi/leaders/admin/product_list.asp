<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2004年12月25日22:58:03　　　　　　　　　　┃
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
<!--#include file="includes/pager.asp"--> 

<%call isLogin%>
<%

dim rs,rss,rsSub,sql,classPager,page,rowCount
dim layer,CategoryID,tree,abce,rsArray,rowNum,rows
dim recommendStr,newStr

page=Request.QueryString("page")

set rs=server.CreateObject("adodb.recordset")
set rsSub=server.CreateObject("adodb.recordset")
set rss=server.CreateObject("adodb.recordset")

'获取分类列表
layer=1
sql="select ID,[Name] from Category where ParentID=0 order by ID "
rs.open sql,conn_access,1,1
rowNum=rs.RecordCount
If rowNum>0 Then
	rsArray=rs.GetRows()
	For rows=0 to ubound(rsArray,2)
		abce=""
		sql="select ID,[Name] from Category where ID="&rsArray(0,rows)&" order by ID "
		rss.open sql,conn_access,1,1
		tree=tree & ShowTreeMenu(rss.GetRows(),layer,abce)
		rss.close
	Next
End if
rs.close

sql="select Products.ID,Price,Products.Name,Products.indate,Products.Recommend,Products.[NO],Category.Name as CategoryName,IsNew,Views "
sql=sql&"from Products,Category where Products.CategoryID=Category.ID and ProductParentID=0"

dim recommendKey,searchKey,categoryKey,newKey
If NOT request.form Then
	
	recommendKey=request("recommendKey")
	searchKey=request("searchKey")
	categoryKey=request("categoryKey")
	newKey=request("newKey")

	If NOT isNE(recommendKey) and recommendKey<>0 Then
		Select Case (recommendKey) 
			Case "isRecommend"
				sql=sql&"and Products.Recommend=1 "
			Case "notRecommend"
				sql=sql&"and Products.Recommend=0 "
			Case Else
		End Select
	End if
	
	If NOT isNE(newKey) and newKey<>0 Then
		Select Case (newKey) 
			Case "isNew"
				sql=sql&"and Products.IsNew=1 "
			Case "notNew"
				sql=sql&"and Products.IsNew=0 "
			Case Else
		End Select
	End if	
	
	If NOT isNE(categoryKey) and categoryKey<>0 Then
		sql=sql&"and Products.CategoryID="&categoryKey&" "
		tree=replace(tree,"value="&categoryKey,"selected value="&categoryKey)
	End if	
	
	If NOT isNE(searchKey) Then
		sql=sql&"and ( Products.Name like '%"&searchKey&"%' or Products.Name like '%"&searchKey&"%' "
		sql=sql&"or Products.[NO] like '%"&searchKey&"%' "
		sql=sql&"or Products.Description like '%"&searchKey&"%' or Products.Description like '%"&searchKey&"%') "
	End if
	
End if

sql=sql&" order by [NO] desc"

set classPager=new SplitPager
classPager.setConn=conn_access
classPager.setSolitudeSQL=sql
classPager.setPerPageCount=managePageSize
set rs=classPager.getRecordset

recommendStr=drawSelect(array("","-=推荐=-","推荐√","推荐×"),array("",0,"isRecommend","notRecommend"),"option","recommendKey",recommendKey,"onChange=submit()")
newStr=drawSelect(array("","-=最新=-","最新√","最新×"),array("",0,"isNew","notNew"),"option","newKey",newKey,"onChange=submit()")

dim urlPara
urlPara=getURLPara(true)
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="robots" none="noindex,nofollow">
<link href="css/style.css" rel="stylesheet" type="text/css">
<title>记录列表</title>
<script type="text/javascript" src="../js/prototype.js"></script>
<!--
<script type="text/javascript" src="js/mouse_on_title.js"></script>
 -->
 <script language="javascript">
var debug = true;
var operation_url = "operation.asp";

// 删除评论请求
function set_price(id, price)
{

	var para = "action=setProductPrice&ID="+id+"&newPrice="+price;
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
            <td width="100" align="right" bgcolor="#CCCCCC" >产品管理</td>
            <td align="right" ><form action="" method="get" name="formSearch" id="formSearch">
              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                  <td align="right"><img src="img/Search_03.gif" border="0">
                      <input name="searchKey" type="text" size="15">
                      <input name="Submit" type="submit" class="button" value="搜索">
					  <%=recommendStr%>&nbsp;<%=newStr%>
                      <select name="categoryKey" id="categoryKey" onChange="submit()">
                        <option value="0" selected>-=分类=-</option>
                        <%=tree%>
                      </select></td>
                  <td align="right"><input name="add_product" type="button" class="button" id="add_product" onClick="location='product_edit.asp'" value="发布产品"></td>
                </tr>
              </table>
            </form>
            </td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td>
		<table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
          <tr align="center" bgcolor="#003366">
            <td width="30" class="bai">ID</td>
            <td  class="bai">产品名</td>
            <td class="bai">编号</td>
            <td class="bai">分类</td>
            <td class="bai">最新</td>
            <td class="bai">推荐</td>
            <td bgcolor="#003366" class="bai">价钱</td>
            <td bgcolor="#003366" class="bai">查看</td>
            <td bgcolor="#003366" class="bai">日期</td>
            <td width="150" bgcolor="#003366" class="bai">操作</td>
          </tr>
		  <%
		  rowCount=managePageSize
		  while not rs.eof and rowCount > 0
		  rowCount=rowCount-1
		  %>
          <tr style="cursor:pointer" id="<%=rs("ID")%>" onmouseover="setPointer(this, 'over');" onmouseout="setPointer(this, 'out');" onmousedown="setPointer(this, 'click')">
            <td align="center"><%=rs("ID")%></td>
            <td title="<%=rs("Name")%>"><%=substr(rs("Name"),30)%></td>
            <td align="center"><%=rs("NO")%></td>
            <td align="center"><%=rs("CategoryName")%></td>
            <td align="center"><%
			If cstr(rs("IsNew"))="1" Then
				response.Write "<a href=operation.asp?action=setNewProduct&id="&rs("ID")&"&isNew=0&urlPara="&urlPara&">√</a>"
			Else
				response.Write "<a href=operation.asp?action=setNewProduct&id="&rs("ID")&"&isNew=1&urlPara="&urlPara&">×</a>"
			End if
			%></td>
            <td align="center">
			<%
			If cstr(rs("Recommend"))="1" Then
				response.Write "<a href=operation.asp?action=setRecommendProduct&id="&rs("ID")&"&recommend=0&urlPara="&urlPara&">√</a>"
			Else
				response.Write "<a href=operation.asp?action=setRecommendProduct&id="&rs("ID")&"&recommend=1&urlPara="&urlPara&">×</a>"
			End if
			%>			</td>
            <td align="center" id="price_tr_<%=rs("ID")%>" onMouseOver="price_input(<%=rs("ID")%>,'over')" onMouseOut="price_input(<%=rs("ID")%>,'out')" onMouseDown="price_input(<%=rs("ID")%>,'cdown')">
			<p style="margin:0; padding:0" id="price_<%=rs("ID")%>"><%=rs("Price")%></p>
			<input name="newPrice" id="price_input_<%=rs("ID")%>" style="display:none" type="text" size="5" >
			</td>
            <td align="center"><%=rs("views")%></td>
            <td align="center">
			<%
			
			dateString = DatePart("yyyy",rs("indate")) & "-"
			dateString = dateString & DatePart("m",rs("indate")) & "-"
			dateString = dateString & DatePart("d",rs("indate"))
			response.write dateString
			%></td>
            <td align="center">
			
			[<a href="product_edit.asp?id=<%=rs("ID")%>&type=link&urlPara=<%=urlPara%>">添加</a>]
			[<a href="operation.asp?action=copyProduct&id=<%=rs("ID")%>&urlPara=<%=urlPara%>">复制</a>]  
			[<a href="product_edit.asp?action=edit&id=<%=rs("ID")%>&urlPara=<%=urlPara%>">编辑</a>] 
			[<a href="operation.asp?action=delproducts&id=<%=rs("ID")%>">删除</a>]</td>
          </tr>
		  <%
		  		sql="select Products.Price,Products.ID,Products.Name,Products.indate,Products.Recommend,Products.[NO],Category.Name as CategoryName,IsNew,Views "
				sql=sql&"from Products,Category where Products.CategoryID=Category.ID and ProductParentID="&rs("ID")
		  		set rsSub=conn_access.Execute (sql)
				If not (rsSub.bof and rsSub.eof) Then		  
		  %>
          <tr>
            <td colspan="10" align="center" bgcolor="#F0F0F0" style="padding-left:20px"><table width="100%"  border="1" cellpadding="3" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
              <tr align="center" bgcolor="#003366">
                <td bgcolor="#005EBB"  class="bai">产品名</td>
                <td bgcolor="#005EBB" class="bai">编号</td>
                <td bgcolor="#005EBB" class="bai">分类</td>
                <td bgcolor="#005EBB" class="bai">最新</td>
                <td bgcolor="#005EBB" class="bai">推荐</td>
                <td bgcolor="#005EBB" class="bai">价钱</td>
                <td bgcolor="#005EBB" class="bai">查看</td>
                <td bgcolor="#005EBB" class="bai">日期</td>
                <td width="90" bgcolor="#005EBB" class="bai">操作</td>
              </tr>
              <%
				while not rsSub.eof
		  	  %>
              <tr id="<%=rsSub("ID")%>" style="cursor:pointer" onmouseover="setPointer(this, 'over');" onmouseout="setPointer(this, 'out');" onmousedown="setPointer(this, 'click')" >
                <td title="<%=rsSub("Name")%>"><%=substr(rsSub("Name"),30)%></td>
                <td align="center"><%=rsSub("NO")%></td>
                <td align="center"><%=rsSub("CategoryName")%></td>
                <td align="center"><%
			If cstr(rsSub("IsNew"))="1" Then
				response.Write "<a href=operation.asp?action=setNewProduct&id="&rsSub("ID")&"&isNew=0&urlPara="&urlPara&">√</a>"
			Else
				response.Write "<a href=operation.asp?action=setNewProduct&id="&rsSub("ID")&"&isNew=1&urlPara="&urlPara&">×</a>"
			End if
			%></td>
                <td align="center"><%
			If cstr(rsSub("Recommend"))="1" Then
				response.Write "<a href=operation.asp?action=setRecommendProduct&id="&rsSub("ID")&"&recommend=0&urlPara="&urlPara&">√</a>"
			Else
				response.Write "<a href=operation.asp?action=setRecommendProduct&id="&rsSub("ID")&"&recommend=1&urlPara="&urlPara&">×</a>"
			End if
			%>                </td>
            	<td align="center" id="price_tr_<%=rsSub("ID")%>" onMouseOver="price_input(<%=rsSub("ID")%>,'over')" onMouseOut="price_input(<%=rsSub("ID")%>,'out')" onMouseDown="price_input(<%=rsSub("ID")%>,'cdown')">
				<p style="margin:0; padding:0" id="price_<%=rsSub("ID")%>"><%=rsSub("Price")%></p>
				<input name="newPrice" id="price_input_<%=rsSub("ID")%>" style="display:none" type="text" size="5" >
				</td>
                <td align="center"><%=rsSub("views")%></td>

			    <td align="center"><%=rsSub("indate")%></td>
                <td align="center">
				[<a href="product_edit.asp?action=edit&id=<%=rsSub("ID")%>&urlPara=<%=urlPara%>&type=linkEdit">编辑</a>]
				<!-- [<a href="operation.asp?action=copyProduct&id=<%=rsSub("ID")%>&urlPara=<%=urlPara%>">复制</a>]  -->
				[<a href="operation.asp?action=delproducts&id=<%=rsSub("ID")%>&type=linkDelete">删除</a>]
				</td>
              </tr>
              
              <%
		  rsSub.movenext
		  wend
		  %>
            </table></td>
            </tr>
		  <%
		  End if
		  rsSub.close
		  rs.movenext
		  wend
		  %>
          <tr align="center">
            <td colspan="10"> <%=classPager.getBar%></td>
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
set rss=nothing
set conn_access=nothing
%>