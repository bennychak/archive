<?php if(!defined('IN_UCHOME')) exit('Access Denied');?><?php subtplcheck('template/default/do_swfupload', '1283263724', 'template/default/do_swfupload');?><?php if(!empty($uploadResponse)) { ?>
<uploadResponse>
<message><?php if($status=="success") { ?>���<?php } else { ?><?=$uploadfiles?><?php } ?></message>
<status><?=$status?></status>
<proid><?=$proid?></proid>
<albumid><?=$albumid?></albumid>
<picid><?=$picid?></picid>
<?php if($fileurl) { ?><filepath><?=$fileurl?></filepath><?php } ?>
</uploadResponse>
<?php } else { ?>
<parameter>
<?php if($iscamera) { ?>
<images>
<?php if(is_array($dirarr)) { foreach($dirarr as $key => $val) { ?>
<categories name="<?=$val['0']?>" directory="<?=$val['1']?>">
<?php if(is_array($val['2'])) { foreach($val['2'] as $ikey => $value) { ?>
<img name="<?=$value?>"/>
<?php } } ?>
</categories>
<?php } } ?>
</images>
<?php } elseif($isdoodle) { ?>
<background>
<?php if(is_array($filearr)) { foreach($filearr as $key => $filename) { ?>
<bg url="./image/doodle/big/<?=$filename?>" thumb="./image/doodle/thumb/<?=$filename?>"/>
<?php } } ?>
</background>
<?php } elseif($isupload) { ?>
<allowsExtend>
<extend depict="All Image File(*.jpg,*.jpeg,*.gif,*.png)">*.jpg,*.gif,*.png,*.jpeg</extend>
</allowsExtend>
<?php } ?>
<language>
<create>����</create>
<notCreate>ȡ��</notCreate>
<albumName>�����</albumName>
<createTitle>���������</createTitle>
<?php if(!$isdoodle) { ?>
<okbtn>����</okbtn>
<cancelbtn>�鿴</cancelbtn>
<?php if($isupload) { ?>
<fileName>�ļ���</fileName>
<depict>����(�����޸�)</depict>
<size>�ļ���С</size>
<stat>�ϴ�����</stat>
<aimAlbum>�ϴ���:</aimAlbum>
<browser>���</browser>
<delete>ɾ��</delete>
<upload>�ϴ�</upload>
<okTitle>�ϴ����</okTitle>
<okMsg>�����ļ��ϴ����!</okMsg>
<uploadTitle>�����ϴ�</uploadTitle>
<uploadMsg1>�ܹ���</uploadMsg1>
<uploadMsg2>���ļ��ȴ��ϴ�,�����ϴ���</uploadMsg2>
<uploadMsg3>���ļ�</uploadMsg3>
<bigFile>�ļ�����</bigFile>
<uploaderror>�ϴ�ʧ��</uploaderror>
<?php } elseif($iscamera) { ?>
<desultory>ץ��</desultory>
<series>����</series>
<save>����</save>
<pageup>��һҳ</pageup>
<pagedown>��һҳ</pagedown>
<clearbg>������</clearbg>
<reload>����</reload>
<cancel>ȡ��</cancel>
<siteerror>��������,ϵͳ����ʧ��</siteerror>
<ver1>������FlashPlayer 9.0.45���ϰ汾���Ĳ������汾Ϊ</ver1>
<ver2>������</ver2>
<refuse>�����Ļ����ϼ�⵽����ͷ�����ܾ�������ͷ��ʹ��</refuse>
<countdown>����</countdown>
<second>��</second>
<nocam>�����Ļ�����û�м�⵽����ͷ������������ͷ�豸����ʹ����</nocam>
<autoShooting>������</autoShooting>
<explain>�������ã�</explain>
<okTitle>�ϴ����</okTitle>
<okMsg>��ͷ���ϴ����</okMsg>
<saveTitle>�����ϴ�</saveTitle>
<saveToNote>���浽</saveToNote>
<saveMsg1>�ܹ���</saveMsg1>
<saveMsg2>�Ŵ�ͷ��,���ڱ����</saveMsg2>
<saveMsg3>�Ŵ�ͷ����</saveMsg3>
<?php } ?>
<?php } else { ?>
<reload>�ػ�</reload>
<save>����</save>
<notDraw>û���κ�Ϳѻ�������޷�����</notDraw>
<?php } ?>
</language>
<config>
<userid><?=$_SGLOBAL['supe_uid']?></userid>
<hash><?=$hash?></hash>
<maxupload><?=$max?></maxupload>
<?php if($iscamera) { ?>
<countdown>3</countdown>
<countBy>2000</countBy>
<?php } ?>
</config>
<?php if($isdoodle) { ?>
<filters>
<filter id="0">����</filter>
<filter id="1">��Ӱ</filter>
<filter id="2">ģ��</filter>
<filter id="3">����</filter>
<filter id="4">ˮ��</filter>
<filter id="5">�罦</filter>
<filter id="6">����</filter>
</filters>
<?php } ?>
<albums>
<album id="-1">��ѡ�����</album>
<?php if(is_array($albums)) { foreach($albums as $key => $value) { ?>
<album id="<?=$value['albumid']?>"><?=$value['albumname']?></album>
<?php } } ?>
<album id="add">+�½����</album>
</albums>
</parameter>
<?php } ?><?php ob_out();?>