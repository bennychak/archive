<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2004年12月26日10:51:59　　　　　　　　　　┃
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
<!--#include file="includes/md5.asp"--> 

<%call isLogin%>
<%

'If license<>LicenseSN() Then
'	response.Write "序列号错误！"
'	response.end
'End if


dim layer,abce,tree,sql,sqll,rs,rss,rsArray,rows,rowNum,ID
dim ParentID,Name,Description,Image
dim returnPage

ID=request.QueryString ("ID")
returnPage=Request.ServerVariables("URL")
ParentID=0

set rs=server.CreateObject("adodb.recordset")
set rss=server.CreateObject("adodb.recordset")

If NOT isNE(ID) Then
	returnPage=returnPage&"?id="&ID
	sql="select * from Category where id="&ID
	set rs=conn_access.Execute (sql)
	If not (rs.bof and rs.eof) Then
		ParentID=rs("ParentID")
		Name=rs("Name")
		Description=rs("Description")
		Image=rs("Image")
	End if
	rs.close
End if

layer=1
sql="select ID,Name from Category where ParentID=0 order by ID "
rs.open sql,conn_access,1,1
rowNum=rs.RecordCount
If rowNum>0 Then
	rsArray=rs.GetRows()
	For rows=0 to ubound(rsArray,2)
		abce=""
		sqll="select ID,Name from Category where ID="&rsArray(0,rows)&" order by ID "
		rss.open sqll,conn_access,1,1
		tree=tree&ShowTreeMenu(rss.GetRows(),layer,abce)
		rss.close
	Next
End if

rs.close
set rs=nothing
set rss=nothing

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
<script language="javascript">
function selectLevel(item){
	switch(item.value){
		case "1":
			prTable.style.display="none";
			form1.basic_ParentID.disabled="disabled";
			form1.basic_ParentID.title=""
		break;
		case "2":
			prTable.style.display="";
			form1.basic_ParentID.disabled="";
			form1.basic_ParentID.title="请选择所属分类!~!"
		break;
	}
}

function checkHasImage(item){
	if(item.checked){
		image_view_tr.style.display="";
		form1.basic_image.style.display="";
		image_div.style.display="none";
	}else{
		image_view_tr.style.display="none";
		form1.basic_image.style.display="none";
		image_div.style.display="";
	}
}

function showImage(item,desc){
	item.value = trim(item.value);
	desc.src = item.value;
    var showimg = new Image();
    showimg.src = item.value;
	desc.style.width = showimg.width;
	desc.style.height = showimg.height;
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
    <td width="84%" rowspan="2" valign="top">
	<table width="100%"  border="0" cellspacing="5" cellpadding="5">
      <tr>
        <td>产品分类</td>
      </tr>
      <tr>
        <td align="center">
		<form action="category_save.asp" method="post" enctype="multipart/form-data" name="form1" onsubmit="return checkForm(this)">
<%
If isNE(ID) Then
%>          
		  <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
            <tr align="left">
              <td width="100" align="right" bgcolor="#CCCCCC" >分类类型</td>
              <td>
			  <input type="radio" name="LevelSelected" value="1" checked onClick="selectLevel(this)">根分类
              <input type="radio" name="LevelSelected" value="2" onClick="selectLevel(this)">子分类
              </td>
            </tr>
          </table>
          <br>
          <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse;display:none" id="prTable">
            <tr align="left">
              <td width="18%" align="right" bgcolor="#CCCCCC" >所属上级分类</td>
              <td width="82%">
                <select name="basic_ParentID" id="basic_ParentID">
				<option value="0">请选择</option>
				<%=tree%>
                </select>
			  </td>
            </tr>
          </table>
          <br>
<%
End if
%>
		  <table width="100%" border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse" >
            <tr align="left">
              <td align="right" >分类名</td>
              <td>

				    <input name="basic_Name" type="text" id="basic_Name" size="30" maxlength="30" value="<%=Name%>">
			  </td>
            </tr>
            <tr align="left">
              <td align="right" >分类说明</td>
              <td>
			  <input name="basic_Description" type="text" id="basic_Description" size="50%" value="<%=Description%>">
			  </td>
            </tr>
            <tr align="left" style="display:none">
              <td align="right" >
			  <input name="has_image" type="checkbox" id="has_image" value="True" onClick="checkHasImage(this)">
                分类图片
			  </td>
              <td>
			  	<div id="image_div">
			    <%
				If not isNE(Image) Then
				%>
				<img src="<%="../"&categoryImagePath&Image%>" id="image_view">
				<input name="oldImageFileName" type="hidden" id="table" value="<%=Image%>">
				<br>
				[<a href="operation.asp?action=delCategoryImage&ID=<%=ID%>&filename=<%=Image%>">删除</a>]				
				<%
				End If
				%>
				</div>
                <input name="basic_image" type="file" id="basic_image" size="50" style="display:none" onChange="setTimeout('showImage(form1.basic_image,document.all.upimage_view)',500)">
				</td></tr>
            <tr align="left" id="image_view_tr" style="display:none">
              <td align="right" >分类图片预览</td>
              <td><img src="img/noimage.png" id="upimage_view"></td>
            </tr>            
          </table>
		  <br>
          <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
            <tr align="left">
              <td align="center" >
			  <input name="Submit" type="submit" class="button" value="保存">
                <input name="ID" type="hidden" id="ID" value="<%=ID%>">
                <input name="table" type="hidden" id="table" value="Category">
                <input name="returnPage" type="hidden" id="returnPage" value="<%=returnPage%>">
                <input name="return" type="button" class="button" id="return" onClick="location='category_tree.asp'" value="返回">
			  </td>
			</tr>
          </table>
        </form></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="bottom"><img src="img/left_end.gif" width="157" height="160" border="0"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
