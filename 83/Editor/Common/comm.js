function RTM()
{	
	var sLoadLnk = mSystem.URLP["lnk"];
	var sLoadMode = mSystem.URLP["loadmode"];
	var sLoadUrl = mSystem.URLP["url"];
	
	if(String.isEmpty(sLoadLnk)){_alert("0x0001");}
	if(String.isEmpty(sLoadMode))sLoadMode = "FORM";
	
	mSystem["LoadLnk"] = sLoadLnk;
	mSystem["LoadUrl"]  = sLoadUrl;
	mSystem["LoadMode"] = sLoadMode.toUpperCase();
	mSystem["MODELIST"] = new Array("VIEW","CODE","EDIT","INIT","FULLSCREEN");
	mSystem["ZoomSize"] = 100;
	
	try{mLoading();}catch(e){}
}

function mLoading()
{
	listToolbar();
	overrideVriable();
	setMode("INIT");
}
function overrideVriable()
{
	for(var i = 0;i<mSystem.VARIABLE.length; i++)
	{
		var currVar = mSystem.VARIABLE[i];
		var currValue = mSystem.URLP[currVar.toLowerCase()];
		if(!String.isEmpty(currValue)){mSystem[currVar] = currValue;}
	}
	mSystem["ConvertUploadPath"] = ConvertURL(mSystem["UploadPath"],mSystem["UrlMode"]);
}
function getEditorFrame()
{
	if(mSystem["EDITORFRAME"])return mSystem["EDITORFRAME"];
	for (var i=0; i<parent.frames.length;i++)
	{
		if (parent.frames[i].document == self.document){
			mSystem["EDITORFRAME"] = parent.frames[i].frameElement;
			return mSystem["EDITORFRAME"];
		}
	}
}
function getIFRAMESIZE()
{
	mSystem["Width"] = self.document.body.clientWidth;
	mSystem["Height"] = self.document.body.clientHeight;
	mSystem["EditorWidth"] = Editor.document.body.clientWidth;
	mSystem["EditorHeight"] = Editor.document.body.clientHeight;
}
function loadLnkValue()
{
	try{
		mSystem.mLnk = getElement(parent.document,mSystem["LoadLnk"]);
		divSysTemp.innerHTML = mSystem.mLnk.value;
	}
	catch(e){
		_alert("0x0004")
	}
}
function checkLnkForm()
{
	try{
		mSystem.mForm = mSystem.mLnk.form;
		mSystem.mForm.attachEvent("onsubmit",onFormSubmit)
		mSystem.mForm.attachEvent("onreset",onFormReset)
	}
	catch(e){
		_alert("0x0005");
	}
}
function validMode(strMode)
{
	for(var i=0;i<mSystem["MODELIST"].length;i++)
	{
		if(mSystem["MODELIST"][i] == strMode) return true;
		if(i == (mSystem["MODELIST"].length - 1)){return _alert("0x0003");}
	}
}
function checkMode(strMode)
{
	if(strMode.indexOf(mSystem["EditMode"])>-1){
		return true;
	}
	else{
		if(confirm(getLangText("Alert","0x1003"))){setMode("EDIT");}
		return false;
	}
}
//============================================================================================================

function setMode(sMode)
{
	validMode(sMode);
	if(sMode == mSystem["EditMode"]){return false;}
	switch(sMode)
	{
		case "INIT":
				loadLnkValue();
				switch(mSystem["LoadMode"])
				{
					case "FORM":
								checkLnkForm();
								setModeHtml(mSystem["InitMode"]);
								setModeBtn(mSystem["InitMode"]);
								break;
					case "FULLSCREEN":
								EditorSideBtnList.style.display = "none";	//
								setModeHtml(parent.opener.mSystem["EditMode"]);
								setModeBtn(parent.opener.mSystem["EditMode"]);
								break;
					default:
								checkLnkForm();
								mSystem["InitMode"] = "EDIT";	//
								Editor.document.designMode = "Off";
								Editor.location.href = mSystem["LoadUrl"]
								Editor.document.designMode = "On";
								Editor.document.onreadystatechange = setEditorEventOnLoadUrl;
								Editor.document.close();
								setModeBtn("EDIT");
								break;
				}
				break;
		default:
				if(sMode=="VIEW" && previewHTML())return ;
				setModeBtn(sMode);
				saveTemp();
				setModeHtml(sMode);
				break;
	}
	doEditorZoom(mSystem["ZoomSize"]);
}
function setModeHtml(sMode)
{
	switch(sMode)
	{
		case "VIEW":
			mSystem["EditMode"] = "VIEW";
			Editor.document.designMode = "Off";
			Editor.document.open();
			Editor.document.write(mSystem["EditorHead"]);
			Editor.document.body.innerHTML = divSysTemp.innerHTML;
			break;
		case "CODE":
			mSystem["EditMode"] = "CODE";
			Editor.document.designMode = "On";
			Editor.document.open();
			Editor.document.write(mSystem["EditorHead"]);
			Editor.document.body.innerText = divSysTemp.innerHTML;
			break;
		case "EDIT":
			mSystem["EditMode"] = "EDIT";
			Editor.document.designMode = "On";
			Editor.document.open();
			Editor.document.write(mSystem["EditorHead"]);
			Editor.document.body.innerHTML = divSysTemp.innerHTML;
			try{
				Editor.document.execCommand("2D-Position",true,true);
				Editor.document.execCommand("MultipleSelection", true, true);
				Editor.document.execCommand("LiveResize", true, true);
			}
			catch(e){}
			break;
	}
	setEditorEvent();
	Editor.document.close();
	Editor.focus();
}
function setEditorEventOnLoadUrl()
{	
	if(Editor.document.readyState=="complete")	{
		saveTemp();
		setModeHtml("EDIT");
	}
}
function setEditorEvent()
{
	Editor.document.body.onpaste = onPaste;
	Editor.document.body.onhelp = onHelp;
	Editor.document.onkeydown = new Function("return onKeyDown(Editor.event);");
	Editor.document.body.oncontextmenu = function(){return false;}
	self.document.body.oncontextmenu = function(){return false;}
	self.document.body.onselectstart = function(){return false;}
}

//============================================================================================================

function saveTemp()
{
	var sTemp;
	switch(mSystem["EditMode"])
	{
		case "VIEW":sTemp = Editor.document.body.innerHTML;break;
		case "CODE":sTemp = mSystem["EditorHead"] + Editor.document.body.innerText;break;
		case "EDIT":sTemp = Editor.document.body.innerHTML;break;
		default:sTemp = Editor.document.body.innerHTML;break;
	}
	divSysTemp.innerHTML = sTemp;
}

function getBodyHTML()
{
	var sHTML;
	switch(mSystem["EditMode"])
	{
		case "VIEW":sHTML = Editor.document.body.innerHTML;break;
		case "CODE":sHTML = Editor.document.body.innerText;break;
		case "EDIT":sHTML = Editor.document.body.innerHTML;break;
	}
	return sHTML;
}
function getHTML()
{
	var s;
	switch(mSystem["EditMode"])
	{
		case "VIEW":s = Editor.document.documentElement.innerHTML;break;
		case "CODE":s = Editor.document.documentElement.innerText;break;
		case "EDIT":s = Editor.document.documentElement.innerHTML;break;
	}
	return s;
}
function setHTML(s)
{
	switch(mSystem["EditMode"])
	{
		case "VIEW":Editor.document.body.innerHTML = s;break;
		case "CODE":Editor.document.body.innerText = s;break;
		case "EDIT":Editor.document.body.innerHTML = s;break;
	}
}
function pasteHTML(str)
{
	if(str == "" || str == null)return;
	if(Editor.document.selection.type!="None")	Editor.document.selection.clear();
	Editor.document.selection.createRange().pasteHTML(str);	
}
function appendHTML(str)
{
	if(mSystem["EditMode"] == "CODE"){
		Editor.document.body.insertAdjacentText("beforeEnd",str);
	}else{
		Editor.document.body.insertAdjacentHTML("beforeEnd",str);
	}
}
function pasteWord()
{
	if(!checkMode("EDIT"))return false;
	Editor.focus();
	var sHTML = _ClipBoard.getHTML();
	if (mSystem.SEV >= 5.5){
		pasteHTML(sHTML);
	}
	else if(confirm(eval(getLangText("Alert","0x1001")))){
		pasteHTML(sHTML.clearWordHTML());
	}
	else{
		pasteHTML(sHTML);
	}
}
function pasteText()
{
	if(mSystem["EditMode"]=="VIEW")return false;
	Editor.focus();
	pasteHTML(_ClipBoard.getText());
}
function insertHTML(str) 
{
	if(!checkMode("EDIT"))return false;
	pasteHTML(str);
}
function previewHTML()
{
	if(mSystem["LoadMode"] == "FULLSCREEN")return false;
	if(confirm(getLangText("Alert","0x1007"))){
		var iTempHeight = 400;
		var iTempWidth = 500;
		if(mSystem.SEV >= 5.5)
		{
			var iTempHeight = mSystem["EditorHeight"];
			var iTempWidth = mSystem["EditorWidth"];
		}
		var VIEW_WIN = window.open("about:blank","VIEW_WIN","resizable=yes,left=0,top=0,height="+iTempHeight+",width="+iTempWidth+",scrollbars=yes,status=yes,toolbar=no,menubar=no,location=no");
			VIEW_WIN.document.open();
			VIEW_WIN.document.write(mSystem["EditorHead"]);
			VIEW_WIN.document.body.innerHTML = getBodyHTML();
			VIEW_WIN.document.close();
			VIEW_WIN.focus();
			return true;
	}
	else{
		return false;
	}
}
//============================================================================================================

function onPaste()
{
	if (mSystem["EditMode"] == "EDIT")
	{
		var sHTML = _ClipBoard.getHTML();
		if(sHTML.isWordHTML())
		{
			if (confirm(getLangText("Alert","0x1002"))){
					pasteHTML(sHTML.clearWordHTML()) ;
					return false ;
			}
		}
		return true;
	}
	else{
		pasteHTML(_ClipBoard.getText());
		return false;
	}
}
function onHelp()
{
	ShowDialog('dialog/help.htm','400','300',false)
	return false;
}

function onFormSubmit()
{
	var iLimit = 50000;
	var i = 1;
	var oField = mSystem.mLnk;
	var oForm = mSystem.mForm;
	var sEditorHTML = getHTML();
	//
	sEditorHTML = URLFilters(sEditorHTML);
	if(mSystem["FilterMode"].toLowerCase() == "true") sEditorHTML = Editor_DeCode(sEditorHTML,mSystem["Filters"])
	var re = /^(\w+)(_1)+$/ig;
	if(!re.test(mSystem["LoadLnk"]))_alert("0x0006");
	var sLnkTag = RegExp.$1
	//
	if(sEditorHTML.length > iLimit)
	{
		oField.value = sEditorHTML.substr(0,iLimit);
		sEditorHTML = sEditorHTML.substr(iLimit);
		while (sEditorHTML.length > 0) 
		{
			i++;
			var sEleName = sLnkTag + "_"+ i;
			var oTEXT = oField.document.createElement("<TEXTAREA name='" + sEleName + "'></TEXTAREA>") ;
				oTEXT.style.display = "none";
				oTEXT.value = sEditorHTML.substr(0,iLimit);
				if(eleIsExist(oForm,sEleName)){
					var oOldTEXT = getElement(oForm,sEleName);
						oOldTEXT.value = oTEXT.value;
				}
				else{
					oForm.appendChild(oTEXT);
				}
				sEditorHTML = sEditorHTML.substr(iLimit);
		}
	}
	else
	{
		oField.value = sEditorHTML;
	}
	var sTEXTCOUNT_NAME = sLnkTag  + "_COUNT"
	var oTEXT_COUNT = oField.document.createElement("<Input type=hidden  name='" + sTEXTCOUNT_NAME + "' value='" + i + "'>");
		if(eleIsExist(oForm,sTEXTCOUNT_NAME)){
			var oOldTEXT_COUNT = getElement(oForm,sTEXTCOUNT_NAME);
				oOldTEXT_COUNT.value = i;
		}
		else{
			oForm.appendChild(oTEXT_COUNT);
		}
}

function onFormReset(){document.location.reload();}

function onKeyDown(event)
{
	var key = String.fromCharCode(event.keyCode).toUpperCase();
	if (event.ctrlKey)
	{
		if (key=="+"){
			scrollChange(100);
			return false;
		}
		if (key=="-"){
			scrollChange(-100);
			return false;
		}
		if (key == "R"){
			findReplace();
			return false;
		}
		if (key=="1"){
			setMode("VIEW");
			return false;
		}
		if (key=="2"){
			setMode("CODE");
			return false;
		}
		if (key=="3"){
			setMode("EDIT");
			return false;
		}
	}
	if (event.ctrlKey){
		if ((key == "B")||(key == "I")||(key == "U")){
			return false;
		}
	}
	if(event.keyCode == 27){
		try{
			parent.opener.window;
			parent.close();
			return false;
		}
		catch(e){}
	}
	if(mSystem["EditMode"]!="VIEW")
	{
		if (event.keyCode==13)
		{
			var oSelTextRange = Editor.document.selection.createRange();
			if(Editor.document.selection.type != "Control")
			{
				oSelTextRange.pasteHTML("<BR>");
				event.cancelBubble = true;
				event.returnValue = false;
				oSelTextRange.select();
				oSelTextRange.moveEnd("character", 1);
				//oSelTextRange.moveStart("character", 1);
				//oSelTextRange.collapse(false);
			}
			return false;
		}
	}
	return true;
}

//============================================================================================================

function zPosition()
{
	if(!checkMode("EDIT"))return false;
	if (Editor.document.selection.type != "Control") return;
	var obj	= null;
	var oRange	= Editor.document.selection.createRange();
	for (var i=0; i<oRange.length; i++)
	{
		obj = oRange.item(i);
		if (obj.style.position != "absolute") {
			obj.style.position="absolute";
		}else{
			obj.style.position="static";
		}
	}
}
function zIndex(action){
	if(!checkMode("EDIT"))return false;
	var obj	= null;
	if(Editor.document.selection.type != "Control") return;
	var oRange	= Editor.document.selection.createRange();
	for(var i=0; i<oRange.length; i++)
	{
		obj = oRange.item(i);
		obj.style.position="absolute";
		if (action == '+'){
			obj.style.zIndex  += 1;
		}
		else{
			obj.style.zIndex  -= 1;
		}
	}
}
function findReplace(){
	if(mSystem.SEV < 5.5){return _alert("0x1004");}
	ShowDialog("dialog/findreplace.htm", 320, 165, false);
}
function createLink(){
	if(!checkMode("EDIT"))return false;
	if (Editor.document.selection.type == "Control")
	{
		var oControlRange = Editor.document.selection.createRange();
		if (oControlRange(0).tagName.toUpperCase() != "IMG"){return _alert("0x1005");}
	}
	ShowDialog("dialog/hyperlink.htm", 350, 170, true);
}
function mapEdit(){
	if(!checkMode("EDIT"))return false;
	if(mSystem.SEV < 5.5){return _alert("0x1004");}
	var oControlRange = Editor.document.selection.createRange();
	if (Editor.document.selection.type != "Control" ||oControlRange(0).tagName.toUpperCase() != "IMG"){return _alert("0x1006");}
	window.open("dialog/map.htm", 'mapEdit', 'toolbar=no,location=no,directories=no,status=not,menubar=no,scrollbars=no,resizable=yes,width=450,height=300');
	return true;
}
function Maximize(){
	try{
		if(parent.opener == null || parent.opener.parent.opener == null){
    		var oWin = window.open("dialog/fullscreen.htm", "fs" + mSystem["LoadLnk"] , 'toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,fullscreen==yes');
		}
	}
	catch(e){}
}
function Minimize()
{
	try{
		if(parent.opener.window){parent.Minimize();}
	}
	catch(e){}
}
function ShowDialog(sURL, iWidth, iHeight ,bCheck)
{
	if(bCheck && !checkMode("EDIT")){return false;}
	if(mSystem["EditMode"]=="VIEW"){if(confirm(getLangText("Alert","0x1003"))){setMode("EDIT");}return false;}
	Editor.focus();
	var oDialog = showModalDialog(sURL, window, "dialogWidth:" + iWidth.toString() + "px;dialogHeight:" + iHeight.toString() + "px;help:no;scroll:no;status:no");
	Editor.focus();
	return oDialog;
}
function ExecCommand(bCheck,sCmd,sValue){
	if(bCheck && !checkMode("EDIT"))return false;
	if(mSystem["EditMode"]=="VIEW"){if(confirm(getLangText("Alert","0x1003"))){setMode("EDIT");}return false;}
	Editor.focus();
	if (sValue==null){
		var b = Editor.document.execCommand(sCmd);
	}
	else{
		var b = Editor.document.execCommand(sCmd,"",sValue);
	}
	Editor.focus();
	return b;
}
function scrollChange(size)
{
	if(mSystem.SEV < 5.5){return _alert("0x1004");}
	var obj = mSystem["EDITORFRAME"];
	var height = parseInt(obj.offsetHeight);
	if((height + size)>200)obj.height = height + size;
}

function doEditorZoom(size){
	try{
		Editor.document.body.runtimeStyle.zoom = size + "%";
		mSystem["ZoomSize"] = size;
	}
	catch(e){}
}

//============================================================================================================

function setModeBtn(sMode)
{
	try{
		var sModeBtnName = "ModeBtn_" + sMode;
		if(mSystem["LastModeBtn"]!=null){document.all[mSystem["LastModeBtn"]].className = "ModeBtnUp";}
		document.all[sModeBtnName].className = "ModeBtnDown";
		mSystem["LastModeBtn"] = sModeBtnName;
	}
	catch(e){}
}
function onBtnMouseOver()
{
	var oBtn = event.srcElement.parentElement;
	if(oBtn.tagName == "DIV")
	{
		oBtn.className = "ImgBtnUp";
		event.cancelBubble=true;
	}
}
function onBtnMouseOut()
{
	var oBtn = event.srcElement.parentElement;
	if(oBtn.tagName == "DIV")
	{
		oBtn.className = "ImgBtn";
		event.cancelBubble=true;
	}
}
function onBtnMouseDown()
{
	var oBtn = event.srcElement.parentElement;
	if(oBtn.tagName == "DIV")
	{
		oBtn.className = "ImgBtnDown";
		event.cancelBubble=true;
	}
}
function onBtnMouseUp()
{
	var oBtn = event.srcElement.parentElement;
	if(oBtn.tagName == "DIV")
	{
		oBtn.className = "ImgBtnUp";
		event.cancelBubble=true;
	}
}
function mCancelEvent(){
	event.returnValue=false;
	event.cancelBubble=true;
	return false;
}
function InitBtn(btn){
	btn.onmouseover = onBtnMouseOver;
	btn.onmouseout = onBtnMouseOut;
	btn.onmousedown = onBtnMouseDown;
	btn.onmouseup = onBtnMouseUp;
}
function attachCancelEvent(obj)
{
	obj.ondragstart = mCancelEvent;
	obj.onselectstart = mCancelEvent;
	obj.onselect = mCancelEvent;
}
function listToolbar()
{
	var posLeft = 2, posTop = 2;

	for(i=0;i<document.all.mToolbar.rows.length;i++)
	{
		var currRow = mToolbar.rows[i];
		var currCell = currRow.firstChild;
			currCell.innerHTML += "&nbsp;";
			attachCancelEvent(currRow);
		for(j=0;j<currCell.childNodes.length;j++)
		{
			var currObject = currCell.childNodes[j];
				switch(currObject.className)
				{
					case "TBHandle":
							currObject.style.posLeft = posLeft;
							currObject.style.posTop = posTop + 1;
							posLeft += currObject.offsetWidth + 2;
							break;
					case "TBSep":
							currObject.style.posLeft = posLeft;
							currObject.style.posTop = posTop + 1;
							posLeft += currObject.offsetWidth + 2;
							break;
					case "TBGen":
							currObject.style.posLeft = posLeft;
							currObject.style.posTop = posTop + 1;
							posLeft += currObject.offsetWidth + 2;
							break;
					case "ImgBtn":
							if(mSystem["LoadMode"] == "FULLSCREEN" && currObject.id == "Maximize"){document.all.Maximize.style.display="none";break}
							if(mSystem["LoadMode"] != "FULLSCREEN" && currObject.id == "Minimize"){document.all.Minimize.style.display="none";break}
							currObject.style.posLeft = posLeft;
							currObject.style.posTop = posTop;
							posLeft += currObject.offsetWidth + 2;
							InitBtn(currObject);
							break;
					default:
							if(typeof(currObject.className) != "undefined")
							{
								currObject.style.posLeft = posLeft;
								currObject.style.posTop = posTop;
								posLeft += currObject.offsetWidth + 2;
							}
							break;
				}
		}
		posLeft = 2;
		posTop +=  currCell.offsetHeight;
	}
}