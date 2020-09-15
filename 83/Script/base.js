// JavaScript Document
$(function(){
	$(".m1").hover(function(){
		$(this).children("a").animate({top:"-48px"},120);
		$(".t1").fadeIn(60);
		$(".t1").animate({top:"5px"},60);
		},function(){
			$(this).children("a").animate({top:"0"},120);
			$(".t1").animate({top:"0"},60);
			$(".t1").fadeOut(60);
			});
	$(".m2").hover(function(){
		$(this).children("a").animate({top:"-48px"},120);
		$(".t2").fadeIn(60);
		$(".t2").animate({top:"5px"},60);
		},function(){
			$(this).children("a").animate({top:"0"},120);
			$(".t2").animate({top:"0"},60);
			$(".t2").fadeOut(60);
			});
	$(".m3").hover(function(){
		$(this).children("a").animate({top:"-48px"},120);
		$(".t3").fadeIn(60);
		$(".t3").animate({top:"5px"},60);
		},function(){
			$(this).children("a").animate({top:"0"},120);
			$(".t3").animate({top:"0"},60);
			$(".t3").fadeOut(60);
			});
	$(".m4").hover(function(){
		$(this).children("a").animate({top:"-48px"},120);
		$(".t4").fadeIn(60);
		$(".t4").animate({top:"5px"},60);
		},function(){
			$(this).children("a").animate({top:"0"},120);
			$(".t4").animate({top:"0"},60);
			$(".t4").fadeOut(60);
			});
	});

$(function(){
	$(".window a:eq(0),.news a:eq(0)").css("color","#397baf");
	$(".window a:eq(1),.news a:eq(1)").css("color","#06945b");
	$(".window a:eq(2),.news a:eq(2)").css("color","#1d5c8e");
	$(".window a:eq(3),.news a:eq(3)").css("color","#0f6d47");
	$(".window a:eq(4),.news a:eq(4)").css("color","#397baf");
	$(".window a:eq(5),.news a:eq(5)").css("color","#06945b");
	$(".window a:eq(6),.news a:eq(6)").css("color","#1d5c8e");
	$(".window a:eq(7),.news a:eq(7)").css("color","#0f6d47");
	});