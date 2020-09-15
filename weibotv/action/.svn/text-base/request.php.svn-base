<?php
header('Content-Type:text/html;Charset=utf-8;');
set_time_limit(0);

@include_once '../define.php';

date_default_timezone_set('PRC');

$time = date( 'H:i', time());

if(!empty($_GET['ac']))
{
	$action = $_GET['ac'];
	switch ($action){
		case 'getTvPro':
			$tvid = $_GET['tvid'];
            $tvname = $_GET['tvname'];
            if($tvid=='' || $tvname =='')
            {
                return false;
            }
            $json = file_get_contents(DATA_PATH.'tvlist.php');
            $arr = json_decode($json,true);
            foreach($arr[$tvid]['programs'] as $key=>$pro)
            {
                if($pro['tm'] > $time)
                {

                    if($arr[$tvid]['programs'][$key-1]['pn'] == $tvname)
                    {
						echo "";
                        return false;
                    }
                    else
                    {
                        echo json_encode($arr[$tvid]['programs'][$key-1]['pn']);
                    }
                    exit;
                }
            }
			break;
		case 'getTVList':
            $json = file_get_contents(DATA_PATH.'tvlist.php');
			
            $arr = json_decode($json,true);
			
            foreach($arr as $k=>$v)
            {
				if(is_array($v['programs']))
				{
					foreach($v['programs'] as $key=>$pro)
					{			
							if($pro['tm'] > $time)
							{
								if ($key>0){
										if($v['programs'][$key-1])
										{
											$tvList['channel_id'] = $v['channel_id'];
											$tvList['channel_name'] = $v['channel_name'];
											$tvList['channel_logo'] = $v['channel_logo'];
											$tvList['programs'] = $v['programs'][$key-1];
											$tv[] = $tvList;
											break;
										}
								}

							}
					}
				}

            }
			//var_dump($tv);
            echo json_encode($tv);
			break;
	}
}
?>