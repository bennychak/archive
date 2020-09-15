

var _IO = new function()
{
	this.input = function(){return prompt();};
	this.output = function(obj){alert(obj);};
	this.print = function(s){document.write(s);};
}

var _ClipBoard = new function()
{
	this.getHTML = function()
	{
		var sTemp;
		var oDiv = document.getElementById("divClipBoardTemp");
		var oTextRange = document.body.createTextRange();
			oDiv.innerHTML = "";
			oTextRange.moveToElementText(oDiv);
			oTextRange.execCommand("Paste");
			sTemp = oDiv.innerHTML;
			oDiv.innerHTML = "";
		return sTemp;
	};
	this.getText = function()
	{
		if(clipboardData.getData("Text") != null){
			return String.HTMLEncode(clipboardData.getData("Text"));
		}
		else{
			return "";
		}
	};
}

function _throw(e,s)
{
	if(e instanceof Error){throw(e);}
	else if(typeof(e)=="string")
	{
		throw(new Error(e,getLangText("Alert",e)));
	}
	else
	{
		throw(new Error(e,s));
	}
}

function _alert(sCode)
{
	var sMsg = getLangText("Alert",sCode);
	_IO.output(eval(getLangText("Alert","0x0000")));
	return false;
}

function URLParams()
{
	var	oTempUrlParams = new Object();
	var	oCollUrlParams = window.location.search.substr(1).split("&");
	for(i=0;i<oCollUrlParams.length;i++)
	{
		var arroCollUrlParams=oCollUrlParams[i].split("=");
		oTempUrlParams[arroCollUrlParams[0].toLowerCase()]=arroCollUrlParams[1];
	}
	return oTempUrlParams;
}

function window.onerror(sMsg,sUrl,sLine)
{
	_IO.output(eval(getLangText("Alert","0x0000")));
	alert(sUrl + sLine)
	return true;
}

function document.onreadystatechange()
{
	if(document.readyState!="complete")return;
	mSystem.URLP = URLParams();
	mSystem.SEV = Number(ScriptEngineMajorVersion() + "." + ScriptEngineMinorVersion())	;
	mSystem["EditorHead"] = getLangText("Cmpnts","0x2000");
	RTM();
	//mFinish();
	window.setTimeout("mFinish()",11);
}
function document.onkeydown()
{
	if(event.keyCode == 27){
		try{
			parent.opener.window;
			parent.close();
			return false;
		}
		catch(e){}
	}
}
function document.oncontextmenu(){
	event.returnValue = false;	
}
function getLangText(sType,sCode)
{
	var xPath = "/Language/Group[@Type='"+sType+"']/item[@Code='" + sCode + "']";
	var langTextNode = xmlLangPack.selectSingleNode(xPath);
	if(langTextNode){
		return langTextNode.text;
	}
	else{
		_throw("0x0007");
	}
}

function eleIsExist(oColl,Str)
{
	return oColl.all(Str)?true:false;	
}

function getElement(oColl,Str)
{
	return oColl.all(Str);
}

function _import(type,url,language)
{
	switch(type.toLowerCase())
	{
		case "SCRIPT":
			if(language==null||language=="")language="jscript";
			var oTempObj = document.createElement("script");
				oTempObj.src = url;
				oTempObj.language = language;
				if(document.readyState!="complete")
				{_IO.print(oTempObj.outerHTML);}
				else
				{document.body.insertAdjacentElement("afterBegin",oTempObj);}
			break;
		case "STYLESHEET":
			if(document.styleSheets.length==0)
			{
				var oTempObj = document.createElement("link");
					oTempObj.href = url;
					oTempObj.rel = "stylesheet";
					oTempObj.rev = "stylesheet";
					oTempObj.type = "text/css";
					_IO.print(oTempObj.outerHTML);
			}
			else
			{document.styleSheets[0].addImport(url);}
			break;
	}
}
function mFinish()
{
	try{
		EditorLoading.style.display = "none";
		EditorFrame.style.display = "block";
		EditorStatusBar.style.display = "block";
		attachCancelEvent(document.all.EditorStatusBar)
		if(mSystem.SEV >= 5.5) EditorSideBtnList.style.display = "block";
		getIFRAMESIZE();
		getEditorFrame();
		Editor.focus();
	}
	catch(e){}
}