//����������������������������������
//��                                                              ��
//�� JScript �������п�	Version 1.0                               ��
//��                                                              ��
//�� Code by Chris.J(�Ƽ�¡)                                      ��
//��                                                              ��
//����������������������������������

//=============================================================================================
//	********************* �ַ����ӻ������� *********************
//=============================================================================================


//=============================================================================================
//	�ж��ַ��Ƿ�Ϊ��
//=============================================================================================
function String.prototype.isEmpty()
{
	if(this == null)
		return true;
	else
		return this.trim()=="";
}
function String.isEmpty(str)
{
	if(typeof(str)=="undefined")
		return true;
	else
		return str.isEmpty();
}

//=============================================================================================
//	ȥ������ַ�(�൱��VBScript��LTrim())
//=============================================================================================
function String.prototype.lTrim()
{
	return this.replace(/^(\x20+)([^\x20]+)/,"$2");
}
function String.lTrim(str){return str.lTrim();}

//=============================================================================================
//	ȥ������ַ�(�൱��VBScript��RTrim())
//=============================================================================================
function String.prototype.rTrim()
{
	return this.replace(/([^\x20]+)(\x20+)$/,"$1");
}
function String.rTrim(str){return str.rTrim();}

//=============================================================================================
//	ȥ������ַ�(�൱��VBScript��Trim())
//=============================================================================================
function String.prototype.trim()
{
	var re = /(^(\x20+))(.*[^\x20])((\x20+)$)/g;
	return this.replace(re,"$3");
	//return this.lTrim().rTrim();
}
function String.trim(str){return str.trim();}

//=============================================================================================
//	ȡ˫�ֽ��ַ��ĳ���
//=============================================================================================
function String.prototype.len()
{
	var re = /[^\x00-\xff]/g;
	return this.replace(re,"aa").length;
}
function String.len(str){return str.len();}


//=============================================================================================
//	�Ƿ�Ϊ����
//=============================================================================================
function String.prototype.isNumber()
{
	var re = /^([0-9]+)$/g;
	return re.test(this);
}
function String.isNumber(str){return str.toString().isNumber();}

//=============================================================================================
//	�Ƿ�Ϊ����ֵ
//=============================================================================================
function String.prototype.isBoolean()
{
	var re = /^((true)|(false)|(yes)|(no)|(1)|(0)){1}$/i;
	return re.test(this);
}
function String.isBoolean(str){return str.isBoolean();}

//=============================================================================================
//	�Ƿ�ΪEmail��ʽ���ַ�
//=============================================================================================
function String.prototype.isEmail()
{
	var re = /^(\w+)\@(\w+)(\.\w+)+$/;
	return re.test(this);
}
function String.isEmail(str){return str.isEmail();}

//=============================================================================================
//	�Ƿ�Ϊ���ڸ�ʽ
//=============================================================================================
function String.prototype.isDate()
{
	var re=/^(\d{4})-(\d{1,2})-(\d{1,2})$/;
	if(!re.test(this)){return false;}
	else{
		var iY = parseInt(RegExp.$1);
		var iM = parseInt(RegExp.$2)-1;
		var iD = parseInt(RegExp.$3);
		var DATE = new Date(iY,iM,iD)
		return DATE.getYear()==iY&&DATE.getMonth()==iM&&DATE.getDate()==iD;
	}
}
function String.isDate(str){return str.isDate();}

//=============================================================================================
//	�Ƿ��а��������ַ�
//=============================================================================================
function String.prototype.isBg2312()
{
	var re = /[\u4e00-\u9fa5]+/g;
	return re.test(this);
}
function String.isBg2312(str){return str.isBg2312();}

//=============================================================================================
//	�Ƿ��а���˫�ֽ��ַ�(��������)
//=============================================================================================
function String.prototype.isDoubleByte()
{
	var re = /[^\x00-\xff]/g;
	return re.test(this);
}
function String.isDoubleByte(str){return str.isDoubleByte();}

//=============================================================================================
//	�Ƿ��а���ȫ���ַ�
//=============================================================================================
function String.prototype.isSBC()
{
	var re = /[\uFF00-\uFFFF]/g;
	return re.test(this);
}
function String.isSBC(str){return str.isSBC();}

//=============================================================================================
//	�Ƿ�Ϊ��ȫ�ַ�
//=============================================================================================
function String.prototype.isSafe()
{
	var re = /[\&\?\%\,\.\;\:\'\"\`\~\!\@\#\$\^\*\<\>\(\)\{\}\[\]\|\\\/\+\=\-\n\r\f\t\v]/g;
	return !re.test(this);
}
function String.isSafe(str){return str.isSafe();}

//=============================================================================================
//	�Ƿ�Ϊ��ȫ��SQL���
//=============================================================================================
function String.prototype.isSafeSQL()
{
	var re = /[\'\"\;]/g;
	return !re.test(this);
}
function String.isSafeSQL(str){return str.isSafeSQL();}

//=============================================================================================
//	�Ƿ�Ϊ��ɫֵ
//=============================================================================================
function String.prototype.isColor()
{
	var re = /\#[a-fA-F0-9]{6}/;
	return re.test(this);
}
function String.isColor(str){return str.isColor();}

//=============================================================================================
//	�Ƿ�Ϊ��׼��URL
//=============================================================================================
function String.prototype.isURL()
{
	var re = /^((\w+):\/\/)(\w+)/;
	return re.test(this);
}
function String.isURL(str){return str.isURL();}

//=============================================================================================
//	�Ƿ�Ϊ��׼��HTTPURL
//=============================================================================================
function String.prototype.isHTTPURL()
{
	var re = /^(HTTP:\/\/)(\w+)/ig;
	return re.test(this);
}
function String.isHTTPURL(str){return str.isHTTPURL();}


//=============================================================================================
//	********************* �ַ�����,����,���˲��� *********************
//=============================================================================================




//=============================================================================================
//	�Ƿ�ΪWord��ʽ���ַ���
//=============================================================================================
function String.prototype.isWordHTML()
{
	var re = /<\w[^>]* class="?MsoNormal"?/gi;
	return re.test(this);
}
function String.isWordHTML(str){return str.isWordHTML();}


//=============================================================================================
//	���Word��ǩ
//=============================================================================================
function String.prototype.clearWordHTML()
{
	var sHTML = this;
		sHTML = sHTML.replace(/&nbsp;/," ");
		sHTML = sHTML.replace(/<\/?SPAN[^>]*>/gi, "");
		sHTML = sHTML.replace(/<(\w[^>]*) class=([^ |>]*)([^>]*)/gi, "<$1$3");
		sHTML = sHTML.replace(/<(\w[^>]*) style="([^"]*)"([^>]*)/gi, "<$1$3");
		sHTML = sHTML.replace(/<(\w[^>]*) lang=([^ |>]*)([^>]*)/gi, "<$1$3");
		sHTML = sHTML.replace(/<\\?\?xml[^>]*>/gi, "");
		sHTML = sHTML.replace(/<\/?\w+:[^>]*>/gi, "");
		try{
			var re = new RegExp("(<P)([^>]*>.*?)(<\/P>)","gi")
			if(re.test(sHTML))sHTML = sHTML.replace( re,"<div$2</div>");
		}
		catch(e){}
	return sHTML;
}
function String.clearWordHTML(str){return str.clearWordHTML();}

//=============================================================================================
//	��HTML����(������ӡ�ַ�)����ת��ΪHTMLʵ���ַ�
//=============================================================================================
function String.prototype.HTMLEncode()
{
	var sTemp;
	sTemp = this.replace(/&/g, "&amp;") ;
	sTemp = sTemp.replace(/"/g, "&quot;") ;
	sTemp = sTemp.replace(/</g, "&lt;") ;
	sTemp = sTemp.replace(/>/g, "&gt;") ;
	sTemp = sTemp.replace(/'/g, "&#146;") ;
	sTemp = sTemp.replace(/\x20/g,"&nbsp;");
	sTemp = sTemp.replace(/(\n|\f|\r)/g,"<br>");
	sTemp = sTemp.replace(/\t/g,"&nbsp;&nbsp;&nbsp;&nbsp;");
	return sTemp;
}
function String.HTMLEncode(str){return str.HTMLEncode();}

//=============================================================================================
//	��HTMLʵ���ַ�����ת��ΪHTML����
//=============================================================================================
function String.prototype.HTMLDecode()
{
	var sTemp;
	sTemp = this.replace("&amp;","&");
	sTemp = sTemp.replace("&quot;",'"');
	sTemp = sTemp.replace("&lt;","<");
	sTemp = sTemp.replace("&gt;,">"");
	sTemp = sTemp.replace("&#146;","'");
	sTemp = sTemp.replace("&nbsp;"," ");
	return sTemp;
}
function String.HTMLDecode(str){return str.HTMLDecode();}




//=============================================================================================
//	********************* ���ܺ��� ( һ ) *********************
//=============================================================================================




//=============================================================================================
//	���������ַ���
//=============================================================================================
function getDateString(oDate,sTsep)
{
	var sDate = oDate.getYear().toString();
		sDate += sTsep + formatString((oDate.getMonth()+1).toString(),"0",2);
		sDate += sTsep + formatString(oDate.getDate().toString(),"0",2);
	return sDate;
}

//=============================================================================================
//	����ʱ���ַ���
//=============================================================================================
function getTimeString(oDate,sTsep)
{
	var sTime = oDate.getHours().toString();
		sTime += sTsep + formatString(oDate.getMinutes().toString(),"0",2);
		sTime += sTsep + formatString(oDate.getSeconds().toString(),"0",2);
	return sTime;
}

//=============================================================================================
//	��������ַ���(<16λ)
//=============================================================================================
function getRndString(iLen)
{
	var s = Math.random().toString();
	return s.substr(2,iLen);
}

//=============================================================================================
//	��ʽ���ַ��� formatString("aaa","#",5)  ���� return "##aaa"
//=============================================================================================
function formatString(s1,s2,iLen)
{
	for(;s1.length<iLen;){
		s1 = s2.toString() + s1;
	}
	return s1;
}




