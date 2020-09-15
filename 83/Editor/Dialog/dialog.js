try{
	var mSystem = dialogArguments.mSystem;
}
catch(e){
}

var	URLParams = new Object();
var	oCollUrlParams = window.location.search.substr(1).split("&");
for(i=0;i<oCollUrlParams.length;i++)
{
	var arroCollUrlParams=oCollUrlParams[i].split("=");
	URLParams[arroCollUrlParams[0].toLowerCase()]=arroCollUrlParams[1];
}

function onKeyDown(event)
{
	if(event.keyCode == 27){parent.close();}
}document.onkeydown = new Function("return onKeyDown(event);");

function SelectionRange()
{
	return dialogArguments.Editor.document.selection.createRange();
}

function SelectionType()
{
	return dialogArguments.Editor.document.selection.type;
}
function ShowDialog(sURL, iWidth, iHeight)
{
	var oDialog = showModalDialog(sURL, window, "dialogWidth:" + iWidth.toString() + "px;dialogHeight:" + iHeight.toString() + "px;help:no;scroll:no;status:no");
	return oDialog;
}

//=============================================================================================



//=============================================================================================
//	ȥ�����ҿո�
//=============================================================================================
function trim(str)
{
	var re = /(^(\x20+))(.*[^\x20])((\x20+)$)/g;
	return str.replace(re,"$3");
}

//=============================================================================================
//	��ֵ�Ƿ�Ϊ16������ɫ��ʽ
//=============================================================================================
function IsColor(color)
{
	var re = /\#[a-fA-F0-9]{6}/;
	return re.test(color);
}

//=============================================================================================
//	��ֵ�Ƿ�ΪHttpURL��ʽ
//=============================================================================================
function IsURL(url)
{
	var re = /^(HTTP:\/\/)(\w)+/;
	return re.test(url.toUpperCase());
}

//=============================================================================================
//	�����Ƿ�Ϊ��ֵ
//=============================================================================================
function IsDigit(){
  return ((event.keyCode >= 48) && (event.keyCode <= 57));
}

//=============================================================================================
//	��ʾ�Խ�
//=============================================================================================
function AlertFocus(oText,s){
	alert(s);
	oText.focus();
	oText.select();
	return false;
}

//=============================================================================================
//	���ַ�ת��Ϊ����
//=============================================================================================
function ToInt(str)
{
	str = trim(str);
	var sTemp=parseFloat(str);
	if (isNaN(sTemp)){
		str = "";
	}else{
		str = sTemp;
	}
	
	return str;
}

//=============================================================================================
//	����ɫ��
//=============================================================================================
function SelectColor(what){
	var dEL = document.all("d_"+what);
	var sEL = document.all("s_"+what);
	var url = "selcolor.htm?color="+ dEL.value.substr(1);
	var arr = showModalDialog(url,window,"dialogWidth:280px;dialogHeight:250px;help:no;scroll:no;status:no");
	if (arr){
		dEL.value=arr;
		sEL.style.backgroundColor=arr;
	}
}
//=============================================================================================
//	�򿪱�����
//=============================================================================================
function SelectImage(){
	showModalDialog("backimage.htm?action=other",window,"dialogWidth:350px;dialogHeight:210px;help:no;scroll:no;status:no");
}

//=============================================================================================
//	�Ƚ�Selectֵ��ѡ��
//=============================================================================================
function SearchSelectValue(o_Select, s_Value){
	for (var i=0;i<o_Select.length;i++){
		if (o_Select.options[i].value == s_Value){
			o_Select.selectedIndex = i;
			return true;
		}
	}
	return false;
}
//=============================================================================================
//	�Ƿ�Ϊ����ĺ�׺
//=============================================================================================
function IsAllowExt(sUrl, sAllowExt){
	var sFileName = sUrl.toUpperCase().substr(sUrl.lastIndexOf("/")+1);
	var sExt = sFileName.substr(sFileName.lastIndexOf(".")+1);
	var a = sAllowExt.toUpperCase().split("|");
	for (var i=0;i<a.length ;i++ )
	{
		if(a[i] == sExt)return true;
	}
	return false;
}
//=============================================================================================
//	·������
//=============================================================================================

function ConvertURL(sPath,v)
{
	return dialogArguments.ConvertURL(sPath,v);
}
function URLFilters(s,v)
{
	return dialogArguments.URLFilters(s,mSystem["UrlMode"]);
}
function getSitePath()
{
	return dialogArguments.getSitePath();
}

function getEditorRootPath()
{
	return dialogArguments.getEditorRootPath();
}

function getEditorHttpPath()
{
	return dialogArguments.getEditorHttpPath();	
}

function absoluteHttpPath2AbsoluteRootPath(str,sSitePath)
{
	return dialogArguments.absoluteHttpPath2AbsoluteRootPath(str,sSitePath);	
}
function absoluteHttpPath2RelativePath(sAbsoluteHttpPath,sRelativeFldrHttpPath,sSitePath)
{
	return dialogArguments.absoluteHttpPath2RelativePath(sAbsoluteHttpPath,sRelativeFldrHttpPath,sSitePath);	
}
function relativePath2AbsoluteHttpPath(sRelativePath,sEditorRootPath)
{
	return dialogArguments.relativePath2AbsoluteHttpPath(sRelativePath,sEditorRootPath);	
}
function relativePath2AbsoluteRootPath(url)
{
	return absoluteHttpPath2AbsoluteRootPath(relativePath2AbsoluteHttpPath(url,getEditorHttpPath()),getSitePath());
}

var strUploading = "<div id='divUploading'  align='center' style='background-color:menu;width:110%;height:110%;position:absolute;left:-1;top:-1;display:none'>"
	strUploading += "<table border=0 cellpadding=0 cellspacing=1 width='50%' height='120'><tr><td width='100%' valign='middle' align='center'><marquee align='middle' behavior='alternate' scrollamount='-1'><strong><font color='#990033'>�ļ������ϴ�,���Ժ�!</font></strong></marquee></td></tr></table>"
	strUploading += "</div>"

