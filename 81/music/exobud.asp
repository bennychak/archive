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
<!--�ظ����� -->
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 10
Repeat1__index = 0
music_numRows = music_numRows + Repeat1__numRows
%>
<!--�ظ����� -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Musique de Bienfantaisie</title>
<meta name="Author" content="ExoBUD, Jinwoong Yu">
<meta name="Keywords" content="ExoBUD MP">
<meta name="Description" content="asf,asx,wma,wmx,wmv,wvx,mp3,wav,mid ��վý�岥�ų���">
<link rel="stylesheet" type="text/css" href="exobud.css">
<!-- 
============================================================��������Ϣ����Ȩ���桿====
ExoBUD MP(II) v4.1tc+ [Traditional Chinese Version]
Copyright(Pe) 1999-2003 Jinwoong Yu[ExoBUD], Kendrick Wong[kiddiken.net].yune_lee[liyu.net]
======================================================================================
����ԭ����: ������(Jinwoong Yu) 
������վ: http://exobud.nayana.org 
�����ʼ�: exobud@hanmail.net
�������Ļ�����: ��ֱ(Kendrick Wong/kiddiken)
������վ: http://kiddiken.net
�����ʼ�: webmaster@kiddiken.net
�������Ļ�����: liyu(yune_lee)
������վ: http://www.liyu.net
�����ʼ�: yune_lee@163.net
0ICQ �˺�: 4410162
��������: 2003.01.10(�˰汾ԭ���İ�) 
��������: 2003.03.23(���������׸��汾)
��������: 2003.05.22(���������׸��汾)
======================================================================================
��Ȩ���С�
�������ǻ۲Ʋ�Ȩ�� �������Ա����� ExoBUD MP(II) ���κ��޸ġ�����(����)��壬����
*����*�����˶ΰ�Ȩ��������ݣ���������(�����)ԭ���߼����Ļ����ߵ����ֺ���վ���ᡣ
�������Ҫ�Է������İ��������İ�ĳ���Ϊ������������������Եİ汾�����������������ϣ�
�������������޸Ĺ��İ汾�����������Դ��͵����ʼ��ķ�ʽ���������ǵ�ͬ�⡣
�벻Ҫ������(�����)ԭ���߻����Ļ����ߵ����ָĳ����Լ������֣�
Ȼ������һ�������������������������Ϲ�������ɢ����������Ϊ�������ص���Ȩ��Ϊ��
���ǹ�����ѳ��������벻Ҫʹ������ҵ��;�ϡ�
���⣬���಻�ɽ�������(ȫ���򲿷�)���Ƶ���������ý��(�������Ƭ)��������������;��
������Ϊʹ�ñ��������������������ʧ����٣�����ԭ���߼����Ļ����߾����ö��为��
============================================================�����(Skin)������Ϣ��====
ExoBUD MP(II) v4.1tc+ CSS���ɴ����� (Custom-CSS Version, v1.0)
======================================================================================
����ԭ����: ������(Jinwoong Yu) 
������վ: http://exobud.nayana.org 
�����ʼ�: exobud@hanmail.net
�������Ļ�����: ��ֱ(Kendrick Wong/kiddiken)
������վ: http://kiddiken.net
�����ʼ�: webmaster@kiddiken.net
�������Ļ�����: liyu(yune_lee)
������վ: http://www.liyu.net
�����ʼ�: yune_lee@163.net
0ICQ �˺�: 4410162
��������: 2003.01.10(�˰汾ԭ���İ�) 
��������: 2003.03.23(���������׸��汾)
��������: 2003.05.22(���������׸��汾)
======================================================================================
��CSS���ɴ����桻����˼������͸���޸Ĳ���������ʽ�� (Custom Style Sheet)��
����������Ҫ�����������Ҫ��ģ�����˰汾֮�ص�Ϊ����ϵİ�ť������ͼ�ļ���ʾ��
�����Դ��巽ʽ�İ�ť��ʾ������������ʱ�޸���ʽ����趨���任����������ۣ�
ʹ�ô���岥���������ע�����
1. �˰汾�������������˿ɽ���ʾý������ʱ�䳤�ȵķ������صĹ��ܣ����¼���
ռ��ҳ��ռ��Ŀ�ġ��������Ӻ���Ҫ��ѡ���Ƿ�Ҫ����������������
2. �˰汾����ƣ����Դ��尴ť������ͼ�ļ��ķ�ʽ����ʾ��������ϵİ�ť��������
imgchg.js �� exobud.js ��������������û�й��ڶ�̬��ť (Roll Over) ͼ����
������벿�� (��ʾ����״̬�� Scope ͼ������)���������Ҫ��ͼ�ļ�����ʾ��ť��
������ʹ�������汾�Ĳ�������
3. �������������Դ���ķ�ʽ����ʾý����⣬��������趨�����嵥��Ŀ��ý��
����ʱʹ������ &#12345; ��Щ����������ǲ����Զ�ת��������Ҫ���ַ��ġ�
������ֻ����ʹ�÷������Ļ�Ӣ����Ԫ���趨ý����⡣
======================================================================================
-->
<!-- ���� ExoBUD MP(II) ������ -->
<script language="JavaScript" src="exobud.js"></script>
<!-- ���� ExoBUD MP(II) �����趨�� -->
<script language="JavaScript" src="exobudset.js"></script>
<!-- ���� ExoBUD MP(II) �����嵥�趨�ļ� -->

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

<!-- ���������Ϥԭʼ��༭����������޸�����ʹ�� JScript �Ĳ��ݣ�������ܻᵼ�³������������� -->
<script language="JScript" for="Exobud" event="openStateChange(sf)">evtOSChg(sf);</script>
<script language="JScript" for="Exobud" event="playStateChange(ns)">evtPSChg(ns);</script>
<script language="JScript" for="Exobud" event="error()">evtWmpError();</script>
<script language="JScript" for="Exobud" event="Buffering(bf)">evtWmpBuff(bf);</script>
<!-- ���ء���̬��ťͼ�ļ��л����� JavaScript �����ļ� -->
<script language="JavaScript" src="imgchg.js"></script>
</head>
<!-- ���������ý�岥����Ƕ��������վʹ��ʱ������Ԥ�� 640~760px(����) �Ŀ��
���� 20~25px(����) �ĸ߶� (�ڲ�ʹ����Ļ���ܵ������) ����ƿ�ܵ����ݡ� -->
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
<!-- ��ʾý�����ķ��飺
������͸���޸� style �����������ʽ�趨����һЩ����ϲ�õĵ����� -->
<input type="text" class="title" id="disp1" value="" readonly style="height:18;width:250;cursor:crosshair">
<!-- ��ʾʱ�䳤�ȵķ��飺
����ý���ʱ�䳤�ȳ���һСʱ���뽫 width ����ֵ�ʵ������ӣ�����Ϣ������ʾ�������� -->
<input type="button" class="time" id="disp2" value="" title="ʱ�䳤����ʾ��ʽ (����/����)"
onClick="chgTimeFmt()" style="width:90;height:18;cursor:hand">
</td>
<!-- ��ʾ����״̬�� Scope ��̬ͼ�ļ���
�������Ҫ������ͼ������ͬʱ�ο����޸� imgchg.js �ӽ��nĩ�Ĳ��ݡ� -->
<td width=30 height=20 align=center
><img name="scope" src="./img/scope_off.gif" width=17 height=16
onClick="vizExobud()" style="cursor:help" title="Chez Bienfantaisie"
></td>
<!-- ��������������ϵ����а�ť��
��Щ��ť�����Դ���ķ�ʽ����ʾ�ģ������ܰѰ�ť����ͼ�ļ��ķ�ʽ����ʾ�� -->
<td height=20 nowrap>
<!-- �������ư�ť -->
<input type="button" class ="buttons" name="vmute" value="����" title="����ģʽ"
onClick="wmpMute()" style="height:18;cursor:hand"
><input type="button" class ="buttons" name="vdn" value="��" title="��������"
onClick="wmpVolDn()" style="height:18;cursor:hand"
><input type="button" class ="buttons" name="vup" value="��" title="��������"
onClick="wmpVolUp()" style="height:18;cursor:hand">
<!-- ����ģʽ��ť -->
<input type="button" class ="buttons" name="pmode" value="" title="����˳�� (ѭ�� ���)"
onClick="chgPMode()" style="height:18;cursor:hand"
><input type="button" class ="buttons" name="rept" value="ѭ��" title="�л��Ƿ��ظ�����Ŀǰ����Ŀ"
onClick="chkRept()" style="height:18;cursor:hand">
<!-- ����������ť -->
<input type="button" class ="buttons" name="prevt" value="��һ��" title="��һ����Ŀ"
onClick="playPrev()" style="height:18;cursor:hand"
><input type="button" class ="buttons" name="pauzt" value="��ͣ" title="��ͣ������"
onClick="wmpPP()" style="height:18;cursor:hand"
><input type="button" class ="buttons" name="stopt" value="ֹͣ" title="ֹͣ"
onClick="wmpStop()" style="height:18;cursor:hand"
><input type="button" class ="buttons" name="playt" value="����" title="����"
onClick="startExobud()" style="height:18;cursor:hand"
><input type="button" class ="buttons" name="nextt" value="��һ��" title="��һ����Ŀ"
onClick="playNext()" style="height:18;cursor:hand">
<!-- �����嵥��ť -->
<input type="button" class ="buttons" name="plist" value="�嵥" title="��ʾ�����嵥����"
onClick="openPlist()" style="height:18;cursor:hand">
</td>
</tr>
<tr>
<td colspan=3 height=0>
<!-- ��ʾ��Ļ��Ĳ��ݣ�
�������Ҫʹ����Ļ���ܣ�������ҪԤ��ҳ��һЩ�ռ�������ʾ�����Ļ��
�������Ƿ�ʹ����Ļ���ܣ���������޸Ļ�ɾ��������� DIV ������﷨�� -->
<div id="capText" style="width:100%;height:60;color:white;background-color:#555555;padding-top:3px;padding-left:5px;display:none"
>ExoBUD MP(II) ��Ļ��ʾϵͳ(SMI)</div>
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
