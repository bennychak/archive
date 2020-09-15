// JavaScript Document
var domain="http://maison.ivoiriens.com/";
var ie6domainhead="http://www.ivoiriens.com/";
$(function(){
	$(".table2 tr:odd").addClass("table2odd");
	$(".table2 th a").click(function(){
		return false;
		});
	$("a",".table1").attr("target","_blank");
	$("a",".table2").attr("target","_blank");
	$("#loadgroup").load("/maison/portal.php #portal_block_31_content",function(){
		$("#portal_block_31_content").addClass("clear");
		$("a","#loadgroup").each(function(){
				var a = $(this).attr("href");
				var b = domain + a;
				$(this).attr("href",b);
				var c = $("img",this).attr("src");
				var d = domain + c;
				$("img",this).attr("src",d);
				});
			});
	})