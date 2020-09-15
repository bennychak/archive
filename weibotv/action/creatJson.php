<?php

set_time_limit(0);

@include_once '../define.php';

require_once ACTION_PATH.'xml.class.php';

$xmlDom = new TVXml();

$xml = $xmlDom->getXMLDom();

$tvitem = $xml->tvitem;

$tvcount = count($tvitem);

$tvlist = array();


for($i=0; $i< $tvcount; $i++)
{
    $tid = $tvitem[$i]->id.'';
    $tvlist[$tid] = $xmlDom->getChannelList($tid);
    $xmlUrl = $xmlDom->creatXmlById($tid);
    //$tvlist[] = $xmlDom->getChannelList($tid);
}
$xmlDom->xml_serialize($tvlist);
?>