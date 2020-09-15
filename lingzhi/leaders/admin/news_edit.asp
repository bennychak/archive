<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年3月26日20:46:48 　　　　　　　　　　┃
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
dim title,content,rs,sql,action,id,category,image
dim returnUrl

action=request.querystring("action")
id=request.querystring("id")

'returnUrl=Request.ServerVariables("URL")
returnUrl="news_list.asp"

set rs=server.createobject("ADODB.Recordset")
with rs

	If action="edit" Then
		
		id=request.querystring("id")
		If id="" or (not IsNumeric(id)) Then 
			set rs=nothing
			response.end
		end if

		sql="select * from news where id="&id
		.open sql,conn_access,1,1
		title=.fields("newstitle")
		content=.fields("content")
		category=.fields("category")
		image=.fields("image")
		if NOT isNE(category) then category=cstr(category)
		
		.close
		set rs=nothing
	End if
end with

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
        <td>发布新闻</td>
      </tr>
      <tr>
        <td align="center"><form action="news_save.asp" method="post" enctype="multipart/form-data" name="form1" onsubmit="return checkForm(this)">
          <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
            <tr>
              <td width="8%" align="center">标题</td>
              <td align="left">
			  <input name="basic_newstitle" type="text" id="basic_newstitle" size="50" value="<%=title%>" title="请输入标题!~200:!"></td>
            </tr>
            <tr>
              <td align="center">分类</td>
              <td align="left"><%=drawSelect(array("","-=请选择分类=-","消息公告","一般新闻"),array("","-1","1","2"),"option","basic_category",category,"title=""请选择分类!~!""")%></td>
            </tr>
            <tr>
              <td align="right" >
			  <input name="has_image" type="checkbox" id="has_image" value="True" onClick="checkHasImage(this)">
			  图片
			  </td>
              <td align="left">
			  	<div id="image_div">
			    <%
				If not isNE(Image) Then
				
				%>
				
				<img src="<%="../"&newsImagePath&Image%>" id="image_view">
				<input name="oldImageFileName" type="hidden" id="table" value="<%=Image%>">
				<br>
				[<a href="operation.asp?action=delNewsImage&ID=<%=ID%>&filename=<%=Image%>">删除</a>]				
				<%
				End If
				%>
				</div>
                <input name="basic_image" type="file" id="basic_image" size="50" style="display:none" onChange="setTimeout('showImage(form1.basic_image,document.all.upimage_view)',500)">
				</td>
				
            </tr>
			
            <tr align="left" id="image_view_tr" style="display:none">
              <td align="right" >图片预览</td>
              <td><img src="img/noimage.png" id="upimage_view"></td>
            </tr>            

            <tr align="left">
              <td colspan="2" class="bai"><textarea name="basic_content" cols="100%" rows="20" id="basic_content" title="请输入内容!~3000:!"><%=content%></textarea></td>
              </tr>
          </table>
          （注意输入所有内容完全支持HTML）<br>
          <input name="Submit" type="submit" class="button" value="保存"> 
          <input name="return" type="button" class="button" id="return" onClick="location='news_list.asp'" value="返回">
		  <input type="hidden" name="table" value="news">
		  <input type="hidden" name="returnPage" value="<%=returnUrl%>">
		  <input type="hidden" name="id" value="<%=id%>">
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
