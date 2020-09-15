<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2004年12月25日21:46:48　　　　　　　　　　┃
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
dim layer,abce,tree,sql,rs,rss,rsArray,rows,rowNum,ID,pl,ps
dim CategoryID,NO,Name,Description,Recommend,Simage,Bimage,IsNew
dim Qqmini,Material,QqminiNumber
dim Size,Plating,Stone,Magnetic
dim returnPage
dim categoryExart,dtype
dim urlPara

ID=request.QueryString ("id")
dtype=request.QueryString ("type")
urlPara=request.QueryString ("urlPara")

returnPage=Request.ServerVariables("URL")

set rs=server.CreateObject("adodb.recordset")
set rss=server.CreateObject("adodb.recordset")

If NOT isNE(ID) Then
	returnPage=returnPage&"?id="&ID
	sql="select * from Products where id="&ID
	set rs=conn_access.Execute (sql)
	If not (rs.bof and rs.eof) Then
		CategoryID=rs("CategoryID")
		NO=rs("NO")
		Qqmini=rs("Qqmini")
		Material=rs("Material")		
		Name=rs("Name")
		Size=rs("Size")
		Price=rs("Price")
		Plating=rs("Plating")
		Stone=rs("Stone")
		Magnetic=rs("Magnetic")
		Description=rs("Description")
		QDescription=rs("QDescription")
		Recommend=rs("Recommend")
		QqminiNumber=rs("QqminiNumber")
		IsNew=rs("IsNew")
		pl=instr(rs("ShowWhere"),"PL")
		ps=instr(rs("ShowWhere"),"PS")
		
		If dtype<>"link" Then
			Simage=rs("Simage")
			Bimage=rs("Bimage")
		End if
	End if
	rs.close
End if

If dtype="link" or dtype="linkEdit" Then
	categoryExart=" disabled "
	returnPage=returnPage&"&type=linkEdit"
End if



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
		tree=tree&ShowTreeMenu(rss.GetRows(),layer,abce)
		rss.close
	Next
End if
rs.close
set rs=nothing
set rss=nothing

If NOT isNE(CategoryID) Then
	tree=replace(tree,"value="&CategoryID,"selected value="&CategoryID)
End if

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
function checkHasSImage(item){
	if(item.checked){
		simage_view_tr.style.display="";
		form1.basic_Simage.style.display="";
		simage_div.style.display="none";
	}else{
		simage_view_tr.style.display="none";
		form1.basic_Simage.style.display="none";
		simage_div.style.display="";
	}
}

function checkHasBImage(item){
	if(item.checked){
		bimage_view_tr.style.display="";
		form1.basic_Bimage.style.display="";
		bimage_div.style.display="none";
	}else{
		bimage_view_tr.style.display="none";
		form1.basic_Bimage.style.display="none";
		bimage_div.style.display="";
	}
}


function showImage(item,vimage,limitW,limitH){

	var imgTmp = new Image();
	imgTmp.src = item.value;
	var desc = document.getElementById(vimage);
	

	if (/^.+\.(gif|jpg|png)$/i.test(item.value)) {
	}
	else{
		alert("只可以选择扩展名为：GIF,JPG,PNG的文件！请重新选择");
		return;
	}

	if((limitW!=-1) && (limitH!=-1)){
		if(imgTmp.width!=limitW || imgTmp.height!=limitH){
			alert("警告！图片不符合规格！所选择的图片必须为："+limitW+"X"+limitH+" 请重新选择！");
			return;
		}
	}
	else{
		if(limitW!=-1 && imgTmp.width!=limitW){
			alert("警告！图片不符合规格！所选择的图片宽度必须为："+limitW+" 请重新选择！");
			return;
		}
		if(limitH!=-1 && imgTmp.height!=limitH){
			alert("警告！图片不符合规格！所选择的图片高度必须为："+limitH+" 请重新选择！");
			return;
		}
	}

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
    <td width="157" valign="top"><TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border="0">
        <TBODY>
          <TR>
            <TD vAlign=top><!--#include file="menu.asp"--></TD>
          </TR>
        </TBODY>
      </TABLE></td>
    <td width="84%" rowspan="2" valign="top"><table width="100%"  border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td>发布产品</td>
        </tr>
        <tr>
          <td align="center"><form action="product_save.asp" method="post" enctype="multipart/form-data" name="form1" ONSUBMIT="return checkForm(this)">
              <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
                <tr>
                  <td width="120" align="right"><span class="red">*</span>所属分类(Category)</td>
                  <td align="left"><select name="basic_CategoryID" id="basic_CategoryID" title="请选择所属分类!~!" <%=categoryExart%>>
                      <option>请选择</option>
                      <%=tree%>
                    </select>
                    (只能选择第二级的子分类) </td>
                </tr>
                <tr>
                  <td align="right"><span class="red">*</span>编号(NO.)</td>
                  <td align="left"><input name="basic_NO" type="text" id="basic_NO" size="30" maxlength="100" value="<%=NO%>" title="请输入产品编号!~!">                  </td>
                </tr>
                <tr>
                  <td align="right"><span class="red">*</span>最少定货量(MiniQQ)</td>
                  <td align="left"><input name="basic_Qqmini" type="text" id="basic_Qqmini" size="50" maxlength="100" value="<%=Qqmini%>" title="请输入最少订货量!~!">
                    (页面显示字符串)</td>
                </tr>
                <tr>
                  <td align="right"><span class="red">*</span>最少定货量(MiniQQ)</td>
                  <td align="left"><input name="basic_QqminiNumber" type="text" id="basic_QqminiNumber" size="50" maxlength="100" value="<%=QqminiNumber%>" title="请输入最少订货量!~int!">
                  (订购时缺省数量,只能填写整数)</td>
                </tr>
                <tr>
                  <td align="right"><span class="red">*</span>产品名(Name)</td>
                  <td align="left"><input name="basic_Name" type="text" id="basic_Name" size="50" maxlength="100" value="<%=Name%>" title="请输入英文产品名!~!">                  </td>
                </tr>
                <tr>
                  <td align="right">尺寸(Size)</td>
                  <td align="left"><input name="basic_Size" type="text" id="basic_Size" size="30" maxlength="100" value="<%=Size%>">
                  (没有的话请留空否则严格按照格式输入)</td>
                </tr>
                <tr>
                  <td align="right">电镀(Plating)</td>
                  <td align="left"><input name="basic_Plating" type="text" id="basic_Plating" size="30" maxlength="100" value="<%=Plating%>">
                  (没有的话请留空)</td>
                </tr>
                <tr>
                  <td align="right">磁性(Magnetic)</td>
                  <td align="left"><input name="basic_Magnetic" type="text" id="basic_Magnetic" size="30" maxlength="100" value="<%=Magnetic%>">
                  (没有的话请留空)</td>
                </tr>
                <tr>
                  <td align="right">石头(Stone)</td>
                  <td align="left"><input name="basic_Stone" type="text" id="basic_Stone" size="30" maxlength="100" value="<%=Stone%>"></td>
                </tr>
                <tr>
                  <td align="right">材料(Material)</td>
                  <td align="left"><input name="basic_Material" type="text" id="basic_Stone2" size="30" maxlength="100" value="<%=Material%>"></td>
                </tr>
                <tr>
                  <td align="right">价钱(Price)</td>
                  <td align="left"><input name="basic_Price" type="text" id="basic_Price" size="30" maxlength="100" value="<%=Price%>" title="请输入产品价钱!~!"></td>
                </tr>
                <tr>
                  <td align="right"><p>报价描述</p>
                  </td>
                  <td align="left"><textarea name="basic_QDescription" cols="60" rows="3" id="basic_QDescription"><%=QDescription%></textarea></td>
                </tr>
                <tr>
                  <td align="right"><p>产品描述</p><p>Description</p></td>
                  <td align="left"><textarea name="basic_Description" cols="60" rows="3" id="basic_Description"><%=Description%></textarea></td>
                </tr>
                <tr>
                  <td align="right">推荐(Recommend)</td>
                  <td align="left"><input name="Recommend" type="checkbox" id="Recommend" value="1" <%If Recommend="1" Then  response.Write "checked"%>>                  </td>
                </tr>
                <tr>
                  <td align="right">最新(New)</td>
                  <td align="left" valign="middle"><input name="IsNew" type="checkbox" id="IsNew" value="1" <%If IsNew="1" Then  response.Write "checked"%>></td>
                </tr>
                <tr>
                  <td align="right">显示在</td>
                  <td align="left" valign="middle"><input name="PLshow" type="checkbox" id="PLshow" value="PL" <%If pl>0 then response.write "checked"%>>                    
                    产品列表&nbsp;&nbsp;
                    <input name="PSshow" type="checkbox" id="PSshow" value="PS" <%If ps>0 then response.write "checked"%>>                  
                  报价单</td>
                </tr>
                <tr>
                  <td align="right"><input name="has_simage" type="checkbox" id="has_simage" value="True" onClick="checkHasSImage(this)">
                    小图</td>
                  <td align="left" valign="middle"><div id="simage_div">
                      <%
				If not isNE(Simage) Then
				%>
                      <img src="<%="../"&productImagePath&Simage%>" id="simage_view">
                      <input name="oldSImageFileName" type="hidden" id="table" value="<%=Simage%>">
                      <br>
                      [<a href="operation.asp?action=delProductSimage&ID=<%=id%>&filename=<%=Simage%>"">删除</a>]
                      <%
				End If
				%>
                    </div>
                    <input name="basic_Simage" type="file" id="basic_Simage" size="50" style="display:none" onChange="showImage(this,'upsimage_view',120,70)">
                    (120X70像素) </td>
                </tr>
                <tr style="display:none" id="simage_view_tr">
                  <td align="right">小图上传预览</td>
                  <td align="left"><img src="img/noimage.png" id="upsimage_view"></td>
                </tr>
                <tr>
                  <td align="right"><input name="has_bimage" type="checkbox" id="has_bimage" value="True" onClick="checkHasBImage(this)">
                    大图</td>
                  <td align="left"><div id="bimage_div">
                      <%
				If not isNE(Bimage) Then
				%>
                      <img src="<%="../"&productImagePath&Bimage%>" id="bimage_view">
                      <input name="oldBImageFileName" type="hidden" id="table" value="<%=Bimage%>">
                      <br>
                      [<a href="operation.asp?action=delProductBimage&ID=<%=ID%>&filename=<%=Bimage%>">删除</a>]
                      <%
				End If
				%>
                    </div>
                    <input name="basic_Bimage" type="file" id="basic_Bimage" size="50" style="display:none" onChange="showImage(this,'upbimage_view',496,-1)">
                    (496X292像素) </td>
                </tr>
                <tr style="display:none" id="bimage_view_tr">
                  <td align="right">大图上传预览</td>
                  <td align="left"><img src="img/noimage.png" id="upbimage_view"></td>
                </tr>
              </table>
              <br>
              <input name="Submit" type="submit" class="button" value="保存">
              <input name="return" type="button" class="button" id="return" onClick="location='product_list.asp'" value="返回">
              <input type="hidden" name="table" value="Products">
              <input name="returnPage" type="hidden" id="returnPage" value="<%=returnPage%>">
              <input type="hidden" name="id" value="<%=ID%>">
			  <%If dtype="link" or dtype="linkEdit" Then%>
              <input name="type" type="hidden" id="type" value="<%=dtype%>">
              <input name="basic_CategoryID" type="hidden" id="basic_CategoryID" value="<%=CategoryID%>">
          	  <%End if%>
              <input name="urlPara" type="hidden" id="urlPara" value="<%=urlPara%>">
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
