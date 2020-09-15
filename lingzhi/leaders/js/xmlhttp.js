function GetReady(){
	if(xh.readyState==4){
		var strResult = unescape(xh.responseText);
		var arrResult = strResult.split("|");

		var insertstr=""
		for(var i=0;i<arrResult.length;i++){
			tmpResult=arrResult[i].split("~")
			insertstr=insertstr+"<tr onClick=\"selectcell(this)\" id="+tmpResult[1]+">\n<td class=\"black\" style=\"padding-left:10pt;cursor:pointer\" >"+tmpResult[0]+"</td>\n</tr>\n";
		}
		tbl.innerHTML=""
		insertstr="	<table width=\"95%\" border=\"0\" cellspacing=\"2\" cellpadding=\"2\">"+insertstr+"</table>"
		
		tbl.innerHTML=insertstr
	}
	else{
		tbl.innerHTML="<br>　　正在装载栏目数据，请稍侯.......<br><br>"
	}
}

function GetResult(item,flag){
	var newid,stationlevel
	newid=item.id.split("_")[1]

	var obj =eval(item.id+"_sub");

	if(item.id.substr(0,1)=="s"){
		tbl=eval("station_"+newid)
		stationlevel=1
	}
	else{
		tbl=eval("basic_"+newid)
		stationlevel=0
	}
	
	if(obj.style.display==""){
		obj.style.display="none";
	}
	else{
		obj.style.display="";
		if (flag){
			xh = new ActiveXObject("Microsoft.XMLHTTP");
			xh.onreadystatechange = GetReady
			xh.open("POST","readata.asp?"+"type=station"+"&id="+newid+"&stationlevel="+stationlevel,true);
			xh.send();
		}
	}
}