<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../Connections/bien.asp" -->
<%
Dim music
Dim music_numRows

Set music = Server.CreateObject("ADODB.Recordset")
music.ActiveConnection = MM_bien_STRING
music.Source = "SELECT date, music, name FROM music ORDER BY date DESC"
music.CursorType = 0
music.CursorLocation = 2
music.LockType = 1
music.Open()

music_numRows = 0
%>
<!--重复区域 -->
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 10
Repeat1__index = 0
music_numRows = music_numRows + Repeat1__numRows
%>
<!--重复区域 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Musique de Bienfantaisie</title>
<meta name="Author" content="ExoBUD, Jinwoong Yu">
<meta name="Keywords" content="ExoBUD MP">
<meta name="Description" content="asf,asx,wma,wmx,wmv,wvx,mp3,wav,mid 网站媒体播放程序">
<link rel="stylesheet" type="text/css" href="exobud.css">
<!-- 
============================================================【程序信息及版权宣告】====
ExoBUD MP(II) v4.1tc+ [Traditional Chinese Version]
Copyright(Pe) 1999-2003 Jinwoong Yu[ExoBUD], Kendrick Wong[kiddiken.net].yune_lee[liyu.net]
======================================================================================
程序原作者: 庾珍雄(Jinwoong Yu) 
个人网站: http://exobud.nayana.org 
电子邮件: exobud@hanmail.net
繁体中文化作者: 惊直(Kendrick Wong/kiddiken)
个人网站: http://kiddiken.net
电子邮件: webmaster@kiddiken.net
简体中文化作者: liyu(yune_lee)
个人网站: http://www.liyu.net
电子邮件: yune_lee@163.net
0ICQ 账号: 4410162
发表日期: 2003.01.10(此版本原韩文版) 
发表日期: 2003.03.23(繁体中文首个版本)
发表日期: 2003.05.22(简体中文首个版本)
======================================================================================
版权所有。
请尊重智慧财产权： 无论您对本程序 ExoBUD MP(II) 作任何修改、制作(或翻译)面板，请您
*必须*保留此段版权宣告的内容，包括程序(及面板)原作者及中文化作者的名字和网站连结。
如果您想要以繁体中文版或简体中文版的程序为基础，翻译成其它语言的版本，及／或在因特网上，
公开发表您所修改过的版本，请您首先以传送电子邮件的方式，征求我们的同意。
请不要将程序(或面板)原作者或中文化作者的名字改成您自己的名字，
然后以另一程序名称重新命名后在网络上公开发表及散播本程序，因为这是严重的侵权行为。
这是公益免费程序，所以请不要使用在商业用途上。
另外，您亦不可将本程序(全部或部份)复制到其它储存媒体(例如光盘片)上作贩卖获利用途。
假如因为使用本程序而令您蒙受数据遗失或损毁，程序原作者及中文化作者均不用对其负责。
============================================================【面板(Skin)制作信息】====
ExoBUD MP(II) v4.1tc+ CSS自由创作版 (Custom-CSS Version, v1.0)
======================================================================================
程序原作者: 庾珍雄(Jinwoong Yu) 
个人网站: http://exobud.nayana.org 
电子邮件: exobud@hanmail.net
繁体中文化作者: 惊直(Kendrick Wong/kiddiken)
个人网站: http://kiddiken.net
电子邮件: webmaster@kiddiken.net
简体中文化作者: liyu(yune_lee)
个人网站: http://www.liyu.net
电子邮件: yune_lee@163.net
0ICQ 账号: 4410162
发表日期: 2003.01.10(此版本原韩文版) 
发表日期: 2003.03.23(繁体中文首个版本)
发表日期: 2003.05.22(简体中文首个版本)
======================================================================================
『CSS自由创作版』的意思是让您透过修改播放面板的样式表 (Custom Style Sheet)，
根据您的需要自行设计您想要的模样。此版本之特点为面板上的按钮不是以图文件显示，
而是以窗体方式的按钮显示，所以您可随时修改样式表的设定来变换播放面板的外观！
使用此面板播放器的相关注意事项：
1. 此版本播放器，加入了可将显示媒体标题和时间长度的方块隐藏的功能，达致减少
占用页面空间的目的。您可以视乎需要，选择是否要将方块隐藏起来。
2. 此版本的设计，是以窗体按钮代替以图文件的方式来显示播放面板上的按钮，所以在
imgchg.js 和 exobud.js 这两个档案，都没有关于动态按钮 (Roll Over) 图档的
程序代码部份 (显示播放状态的 Scope 图档除外)。如果您想要以图文件来显示按钮，
建议您使用其它版本的播放器。
3. 由于这个面板是以窗体的方式来显示媒体标题，如果您在设定播放清单项目的媒体
标题时使用了像 &#12345; 这些句柄，程序是不会自动转换成您想要的字符的。
所以您只可以使用繁体中文或英数字元来设定媒体标题。
======================================================================================
-->
<!-- 加载 ExoBUD MP(II) 主程序 -->
<script language="JavaScript" src="exobud.js"></script>
<!-- 加载 ExoBUD MP(II) 基本设定档 -->
<script language="JavaScript" src="exobudset.js"></script>
<!-- 加载 ExoBUD MP(II) 播放清单设定文件 -->

<script language="JavaScript">
<% 
While ((Repeat1__numRows <> 0) AND (NOT music.EOF)) 
%>
mkList("<%=(music.Fields.Item("music").Value)%>","<%=(music.Fields.Item("name").Value)%>");
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  music.MoveNext()
Wend
%>
</script>

<!-- 如果您不熟悉原始码编辑，请勿随便修改下面使用 JScript 的部份，否则可能会导致程序不能正常运作 -->
<script language="JScript" for="Exobud" event="openStateChange(sf)">evtOSChg(sf);</script>
<script language="JScript" for="Exobud" event="playStateChange(ns)">evtPSChg(ns);</script>
<script language="JScript" for="Exobud" event="error()">evtWmpError();</script>
<script language="JScript" for="Exobud" event="Buffering(bf)">evtWmpBuff(bf);</script>
<!-- 加载「动态按钮图文件切换」的 JavaScript 程序文件 -->
<script language="JavaScript" src="imgchg.js"></script>
</head>
<!-- 当您将这个媒体播放器嵌入您的网站使用时，建议预留 640~760px(像素) 的宽度
乘以 20~25px(像素) 的高度 (在不使用字幕功能的情况下) 来设计框架的内容。 -->
<body background="../image/musicbg.gif" onLoad="initExobud();" onDragStart="return false" onSelectStart="return false"
topmargin=0 leftmargin=0 marginwidth=0 marginheight=0>
<object id="Exobud" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6"
type="application/x-oleobject" width="0" height="0"
style="position:relative;left:0px;top:0px;width:0px;height:0px;">
<param name="autoStart" value="true">
<param name="balance" value="0">
<param name="currentPosition" value="0">
<param name="currentMarker" value="0">
<param name="enableContextMenu" value="false">
<param name="enableErrorDialogs" value="false">
<param name="enabled" value="true">
<param name="fullScreen" value="false">
<param name="invokeURLs" value="false">
<param name="mute" value="false">
<param name="playCount" value="1">
<param name="rate" value="1">
<param name="uiMode" value="none">
<param name="volume" value="100">
</object>
<table height=20 align=center cellpadding=0 cellspacing=0 border=0>
<form name="exobudform">
<tr>
<td height=20>
<!-- 显示媒体标题的方块：
您可以透过修改 style 属性里面的样式设定来做一些个人喜好的调整。 -->
<input type="text" class="title" id="disp1" value="" readonly style="height:18;width:250;cursor:crosshair">
<!-- 显示时间长度的方块：
假如媒体的时间长度超过一小时，请将 width 的数值适当地增加，令信息可以显示得完整。 -->
<input type="button" class="time" id="disp2" value="" title="时间长度显示方式 (正常/倒数)"
onClick="chgTimeFmt()" style="width:90;height:18;cursor:hand">
</td>
<!-- 显示播放状态的 Scope 动态图文件：
如果您想要变更这个图档，请同时参考及修改 imgchg.js 接近檔末的部份。 -->
<td width=30 height=20 align=center
><img name="scope" src="./img/scope_off.gif" width=17 height=16
onClick="vizExobud()" style="cursor:help" title="Chez Bienfantaisie"
></td>
<!-- 播放器控制面板上的所有按钮：
这些按钮都是以窗体的方式来显示的，您不能把按钮改以图文件的方式来显示。 -->
<td height=20 nowrap>
<!-- 音量控制按钮 -->
<input type="button" class ="buttons" name="vmute" value="静音" title="静音模式"
onClick="wmpMute()" style="height:18;cursor:hand"
><input type="button" class ="buttons" name="vdn" value="▼" title="减少音量"
onClick="wmpVolDn()" style="height:18;cursor:hand"
><input type="button" class ="buttons" name="vup" value="▲" title="增加音量"
onClick="wmpVolUp()" style="height:18;cursor:hand">
<!-- 播放模式按钮 -->
<input type="button" class ="buttons" name="pmode" value="" title="播放顺序 (循序 随机)"
onClick="chgPMode()" style="height:18;cursor:hand"
><input type="button" class ="buttons" name="rept" value="循环" title="切换是否重复播放目前的曲目"
onClick="chkRept()" style="height:18;cursor:hand">
<!-- 基本操作按钮 -->
<input type="button" class ="buttons" name="prevt" value="上一曲" title="上一首曲目"
onClick="playPrev()" style="height:18;cursor:hand"
><input type="button" class ="buttons" name="pauzt" value="暂停" title="暂停．继续"
onClick="wmpPP()" style="height:18;cursor:hand"
><input type="button" class ="buttons" name="stopt" value="停止" title="停止"
onClick="wmpStop()" style="height:18;cursor:hand"
><input type="button" class ="buttons" name="playt" value="播放" title="播放"
onClick="startExobud()" style="height:18;cursor:hand"
><input type="button" class ="buttons" name="nextt" value="下一曲" title="下一首曲目"
onClick="playNext()" style="height:18;cursor:hand">
<!-- 播放清单按钮 -->
<input type="button" class ="buttons" name="plist" value="清单" title="显示播放清单内容"
onClick="openPlist()" style="height:18;cursor:hand">
</td>
</tr>
<tr>
<td colspan=3 height=0>
<!-- 显示字幕框的部份：
如果您想要使用字幕功能，您便需要预留页面一些空间用来显示这个字幕框。
无论您是否使用字幕功能，请勿随便修改或删除下面这段 DIV 区块的语法。 -->
<div id="capText" style="width:100%;height:60;color:white;background-color:#555555;padding-top:3px;padding-left:5px;display:none"
>ExoBUD MP(II) 字幕显示系统(SMI)</div>
</td>
</tr>
</form>
</table>
</body>
</html>
<%
music.Close()
Set music = Nothing
%>
