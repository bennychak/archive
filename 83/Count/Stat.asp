<%
TheUrl="http://" & Request.ServerVariables("http_host") & FindDir(Request.ServerVariables("url"))
%>
var url='<%=TheUrl%>';
document.write("<a href='"+url+"Infolist.asp' target='_blank' >");
document.write("<img src='"+url+"Count.asp?Referer="+escape(top.document.referrer)+"&webURL="+escape(top.document.URL)+"&Width="+escape(screen.width)+"&Height="+escape(screen.height)+"' border=0 width=50 height=12>");
document.write("</a>");
<%
Function FindDir(FilePath)
  dim i,abc
	FindDir=""
	for i=1 to len(FilePath)
	if left(right(FilePath,i),1)="/" or left(right(FilePath,i),1)="\" then
	  abc=i
	  exit for
	end if
	next
	if abc <> 1 then
	FindDir=left(FilePath,len(FilePath)-abc+1)
	end if
end Function
%>