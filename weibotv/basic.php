<?php
	error_reporting(0);
	set_time_limit(0);
	require_once ACTION_PATH.'xml.class.php';
	$xmlDom = new TVXml();
	$tvid = empty($_GET['tvid']) ? null : $_GET['tvid'];
	$channels = $xmlDom->getDefault($tvid);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>微博微电视</title>
<link href="http://mat1.gtimg.com/www/mb/css/style_110808.css" type="text/css" rel="stylesheet" />
<link href="css/style.css" type="text/css" rel="stylesheet"/> 
<script type="text/javascript">
	document.domain = "qq.com";
	var channel_id = "<?php echo $channels['channelInfo']['id'];?>";
	var channel_acconut = "<?php echo $channels['channelInfo']['account']; ?>";
	var getCurProTime = <?php echo $getCurProTime ; ?>;
	var getTVListTime = <?php echo $getTVListTime ; ?>;
</script>
</head>
<body>
<!--
转播 对话 评论 表情 弹层在页面下方
ie6下关灯效果需要前端支持
-->
<div class="headWrap abovedark">
	<div class="headInside">
        <h1><a class="logo1" href="http://t.qq.com" title="腾讯微博">腾讯微博</a><a class="logo2" href="./index.php" title="微电视，一起看一起聊！">微电视，一起看一起聊！</a></h1>
        <div class="topNav right">
			<div id="site_nav_mblogin" class="site_nav_mblogin">
				<div class="topNavItem ">
					<div class="mblog_login_info" id="mblog_logined_info" style="display: none;"></div>
					<div class="mblog_login_button" id="mblog_login_button"><span>登录微博</span>
						<div class="mbCardUserInfo" id="mbCarduserNotLogin" style="display: none;">
							<div class="arrowBox"><div class="arrow"></div></div>
							<div class="mbClose"><a href="#"><span>关闭</span></a></div>
							<div class="mbCardUserDetail">
								<div class="mbConTxt">
									
								</div>
								<div class="mbReg"><a target="_blank" href="http://t.qq.com?pref=qqcom.toptips">开通微博</a></div>
							</div>
						</div>
					</div>
				</div>
				<div id="back_home" class="topLink" style="display:none"><a href="http://t.qq.com">返回我的主页</a></div>
				<div id="mblog_logout_text" style="display:none"><a href="javascript:;">退出</a></div>
			</div>
        </div>
	</div>
</div>
<div class="mainWrapper">
	<div class="currentWrap">
		<div class="currentInsideTop">
			<h2 class="fontYH">正在直播:<span title="<?php echo $channels['programInfo'];?>"><?php echo $channels['programInfo'];?></span></h2>
		</div>
    	<div class="currentInside">
        	<div class="maskListAbove">
            <a href="javascript:;" class="turnlight abovedark" title="关灯">关灯</a>
            <div class="player abovedark">
				<div id="flv_player" class="mod_player" style="width: 600px; height: 450px;">
					<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="600" height="450" id="SimpleVPlayer" align="middle">
						<param name="flashvars" value="oid=&amp;adplay=1">
						<param name="allowScriptAccess" value="always" />
						<param name="allowFullScreen" value="true" />
						<param name="movie" value="http://imgcache.qq.com/minivideo_v1/vd/res/TencentPlayerLive.swf" />
						<param name="quality" value="high" />
						<param name="wmode" value="Opaque" />
						<param name="bgcolor" value="#000000" />
						<embed id="SimpleVPlayer" src="http://imgcache.qq.com/minivideo_v1/vd/res/TencentPlayerLive.swf" quality="high" bgcolor="#000000" devicefont="false" flashvars="oid=&amp;adplay=1" wmode="Opaque" width="600" height="450" name="SimpleVPlayer" align="middle" menu="true" allowScriptAccess="always" scale="showall" loop="true" play="true" allowFullScreen="true" type="application/x-shockwave-flash" salign="" pluginspage="http://www.adobe.com/go/getflashplayer" />
					</object>
				</div>
            </div>
<!--点击侧边节目单按钮展开-->
 			<div class="masklist abovedark" <?php echo !$channels['channelInfo']['id'] ? 'style="display:block"':""?>>
            	<h5>直播节目单</h5>
                <a href="javascript:void(0);" class="close"><span class="ffsong">×</span>关闭</a><!--点击关闭masklist-->
                <ul>
                	<li class="head">
                    	<div class="tvstation">电视台</div>
                        <div class="showtime">时间</div>
                        <div class="currentplay">正在播放</div>
                    </li>
                </ul>
                <ul class="roll">
                <?php 
                $i = 0; $class = '';
                foreach ($channels['tvlist'] as $key=>$tv){
                	$class = $i%2 ? 'odd' : 'even';
					if($tv['programs']['pn'] == "该频道暂无预告") {continue;}
                ?>
                	<li class="<?php echo $class;?>">
                    	<div class="tvstation"><img src="<?php echo $tv['channel_logo'];?>" /><?php echo $tv['channel_name'];?></div>
                        <div class="showtime"><?php echo !$tv['programs']['tm']  || null==$tv['programs']['tm'] ? '暂无' :$tv['programs']['tm'];?></div>
                        <div class="currentplay">
                        	<a href="?tvid=<?php echo $tv['channel_id'];?>"><em></em></a>
                        	<a href="?tvid=<?php echo $tv['channel_id'];?>"><?php echo Fun::str_cut($tv['programs']['pn'],34) ;?></a>
                        </div>
                    </li>
                <?php $i++;} ?>
                </ul>
            </div>
<!--/点击侧边节目单按钮展开-->
            <div class="weibo">
            	<div class="talkWrap">
					<form id="sendMsgForm" action="http://radio.t.qq.com/api/message/publish.php" target="sendMsg" method="POST">
						<div class="txtWrap"><textarea name="content"><?php echo '#'.$channels['programInfo']['topic'].'#';?></textarea></div><!--鼠标焦点落在textarea上时，添加active的class，且清除textarea中内容-->
						<div class="insertFun">
							
								<span class="left">
									<a href="javascript:;" role="biaoqing" target-data="txtMsg">表情</a>
								</span>
								<span class="right"><span class="sendmsgtip">　</span><input class="submit sendBtn"  type="button" value="广播" /></span>
							<input type="hidden" name="callback" value="publish" >
							<input type="hidden" name="type" value="" >
						</div>
					</form>
					<iframe id="sendMsg" name="sendMsg"></iframe>
                </div>
                <div class="talkList"><!--textarea激活时，设置talkList高度320px-->
                    <div class="newweibo" style="display:none">
                        <a href="javascript:;">有0条新广播，点击更新</a>
                    </div>
                	<ul>
                    	
                    </ul>
                </div>
                <div class="talkWrapFoot">
                    <label for="rollplay" class="left"><input id="rollplay" type="checkbox" checked="false" />滚动直播</label><a href="http://t.qq.com/k/" target="_blank" id="allTopic">查看全部广播<span class="ffsong">&gt;&gt;</span></a>
                </div>
            </div>
			<a href="javascript:;" class="listbtnlink abovedark"><em></em>节目单</a>
			</div>
			<span class="listbtn" title="节目单"></span>
        </div>
        
    </div>
	<div class="footWrap">
    	<div class="weiboModWrap">
        	<div class="mod profile">
            	
            </div>
            <div class="mod hotItem">
            	<h3 class="fontYH">热门节目官博</h3>
                <ul>
                <?php 
                foreach ($channels['hotproglist'] as $key=>$prog){
                	if($key < 6){
                ?>
                	<li>
                    	<div class="userPic">
                        	<a href="http://t.qq.com/<?php echo $prog['account'];?>"><img src="<?php echo $prog['headimg'];?>" /></a>
                        </div>
                        <div class="info">
                        	<p><a href="http://t.qq.com/<?php echo $prog['account'];?>"><?php echo Fun::str_cut($prog['nick'],16) ;?></a></p>
                            <p><a href="#" class="addFollow"  data-name="<?php echo $prog['account'];?>">+收听</a></p>
                        </div>
                    </li>
                <?php }}?>
                </ul>
            </div>
            <div class="mod moderator" id="slide">
            	<h3 class="fontYH">热门主持人官博</h3>
                <div class="pagination"></div>
				<div class="slideBox">
					<ul>
					<?php foreach ($channels['hotuserlist'] as $host){?>
						<li>
							<div class="userPic">
								<a href="http://t.qq.com/<?php echo $host['account'];?>"><img src="<?php echo $host['headimg'];?>" /></a>
							</div>
							<div class="info">
								<p><a href="http://t.qq.com/<?php echo $host['account'];?>"><?php echo $host['nick'];?></a></p>
								<p><a href="#" class="addFollow"  data-name="<?php echo $host['account'];?>">+收听</a></p>
								<p><?php echo $host['nick'];?></p>
							</div>
						</li>
					<?php }?>
					</ul>
				</div>
                <a href="javascript:;" class="arrow l" role="left" title="上翻"><b>上翻</b></a>
                <a href="javascript:;" class="arrow r" role="right"  title="下翻"><b>下翻</b></a>
            </div>
        </div>
        <div id="Copyright" class="abovedark">
            <p><a target="_blank" href="http://www.qq.com">腾讯网</a>  |  <a target="_blank" href="http://www.qq.com/map">网站导航</a>  |  <a href="http://t.qq.com/certification">认证服务</a>  |  <a target="_blank" href="http://open.t.qq.com">开放平台</a>  |  <a href="http://t.qq.com/k/%25E6%2584%258F%25E8%25A7%2581%25E5%258F%258D%25E9%25A6%2588">意见反馈</a> </p>
            Copyright &copy; 1998 - 2011 Tencent. All Rights Reserved
        </div>
    </div>
</div>
<div class="lock" style="display:none"></div><!--关灯cover-->
<!--弹层-->
<div class="D zhuanboWrap" style="display:none"><div class="CR"><table border="0" cellspacing="0" cellpadding="0" class="tbSendMsg"><tbody><tr><td class="tl"></td><td class="tm"></td><td class="tr"></td></tr><tr><td class="lm"></td><td><div class="DWrap"><div class="DTitle" style="height: 0px; "></div><a title="Close" class="DClose close" href="#">Close</a><div class="DLoad"></div><div class="DCont">
	<!--转播-->
    	<div class="zfWrap">
			<div class="SA" style="left: 329px; "><em>◆</em><span>◆</span></div>	
			<div class="top">
				<span class="left">
					<span class="number cNote">转播原文，把它分享给你的听众</span>
					<span class="replyTitle"><br>顺便说两句:</span>
					<span class="addReply" style="display: none; "></span>
				</span>
				<a href="#" class="close" title="关闭">关闭</a>	
			</div>	
			<iframe name="zbIfrm" id="zbIfrm" src="about:blank" frameborder="0" scrolling="no" style="height:0"></iframe>	
			<div class="cont">
				<form action="http://radio.t.qq.com/api/message/publish.php" target="zbIfrm" method="POST" id="zbForm">
					<input type="hidden" name="type" value="1" />
					<input type="hidden" name="endTime" value="" />
					<input type="hidden" name="statrTime" value="" />
					<input type="hidden" name="pId" id="zbPid" value="" />
					<input type="hidden" name="callback" value="zhuanbo" />
					<textarea class="inputTxt zhuanboTxt" name="content" target-data="msgTxt" role="zhuanbo" style="overflow-y: auto; height: 37px; "></textarea>
				</form>
				<div class="txtShadow" style="height: 37px; "><span></span><b>|</b><span></span>
			</div>
		</div>	
		<div class="bot">
			<div class="insertFun">
				<div class="newTopic">
					<a href="javascript:;" class="creatNew" title="汇聚相同热点的广播" tabindex="3">话题</a>
				</div>
				<div class="insertFace">
					<span class="ico_face"></span>
					<a class="txt tzhuanbo" href="javascript:;" role="biaoqing" title="表情">表情</a>
				</div>
			</div>
			<input type="button" class="inputBtn sendBtn zhuanboBtn" value="" title="转播">
				<span class="sendmsgtip countTxt"></span>	
			</div>	
			<div class="talkSuc" style="display:none">
				<span class="ico_tsW">
					<span class="ico_ts"></span>
				</span><span class="msg"></span>
			</div>
		</div>
	<!--/转播-->
</div></div></td><td class="rm"></td></tr><tr><td class="bl"></td><td class="bm"></td><td class="br"></td></tr></tbody></table></div></div>
<!--/弹层-->
<!--表情-->
<div class="faceWrap" style=" display:none"> <div class="musicTab"><ul><li class="select"><b>默认表情</b></li></ul><a href="javascript:;" class="close" title="关闭"></a></div> <div class="faceBox"><div class="faceCell"> <div class="dFace" index="1"><div><a href="#" class="f14" title="微笑" i="0"></a><a href="#" class="f1" title="撇嘴" i="1"></a><a href="#" class="f2" title="色" i="2"></a><a href="#" class="f3" title="发呆" i="3"></a><a href="#" class="f4" title="得意" i="4"></a><a href="#" class="f5" title="流泪" i="5"></a><a href="#" class="f6" title="害羞" i="6"></a><a href="#" class="f7" title="闭嘴" i="7"></a><a href="#" class="f8" title="睡" i="8"></a><a href="#" class="f9" title="大哭" i="9"></a><a href="#" class="f10" title="尴尬" i="10"></a><a href="#" class="f11" title="发怒" i="11"></a><a href="#" class="f12" title="调皮" i="12"></a><a href="#" class="f13" title="呲牙" i="13"></a><a href="#" class="f0" title="惊讶" i="14"></a><a href="#" class="f15" title="难过" i="15"></a><a href="#" class="f16" title="酷" i="16"></a><a href="#" class="f96" title="冷汗" i="17"></a><a href="#" class="f18" title="抓狂" i="18"></a><a href="#" class="f19" title="吐" i="19"></a><a href="#" class="f20" title="偷笑" i="20"></a><a href="#" class="f21" title="可爱" i="21"></a><a href="#" class="f22" title="白眼" i="22"></a><a href="#" class="f23" title="傲慢" i="23"></a><a href="#" class="f24" title="饥饿" i="24"></a><a href="#" class="f25" title="困" i="25"></a><a href="#" class="f26" title="惊恐" i="26"></a><a href="#" class="f27" title="流汗" i="27"></a><a href="#" class="f28" title="憨笑" i="28"></a><a href="#" class="f29" title="大兵" i="29"></a><a href="#" class="f30" title="奋斗" i="30"></a><a href="#" class="f31" title="咒骂" i="31"></a><a href="#" class="f32" title="疑问" i="32"></a><a href="#" class="f33" title="嘘" i="33"></a><a href="#" class="f34" title="晕" i="34"></a><a href="#" class="f35" title="折磨" i="35"></a><a href="#" class="f36" title="衰" i="36"></a><a href="#" class="f37" title="骷髅" i="37"></a><a href="#" class="f38" title="敲打" i="38"></a><a href="#" class="f39" title="再见" i="39"></a><a href="#" class="f97" title="擦汗" i="40"></a><a href="#" class="f98" title="抠鼻" i="41"></a><a href="#" class="f99" title="鼓掌" i="42"></a><a href="#" class="f100" title="糗大了" i="43"></a><a href="#" class="f101" title="坏笑" i="44"></a><a href="#" class="f102" title="左哼哼" i="45"></a><a href="#" class="f103" title="右哼哼" i="46"></a><a href="#" class="f104" title="哈欠" i="47"></a><a href="#" class="f105" title="鄙视" i="48"></a><a href="#" class="f106" title="委屈" i="49"></a><a href="#" class="f107" title="快哭了" i="50"></a><a href="#" class="f108" title="阴险" i="51"></a><a href="#" class="f109" title="亲亲" i="52"></a><a href="#" class="f110" title="吓" i="53"></a><a href="#" class="f111" title="可怜" i="54"></a><a href="#" class="f112" title="菜刀" i="55"></a><a href="#" class="f89" title="西瓜" i="56"></a><a href="#" class="f113" title="啤酒" i="57"></a><a href="#" class="f114" title="篮球" i="58"></a><a href="#" class="f115" title="乒乓" i="59"></a><a href="#" class="f60" title="咖啡" i="60"></a><a href="#" class="f61" title="饭" i="61"></a><a href="#" class="f46" title="猪头" i="62"></a><a href="#" class="f63" title="玫瑰" i="63"></a><a href="#" class="f64" title="凋谢" i="64"></a><a href="#" class="f116" title="示爱" i="65"></a><a href="#" class="f66" title="爱心" i="66"></a><a href="#" class="f67" title="心碎" i="67"></a><a href="#" class="f53" title="蛋糕" i="68"></a><a href="#" class="f54" title="闪电" i="69"></a><a href="#" class="f55" title="炸弹" i="70"></a><a href="#" class="f56" title="刀" i="71"></a><a href="#" class="f57" title="足球" i="72"></a><a href="#" class="f117" title="瓢虫" i="73"></a><a href="#" class="f59" title="便便" i="74"></a><a href="#" class="f75" title="月亮" i="75"></a><a href="#" class="f74" title="太阳" i="76"></a><a href="#" class="f69" title="礼物" i="77"></a><a href="#" class="f49" title="拥抱" i="78"></a><a href="#" class="f76" title="强" i="79"></a><a href="#" class="f77" title="弱" i="80"></a><a href="#" class="f78" title="握手" i="81"></a><a href="#" class="f79" title="胜利" i="82"></a><a href="#" class="f118" title="抱拳" i="83"></a><a href="#" class="f119" title="勾引" i="84"></a><a href="#" class="f120" title="拳头" i="85"></a><a href="#" class="f121" title="差劲" i="86"></a><a href="#" class="f122" title="爱你" i="87"></a><a href="#" class="f123" title="NO" i="88"></a><a href="#" class="f124" title="OK" i="89"></a><a href="#" class="f42" title="爱情" i="90"></a><a href="#" class="f85" title="飞吻" i="91"></a><a href="#" class="f43" title="跳跳" i="92"></a><a href="#" class="f41" title="发抖" i="93"></a><a href="#" class="f86" title="怄火" i="94"></a><a href="#" class="f125" title="转圈" i="95"></a><a href="#" class="f126" title="磕头" i="96"></a><a href="#" class="f127" title="回头" i="97"></a><a href="#" class="f128" title="跳绳" i="98"></a><a href="#" class="f129" title="挥手" i="99"></a><a href="#" class="f130" title="激动" i="100"></a><a href="#" class="f131" title="街舞" i="101"></a><a href="#" class="f132" title="献吻" i="102"></a><a href="#" class="f133" title="左太极" i="103"></a><a href="#" class="f134" title="右太极" i="104"></a></div> </div><div class="facePreview" style="display: none; "><div><p class="faceImg"><img src="http://mat1.gtimg.com/www/mb/images/face/3.gif" alt=""></p><p class="faceName">发呆</p></div></div></div>
<!--/表情-->

<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="http://mat1.gtimg.com/www/mb/js/portal/mi.MiniNav_110621V1.js" charset="utf-8"></script>
<script type="text/javascript" src="http://mat1.gtimg.com/www/mb/js/portal/mi.Portal_110420v3.js" charset="utf-8"></script>
<script type="text/javascript" src="js/WTV.js"></script>
<script type="text/javascript">
	WTV.init();
	WTV_weibo.init();
	WTV_live.initHttpPlayer();
	function playerInit(){
		if(channel_id){
			WTV_live.httpPlay(channel_id, "http://zb.v.qq.com:1863/?progid="+channel_id);
		}
	}
	$(document).ready(function(){
		if(channel_id){
			WTV_live.httpPlay(channel_id, "http://zb.v.qq.com:1863/?progid="+channel_id);
		}
	});
</script>
</body>
</html>