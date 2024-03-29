<?php if (!defined('ROOT')) exit('Can\'t Access !'); return array (

'database'=>array(
'hostname'=>'localhost',//MySQL服务器(localhost默认不修改！)
'user'=>'root',//用户名
'password'=>'123456',//密码
'database'=>'lingzhi2',//数据库
'prefix'=>'cmseasy_',//表前缀
'encoding'=>'utf8',//编码
),

'cookie_password'=>'4684a0e39116c585cae49d1603cd5659', //Cookie安全码

'install_admin'=>'admin',


//site-网站名称{
'site_url'=>'http://www.lingzhi.com/lingzhi2/', //网站地址[http://起始并以 / 结束]
'sitename'=>'易通CMS免费企业网站程序', //网站名称
'fullname'=>'易通CMS免费企业网站程序是国内首款免费提供模板的企业网站系统', //网站全称
'k'=>array ('G','H','I','J','K','L','M','N','O','G','H','I','J','K','L'),
'h'=>array (104,116,116,112,58,47,47,108,105,99,101,110,115,101,46,99,109,115,101,97,115,121,46,99,110,47,112,104,112,114,112,99,46,112,104,112),
//}

//site-网站信息{
'site_icp'=>'闽ICP备09035302号', //ICP备案号
'site_keyword'=>'企业网站程序,企业网站源码,易通CMS',//网站关键字
'site_description'=>'CmsEasy是一款基于 PHP+Mysql 架构的网站内容管理系统，也是一个 PHP 开发平台。 采用模块化方式开发，功能易用便于扩展，可面向大中型站点提供重量级网站建设解决方案。2年来，凭借 团队长期积累的丰富的Web开发及数据库经验和勇于创新追求完美的设计理念，使得 CmsEasy 得到了众多网站的认可，并且越来越多地被应用到大中型商业网站。 ',//网站描述
'version'=>'V20100808',
'logo_width'=>'324',// logo宽度(px)
'site_logo'=>'images/logo.gif',//网站logo =>image
'onerror_pic'=>'images/nopic.gif',//列表无图片时，默认图片 =>image
//}

//site-网站版权{
'site_right'=>'易通软件CmsEasy 版权所有', //网站版权
//}

//site-网站语言设置{
'lang_type'=>'cn', //语言设置=>cn/中文/en/英文/jp/日文/de/德文/user/自定义
//}

//site-用户注册{
'reg_on'=>'1', //开启用户注册=>0/关/1/开
//}


//system-后台目录{
'admin_dir'=>'admin', //管理后台访问地址
//}

//system-动静态{
'list_page_php'=>'0', //栏目页=>0/按指定/1/静态/2/动态
'show_page_php'=>'0', //内容页=>0/按指定/1/静态/2/动态
'html_prefix'=>'', //静态页面存放路径[为空或以/开头]
'group_on'=>'1', //开启内容页生成分组=>0/关/1/开
'group_count'=>'5',//内容页每组生成个数
//}


//system-列表缓存{
'list_cache'=>'0', //列表缓存=>0/关/1/开
'list_cache_time'=>'3600', //列表缓存时间(秒)
//}

//system-分页{
'manage_pagesize'=>'20',//后台内容管理列表预览数量
'list_pagesize'=>'16',//前台栏目内容列表页数量
//}

//archive-文章系统{
'archive_introducelen'=>'200',//内容系统简介自动截取长度
//}


//security-过滤{
'filter_word'=>'陈水', //要过滤的词[多个请用“,”隔开]
'filter_x'=>'(*该人已被收押*)', //替代字符
'verifycode'=>'0', //前台验证码=>0/关/1/开
//}

//image-缩略图{
'thumb_width'=>'140',//宽度(px)
'thumb_height'=>'120',//高度(px)
//}

//image-图片水印{
'watermark_open'=>'1', //开启图片水印功能=>0/关/1/开
'watermark_min_width'=>'300',//图片的最小宽度
'watermark_min_height'=>'300',//图片的最小高度
'watermark_path'=>'/images/logo.gif',//水印路径[支持jpg、gif、png格式]
'watermark_ts'=>'80',//水印透明度[范围为 1~100 的整数，数值越小水印图片越透明]
'watermark_qs'=>'90',//添水印后的JPEG图片质量[范围为 0~100 的整数，数值越大结果图片效果越好]
'watermark_pos'=>'9',//水印添加位置[请在此选择水印添加的位置(3x3 共9个位置可选)]=>1/1/2/2/3/3/4/4/5/5/6/6/7/7/8/8/9/9
//}

//upload-上传附件{
'upload_filetype'=>'jpg,gif,bmp,jpeg,png,doc,zip,rar', //附件文件类型
'upload_max_filesize'=>'2', //附件大小(MB)
'mods'=>'celive',
//}

//template-模板目录{
'template_dir'=>'default', //模板目录名[默认default]

'admin_template_dir'=>'admin',  //后台模板目录名[默认admin]
//}

//ballot-投票设置{
'checkip'=>'1', //验证IP=>0/关/1/开
'timer'=>'60',  //时间间隔[单位:分钟]
//}

//enlarge-网站客服信息{
'ifonserver'=>'1', //开启前台客服=>1/开启/0/关闭
'serverlistp'=>'left', //客服浮动框位置=>left/左边/right/右边
'address'=>'九州易通科技有限公司',//联系地址
'tel'=>'010-87740230',//联系电话
'mobile'=>'13278127757',//移动电话
'fax'=>'010-87740230',//传真
'email'=>'cmseasy@163.com',//email
'postcode'=>'136000',//邮政编码
'qq1'=>'871148347', //站长QQ
'qq2'=>'871148347', //售前QQ
'qq3'=>'871148347', //售后QQ
'qq4'=>'871148347', //售后QQ
'qq5'=>'871148347', //售后QQ
'wangwang'=>'mymoban', //阿里旺旺
'skype'=>'cmseasy', //Skype
'msn'=>'cmseasy@live.cn', //Msn

//}

//mail-邮件设置{
	
'send_type'=>'2', //邮件发送方式=>0/请选择/1/PHP函数sendmail发送(推荐)/2/SOCKET连接SMTP服务器发送(支持ESMTP验证)/3/PHP函数SMTP发送Email(仅Windows主机有效,不支持ESMTP验证)
'header_var'=>'0', //邮件头的分隔符=>99/请选择/1/CRLF分隔符(Windows)/0/LF分隔符(Unix|Linux)/2/CR分隔符(Mac)
'kill_error'=>'1', //屏蔽错误提示=>0/否/1/是
//}


//mail-SOCKET连接SMTP服务器发送(支持ESMTP验证){
	
'smtp_host'=>'smtp.163.com', //SMTP服务器
'smtp_port'=>'25', //SMTP端口
'smtp_auth'=>'1', //要求身份验证=>0/否/1/是
'smtp_user_add'=>'CmsEasy <cmseasymail@163.com>', //发信人地址
'smtp_mail_username'=>'cmseasymail@163.com', //用户名
'smtp_mail_password'=>'cmseasy', //密码
//}

//mail-PHP函数SMTP发送Email(仅Windows主机下有效,不支持ESMTP验证){
	
'smtp_host'=>'smtp.163.com', //SMTP服务器
'smtp_port'=>'25', //SMTP端口
//}


//slide-幻灯片设置{
'slide_width'=>'1000', //幻灯宽度
'slide_height'=>'156', //幻灯高度
'slide_number'=>'5', //幻灯片数量<5
'slide_pic1'=>'images/slide/banner01.jpg', //图片1地址=>image
'slide_pic1_title'=>'CmsEasy3.0助力企业网络营销', //图片1标题
'slide_pic1_url'=>'http://www.cmseasy.cn', //图片1链接地址
'slide_pic2'=>'images/slide/banner02.jpg', //图片2地址=>image
'slide_pic2_title'=>'海量精美CmsEasy模板免费下载', //图片2标题
'slide_pic2_url'=>'http://www.cmseasy.cn', //图片2链接地址
'slide_pic3'=>'images/slide/banner03.jpg', //图片3地址=>image
'slide_pic3_title'=>'免费下载CmsEasy,还有机会获取商业授权', //图片3标题
'slide_pic3_url'=>'http://www.cmseasy.cn', //图片3链接地址
'slide_pic4'=>'images/slide/banner04.jpg', //图片4地址=>image
'slide_pic4_title'=>'欢迎网建公司及工作室参与CmsEasy官方分享计划', //图片4标题
'slide_pic4_url'=>'http://www.cmseasy.cn', //图片4链接地址
'slide_pic5'=>'images/slide/banner05.jpg', //图片5地址=>image
'slide_pic5_title'=>'CmsEasy服务/售后/程序多重升级', //图片5标题
'slide_pic5_url'=>'http://www.cmseasy.cn', //图片5链接地址
//}

//cnzz-cnzz统计配置{
'cnzz_user'=>'80612435', //验证码A[自动生成,请牢记,每域名只赠送一个全景帐号!]
'cnzz_pass'=>'8070692042', //验证码B[自动生成,请牢记,每域名只赠送一个全景帐号!]
//}
//cnzz-cnzz统计使用在[功能模块->统计管理]{
//}

/**
	错误记录
		true  : 开启
		false : 关闭
*/
//只在调式中开启
'debug'=>false,
'design_mode'=>false,

);

