<%
'�ļ�λ�ã�/Include/Const.asp
'
'ע�⣺�ϴ������޸����ݿ����ʹ��·����������"'"����ȥ�����벻Ҫʹ�ûس�
'���飺ֻ���ַ�����Ҫ���ӡ�ɾ��
' 
'========��վϵͳ����==========================================================
'
dim SysFileUrl
dim SysRootDir,SiteDataPath,SiteDataBakPath,StatDataPath,StatDataBakPath
dim UrlFileName

SysFileUrl=split(replace(Request.ServerVariables("URL"),"\","/"),"/")
SysRootDir = "/"                                      'ϵͳ���е�Ŀ¼,�������/
if ubound(SysFileUrl)-2>=1 then
	dim iii
 	for iii=1 to (ubound(SysFileUrl)-2)
		SysRootDir = SysRootDir&SysFileUrl(iii)&"/"
	next 
end if
SiteDataPath = SysRootDir&"Database/#$% ^NwebCn_Site.mdb"       '��վ�����·��,ֻ���޸�"��"�ڵ�
SiteDataBakPath = SysRootDir&"Database/Bak_NwebCn_Site.mdb"     '��վ���ݿ�·��,ֻ���޸�"��"�ڵ�
StatDataPath = SysRootDir&"Database/#$% ^NwebCn_Stat.mdb"       'ͳ�Ƴ����·��,ֻ���޸�"��"�ڵ�
StatDataBakPath = SysRootDir&"Database/Bak_NwebCn_Stat.mdb"     'ͳ�Ʊ��ݿ�·��,ֻ���޸�"��"�ڵ�

UrlFileName = mid(request.ServerVariables("SCRIPT_NAME"),InStrRev(request.ServerVariables("SCRIPT_NAME"),"/")+1) 
'
'========������Ϣ����==========================================================
%> 
