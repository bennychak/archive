//t_box
/*$(function(){
	$("textarea",".t_textarea").focus(function(){$(".t_shadow").show();}).blur(function(){$(".t_shadow").hide();});
	$("a",".t_btn").click(function(){
		$(this).addClass("selected").parents().siblings().children().removeClass("selected");
		$("textarea",".t_textarea").trigger("focus");
		return false;
		});
	});*/
$(function(){
	$("#t_box textarea").focus(function(){$(".t_sh").show();}).blur(function(){$(".t_sh").hide();});
	$("#t_box .b1 a").click(function(){
		if($(".txt_area").css("display") == "block"){
			return false;
			}
		$(this).parents("li").siblings().removeClass("t_z4").end().parents("ul").addClass("t_bgtxt").removeClass("t_bgimg t_bgmov");
		$(".txt_area").show().children("textarea").trigger("focus").select();
		$(".img_area,.mov_area").hide();
		return false;
		});
	$("#t_box .b2 a").click(function(){
		if($(".img_area").css("display") == "block"){
			return false;
			}
		$(this).parents("li").addClass("t_z4").siblings().removeClass("t_z4").end().parents("ul").addClass("t_bgimg").removeClass("t_bgtxt t_bgmov");
		$(".txt_area,.img_area,.mov_area").hide();/*
		$(this).parents("li").removeClass("t_z4");
		$(".img_area").fadeIn("fast");
		$("textarea",".img_area").trigger("focus").select();*/
		return false;
		});
	$("#t_box .b3 a").click(function(){
		if($(".mov_area").css("display") == "block"){
			return false;
			}
		$(this).parents("li").addClass("t_z4").siblings().removeClass("t_z4").end().parents("ul").addClass("t_bgmov").removeClass("t_bgtxt t_bgimg");
		$(".txt_area,.img_area,.mov_area").hide();
		return false;
		});
	$(".img_area a").click(function(){
		$(".img_area").fadeOut("fast");
		$("#t_box .b2").addClass("t_z4");
		return false;
		});
	$(".mov_area a").click(function(){
		$(".mov_area").fadeOut("fast");
		$("#t_box .b3").addClass("t_z4");
		return false;
		});
	$("#t_box input.movsubtn").click(function(){
		$(this).parents(".b3").removeClass("t_z4");
		$(".mov_area").fadeIn("fast");
		$("textarea",".mov_area").trigger("focus").select();
		});
	});
	
//labelcomment
$(function(){
	$(".labelcomment .lw a").hover(function(){
		$(".w",this).css("overflow","visible");
		$("b",this).hide();
		},function(){
			$(".w",this).css("overflow","hidden");
			$("b",this).show();
			});
	$(".labelcomment li.lw").hover(function(){
		$(this).siblings(".lw").children().children(".w").toggleClass("lwposition").children(".w1").toggleClass("lwposition");
		});
	});
	
//avatarlist
$(function(){
	$(".fn_avatar_hover .avatarlist li.listitem,.fn_avatar_hover2:not('.comment') .avatarlist li.listitem,.fn_avatar_hover3 .avatarlist li.listitem").hover(function(){
		$(this).toggleClass("avatarselect").next().toggleClass("lastborder");
		});
	});
	
//layer 通用
$(function(){
	$(".layTogglea").click(function(event){
		var toggleid = $(this).siblings(".toggle").attr("id");
		$("#" + toggleid).toggle();
		$(".toggle:not('#" + toggleid + "')").hide().siblings(".layTogglea").removeClass("dbarrow2");
		return false;
		});
	});

//消息 模仿编辑收件人点击
$(function(){
	$(".sendnewmsg",".content_bar").click(function(){
		$(".btn_a_receiver",".avatartool").trigger("click");
		return false;
		});
	});

//layer2 箭头上下翻
$(function(){
	$(".l2a").click(function(){
		$(this).toggleClass("dbarrow2");
		return false;
		});
	});

//fix_layer
$(function(){
	$(".fix_a").click(function(){
		$(this).parents("li").css("z-index","20").addClass("avatarfix").siblings("li").css("z-index","1").removeClass("avatarfix").children(".fix_layer").hide();
		$(this).siblings(".fix_layer").show();
		return false;
		});
	$(".close16",".fix_layer").click(function(){
		$(this).parents(".fix_layer").hide().parents("li").removeClass("avatarfix");
		return false;
		});
	$(".cancel",".fix_layer").click(function(){
		$(this).parents(".fix_layer").children(".close16").trigger("click");
		});
	});
	
//layer5
$(function(){
	$(".nofriendrelative").click(function(){
		$(this).parents(".icon_more").siblings(".layer5a").toggle();
		return false;
		});
	$(".nogroup").click(function(){
		$(this).parents(".icon_more").siblings(".layer5b").toggle();
		return false;
		});
	});

//layer6
$(function(){
	$(".close16",".layer6").click(function(){
		$(this).parents(".layer6").hide();
		return false;
		});
	});

//点击后本体hide，指定class show
$(function(){
	$(".prenewmessage a").click(function(){
		$(this).parents("li").hide();
		$(".newmessage").slideDown(200);
		return false;
		});
	});

//单独照片页layer1内选项
//grouplist行为
$(function(){
	$(".grouplist dl dd > a").click(function(){
		$(this).siblings(".none").toggle();
		$(this).parent("dd").siblings("dd").children(".none").hide();
		var a = $(this).siblings(".none").css("display");
		if(a == "none"){
			$(this).removeClass("blackarrow");
			}else if(a == "block"){
				$(this).addClass("blackarrow");
				$(this).parents("dd").siblings("dd").children("a").removeClass("blackarrow");
				}
		return false;
		});
	});

//scrollTop
$(function(){
	var topDistance = 400;//go-top距顶端距离
	var showDistance = 1;//距离顶端多少距离开始显示go-top
	var gotopCon = "<div class='go-top'><a href='#'><img src='/images/gotop.gif' /></a></div>"
	var thisTop = $(window).scrollTop() + topDistance;
	$("#ui_wrap1").css("position","relative");
	$("#ui_wrap1").append(gotopCon);
	$(".go-top").css("top",thisTop);
	if($(window).scrollTop() < showDistance){
		$(".go-top").hide();
		}
	$(window).scroll(function(){
		thisTop = $(this).scrollTop() + topDistance;
		$(".go-top").css("top",thisTop);
		if($(this).scrollTop() < showDistance){
			$(".go-top").fadeOut("fast");
			}else{
				$(".go-top").fadeIn("fast");
				}
		});
	$("a",".go-top").click(function(){
		$("html").animate({scrollTop:0},"fast");//IE,FF
		$("body").animate({scrollTop:0},"fast");//Webkit
		return false;
		});
	});
	
	///*go-top配置*/
	//.go-top{ width:25px; height:65px; position:absolute; right:-30px;}
	//	.go-top a{ display:block; cursor:pointer; outline:none;}

//a的name对应id区域显示的选项卡
$(function(){
	$("a",".sacard").click(function(){
		var n = $(this).attr("name");
		$("#" + n).show().siblings().hide();
		$(this).addClass("selected").parents("span").siblings().children("a").removeClass("selected");
		return false;
		});
	});

//分类导航右栏ol的style
$(function(){
	$(".category_nav_con").each(function(){
		$(".right ol li:gt(9)",this).css("list-style","none");
		});
	});
	
//分类导航列表选中状态
$(function(){
	$(".fn_avatar_hover3 .avatarlist li.listitem").click(function(){
		if($("input[type=checkbox]",this).attr("checked")){
			$("input[type=checkbox]",this).attr("checked",false);
			$(this).removeClass("avatarfix");
			}else{
				$("input[type=checkbox]",this).attr("checked",true);
				$(this).addClass("avatarfix");
				}
			});
	$(".fn_avatar_hover3 .avatarlist li.listitem input[type=checkbox]").click(function(event){
		$(this).parents("li.listitem").trigger("click");
		});
	});
			
//居中定位
$(function(){
		var x = ($(".centerp_box").width() - $(".centerp").width())/2;
		var y = ($(".centerp_box").height() - $(".centerp").height())/2;
		$(".centerp").css({
			left:x,
			top:y
		});
	});

//avatarlist7
$(function(){
	$("#avatarlist7 li.listitem").hover(function(){
		$(this).toggleClass("hover");
		$(this).children(".reply").toggle();
		}).click(function(){
			$(this).addClass("selected").children(".rightarrow").show().end().siblings(".listitem").removeClass("selected").children(".rightarrow").hide().siblings(".fix_layer").children(".close16").trigger("click");
			$(this).parents("ul").siblings("ul").children("li.listitem").removeClass("selected").children(".rightarrow").hide();
			});
	});

//注册页推荐好友选项卡
$(function(){
	$("#ui_reg ul.menu a").click(function(){
		$(this).parents("ul").children("li").removeClass("selected").children(".menuside").remove();
		$(this).parents("li").addClass("selected").prepend("<div class='menuside'></div>")
		var se = $(this).attr("name");
		$(".suggest_friend ." + se + "list").show().siblings("ul").hide();
		return false;
		});
	});

//账户设置列表
$(function(){
	$(".fn_hoverbg tr:not(:first)").hover(function(){
		$(this).toggleClass("hoverbg");
		});
	});

//鼠标移进移出input事件
$(function(){
	$(".toggletxt").focus(function(){
		var check1 = $(this).val();
		if (check1 == this.defaultValue) {
			$(this).val("").addClass("tginput_font1");
			}
		});
	$(".toggletxt").blur(function () {
		var check1 = $(this).val();
		if(check1 == this.defaultValue || check1 == ""){
			$(this).val(this.defaultValue).removeClass("tginput_font1");
			}
		});
	$(".togglepass").focus(function(){
		var check1 = $(this).val();
		if (check1 == this.defaultValue) {
			$(this).val("").removeClass("tginput_img1");
			}
		});
	$(".togglepass").blur(function () {
		var check1 = $(this).val();
		if(check1 == this.defaultValue || check1 == ""){
			$(this).val(this.defaultValue).addClass("tginput_img1");
			}
		});
	});

//toggleblock
$(function(){
	$(".toggleblock").click(function(){
		$(this).parents("li").children(".toggleblock_target").toggle();
		$(this).parents("li").siblings("li").children(".toggleblock_target").hide();
		return false;
		});
	});

//评论的textarea
$(function(){
	$(".comment .commentinput textarea").focus(function(){
		$(this).addClass("add");
		}).blur(function(){
			$(this).removeClass("add");
			});
	});

//评论图片缩略图和视频
$(function(){
	$(".fn_stateimg").click(function(){
		$(this).toggle().siblings(".albumblog").toggle();
		});
	$(".albumblog .stateimg_l").click(function(){
		$(this).parents(".albumblog").toggle().siblings(".stateimg").toggle();
		});
	});
$(function(){
	$(".albumblog .fn_up").click(function(){
		$(this).parents(".albumblog").children(".stateimg_l").trigger("click");
		return false;
		});
	$(".statevideo a").click(function(){
		$(this).parents(".statevideo").hide().siblings(".videoblog").show();
		return false;
		});
	$(".videoblog .fn_up").click(function(){
		$(this).parents(".videoblog").hide().siblings(".statevideo").show();
		return false;
		});
	});

//消息框头像
$(function(){
	$(".avatargroup .avatar_s:gt(4)").hide();
	$(".avatartool .btn_a_open").click(function(){
		$(this).toggleClass("btn_a_close").parents(".avatartool").siblings(".avatargroup").toggleClass("autoheight").children(".avatar_s:gt(4)").toggle();
		return false;
		});
	$(".avatartool .btn_a_open").toggle(function(){
		var avatarbox_h = $(this).parents(".avatarbox").height() -48;
		var chatbox_h = $(this).parents(".avatarbox").siblings(".chatbox").height() - avatarbox_h;
		$(this).parents(".avatarbox").siblings(".chatbox").height(chatbox_h);
		},function(){
			$(this).parents(".avatarbox").siblings(".chatbox").height(270);
			});
	});

//show_login
$(function(){
	$(".fn_showlogin").click(function(){
		$(this).parents(".loginbox").hide();
		$(".fn_showlogin_target").show();
		});
	});

//body事件和layer延时消失
$(function(){
	$("body").click(function(){
		$(".toggle").hide();
		$(".l2a").removeClass("dbarrow2");
		});
	$(".toggle").click(function(event){
		event.stopPropagation();
		});
	});