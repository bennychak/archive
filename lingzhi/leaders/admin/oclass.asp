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
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="robots" none="noindex,nofollow">
<TITLE>无限级列表</TITLE>
<style>
.node{
font-size:12px;
padding:0 0 2 0;
margin-left:10;
height:22px;
}
img{
vertical-align:middle;
}
a{text-decoration:none;font-size:12px;color:black}
.deeptree{
width:100%;
height:100%;
backgound-color:#f2f2f2;
overflow:auto;
}

</style>
</HEAD>
<BODY bgcolor=#f2f2f2>
<nobr>
<div class="deeptree">
<%
dim id
id=Request.QueryString("id")
if id="" or CInt(id)<0 then id=0
if isNumeric(id) then
listTree(CInt(id))
end if


function listTree(id)
	dim rs,sql
	dim imgFolder,imgFile,img
	dim href,parentHref
	dim ahref,click
	imgFolder="img/" '默认路径
	sql="select *,(select count(*) from Category where ParentID = T.id) as children,"
	sql=sql&"(select ParentID from Category where id="&id&") as parent "
	sql=sql&"from Category T where ParentID="&id
	
	set rs=conn_access.execute(sql)
	if not rs.eof then
		parentHref=Request.ServerVariables("URL")&"?id="&rs("parent")
		if id<>0 then 
			'不是父类
		end if
		
		do while not rs.eof 
			if rs("children")>0 then
				'有孩子
				img=imgFolder+"collapsed.gif"
				href=Request.ServerVariables("URL")&"?id="&rs("id")
				click="onclick=""location.href='"&href&"'"""
			else
				'没有孩子
				img=imgFolder+"endnode.gif"
				href="javascript:void(0)"
			end if

			if not isNull(rs("name_CN")) then
				ahref=rs("name_CN")
			else
				ahref="javascript:void(0)"
			end if

			Response.Write "<div class='node' nowrap=true><a href='"&href&"' onfocus='blur()'><img src='"&img&"' border=0></a> "&rs("name_CN")&"</div>"
			rs.movenext
		loop

		rs.close:set rs=nothing
	end if
end function
conn_access.close:set conn_access=nothing
%>

</div>
</nobr>
</BODY>
</HTML>