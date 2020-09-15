<?php
header('Content-Type:text/html;Charset=utf-8;');
error_reporting(0);
if(!empty($_GET['ac']))
{
	$action = $_GET['ac'];
	switch ($action){
		case 'timeformat':
			require_once 'Fun.php';			
			echo Fun::TimeFormat($_GET['time']);
			break;
		case 'getNextProgTime':
			$tvid = $_GET['tvid'];
			require_once 'xml.class.php';
			$xml = new TVXml();
			$nextInfo = $xml->getChannelInfo($tvid);
			echo json_encode($nextInfo);
			break;
		case 'getTVList':
			require_once 'xml.class.php';
			$xml = new TVXml();
			$tvList = $xml->getTVList();
			echo json_encode($tvList);
			break;
	}
}