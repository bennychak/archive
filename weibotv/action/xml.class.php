<?php
header('Content-Type:text/html;Charset=utf8');
error_reporting(0);
require_once 'Fun.php';
@include_once '../define.php';
date_default_timezone_set('PRC');

class TVXml
{
	private $def_xml_file;
	private $channelUrl;
	public $xmlObject;
	private $httpUrl;
	function __construct()
	{
		$this->def_xml_file = DATA_PATH.'tvSample.xml';
		$this->channelUrl = 'http://v.qq.com/xml/program_channel/xml/channel_program_xml_0_';
		$this->httpUrl = HTTP_DATA;
	}

	//读取xml内容
	public function getContent($xml_file)
	{
		if(empty($xml_file)) return '';
        return file_get_contents($xml_file);
	}


	public function setXMLDom()
	{
		if(!file_exists($this->def_xml_file)) $this->xmlObject=null;
	    $xmlDom = simplexml_load_file($this->def_xml_file);
	    $this->xmlObject = $xmlDom;
	}

	public function getXMLDom()
	{
		if(!$this->xmlObject)
		{
			$this->setXMLDom();
		}
		return $this->xmlObject;
	}

	public function getDefaultProgram($tvid)
	{
		$xml = $this->getXMLDom();
		$channels = array();
		if(is_object($xml))
		{
			$tvitem = $xml->tvitem;
			$tvcount = count($tvitem);
			$tvlist = array();
		    for($i=0, $j=0; $i<$tvcount; $i++){
		    	$tid = $tvitem[$i]->id.'';
		    	if($tid === $tvid) $j=$i;
		    	$tvlist[$tid] = $this->getChannelInfo($tid);
		    }
		    //当前频道
			$curChannel = $xml->defaultitem;
			if($tvid)
			{
				$curChannel = $tvitem[$j];
			}
			else
			{
				$tvid = $xml->defaultitem->id.'';
			}

			$proglistObj = $curChannel->proglist->progitem;
	    	$hostlistOjb = $curChannel->hostlist->hostitem;
	    	foreach ($proglistObj as $prog){
	    		$proglist[] = array(
	    			'nick'	  => $prog->nick.'',
	    			'account' => $prog->account.'',
	    			'headimg' => $prog->headimg.''
	    		);
	    	}
	    	foreach ($hostlistOjb as $host){
	    		$hostlist[] = array(
	    			'nick'	  => $host->nick.'',
	    			'account' => $host->account.'',
	    			'headimg' => $host->headimg.''
	    		);
	    	}
			$channels = array(
				'channelInfo' => array(
					'name'	  => $curChannel->name.'',
					'id'	  => $curChannel->id.'',
					'account' => $curChannel->account.''
				),	 //当前频道信息
				'programInfo' => $this->getChannelInfo($tvid),	 //当前节目信息
				'hotproglist' => $proglist,  //热门节目官博
	    		'hotuserlist' => $hostlist,  //热门主持人官博
	    		'tvlist'	  => $tvlist	 //频道列表
			);
		}
	    return $channels;
	}

	public function getTVList()
	{
		$xml = $this->getXMLDom();

		$tvlist = array();
		if(is_object($xml))
		{
			$tvitem = $xml->tvitem;
			$tvlist = array();
		    foreach ($tvitem as $tv){
		    	$tid = $tv->id.'';
		    	$tvlist[] = $this->getChannelInfo($tid);
		    }
		}
		return $tvlist;
	}

	//获取tv列表信息
	public function getChannelList($tvid)
	{
		$xml = simplexml_load_file($this->httpUrl.$tvid.".xml");	 
        if($xml)
        {
            $prr = $xml->xpath('p');

            $channel_id   = $xml->xpath('channel_id');
            $channel_name = $xml->xpath('channel_name');
            $channel_logo = $xml->xpath('channel_small_logo');

                foreach($prr as $key=>$val){
                    $programs[] = array(
                        'id'=>$val->id.'',
                        'pn'=>$val->pn.'',
                        'tm'=>$val->tm.''
                    );
                }
                $currentChannel[] = array(
                    'channel_id' => $channel_id[0].'',
                    'channel_name' => $channel_name[0].'',
                    'channel_logo' => $channel_logo[0].'',
                    'programs' => $programs
                );
                return $currentChannel;
        }

	}

	//获取tv信息
	public function getChannelInfo($tvid)
	{
			if(empty($tvid)) return '';
		    $json = file_get_contents(DATA_PATH.'tvlist.php');
            $arr = json_decode($json,true);

			$time = date("H:i",time());
            foreach($arr[$tvid]['programs'] as $key=>$pro)
            {
                if($pro['tm'] > $time)
                {
                       return  Fun::formatProgram($arr[$tvid]['programs'][$key-1]['pn']);
                }
            }
	}

    //获取远程XML文件并保存在本地
    public function creatXmlById($tvid)
    {
        $xml_file = $this->channelUrl.$tvid.'.xml';
        $str = $this->getContent($xml_file);
        $hd = fopen($xml_file, 'wb');
        if(fwrite($hd, $str) === FALSE)
        {
            return $this->httpUrl.$tvid.".xml";
            exit;
        }
        fclose($hd);
    }

    //获取tv列表，生成json保存到文本文件
    public function xml_serialize($arr)
    {

        $str = json_encode($arr);
        $file = './data/tvlist.php';
        $hd = fopen($file, 'w');
        if(fwrite($hd, $str) === FALSE) {
            exit;
        }
        fclose($hd);
    }

	function getDefaultTVList()
	{
		$time = date( 'H:i', time());
		$json = file_get_contents(DATA_PATH.'tvlist.php');
		$arr = json_decode($json,true);
		foreach($arr as $k=>$v)
		{
			foreach($v['programs'] as $key=>$pro)
			{
				if($pro['tm'] > $time)
				{
					if($v['programs'][$key-1])
					{
						$tv['channel_id'] = $v['channel_id'];
						$tv['channel_name'] = $v['channel_name'];
						$tv['channel_logo'] = $v['channel_logo'];
						$tv['programs']= $v['programs'][$key-1];
						$tvList[] = $tv;
						break;
					}
				}
			}
		}
		return $tvList;
	}

	function getDefault($tvid)
	{
		$tvList = $this->getDefaultTVList();
		$xml = $this->getXMLDom();
		$channels = array();
		if(is_object($xml))
		{
			$tvitem = $xml->tvitem;
			$tvcount = count($tvitem);
			$tvlist = array();
			for($i=0, $j=0; $i<$tvcount; $i++){
				$tid = $tvitem[$i]->id.'';
				if($tid === $tvid) $j=$i;
			}

			//当前频道
			$curChannel = $xml->defaultitem;

			if($tvid)
			{
				$curChannel = $tvitem[$j];
			}
			else
			{
				$tvid = $xml->defaultitem->id.'';
			}

			$proglistObj = $curChannel->proglist->progitem;
			$hostlistOjb = $curChannel->hostlist->hostitem;

			foreach ($proglistObj as $prog){
				$proglist[] = array(
					'nick'	  => $prog->nick.'',
					'account' => $prog->account.'',
					'headimg' => $prog->headimg.''
				);
			}

			foreach ($hostlistOjb as $host){
				$hostlist[] = array(
					'nick'	  => $host->nick.'',
					'account' => $host->account.'',
					'headimg' => $host->headimg.''
				);
			}

			$tvList = $this->getDefaultTVList();
			$channels = array(
				'channelInfo' => array(
					'name'	  => $curChannel->name.'',
					'id'	  => $curChannel->id.'',
					'account' => $curChannel->account.''
				),	 //当前频道信息
				'programInfo' => $this->getChannelInfo($tvid),	 //当前节目信息
				'hotproglist' => $proglist,  //热门节目官博
				'hotuserlist' => $hostlist,  //热门主持人官博
				'tvlist'	  => $tvList	 //频道列表

			);
		}
	return $channels;
	}

}

