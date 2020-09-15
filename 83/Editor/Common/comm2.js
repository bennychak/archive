var mRegExp = new Object();


function insert(what) 
{
	Editor.focus();
	var sel = Editor.document.selection.createRange();

	switch(what){
	case "excel":
		insertHTML(getLangText("Cmpnts","0x2003"));
		break;
	case "quote":
		insertHTML('<table width=95% border="0" align="Center" cellpadding="6" cellspacing="0" style="border: 1px Dotted #6595d6; TABLE-LAYOUT: fixed; background-color:#e8f4ff"><tr><td style="WORD-WRAP: break-word"><font style="color: #990066;font-weight:bold">' + getLangText("Cmpnts","0x2001") + ':</font><br>' + String.HTMLEncode(sel.text) + '</td></tr></table>');
		break;
	case "code":
		insertHTML('<table width=95% border="0" align="Center" cellpadding="6" cellspacing="0" style="border: 1px Dotted #78DCCA; TABLE-LAYOUT: fixed; background-color:#e8f4ff"><tr><td style="WORD-WRAP: break-word"><font style="color: #990033;font-weight:bold">' + getLangText("Cmpnts","0x2002") + '</font><br>' + String.HTMLEncode(sel.text) + '</td></tr></table>');
		break;
	case "date":
		window.execScript('pasteHTML(FormatDateTime(now,1))','VBScript');  
		break;
	case "time":
		window.execScript('pasteHTML(FormatDateTime(now,3))','VBScript');  
		break;
	case "big":	
		insertHTML("<big>" + sel.text + "</big>");
		break;
	case "small":
		insertHTML("<small>" + sel.text + "</small>");
		break;
	case "br":
		insertHTML("<br>")
		break;
	default:
		break;
	}
	sel=null;
	Editor.focus();
}

function URLFilters(s)
{
	var re;
	var sHttpUploadPath = relativePath2AbsoluteHttpPath(mSystem["UploadPath"],getEditorHttpPath())
	var sHttpIconImage = relativePath2AbsoluteHttpPath(mSystem["IconImage"],getEditorHttpPath())
	var sHttpFilesImage = relativePath2AbsoluteHttpPath(mSystem["FilesImage"],getEditorHttpPath())
	var sHttpBgImage = relativePath2AbsoluteHttpPath(mSystem["BgImage"],getEditorHttpPath())
	
	re = new RegExp("(" + sHttpUploadPath + ")+","ig");
	s = s.replace(re,ConvertURL(mSystem["UploadPath"],mSystem["UrlMode"]));
	re = new RegExp("(" + sHttpIconImage + ")+","ig");
	s = s.replace(re,ConvertURL(mSystem["IconImage"],"1"));
	re = new RegExp("(" + sHttpFilesImage + ")+","ig");
	s = s.replace(re,ConvertURL(mSystem["FilesImage"],"1"));
	re = new RegExp("(" + sHttpBgImage + ")+","ig");
	s = s.replace(re,ConvertURL(mSystem["BgImage"],"1"));
	
	return s;
}
//alert(ConvertURL(mSystem["UploadPath"],"3"));
//=============================================================================================
//	相对路径或绝对根路径URL转换    sPath:相对路径或绝对根路径
//=============================================================================================

function ConvertURL(sPath,v)
{
	switch(v)
	{
		case "1": //绝对根路径模式
			sPath = absoluteHttpPath2AbsoluteRootPath(relativePath2AbsoluteHttpPath(sPath,getEditorHttpPath()),getSitePath());
			break;
		case "2": //绝对URL全路径模式
			sPath = relativePath2AbsoluteHttpPath(sPath,getEditorHttpPath());
			break;
		case "3": //相对路径模式
			sPath = absoluteHttpPath2RelativePath(relativePath2AbsoluteHttpPath(sPath,getEditorHttpPath()),getEditorHttpPath(),getSitePath())
			break;
	}
	return sPath;
}

//=============================================================================================
//	网站全称
//=============================================================================================
function getSitePath()
{
	return (document.location.protocol + "//" + document.location.host).toLowerCase();
}
//alert(getSitePath()); //后面不带"/"
//=============================================================================================
//	Editor所在的根路径
//=============================================================================================
function getEditorRootPath()
{
	var url = document.location.pathname;
	return url.substring(0,url.lastIndexOf("/")+1);
}
//alert(getEditorRootPath());
//=============================================================================================
//	Editor所在的http路径
//=============================================================================================
function getEditorHttpPath()
{
	return getSitePath()+getEditorRootPath();
}
//alert(getEditorHttpPath());
//=============================================================================================
//	在同网将http绝对路径转换成绝对根路径
//=============================================================================================
function absoluteHttpPath2AbsoluteRootPath(str,sSitePath)
{
	sSitePath = sSitePath.toLowerCase();
	if(sSitePath.substr(sSitePath.length-1)!="/")sSitePath += "/";
	var re = new RegExp("(" + sSitePath + ")+","ig");
	str = str.replace(re,"/")
	return str;
}
//alert(absoluteHttpPath2AbsoluteRootPath("http://localhost/sina",getSitePath()));

//=============================================================================================
//	在同网将http绝对路径转换成与某目录的相对路径(相对同网某个http绝对地址:sRelativeFldrHttpPath)
//=============================================================================================
function absoluteHttpPath2RelativePath(sAbsoluteHttpPath,sRelativeFldrHttpPath,sSitePath)
{
	var i,j,k,sResultPath = "";
	sSitePath = sSitePath.toLowerCase();
	sAbsoluteHttpPath = sAbsoluteHttpPath.toLowerCase().replace(sSitePath + "/","");
	sRelativeFldrHttpPath = sRelativeFldrHttpPath.toLowerCase().replace(sSitePath + "/","");
	if(sAbsoluteHttpPath.substr(sAbsoluteHttpPath.length-1)=="/")sAbsoluteHttpPath = sAbsoluteHttpPath.substr(0,sAbsoluteHttpPath.length-1);
	if(sRelativeFldrHttpPath.substr(sRelativeFldrHttpPath.length-1)=="/")sRelativeFldrHttpPath = sRelativeFldrHttpPath.substr(0,sRelativeFldrHttpPath.length-1);

	aAbsolutePath = sAbsoluteHttpPath.split("/");
	aRelativeFldrHttpPath = sRelativeFldrHttpPath.split("/");
	
	for(i=0;i<aAbsolutePath.length ;i++){
		if(aAbsolutePath[i] != aRelativeFldrHttpPath[i]){break;}
	}
	k = aRelativeFldrHttpPath.length - i;
	if(sRelativeFldrHttpPath =="")
	{
		sResultPath = "";
	}
	else
	{
		for(j=0;j<k;j++){sResultPath +="../";}
	}
	for(;i<aAbsolutePath.length;i++){
		if(sAbsoluteHttpPath == "")break;
		sResultPath += aAbsolutePath[i] + "/";
	}
	
	if(sResultPath=="")sResultPath = "./";
	
	return sResultPath;
}
//alert(absoluteHttpPath2RelativePath("http://localhost/sina",getEditorHttpPath(),getSitePath()));

//=============================================================================================
//	在同网将相对路径或绝对根路径(sRelativePath)转换成http绝对路径(相对同网某个http绝对地址:sEditorRootPath)
//=============================================================================================
function relativePath2AbsoluteHttpPath(sRelativePath,sEditorRootPath)
{
	var sResultPath = "",sTemp1 = "",sTemp2 = "";
	var sSitePath = getSitePath();
	var sRelativePath = sRelativePath.toLowerCase();
	var sEditorRootPath = sEditorRootPath.toLowerCase();
	
	if(sEditorRootPath.substr(sEditorRootPath.length-1)=="/")sEditorRootPath = sEditorRootPath.substr(0,sEditorRootPath.length-1);
	sEditorRootPath = sEditorRootPath.replace(sSitePath + "/","");
	
	aRelativePath = sRelativePath.split("/");
	aEditorRootPath = sEditorRootPath.split("/");

	var pos = aEditorRootPath.length - 1;
	
	if(sRelativePath.substr(0,1)=="/")
	{
		sResultPath = sSitePath + sRelativePath;
	}
	else if(sRelativePath.substr(0,1)=="")
	{
		sResultPath = sSitePath + "/" + sEditorRootPath;
	}
	else
	{
		for(var i=0;i<aRelativePath.length;i++)
		{
			if(aRelativePath[i] =="..")
			{
				if(pos>=0)pos--;
			}
			else if(aRelativePath[i] == "." || aRelativePath[i] == ""){}
			else
			{
				sTemp2 += aRelativePath[i] + "/";
			}
		}
		for(var j=0;j<=pos&&pos>=0;j++)
		{
			sTemp1 += aEditorRootPath[j] + "/";
		}
		sResultPath = sSitePath + "/" + sTemp1 + sTemp2;
	}
	return sResultPath;
}
//alert(relativePath2AbsoluteHttpPath("../upload/",getEditorHttpPath()));

//=============================================================================================
//  在同网将相对路径转换成绝对根路径(相对同网某个http绝对地址)
//=============================================================================================
function relativePath2AbsoluteRootPath(url)
{
	return absoluteHttpPath2AbsoluteRootPath(relativePath2AbsoluteHttpPath(url,getEditorHttpPath()),getSitePath());
}
//alert(relativePath2AbsoluteRootPath("images"));