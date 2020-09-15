<!--#include file="Head.asp"-->
<style type="text/css">

#banner {position:relative; width:633px; height:260px; border:1px solid #666; overflow:hidden;}
#banner_list img {border:0px;}
#banner_bg {position:absolute; bottom:0;background-color:#000;height:30px;filter: Alpha(Opacity=30);opacity:0.3;z-index:1000;cursor:pointer; width:640px; }
#banner_info{position:absolute; bottom:0; left:5px;height:22px;color:#fff;z-index:1001;cursor:pointer}
#banner_text {position:absolute;width:120px;z-index:1002; right:3px; bottom:3px;}
#banner ul {position:absolute;list-style-type:none;filter:alpha(opacity=80);opacity:0.8; border:1px solid #fff;z-index:1002;
            margin:0; padding:0; bottom:3px; right:5px;}
#banner ul li { padding:0px 8px;float:left;display:block;color:#FFF;border:#e5eaff 1px solid;background-color:#6f4f67;cursor:pointer}
#banner_list a{position:absolute; cursor:default;} <!-- 让四张图片都可以重叠在一起-->
</style>
<script type="text/javascript">
    var t = n = 0, count;
    $(document).ready(function(){    
        count=$("#banner_list a").length;  
        $("#banner_list a:not(:first-child)").hide();
        $("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));
        $("#banner_info").click(function(){window.open($("#banner_list a:first-child").attr('href'), "_blank")});
        $("#banner li").click(function() {
            var i = $(this).text() - 1;//获取Li元素内的值，即1，2，3，4
            n = i;
            if (i >= count) return;
            $("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));
            $("#banner_info").unbind().click(function(){window.open($("#banner_list a").eq(i).attr('href'), "_blank")})
            $("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
            $(this).css({"background":"#be2424",'color':'#000'}).siblings().css({"background":"#6f4f67",'color':'#fff'});
        });
        t = setInterval("showAuto()", 4000);
        $("#banner").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", 4000);});
    })
    
    function showAuto()
    {
        n = n >=(count - 1) ? 0 : ++n;
        $("#banner li").eq(n).trigger('click');
    }
</script>
<div class="content">
    	<div class="left">
        	<div class="window_box">
            	<div class="window">
                	<!--<%=Products("0,",1,1)%>-->
                    <div id="banner">    
                        <div id="banner_bg"></div>  <!--标题背景-->
                        <div id="banner_info"></div> <!--标题-->
                        <ul>
                            <li>1</li>
                            <li>2</li>
                            <li>3</li>
                            <li>4</li>
                        </ul>
                       <div id="banner_list">
                            <a><img src="/img/pic1.jpg" title="" alt="" /></a>
                            <a><img src="/img/pic1.jpg" title="" alt="" /></a>
                            <a><img src="/img/pic1.jpg" title="" alt="" /></a>
                            <a><img src="/img/pic1.jpg" title="" alt="" /></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="right">
        	<div class="ad">
            	<img src="../Images/ad.png" />
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="content">
    	<ul class="imgul">
        	<li class="u1"><a href="#"><img src="../Images/age1.jpg" /></a></li>
            <li class="u2"><a href="#"><img src="../Images/age2.jpg" /></a></li>
        	<li class="u3"><a href="#"><img src="../Images/age3.jpg" /></a></li>
            <li class="u4"><a href="#"><img src="../Images/age4.jpg" /></a></li>
        </ul>
        <div class="news">
        	<style>
			.picNews{ display:none;}
			</style>
        	<h2><a href="newslist.asp">画室新闻</a></h2>
            <%=News("0,")%>
        </div>
        <div class="clear"></div>
    </div>
  <div id="Bodyer_index">
    <!--<div id="Bodyer_banner_index"><img src="http://dummyimage.com/850x190/fff/000.gif&text=banner" width="850" height="190" alt="<%=SiteTitle %>"/></div>-->
	<div id="Bodyer_left_index">
      <!--<div class="Bodyer_left_index_login">
      <h2>网站登录</h2>
	  <%=Login()%>
      </div>-->
      <!--<div class="Bodyer_left_index_announce">
      	<h2>网站公告 <a href="#">more</a></h2>
        <% =Announce()%>
	  </div>-->
      <!--<div class="Bodyer_left_index_links">
	  <h2>友情链接</h2>
	  <% =FriendLink()%>
      </div>-->
	</div>
	<!--<div id="Bodyer_right_index">
      <div class="Bodyer_right_index_item"><h2>最新资讯</h2></div>
	  <div class="Bodyer_right_index_list">
	    <div class="Bodyer_right_index_news"><%=News("0,")%></div>
	  </div>
	  <div class="Bodyer_right_index_item"><h2>最新图片 <a href="productlist.asp">more</a></h2></div>
	  <div class="Bodyer_right_index_list"><br/></div>
	</div>-->
  </div>
<%
function Announce()
  dim rs,sql,NewsName
  set rs = server.createobject("adodb.recordset")
  sql="select top 6 * from NwebCn_News where ViewFlag and NoticeFlag order by id desc"
  rs.open sql,conn,1,1
  if rs.eof then
    response.write "暂无相关信息"
  else
    do while not rs.eof
	  if StrLen(rs("NewsName"))>32 then 
	    NewsName=StrLeft(rs("NewsName"),30)
	  else
	    NewsName=rs("NewsName")
	  end if
      response.write "·<a href=""NewsView.asp?ID="&rs("id")&""" title="""&rs("NewsName")&""">"&NewsName&"</a><br/>"
      rs.movenext
    loop 
  end if
  rs.close
  set rs=nothing
end function

function FriendLink()
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select top 4 * from NwebCn_FriendLink where ViewFlag and LinkType order by id asc"
  rs.open sql,conn,1,1
  if rs.eof then
    response.write "暂无相关信息"
  else
    do while not rs.eof
      response.write "<a href="""&rs("LinkUrl")&""" target=""_blank""><img src="""&rs("LinkFace")&""" alt="""&rs("LinkName")&"""></a><br/>"
      rs.movenext
    loop 
  end if
  rs.close
  set rs=nothing
end function

function News(SortPath)
  dim rs,sql,NewsName
  set rs = server.createobject("adodb.recordset")
  sql="select top 1 * from NwebCn_News where ViewFlag and Instr(SortPath,'"&SortPath&"')>0 and PictureFlag"
  rs.open sql,conn,1,1
  if not rs.eof then
    response.write "<a href=""NewsView.asp?ID="&rs("id")&"""><img class=""picNews"" src="""&rs("Pictures")&"""></a>"
  else
    response.write "<img class=""picNews"" src=""../Images/NoPicture.jpg"">"
  end if
  rs.close
  sql="select top 7 * from NwebCn_News where ViewFlag and Instr(SortPath,'"&SortPath&"')>0 order by id desc"
  rs.open sql,conn,1,1
  if rs.eof then
    response.write "暂无相关信息"
  else
    do while not rs.eof
	  if rs("PictureFlag") then 
	    NewsName="<font color=""#0000ff"">[图]</font>"&StrLeft(rs("NewsName"),42)
	  else
	    NewsName=StrLeft(rs("NewsName"),46)
      end if
      response.write "<img src=""../Images/Arrow_01.gif"" align=""absmiddle"">&nbsp;&nbsp;"&FormatDate(rs("Addtime"),15)&"&nbsp;|&nbsp;<a href=""NewsView.asp?ID="&rs("id")&""" title="""&rs("NewsName")&""">"&NewsName&"</a><br/>"
      rs.movenext
    loop 
  end if
  rs.close
  set rs=nothing
end function

function Products(SortPath,trs,tds)
  dim rs,sql,tr,td,ProductName,SmallPicPath
  set rs = server.createobject("adodb.recordset")
  sql="select top "&trs*tds&" * from NwebCn_Products where ViewFlag  order by Sequence asc"
  'sql="select top "&trs*tds&" * from NwebCn_Products where ViewFlag and CommendFlag and Instr(SortPath,'"&SortPath&"')>0 order by id desc"
  'sql="select top "&trs*tds&" * from NwebCn_Products where ViewFlag and NewFlag order by id desc"
  rs.open sql,conn,1,1
  if rs.eof then
    response.write "暂无相关信息"
  else
    response.write "<table cellpadding=""0""  cellspacing=""0"">"
	for tr=1 to trs
	    response.write "<tr>"
        for td=1 to tds '填充数据到表格
	      if StrLen(rs("ProductName"))<=18 then
            ProductName=rs("ProductName")
	      else 
	        ProductName=StrLeft(rs("ProductName"),16)
	      end if
	      SmallPicPath=HtmlSmallPic(rs("GroupID"),rs("SmallPic"),rs("Exclusive"))
		  response.write "<td>"
          response.write "<table cellpadding=""2"" cellspacing=""0"" >" &_
				    	 "<tr><td style=""border: 1px solid #ccc; width:120px; height:120px; text-align:center;"">" &_
						 "<a href=""ProductView.asp?ID="&rs("id")&""">" &_
				    	 "<img src="""&SmallPicPath&""" border='0' width='120' height='120' onload=""javascript:DrawImage(this,120,120);"" alt="""&rs("ProductName")&""" />" &_
						 "</a>" &_
					     "</td></tr>" &_
						 "<tr><td style=""height:24px; text-align:center;"">" &_
						 "<a href=""ProductView.asp?ID="&rs("id")&""" title="""&rs("ProductName")&""">"&ProductName&"</a>" &_
						 "</td></tr>" &_
						 "</table>"
	      response.write"</td><td width=""14""></td>"
	      rs.movenext
		  if rs.eof then exit for
		next
	    Response.Write "</tr>"
		if rs.eof then exit for
	next
    response.write "</table>"
  end if
  rs.close
  set rs=nothing
end function

%>
<!--#include file="Foot.asp"-->
<!--#include file="FocusLoad.asp" -->