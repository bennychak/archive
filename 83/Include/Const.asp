<%
'文件位置：/Include/Const.asp
'
'注意：上传后请修改数据库名和存放路径，单引号"'"不能去掉，请不要使用回车
'建议：只改字符，不要增加、删除
' 
'========网站系统参数==========================================================
'
dim SysFileUrl
dim SysRootDir,SiteDataPath,SiteDataBakPath,StatDataPath,StatDataBakPath
dim UrlFileName

SysFileUrl=split(replace(Request.ServerVariables("URL"),"\","/"),"/")
SysRootDir = "/"                                      '系统运行的目录,后面需加/
if ubound(SysFileUrl)-2>=1 then
	dim iii
 	for iii=1 to (ubound(SysFileUrl)-2)
		SysRootDir = SysRootDir&SysFileUrl(iii)&"/"
	next 
end if
SiteDataPath = SysRootDir&"Database/#$% ^NwebCn_Site.mdb"       '网站常规库路径,只能修改"…"内的
SiteDataBakPath = SysRootDir&"Database/Bak_NwebCn_Site.mdb"     '网站备份库路径,只能修改"…"内的
StatDataPath = SysRootDir&"Database/#$% ^NwebCn_Stat.mdb"       '统计常规库路径,只能修改"…"内的
StatDataBakPath = SysRootDir&"Database/Bak_NwebCn_Stat.mdb"     '统计备份库路径,只能修改"…"内的

UrlFileName = mid(request.ServerVariables("SCRIPT_NAME"),InStrRev(request.ServerVariables("SCRIPT_NAME"),"/")+1) 
'
'========配置信息结束==========================================================
%> 
