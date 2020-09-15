<div id="bien_logo"><a href="http://<%=(base.Fields.Item("address").Value)%>"><img src="<%=(base.Fields.Item("fishlogo").Value)%>" alt="<%=(base.Fields.Item("fishlogonote").Value)%>" /></a></div>
<div id="bien_banner" class="tt_title">
<%=(base.Fields.Item("blogtitle").Value)%>
</div>
<div id="bien_lefttop">
<div class="bien_lefttopcontainer">
<div class="bien_article_title bien_top4">各种链接</div>
	<ul>
      <% 
While ((Repeat5__numRows <> 0) AND (NOT belong.EOF)) 
%>
      <li><A HREF="sch.asp?<%= "belong=" & belong.Fields.Item("belong").Value %>"><%=(belong.Fields.Item("belong").Value)%></A></li>
        <% 
  Repeat5__index=Repeat5__index+1
  Repeat5__numRows=Repeat5__numRows-1
  belong.MoveNext()
Wend
%>
<li><a href="all.asp">全部</a></li>
<li><a href="demo.asp">旧版</a></li>
</ul>
</div>
</div>
<div id="bien_righttop">
  <div class="bien_righttopcontainer">
		<div class="bien_article_title bien_top4">最新评论人</div>
        <%=(comment.Fields.Item("comment_name").Value)%> &nbsp;<%=(comment.Fields.Item("comment_date").Value)%><br />
        <A HREF="article.asp?<%= "id=" & comment.Fields.Item("comment_articleid").Value %>">查看该评论</A> </div>
	<div class="bien_righttopcontainer">
		<div class="bien_article_title bien_top4">最新留言</div>
		<%=(guest.Fields.Item("name").Value)%> &nbsp;<%=(guest.Fields.Item("time").Value)%><br />主题：<%=(guest.Fields.Item("main").Value)%><br /><a href="guest/index.asp" target="_blank">查看或留言</a>
	</div>
  <div class="bien_righttopcontainer">
  		<div class="bien_article_title bien_top4">老婆专区</div>
		<%=(guaiguai.Fields.Item("guaiguai_article_time").Value)%><br />主题：<%=(guaiguai.Fields.Item("guaiguai_article_title").Value)%><br /><a href="guaiguai/show.asp" target="_blank">查看</a> &nbsp;<a href="guaiguai/login.asp" target="_blank">留言</a>
  </div>
</div>
<div id="bien_leftmain">
	<ul>
		<li class="bien_article_title bien_top4">更新文章列表 - <a style="display:inline; text-decoration:none; font-size:12px;" href="all.asp">全部文章</a></li>
		
        <% 
While ((Repeat1__numRows <> 0) AND (NOT title.EOF)) 
%>
        <li><A HREF="article.asp?<%= "id=" & title.Fields.Item("id").Value %>"><%=(title.Fields.Item("article_title").Value)%></A></li>
          <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  title.MoveNext()
Wend
%>
    </ul>
</div>