function externallinks() { 
 if (!document.getElementsByTagName) return; 
 var anchors = document.getElementsByTagName("a"); 
 for (var i=0; i<anchors.length; i++) { 
   var anchor = anchors[i]; 
   if (anchor.getAttribute("href") && 
       anchor.getAttribute("rel") == "external") 
     anchor.target = "_blank"; 
 } 
} 
window.onload = externallinks;
//<a href="http://" rel="external">_blank</a>

function swf_src(src,wid,hei)
{
    if("\v"=="v"){
        document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="'+wid+'" height="'+hei+'"><param name="wmode" value="Opaque"/><param name="movie" value="'+src+'"><param name="quality" value="high"><embed src="'+src+'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="Opaque" width="'+wid+'" height="'+hei+'"></embed></object>');
    }else{
        document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="'+wid+'" height="'+hei+'"><param name="wmode" value="window"/><param name="movie" value="'+src+'"><param name="quality" value="high"><embed src="'+src+'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="window" width="'+wid+'" height="'+hei+'"></embed></object>');
    }
	
}
//function swf_src(src,wid,hei)
//{
//	document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="'+wid+'" height="'+hei+'"><param name="wmode" value="transparent"/><param name="movie" value="'+src+'"><param name="quality" value="high"><embed src="'+src+'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" width="'+wid+'" height="'+hei+'"></embed></object>');
//}
//window\Opaque\transparent
//对于需要使用输入法的flash游戏来说只能使用window模式，其它模式都会使输入法失效。
//<script type="text/javascript" language="javascript">swf_src("images/flash.swf","184","70");< /script>


