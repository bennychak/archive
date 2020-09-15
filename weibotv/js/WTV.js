var actionRoot = "./action/";
var WTV_live = {
	//初始化http播放器
	initHttpPlayer : function(){
		var isIE  = (navigator.appVersion.indexOf("MSIE") != -1) ? true : false;
		WTV_live.httpObj = !!isIE ? document.getElementById("SimpleVPlayer") : document.embeds["SimpleVPlayer"];
		WTV_live.httpPlay("", "");
	},
	
	//http播放器播放
	httpPlay : function(cnlid, url){
		if (typeof WTV_live.httpObj != "undefined" && WTV_live.httpObj != null && typeof WTV_live.httpObj.loadAndPlayVideoFromVID != "undefined") {
			WTV_live.httpObj.loadAndPlayVideoFromVID(url, cnlid);
		}
	},

	// 停止http的播放
	httpStop : function(){
		if (typeof WTV_live.httpObj != "undefined" && WTV_live.httpObj != null && typeof WTV_live.httpObj.stopVideo != "undefined") {
			WTV_live.httpObj.stopVideo();
		}
	}
}
	
var WTV_weibo = {
	topicDefaultText: "聊聊你在看的节目",
	txtWrap			: $(".txtWrap"),
	msgInputBox		: $(".talkWrap textarea"),
	faceWrap		: $(".faceWrap"),
	talkList				: $(".talkList"),
	zhuanboWrap		: $(".zhuanboWrap"),
	currrentObject	: null,
	newMsgNumFunc	: null,
	getNewMsg : function(){
		if(!document.getElementById("rollplay").checked){
			newMsgNumFunc = setInterval(function(){
				var _topic	= $(".currentInsideTop .fontYH span").html() || "微电视";;
				var tid		= $(".talkList ul li").first().attr("data-id");
				var ttime	= $(".talkList ul li").first().attr("data-time"); 
				if (!tid && !ttime) return;
				$.ajax({
					type:"GET",
					dataType:'jsonp',
					url:"http://radio.t.qq.com/api/topic/getTopicInfo.php?count&id="+tid+"&time="+ttime+"&c=getNewMsgNum&t="+_topic
				})
			},20000)
		}else{
			clearInterval(newMsgNumFunc);
		}
	},
	showNewMsg	: function(){
		var url;
		var topic	= $(".currentInsideTop .fontYH span").html() || "微电视";;
		var tid		= $(".talkList ul li").first().attr("data-id");
		var ttime	= $(".talkList ul li").first().attr("data-time"); 
		if(WTV_weibo.newMsgNum >16){
			url = "http://radio.t.qq.com/api/topic/getTopicInfo.php?c=insertNewTopic&t="+topic;
		}else{
			url = "http://radio.t.qq.com/api/topic/getTopicInfo.php?n="+WTV_weibo.newMsgNum+"&id="+tid+"&time="+ttime+"&c=insertNewTopic&t="+topic;
		}
		$.ajax({
			type:"GET",
			dataType:'jsonp',
			url:url
		});
	},
	//遍历所有微博账号，获取是否收听信息
	getFollowState : function(){ 
		var names = '';
		$("a[data-name]").each(function(index) {
			var field = $(this);
			names += field.attr('data-name') + ',';
		});
		if(names.length){
			$.ajax({
				type:"POST",
				dataType:"jsonp",
				url:"http://radio.t.qq.com/api/relation/userRelation.php?c=relation&u="+names
			});
		}
	},
	//获取电视台官方微博账号收听状态
	getTVFollowState : function(){
		if($("[data-TVName]")){
			$.ajax({
				type:"POST",
				dataType:"jsonp",
				url:"http://radio.t.qq.com/api/relation/userRelation.php?c=TVFollowState&u="+$("a[data-TVName]").attr("data-TVName")
			});
		}
	},
	//发表后插入新内容
	insertPublish : function(){
		var _topic = $(".currentInsideTop .fontYH span").html() || "微电视";;
		var tid = $(".talkList ul li").first().attr("data-id");
		var ttime = $(".talkList ul li").first().attr("data-time"); 
		$.ajax({
			type:"GET",
			dataType:'jsonp',
			url:"http://radio.t.qq.com/api/topic/getTopicInfo.php?n=1&id="+tid+"&time="+ttime+"&c=updateTopic&t="+_topic
		});
	},
	showFace : function(){
		$("img.crs").each(function(i){
			$("img.crs").eq(i).attr("src",$("img.crs").eq(i).attr("crs")).show();
		});
	},
	logoutState : function(){
		var names = '';
		$("a[data-name]").each(function(index) {
			$(this).attr("title","收听").html("+收听").removeClass("disabled").addClass("addFollow");
		});
		$("a[data-TVName]").html("立即收听").attr("title","立即收听").addClass("addFollow").removeClass("delAttention");
		$(".followed").remove();
	},
	init : function(){
		WTV_weibo.getFollowState();
		WTV_weibo.msgInputBox.val(WTV_weibo.topicDefaultText);
		WTV_weibo.msgInputBox.bind({
			focus:function(e){
				targetInput = $(".talkWrap textarea");
				var defaultTopic = $(".currentInsideTop .fontYH span").html()? "#"+$(".currentInsideTop .fontYH span").html()+"#" : "我正在#微电视#边看电视边聊天，电视时间不再孤单！很给力！"
				$(this).val() === WTV_weibo.topicDefaultText ? $(this).val(defaultTopic) : "";
				WTV_weibo.txtWrap.addClass("active");
				WTV_weibo.talkList.height(320);
				$(this).trigger("keyup");
				
			},
			blur:function(){
				if( !$.trim($(this).val()).length ){
					$(this).val(WTV_weibo.topicDefaultText);
					WTV_weibo.txtWrap.removeClass("active");
					WTV_weibo.talkList.height(340);
				}
			},
			change:function(){
				$(this).trigger("keyup");
			}
		});
		//收听按钮
		$(".addFollow").live("click",function(e){
			e.preventDefault();
			if(WTV.checkLogin()){
				if($(this).attr("data-name")){
					WTV_weibo.currrentObject = $(this);
					$.ajax({
						url:"http://radio.t.qq.com/api/relation/follow.php?c=follow&u="+$(this).attr("data-name"),
						dataType:"jsonp"
					});
				}else{
					WTV_weibo.currrentObject = $(this);
					$.ajax({
						url:"http://radio.t.qq.com/api/relation/follow.php?c=followTV&u="+$(this).attr("data-TVName"),
						dataType:"jsonp"
					});
				}
			}
		});
		$(".delAttention").live("click",function(e){
			e.preventDefault();
			if($(this).attr("data-TVName")){
				WTV_weibo.currrentObject = $(this);
				$.ajax({
					url:"http://radio.t.qq.com/api/relation/unfollow.php?c=unFollow&u="+$(this).attr("data-TVName"),
					dataType:"jsonp"
				});
			}
		});
		$(".disabled").live("click",function(e){
			e.preventDefault();
		});
		//发表
		$(".submit").click(function(e){
			if(WTV.checkLogin()){
				if(WTV_weibo.msgInputBox.val().length <= 140 && WTV_weibo.msgInputBox.val().length > 0 ){
					if(WTV_weibo.msgInputBox.val()!="#"+ ($(".currentInsideTop .fontYH span").html() || "微电视") +"#"){
						$("#sendMsgForm").submit();
					}
				}
			}
		});
		//转播发布
		$(".zhuanboBtn").click(function(e){
			if(WTV.checkLogin()){
				if($(".zhuanboTxt").val().length <= 140 )
					$("#zbForm").submit();
			}
		});
		//表情
		var targetInput = $(".talkWrap textarea"); // 目标input对象
		$("a[role='biaoqing']").bind("click",function(e){
			if(WTV_weibo.faceWrap.is(":visible")) return ;
			var self = $(this);
			var role = self.attr("role");
			if(WTV_weibo.zhuanboWrap.css("display") == "block" && !self.hasClass("tzhuanbo")){return;}
			WTV_weibo.faceWrap.css({
				"display": "block",
				"left"	 : self.offset().left-100,
				"top"	 : self.offset().top+30
			});
			WTV_weibo.faceWrap.find(".close").click(function(e){
				e.preventDefault();
				WTV_weibo.faceWrap.hide(100);
			});
		});
		$(".newweibo a").click(function(e){
			WTV_weibo.showNewMsg()
			$(".newweibo").hide(300);
		});
		$("a[role='zhuanbo']").live("click",function(){
			if(WTV.checkLogin()){
				var self = $(this);
				var pid = $(this).attr("data-tid");
				var _wrap = WTV_weibo.zhuanboWrap;
				if(_wrap.is(":visible")) return ;
				$("#zbPid").val(pid);
				$(".zhuanboTxt").val("");
				$(".zhuanboWrap").css({
					"display": "block",
					"left"	 : self.offset().left - 285,
					"top"	 : self.offset().top + 24
				});
				targetInput = $(".zhuanboTxt");
				$(".a[role='biaoqing']").eq(0).click(function(){return false;});
				$(".zhuanboWrap").find(".close").click(function(e){
					e.preventDefault();
					$(".zhuanboWrap").hide();
					$(".faceWrap").hide();
					$(".zhuanboWrap").find(".sendmsgtip").html("");
					targetInput = $(".talkWrap textarea");
				});
				
			}

		});
		
		var QQFace = $(".faceWrap");
		QQFace.find(".dFace a").click(function(e){
			e.preventDefault();
			if(targetInput == "undefined") return;
			var undefined;
			if (targetInput.val().length >= 0){
				targetInput.focus();
				caret = (targetInput.get(0).caret !== undefined ? targetInput.get(0).caret : targetInput.val().length) ;
				insertText("/" + $(this).attr("title") ,caret ,targetInput);
			}
			QQFace.hide();
		});
		
		
		$.fn.cursorPos = function (pos) {
			if ($(this).get(0).setSelectionRange) {
			  $(this).get(0).setSelectionRange(pos, pos);
			} else if ($(this).get(0).createTextRange) {
			  var range = $(this).get(0).createTextRange();
			  range.collapse(true);
			  range.moveEnd('character', pos);
			  range.moveStart('character', pos);
			  range.select();
			}        
		};
		//插入字符
		var insertText = function (text ,caret ,holder) {
		   var pre;
		   var suff;
		   var holderText;

		   caret = caret || 0;

		   if (holder.nodeName) {
			   holder = $(holder);
		   }

		   holderText = holder.val();
		   pre = holderText.substr(0,caret);
		   suff = holderText.substr(caret);
		   holderText = [pre,text,suff].join("");
		   holder.val(holderText);
		   holder.focus();
		   holder.cursorPos([pre,text].join("").length);
	   }
		// 获取光标索引位置
		// http://jsbin.com/iwopa
		if (!$.fn.caret) {
			$.fn.caret = function (callback) {
				var el = $(this).get(0);
				var ret = 0;
				if (el.nodeName.toLowerCase() === "textarea") {
					if (el.selectionStart) {
						ret = el.selectionStart;
					} else if (document.selection) {
						var r = document.selection.createRange();
						if (r !== null) {
							var re = el.createTextRange();
							var rc = re.duplicate();
							re.moveToBookmark(r.getBookmark());
							rc.setEndPoint('EndToStart', re);
							ret = rc.text.length;
						}
					}
				}
				if (callback) {
					callback(el);
				}
				return ret;
			};
		}
		//高亮插入文字
		var highlightOrInsert = function (text ,holder ,trailer ,suff) {
		   trailer = trailer || "#";
		   suff = suff || "";
		   var range;
		   var holderText = holder.value || "";
		   var start = holderText.lastIndexOf(text);
		   var end = start + text.length;

		   // 插入文字
		   if (start < 0) {
			   holder.value = [holderText ,trailer ,text ,trailer ,suff].join("");
			   start = holder.value.lastIndexOf(text);
			   end = start + text.length;
		   }

		   // 高亮文字
		   if (document.createRange) {
				holder.setSelectionRange( start, end );
		   } else {
				range = holder.createTextRange();
				range.collapse(true);
				range.moveStart( 'character', start );
				range.moveEnd( 'character', end - start );
				range.select();
		   }
		}
		
		//初次加在获取4条数据
		_defaultTopic = $(".currentInsideTop .fontYH span").html() || "微电视";
		$.ajax({
			type:"GET",
			dataType:'jsonp',
			url:"http://radio.t.qq.com/api/topic/getTopicInfo.php?n=4&c=insertTopic&t="+_defaultTopic
		});
		
		// 滚动直播
		document.getElementById("rollplay").checked = false;
		var loadTopic;
		$("#rollplay").click(function(){
			if(document.getElementById("rollplay").checked){
				$(".newweibo").hide(100);
				var _topic = $(".currentInsideTop .fontYH span").html() || "微电视";;
				loadTopic = setInterval(function(){
					var tid = $(".talkList ul li").first().attr("data-id");
					var ttime = $(".talkList ul li").first().attr("data-time"); 
					$.ajax({
						type:"GET",
						dataType:'jsonp',
						url:"http://radio.t.qq.com/api/topic/getTopicInfo.php?n=1&id="+tid+"&time="+ttime+"&c=updateTopic&t="+_topic
					});
				},5000);
				WTV_weibo.getNewMsg();
			} else {
				clearInterval(loadTopic);
				WTV_weibo.getNewMsg();
				
			}
		});
		// 话题
		$(".creatNew").click(function () {
			highlightOrInsert("输入话题标题",targetInput.get(0));
		});
		$("#allTopic").click(function(e){
			$(this).attr("href",$(this).attr("href")+ ($(".currentInsideTop .fontYH span").html() || "微电视"));
		});
		// 检查字数
		$(".txtWrap textarea , .zhuanboTxt").keyup(function(event) {
			if (event.keyCode === 17 || event.keyCode ===13) {
				return;
			}
			var msgbox = $(this);
			var msglen = msgbox.val().length;
			var msgtip = $(".talkWrap .sendmsgtip");
			if(msgbox.attr("role") == "zhuanbo")
				msgtip = $(".D .sendmsgtip");
			var tip;
			msgbox.get(0).caret = msgbox.caret();
			
			if (msglen<=140) {
				tip = "还能输入<span>"+(140-msglen)+"</span>字";
				msgtip.removeClass("formerror");
			} else {
				tip = "超出<span>"+(Math.abs(140-msglen) > 100?"很多":Math.abs(140-msglen))+"</span>字";
				msgtip.addClass("formerror");
			}
			msgtip.html(tip);
		}).keydown(function (event) {
			var sendbtn = $(".sendBtn");
			if (event.ctrlKey && (event.keyCode === 13 || event.keyCode === 10)) {
				if (sendbtn.attr("disabled")) {
					return;
				}
				$(".submit").trigger("click");
			}

		}).mouseup(function () {
			var self = $(this);
			self.get(0).caret = self.caret(); // 记录当前光标位置
		});
		//获取当前电视台微博账号数据
		$.ajax({
			type:"GET",
			url:"http://radio.t.qq.com/api/user/getUserInfo.php?u="+channel_acconut+"&c=setUserInfo",
			dataType:"jsonp"
		});
		var unixtime = function (day,hours,minute){
			var dt = new Date();
			var _day = day ? dt.getDay()+1 : dt.getDay() ;
			var _hours = hours || dt.getHours();
			var _minute = minute || dt.getMinutes();
			var ux = Date.UTC(dt.getFullYear() ,dt.getMonth() ,_day ,_hours ,_minute , dt.getSeconds())/1000;
			return ux;
		}
		//每隔一分钟，拉去 下个节目信息、
		setInterval(function(){
			var nowHours	= (new Date().getHours()   < 10  ) ? "0" + new Date().getHours() : new Date().getHours();
			var nowMinuts	= (new Date().getMinutes() < 10  ) ? "0" + new Date().getMinutes() : new Date().getMinutes();
			var nowTime = nowHours+":"+nowMinuts;
			//下个节目信息
			if(channel_id){
				$.getJSON(actionRoot+"./request.php?ac=getTvPro&tvid="+channel_id+"&tvname="+$(".currentInsideTop .fontYH span").html() ,function(data){
					console.log(data);
					if($(".currentInsideTop .fontYH span").html() != data && data){
						$(".currentInsideTop .fontYH span").html(data);
						if($(".txtWrap").hasClass("active")){$(".txtWrap textarea").val("#"+data+"#")}
						$(".talkList ul").html("");
						$.ajax({
							type:"GET",
							dataType:'jsonp',
							url:"http://radio.t.qq.com/api/topic/getTopicInfo.php?n=4&c=insertTopic&t="+data
						});
					}
				});
			}
		},getCurProTime);
		setInterval(function(){
			//节目单数据
			$.getJSON(actionRoot+"request.php?ac=getTVList",function(data){
				if(!data) return ;
				$("ul.roll").html("");
				$(data).each(function(i){
					$(data[i]).each(function(j){
						var style = i%2?"odd":"even";
						if(data[i]['programs'].pn == "该频道暂无预告") return ;
						var time = data[i]['programs'].tm ? data[i]['programs'].tm : "暂无";
						$("ul.roll").append(
							'<li class="'+style+'">'+
								'<div class="tvstation"><img src="'+data[i].channel_logo+'" alt="'+data[i].channel_name+'" />'+data[i].channel_name+'</div>'+
								'<div class="showtime">'+ time +'</div>'+
								'<div class="currentplay">'+
									'<a href="?tvid='+data[i].channel_id+'"><em></em></a>'+
									'<a href="?tvid='+data[i].channel_id+'">'+data[i]['programs'].pn+'</a>'+
								'</div>'+
							'</li>'
						);
					});
				})
				
			})
		}, getTVListTime);
	}
};

var WTV_DIALOG = {
    _id: 0,
    _zindex: 999,
    _msgboxTextHeight: function (text,width) { // 模拟计算文字高度
            var dummy = $("<div class=\"wtvDialog\"><div class=\"msgbox\"><div class=\"msgtext\">" + text + "</div></div></div>");
            var dummycss;
            var dummyHeight;
            dummy.css({
                visibility:"hidden"
            });
            dummy.append(text); // 修正
            $("body").append(dummy);
            dummyHeight = dummy.find(".msgtext").height();
            dummy.remove();
            return dummyHeight;
    },
    
    // 移除所有的对话框
    _disposeAllDialog: function () { 
        var dialog = $(".wtvDialog"); // 对话框主层
        var modalBgLayer = $(".wtvDialogModalBg"); // 取背景层
        dialog.remove();
        modalBgLayer.animate({
            opacity:0
        },200,function () {
            modalBgLayer.remove();
        });
    },

    // 移除指定ID的对话框
    _disposeDialog: function (id) {
        $("#dialog"+id).remove();
        $("#dialogModalBg"+id).remove();
    },

    _createDialog: function (options) { // 对话框初始化
        var dialog;
        var dialogClose;
        var innerDOM;
        var dialogHtml = "<div class=\"wtvDialog\" data-id=\"" + this._id + "\" id=\"dialog" + this._id + "\">"
                        +"<div class=\"wtvDialogBg\"><iframe></iframe></div>"
                        +"<div class=\"wtvDialogMain\"></div>";
        if(options && options.showClose){ // 是否显示关闭按钮
            dialogHtml += "<a class=\"close\" href=\"javascript:void(0);\"></a>";
        }
        dialogHtml += "</div>";
        dialog = $(dialogHtml);
        
        dialog.css({
            zIndex: WTV_DIALOG._zindex
        });

        dialogClose = dialog.find(".close");

        if (dialogClose.length>0) { // 关闭按钮
            dialogClose.click(function () {
                WTV_DIALOG._disposeDialog(dialog.attr("data-id"));
            });
        }
        
        if(options && options.autoClose){
            setTimeout(function () {
                WTV_DIALOG._disposeDialog(dialog.attr("data-id"));
                if (options.autoClose.callback) {
                    options.autoClose.callback();
                }
            },(options.autoClose.wait || 2000));
        }
        
        if(options && options.getDOM){ // 添加DOM(jQuery Object)
            innerDOM = options.getDOM();
            dialog.find(".wtvDialogMain").append(innerDOM);
        }
        
        dialog.css({
            width: options.width + "px",
            height: options.height + "px",
            top: options.top + "px",
            left: options.left + "px"
        });
        return dialog; 
    },

    _merge: function (obj1,obj2) {
        var k;
        for (k in obj1) {
            if (obj1.hasOwnProperty(k)) {
                if (obj2.hasOwnProperty(k)) {
                    obj1[k] = obj2[k];
                }
            }
        }
        return obj1;
    },

    _init: function (options) {
        
        var dialog = $(".wtvDialog"); // 对话框主层
        var modalBgLayer = $(".wtvDialogModalBg"); // 取背景层

        this._id ++;
        this._zindex ++;
        
        if (options && options.modal){ // 无背景层,调用者要求使用背景层
            modalBgLayer = $("<div class=\"wtvDialogModalBg\" id=\"dialogModalBg" + this._id + "\"><iframe></iframe></div>");
            modalBgLayer.css({
                opacity: 0.35
               ,zIndex: WTV_DIALOG._zindex
            });
            
            $("body").append(modalBgLayer);
            
        } 
        dialog = this._createDialog(options);
        $("body").append(dialog);
        if (options.callback) {
            options.callback(dialog);
        }
        return this._id;
    },
    
    msgbox: function (msgtype,text,options){ // 消息提示, msgtype为error,warning,info，text为要显示的文字
        msgtype = msgtype || "warning";
        var textHeight = this._msgboxTextHeight(text,140/*信息区文字宽度*/);
        var msgboxWidth = 220; // 信息提示框宽度
        var mssgboxHeight = textHeight + 30 ; // 信息提示框高度
        var msgboxLeft = ($("body").width() - msgboxWidth) / 2; // 水平居中
        var msgboxTop = (document.documentElement.scrollTop || document.body.scrollTop) + (options.verticalAlign === "middle" ? 1:0.618) * (document.documentElement.clientHeight - mssgboxHeight) / 2; // 黄金分割垂直居中
        var defaultOptions = {
            showClose: true,
            modal: true,
            autoClose: {
                wait: 2000,
                callback: null
            }
        };
        defaultOptions = this._merge(defaultOptions,options);
        this._init({
            modal: defaultOptions.modal,
            showClose: defaultOptions.showClose,
            autoClose: defaultOptions.autoClose,
            width: msgboxWidth,
            height: mssgboxHeight,
            top: msgboxTop,
            left: msgboxLeft,
            getDOM: function () {
                var msgInfo = "<div class=\"msgbox\"><div class=\"msgicon\" style=\"height:"+textHeight+"px;\"><div class=\"icon "+msgtype+"\"></div></div><div class=\"msgtext\">"+text+"</div></div>";
                return $(msgInfo);
            }
        });
    },
    _tipbox: function (type ,text ,modal ,callback) {
        type = type || "success";
        this.msgbox(type, text,{
            showClose: false,
            "modal": modal,
            autoClose: {
                wait: 2000,
                callback: callback
            }
        });
    },
    tipbox: function (type ,text ,callback) {
        this._tipbox(type ,text ,false ,callback);
    },
    modaltipbox: function (type ,text ,callback) {
        this._tipbox(type ,text ,true ,callback);
    }
};

var WTV = {
	slideImage	: function(){
		var oBox			= $("#slide .slideBox")
			oList			= $("#slide ul"),
			oItem			= $("#slide li"),
			oItemCount		= $("#slide li").size() ,
			oListWidth		= 0 ,
			showNum			= 4 ,
			paginationPanel	= $("#slide .pagination"),
			paginationBtn	= $("#slide .pagination a"),
			slideBtn		= $("#slide .arrow"),
			slideWdith		= 0,
			currentPage		= 0,
			pagination		= parseInt( oItemCount / showNum ) || 1 ;
		if( oItemCount > showNum ){
			pagination	= pagination + (parseInt( oItemCount % showNum ) > 0 ? 1 : 0);
		}
		for(var i = 0; i < pagination; i++){
			paginationPanel.append('<a href="javascript:;"></a>');
		}
		paginationPanel.find("a:eq(0)").addClass("on");
		oItem.each(function(){oListWidth += this.offsetWidth;});
		oList.width(oListWidth);
		var goSlide = function(e){
			
			var oBtnType = $(this).attr("role");
			if (oBtnType == "left")
				goRight();
			else
				goLeft();
		};
		var goLeft = function(pageNum){
			if($("#slide .pagination a.on").index() == $("#slide .pagination a").length-1) return;
			slideBtn.unbind("click");
			paginationPanel.find("a").die("click");
			var _pageNum = (pageNum != undefined) ? pageNum : currentPage+1 ;
			slideWdith = oBox.width() * _pageNum;
			$(oList).animate({"marginLeft":"-"+slideWdith+"px"},2000,function(){slideBtn.bind("click",goSlide);paginationBtn.live("click",page);});

			if(pageNum != undefined)
				currentPage = pageNum ;
			else
				currentPage++;
			changePage();
		}
		var goRight = function(pageNum){
			if(parseInt(oList.css("marginLeft")) == 0){return;}
			slideBtn.unbind("click");
			paginationPanel.find("a").die("click");
			var _pageNum = (pageNum != undefined) ? pageNum : currentPage-1 ;
			slideWdith = oBox.width() * _pageNum;
			$(oList).animate({"marginLeft":"-"+slideWdith+"px"},2000,function(){slideBtn.bind("click",goSlide);paginationBtn.live("click",page);});
			if(pageNum != undefined)
				currentPage = pageNum ;
			else
				currentPage--;
			changePage();
			
		}
		var changePage = function(){
			paginationPanel.find("a").removeClass("on");
			paginationPanel.find("a").eq(currentPage).addClass("on");
		}
		var page = function(e){
			slideBtn.unbind("click");
			paginationPanel.find("a").die("click");
			var currentIndex = paginationPanel.find("a.on").index();
			var index = $(this).index();
			if(index > currentIndex)
				goLeft(index);
			else
				goRight(index);
		}
		if(pagination > 1){
			slideBtn.bind("click",goSlide);
		}
		paginationBtn.live("click",page);
	},
	
	checkLogin : function(){
		var uin  = MI.Login.getUin();
		var mbid = MI.S('account_mbid_'+uin);
		if (!uin || !mbid){
			MI.Login.showPopup();
			WTV.listenLogin();
			return false;
		}else{
			return true;
		}
		
	},
	
	subnav : function(){
		$(".topNavItem").bind({
			mouseover	:	function(){$(this).addClass("active"); $(".topNavSub").width(this.offsetWidth);},
			mouseout	:	function(){$(this).removeClass("active");}
		});
		$("#site_nav_mblogin").addClass("show");
	},
	logout : function(){
		$("#mblog_login_button").bind("click",function(){WTV.checkLogin()});
		$("#mblog_logout_text").click(function(){
			$("#back_home").hide();
			WTV_weibo.logoutState();
		})
		
	},
	listenLogin : function(){
		var checkLogined = setInterval(function(){
			var uin  = MI.Login.getUin();
			var mbid = MI.S('account_mbid_'+uin);
			if (uin || mbid){
				WTV.logout();
				$("#back_home").show();
				WTV_weibo.getTVFollowState();
				WTV_weibo.getFollowState();
				clearInterval(checkLogined);
			}
		},1000);
	},

	
	turnlight : function(){
		$(".turnlight").click(function(){
			if($(".lock:visible").size()){
				$(".lock").hide();
				$(".turnlight").attr("title","关灯").html("关灯");
			}else{
				$(".lock").show().height($(".mainWrapper").height());
				$(".turnlight").attr("title","开灯").html("开灯");
			}
		});
	},
	init : function(){
		$(".listbtnlink , .masklist .close").click(function(){
			if($(".masklist:visible").size()){
				$(".masklist").hide();
				if(channel_id){WTV_live.httpPlay(channel_id, "http://zb.v.qq.com:1863/?progid="+channel_id);}
			}else{
				$(".masklist").show();
				if(channel_id){WTV_live.httpStop();}
			}
		});
		WTV.slideImage();
		//WTV.checkLogin();
		WTV.turnlight();
		WTV.listenLogin();
	}
	
}

//收听回调
function follow(data){
	if(data.result){
		WTV_DIALOG.modaltipbox("error","收听失败");
	}else{
		WTV_weibo.currrentObject.html("已收听").attr("title","已收听").addClass("disabled").removeClass("addFollow");
	}
}
//电视台账号收听回调
function followTV(data){
	if(data.result){
		WTV_DIALOG.modaltipbox("error","收听失败");
	}else{
		WTV_weibo.currrentObject.html("取消收听").attr("title","取消收听").addClass("delAttention").removeClass("addFollow addAttention");
		$('<div class="followed"><span class="attend"></span>已收听，</div>').insertBefore(".detail .funBox .left a");
	}
}
//发表回调
var publish = function(data){
	if(!data.result){
		WTV_DIALOG.modaltipbox("success","发表成功！");
		$(".sendmsgtip").html("");
		topic = $(".currentInsideTop .fontYH span").html() || "微电视";
		$(".talkWrap textarea").val("#"+topic+"#");
		WTV_weibo.insertPublish();
	}else{
		WTV_DIALOG.modaltipbox("error",data.msg);
	}
}
//转播回调
var zhuanbo = function(data){
	if(!data.result){
		WTV_DIALOG.modaltipbox("success","转播成功！");
		$(".zhuanboWrap").find("textarea").val("");
		$(".zhuanboWrap").css("display","none");
	}else{
		WTV_DIALOG.modaltipbox("error",data.msg);
	}
}
//取消收听回调
var unFollow = function(data){
	if(data.result){
		WTV_DIALOG.modaltipbox("error","取消收听失败");
	}else{
		WTV_weibo.currrentObject.html("立即收听").attr("title","立即收听").addClass("addFollow").removeClass("delAttention");
		$(".followed").remove();
	}
}
// 更改所有账户收听状态回调
var relation = function(data){
	for(var p in data.info){
		if(parseInt(data.info[p])){
			$("a[data-name='"+p+"']").html("已收听").attr("title","已收听").addClass("disabled").removeClass("addFollow");
		}
	}
}
var TVFollowState = function(data){
	for(var p in data.info){
		if(parseInt(data.info[p])){
			$("a[data-TVName='"+p+"']").html("取消收听").attr("title","取消收听").addClass("delAttention").removeClass("addFollow addAttention");
			if($(".followed")) $(".followed").remove();
			$('<div class="followed"><span class="attend"></span>已收听，</div>').insertBefore(".detail .funBox .left a");
		}
	}
}
//获取当前微博话题的最新数量回调
var getNewMsgNum = function(data){
	if(!data.info.value) return;
	$(".newweibo a").html("有"+data.info.value+"条新广播，点击更新");
	$(".newweibo").show(100);
	WTV_weibo.newMsgNum = data.info.value;
}
//插入话题消息回调
var insertTopic = function(data){
	var info = data.info.talk;
	$(info).each(function(i){
		var image = info[i].image[0] ? '<br /><a href="'+info[i].image[0]+'/460" target="_blank" >点击链接查看图片</a>' : "" ;
		$(".talkList ul").append('<li data-id="'+info[i].id+'" data-time="'+info[i].timestamp+'"><div class="msgCnt"><a href="http://t.qq.com/'+info[i].name+'"><strong>'+info[i].nick+'</strong></a>: '+info[i].content+image+'</div><div class="pubInfo"><span class="left"><a href="http://t.qq.com/p/t/'+info[i].id+'"  target="_blank" class="time">'+info[i].time+'</a></span><span><a href="javascript:;" role="zhuanbo"  data-tid="'+info[i].id+'">转播</a></span></div></li>');
		WTV_weibo.showFace();
		removeMsg();
	});
	WTV_weibo.getNewMsg();
	
}
//插入最新话题消息回调
var insertNewTopic = function(data){
	var info = data.info.talk;
	for(var i=$(info).length; i>=1; i--){
		var image = info[i-1].image[0] ? '<br /><a href='+info[i-1].image[0]+'/460 target="_blank" >点击链接查看图片</a>' : "" ;
		$(".talkList ul").prepend('<li data-id="'+info[i-1].id+'" data-time="'+info[i-1].timestamp+'"><div class="msgCnt"><a href="http://t.qq.com/'+info[i-1].name+'"><strong>'+info[i-1].nick+'</strong></a>: '+info[i-1].content+image+'</div><div class="pubInfo"><span class="left"><a href="http://t.qq.com/p/t/'+info[i-1].id+'"  target="_blank" class="time">'+info[i-1].time+'</a></span><span><a href="javascript:;" role="zhuanbo" data-tid="'+info[i-1].id+'">转播</a></span></div></li>');
		WTV_weibo.showFace();
		removeMsg();
	}
}
//滚动更新话题回调
var updateTopic = function(data){
	var info = data.info.talk;
	var oneMsg,newH;
	$(info).each(function(i){
		var image = info[i].image[0] ? '<br /><a href='+info[i].image[0]+'/460 target="_blank" >点击链接查看图片</a>' : "" ;
		oneMsg = '<li data-id="'+info[i].id+'" class="newMsg'+i+'" data-time="'+info[i].timestamp+'"><div class="msgCnt"><a href="http://t.qq.com/'+info[i].name+'"><strong>'+info[i].nick+'</strong></a>: '+info[i].content+image+'</div><div class="pubInfo"><span class="left"><a href="http://t.qq.com/p/t/'+info[i].id+'" target="_blank" class="time">'+info[i].time+'</a></span><span><a href="javascript:;" role="zhuanbo" data-tid="'+info[i].id+'">转播</a></span></div></li>';
		$(".talkList ul").prepend(oneMsg);
		newH = $("li[data-id="+info[i].id+"]").height();
		$("li[data-id="+info[i].id+"]").height(0).animate({
			height:newH
		},300);
		WTV_weibo.showFace();
		removeMsg();
	});
	
}
var removeMsg = function(){
	if($(".talkList ul li").size()>32){
		$(".talkList ul li").last().remove();
	}
}
//重写当前电视台官方账号基本信息回调
var setUserInfo = function(data){
	if (!data.info) return;
	var info	= data.info;
	var VIP		= (info.vip == true) ? '<a target="_blank" class="vip" title="腾讯认证" href="http://t.qq.com/certification"></a>' : "" ;
	var tid		= info.messages.message[0].id;
	var content	= info.messages.message[0].content;
	var count	= info.messages.message[0].count.rt +  info.messages.message[0].count.comment;
	var from	= "";
	count = count ? count : 0;
	switch (info.messages.message[0].from)
	{
		case 1: from = "来自QQ"; break
		case 2: from = "来自短信"; break
		case 3: from = "来自腾讯微博"; break
		case 4: from = "来自手机腾讯网"; break
		case 5: from = "来自手机彩信"; break
		case 6: from = "来自iPhone"; break
		case 7: from = "来自Android"; break
		case 8: from = "来自S60客户端"; break
		case 11: from = "来自QQ空间说说"; break
		case 12: from = "来自QQ拼音"; break
		case 13: from = "来自腾讯网评论"; break
		case 14: from = "来自QQ五笔"; break
		case 1007: from = "来自手机腾讯网"; break
	}
	$.get(actionRoot+"wtv.php?ac=timeformat&time="+info.messages.message[0].time,function(time){
		var html = '<div id="LUI">'+
			'<ul class="clear">'+
				'<li class="pic">'+
					'<a title="'+info.nick+'" href="http://t.qq.com/'+info.name+'"><img alt="" title="" src="'+info.avatarUrl+'/120"></a>'+
				'</li>'+
				'<li class="detail">'+
					'<h4 class="fontYH"><p title="'+info.name+'" class="userName">'+info.nick+'</p><p><a href="http://t.qq.com/'+info.name+'">http://t.qq.com/'+info.name+'</a></p></h4>'+
					'<div class="userNums">'+
						'广播<a href="http://t.qq.com/'+info.name+'"><strong>'+info.messageTotal+'</strong></a>条<span>|</span>听众<a href="http://t.qq.com/'+info.name+'/follower"><strong>'+info.follower+'</strong></a>人<span>|</span>它收听<a href="http://t.qq.com/'+info.name+'/following" target="_blank"><strong>'+info.following+'</strong></a>人<span>|</span>收录它<a href="http://t.qq.com/list_hison.php?u='+info.name+'" target="_blank"><strong>'+info.listTotal+'</strong></a>'+
					'</div>'+
					'<div class="funBox clear">'+
						'<div class="left">'+
							'<a title="立即收听" href="#" class="addFollow addAttention" data-TVName="'+info.name+'">立即收听</a>'+
						'</div>'+
					'</div>'+
				'</li>'+
			'</ul>'+
		'</div>'+
		'<div class="msgBox">'+
			'<div class="msgCnt"><strong><a href="http://t.qq.com/'+info.name+'" target="_blank">'+info.nick+'</a></strong>'+VIP+'：'+content+'</div>'+
			'<div class="pubInfo">'+
				'<span class="left"><a href="http://t.qq.com/p/t/'+tid+'" target="_blank" class="time">'+time+'</a><span class="f">'+from+'</span><a href="http://t.qq.com/p/t/'+tid+'" target="_blank" class="zfNum">全部转播和评论(<b class="relayNum">'+count+'</b>)</a></span>'+
				'<div class="funBox">'+
					'<a class="relay" role="zhuanbo" href="javascript:;"  data-tid="'+tid+'">转播</a>'+
				'</div>'+
			'</div>'+
		'</div>';
		$(".profile").html("").append(html);
		WTV_weibo.getTVFollowState();
	});
}
