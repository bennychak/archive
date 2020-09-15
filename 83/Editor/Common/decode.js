
function Editor_DeCode(sContent,sFilters)
{
	var sContent2 = sContent;
	var arrFilters = sFilters.split("|");
	if(sContent2==null||sContent2=="")
	{
		return "";
	}
	else
	{
		for(var i=0;i<arrFilters.length;i++)
		{
			sContent2 = mDecode(sContent2,arrFilters[i]);
		}
		return sContent2;
	}
}

function mDecode(sHTML, sFliter)
{
	switch(sFliter.toUpperCase())
	{
		case "CLASS":
			sHTML = mRplace("(<[^>]+) class=[^ |^>]*([^>]*>)", "$1 $2", sHTML) ;
			break;
		case "STYLE":
			sHTML = mRplace("(<[^>]+) style=\"[^\"]*\"([^>]*>)", "$1 $2", sHTML);
			break;
		case "SCRIPT":
			sHTML = mRplace("</?script[^>]*>", "", sHTML);
			sHTML = mRplace("(javascript|jscript|vbscript|vbs):", "$1:", sHTML);
			sHTML = mRplace("on(mouse|exit|error|click|key)", "<I>on$1</I>", sHTML);
			sHTML = mRplace("&#", "<I>&#</I>", sHTML);
			break;
		case "TABLE":
			sHTML = mRplace("</?table[^>]*>", "", sHTML);
			sHTML = mRplace("</?tr[^>]*>", "", sHTML);
			sHTML = mRplace("</?th[^>]*>", "", sHTML);
			sHTML = mRplace("</?td[^>]*>", "", sHTML);
			break;
		case "XML":	
			sHTML = mRplace("<\\?xml[^>]*>", "", sHTML);
			break;
		case "NAMESPACE":
			sHTML = mRplace("<\/?[a-z]+:[^>]*>", "", sHTML);
			break;
		case "FONT":
			sHTML = mRplace("</?font[^>]*>", "", sHTML);
			break;
		case "MARQUEE":
			sHTML = mRplace("</?marquee[^>]*>", "", sHTML);
			break;
		case "OBJECT":
			sHTML = mRplace("</?object[^>]*>", "", sHTML);
			sHTML = mRplace("</?param[^>]*>", "", sHTML);
			sHTML = mRplace("</?embed[^>]*>", "", sHTML);
			break;
		default:
	}
	return sHTML;
}

function mRplace(re, rp, s) 
{
	var RE = new RegExp(re, "ig");
	return s.replace(RE, rp);
}
