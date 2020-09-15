<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2004年12月25日22:09:46　　　　　　　　　　┃
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
'┃南京汉中门大街康怡花园汉佳办事处　2004年12月25日20:48:59┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="includes/config.asp"--> 
<!--#include file="includes/fileup.asp" -->

<%'call isLogin%>

<%
dim id,sql,rs,table,msg,returnPage
dim values,items,fieldstr,valuestr,pl,ps
dim SImageFileName,oldSImageFileName,BImageFileName,oldBImageFileName
dim multipartForm
dim dtype,urlPara



Set multipartForm = new FileUp

'限制上传文件大小
multipartForm.GetData (upLoadImageSize)
'设置上传类型的黑名单
multipartForm.AllowExt="jpg;gif;png;bmp"

dtype=multipartForm.Form("type")

id=multipartForm.Form("id")
returnPage=multipartForm.Form("returnPage")
table=multipartForm.Form("table")
urlPara=multipartForm.Form("urlPara")

'add by jim
pl=multipartForm.Form("PLshow")
ps=multipartForm.Form("PSshow")
pw=pl&"|"&ps
pw=replace(pw,"'","''")
'response.write pw
'response.End
' end add

'推荐
dim Recommend
Recommend=multipartForm.Form("Recommend")
If isNE(Recommend) Then
	Recommend=0
End if

'最新
dim IsNew
IsNew=multipartForm.Form("IsNew")
If isNE(IsNew) Then
	IsNew=0
End if

oldSImageFileName=multipartForm.Form("oldSImageFileName")
oldBImageFileName=multipartForm.Form("oldBImageFileName")


If isNE(table) Then
	response.Write "错误!参数不全!"
	response.end
End if

'上传小图
If multipartForm.Form("has_simage") Then
	SImageFileName=multipartForm.AutoSave("basic_Simage",Server.Mappath("../"&productImagePath)&"\")
	If multipartForm.iserr Then 
		response.Write multipartForm.errmessage
		response.end
	'删除原有图片
	Elseif NOT isNE(oldSImageFileName)<>"" Then
		delFile(Server.Mappath("../"&productImagePath&oldSImageFileName))
	End If
Else
	SImageFileName=oldSImageFileName
End if

'上传大图
If multipartForm.Form("has_bimage") Then
	BImageFileName=multipartForm.AutoSave("basic_Bimage",Server.Mappath("../"&productImagePath)&"\")
	If multipartForm.iserr Then 
		response.Write multipartForm.errmessage
		response.end
	'删除原有图片
	Elseif NOT isNE(oldBImageFileName)<>"" Then
		delFile(Server.Mappath("../"&productImagePath&oldBImageFileName))
	End If
Else
	BImageFileName=oldBImageFileName

End if

'---正则判断---
dim reg,pattern,rement
Set reg=new RegExp
'不区分大小写的
reg.IgnoreCase=true
'搜索整个字符串
reg.Global=True
reg.Pattern="basic_(.+?)"

If isNE(id) OR dtype="link" Then
	for each items in multipartForm.Form
		values=multipartForm.Form(items)
		
		'response.Write items&"->"&values&"<br>"
		
		if reg.test(items) and values<>"" Then
			values = Replace(values,"'","''")
			fieldstr=fieldstr&",["&reg.replace(items,"$1")&"]"
			valuestr=valuestr&",'"&values&"'"
		end if
	next
	set reg=nothing
	fieldstr=delOtherChar(fieldstr)
	valuestr=delOtherChar(valuestr)
	valuestr=server.HTMLEncode(valuestr)
	If dtype="link" Then
		sql="insert into "&table&" ("&fieldstr&",Recommend,IsNew,Simage,Bimage,ProductParentID,ShowWhere) values("&valuestr&","&Recommend&","&IsNew&",'"&SImageFileName&"','"&BImageFileName&"','"&id&"','"&pw&"')"
	else
		sql="insert into "&table&" ("&fieldstr&",Recommend,IsNew,Simage,Bimage,ShowWhere) values("&valuestr&","&Recommend&","&IsNew&",'"&SImageFileName&"','"&BImageFileName&"','"&pw&"')"
	End if
	
'保存编辑
else
	If isNE(id) AND isNE(dtype)  Then
		response.Write "错误!参数不全!"
		set reg=nothing
		response.end
	End if

	for each items in multipartForm.Form
		if reg.test(items) Then
			values=multipartForm.Form(items)
			values = Replace(values,"'","''")
			valuestr=valuestr&"["&reg.replace(items,"$1")&"]='"&values&"',"
			'保存分类ID
			If reg.replace(items,"$1") = "CategoryID" Then
				categoryID = values
			End If

		end if
	next
	valuestr=delOtherChar(valuestr)
	valuestr=server.HTMLEncode(valuestr)
	sql="update "&table&" set "&valuestr&",Recommend="&Recommend&",IsNew="&IsNew&",Simage='"&SImageFileName&"',Bimage='"&BimageFileName&"',ShowWhere='"&pw&"' where id="&id
	
	sql_tmp = "update Products set CategoryID="&categoryID&" where ProductParentID="&id
	conn_access.execute(sql_tmp)
end if

'response.Write sql

set multipartForm=nothing
'response.Write(sql)
conn_access.execute(sql)

If NOT isNE(dtype) Then
	call msgPage(0,"gourl","product_list.asp?"&Server.URLEncode(urlPara),2)
else
	call msgPage(0,"gourl",Server.URLEncode(returnPage),2)
End if
%>
