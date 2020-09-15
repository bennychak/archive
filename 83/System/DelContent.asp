<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Option Explicit %>
<!--#include file="../Include/Const.asp" -->
<!--#include file="../Include/ConnSiteData.asp" -->
<!--#include file="CheckAdmin.asp"-->

<%
dim Result,Selectid
Result=request.QueryString("Result")
SelectID=request.Form("SelectID")
select case Result
  case "Administrators"
    if SelectID<>"" then  conn.execute "delete from NwebCn_Admin where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
  case "LoginLog"
    if SelectID<>"" then  conn.execute "delete from NwebCn_AdminLog where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
  case "MemGroup"
    if SelectID<>"" then  conn.execute "delete from NwebCn_MemGroup where GroupID in ('"&SelectID&"')"
	conn.execute "Update NwebCn_About set GroupID='200603281858588888' , Exclusive='>=' WHERE GroupID = '"&SelectID&"'"
	conn.execute "Update NwebCn_Download set GroupID='200603281858588888' , Exclusive='>=' WHERE GroupID = '"&SelectID&"'"
	conn.execute "Update NwebCn_Members set GroupID='200603281858588888' , GroupName='临时游客' WHERE GroupID = '"&SelectID&"'"
	conn.execute "Update NwebCn_News set GroupID='200603281858588888' , Exclusive='>=' WHERE GroupID = '"&SelectID&"'"
	conn.execute "Update NwebCn_Others set GroupID='200603281858588888' , Exclusive='>=' WHERE GroupID = '"&SelectID&"'"
	conn.execute "Update NwebCn_Products set GroupID='200603281858588888' , Exclusive='>=' WHERE GroupID = '"&SelectID&"'"
    response.redirect request.servervariables("http_referer")
  case "Members"
    if SelectID<>"" then  conn.execute "delete from NwebCn_Members where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
  case "About"
    if SelectID<>"" then
	  conn.execute "delete from NwebCn_About where id in ("&SelectID&")"
	  conn.execute "delete from NwebCn_About where ParentID="&SelectID
	end if 
    response.redirect request.servervariables("http_referer")
    if SelectID<>"" then  conn.execute "delete from NwebCn_About where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
  case "Products"
    if SelectID<>"" then  conn.execute "delete from NwebCn_Products where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
  case "News"
    if SelectID<>"" then  conn.execute "delete from NwebCn_News where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
  case "Download"
    if SelectID<>"" then  conn.execute "delete from NwebCn_Download where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
  case "ADs"
    if SelectID<>"" then  conn.execute "delete from NwebCn_ADs where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
  case "Jobs"
    if SelectID<>"" then  conn.execute "delete from NwebCn_Jobs where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
  case "Message"
    if SelectID<>"" then  conn.execute "delete from NwebCn_Message where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
  case "Order"
    if SelectID<>"" then  conn.execute "delete from NwebCn_Order where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
  case "Talents"
    if SelectID<>"" then  conn.execute "delete from NwebCn_Talents where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
  case "Navigation"
    if SelectID<>"" then
	  conn.execute "delete from NwebCn_Navigation where id in ("&SelectID&")"
	  conn.execute "delete from NwebCn_Navigation where ParentID="&SelectID
	end if 
    response.redirect request.servervariables("http_referer")
  case "FriendLink"
    if SelectID<>"" then  conn.execute "delete from NwebCn_FriendLink where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
  case "Others"
    if SelectID<>"" then  conn.execute "delete from NwebCn_Others where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
  case "NoHackSql"
    if SelectID<>"" then  conn.execute "delete from NwebCn_NoHackSql where SqlIn_ID in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
	
  case else
	
end select
%>