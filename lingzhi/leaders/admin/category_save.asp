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
'┃南京汉中门大街康怡花园汉佳办事处　2004年12月25日10:24:11┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="includes/config.asp"--> 
<!--#include file="includes/fileup.asp" -->

<%call isLogin%>

<%
dim id,sql,rs,table,returnPage
dim values,items,fieldstr,valuestr
dim imageFileName,oldImageFileName
dim multipartForm

Set multipartForm = new FileUp

'限制上传文件大小
multipartForm.GetData (upLoadImageSize)
'设置上传类型的黑名单
multipartForm.AllowExt="jpg;gif;png;bmp"

id=multipartForm.Form("id")
returnPage=multipartForm.Form("returnPage")
table=multipartForm.Form("table")
oldImageFileName=multipartForm.Form("oldImageFileName")

If isNE(table) Then
	response.Write "错误!参数不全!"
	response.end
End if

'上传图片
If multipartForm.Form("has_image") Then
	imageFileName=multipartForm.AutoSave("basic_image",Server.Mappath("../"&categoryImagePath)&"\")
	If multipartForm.iserr Then 
		response.Write multipartForm.errmessage
		response.end
	'删除原有图片
	Elseif NOT isNE(oldImageFileName)<>"" Then
		delFile(Server.Mappath("../"&categoryImagePath&oldImageFileName))
	End If
Else
	imageFileName=oldImageFileName

End if

'---正则判断---
dim reg,pattern,rement
Set reg=new RegExp
'不区分大小写的
reg.IgnoreCase=true
'搜索整个字符串
reg.Global=True
reg.Pattern="basic_(.+?)"

If isNE(id) Then
	for each items in multipartForm.Form
		values=multipartForm.Form(items)
		
		'response.Write items&"->"&values&"<br>"
		
		if reg.test(items) and values<>"" Then
			values = Replace(values,"'","''")
			fieldstr=fieldstr&","&reg.replace(items,"$1")
			valuestr=valuestr&",'"&values&"'"
		end if
	next
	set reg=nothing
	fieldstr=delOtherChar(fieldstr)
	valuestr=delOtherChar(valuestr)
	valuestr=server.HTMLEncode(valuestr)
	sql="insert into "&table&" ("&fieldstr&",[Image]) values("&valuestr&",'"&imageFileName&"')"
	
'保存编辑
else
	If isNE(id)  Then
		response.Write "错误!参数不全!"
		set reg=nothing
		response.end
	End if

	for each items in multipartForm.Form
		if reg.test(items) then
			values=multipartForm.Form(items)
			values = Replace(values,"'","''")
			valuestr=valuestr&reg.replace(items,"$1")&"='"&values&"',"
		end if
	next
	valuestr=delOtherChar(valuestr)
	valuestr=server.HTMLEncode(valuestr)
	sql="update "&table&" set "&valuestr&",[Image]='"&imageFileName&"' where id="&id
end if

'response.Write sql

set multipartForm=nothing

conn_access.execute(sql)
call msgPage(0,"gourl",returnPage,2)

%>
