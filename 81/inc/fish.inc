  <td width="200" valign="top" bgcolor="#eeeeee">
  <table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="15" width="195" background="image/w.gif"></td>
    </tr>
</table>
<table width="200" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="20" background="image/head2incbg.gif"></td>
</tr>
</table>
<table cellpadding="0" cellspacing="0" border="0">
<tr>
  <td height="30" background="image/bg.gif" class="diary_datetitle"><font color="#999999" class="diary_title">Fishlogo de Moi</font></td>
</tr>
  <tr>
    <td width="200" valign="top"><img width="200" border="0" src="<%=(base.Fields.Item("fishlogo").Value)%>"></td>
  </tr>
  </table>
<table align=center cellpadding="0" cellspacing="0" border="0">
  <tr>
  <td width=180 height=30 class="diary_datetitle"><%=(base.Fields.Item("fishlogonote").Value)%></td>
</tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" width="200">
   <tr>
      <td align=center>
<!--日历-->
<iframe scrolling="no" src="inc/calendar.htm" frameborder="0" height="200" width="200"></iframe>
<!--日历-->
<iframe scrolling="no" src="user/login.asp" frameborder="0" height="120" width="200"></iframe>
</td>
  </tr></table>
<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
<tr>
  <td height="30" background="image/bg2.gif" class="diary_title">想说的话</td>
</tr><tr><td><%=(base.Fields.Item("titlemessage").Value)%></td>
</tr></table>
<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
  <tr>
    <td height="30" background="image/bg2.gif" class="diary_title">日志分类</td>
  </tr>
  <% 
While ((Repeat1__numRows <> 0) AND (NOT belong.EOF)) 
%>
  <tr>
        <td height="20"><a href="search.asp?search=<%=(belong.Fields.Item("belong").Value)%>&amp;select=article_belong&amp;Submit=<%=(belong.Fields.Item("belong").Value)%>" target="_top"><%=(belong.Fields.Item("belong").Value)%></a></td>
  </tr>
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  belong.MoveNext()
Wend
%>
</table>
<table align="center" cellspacing="0" cellpadding="0" width="180" border="0"><tr>
  <td height="30" background="image/bg2.gif" class="diary_title">日志搜索</td>
</tr><tr><td height="20"><form action="search.asp" method="get" name="form1" target="_top" id="form1">
  <label>
  <input name="search" type="text" id="search" size="9" />
  </label>
  <label>
  <select name="select">
    <option value="article_title">标题</option>
    <option value="article_content">全文</option>
    <option value="article_writer">作者</option>
    <option value="article_time">时间</option>
    <option value="article_num">编号</option>
    <option value="article_belong">分类</option>
  </select>
  </label>
  <label>
  <input type="submit" name="Submit" value="搜索" />
  </label>
</form>
</td></tr></table>
<!--友情链接-->
<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
  <tbody>
    <tr>
      <td height="30" align="left" background="image/bg2.gif" class="diary_title">友情链接</td>
    </tr>
    <% 
While ((Repeat3__numRows <> 0) AND (NOT link.EOF)) 
%>
    <tr>
      <td align="left" height="20"><a target="_blank" href="<%=(link.Fields.Item("link").Value)%>"><%=(link.Fields.Item("name").Value)%></a></td>
    </tr>
    <% 
  Repeat3__index=Repeat3__index+1
  Repeat3__numRows=Repeat3__numRows-1
  link.MoveNext()
Wend
%>
  </tbody>
</table>
<!--友情链接-->
<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
      <tbody>
	  <tr>
          <td height="30" align="left" background="image/bg2.gif" class="diary_title">网摘收藏</td>
        </tr>
<% 
While ((Repeat5__numRows <> 0) AND (NOT webcollect.EOF)) 
%>
        <tr>
          <td align="left" height="20"><% If Not webcollect.EOF Or Not webcollect.BOF Then %>
              <a target="_blank" href="<%=(webcollect.Fields.Item("web_link").Value)%>"><%=(webcollect.Fields.Item("web_name").Value)%></a>
              <% End If ' end Not webcollect.EOF Or NOT webcollect.BOF %>
            <% If webcollect.EOF And webcollect.BOF Then %>
              没有任何网摘！
  <% End If ' end webcollect.EOF And webcollect.BOF %>
</td>
        </tr>
        <% 
  Repeat5__index=Repeat5__index+1
  Repeat5__numRows=Repeat5__numRows-1
  webcollect.MoveNext()
Wend
%>

      </tbody>
    </table>
<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
	<tr>
      <td height="30" background="image/bg2.gif" class="diary_title">签名Logo</td>
    </tr><tr><td><a target="_top" href="http://<%=(base.Fields.Item("address").Value)%>/"><img width="180" border="0" src="<%=(base.Fields.Item("logo").Value)%>"></a></td></tr></table>
	<table align="center" cellspacing="0" cellpadding="0" width="180" border="0">
      <tr><td class="diary_datetitle">Copyright&copy;2007 by<br>
        <a href="http://<%=(base.Fields.Item("address").Value)%>/"><%=(base.Fields.Item("address").Value)%></a><br>
      <a href="mailto:bienfantaisie@163.com">bienfantaisie@163.com</a><br><a href="mailto:bienfantaisie@hotmail.com">bienfantaisie@hotmail.com</a><br>Allrights Reserved<br><a target="_blank" href="http://www.miibeian.gov.cn">豫ICP备07003303号</a></td></tr></table>
	</td>