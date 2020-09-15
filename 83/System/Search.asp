<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Option Explicit %>
<!--#include file="../Include/Const.asp" -->
<!--#include file="../Include/ConnSiteData.asp" -->
<!--#include file="CheckAdmin.asp"-->

<%
dim Result
  Result=request.QueryString("Result")
dim StartDate,EndDate,Keyword
  StartDate=request.form("Start_Date")
  EndDate=request.form("End_Date")
  Keyword=request.form("Keyword")
select case Result
  case "Members"
    response.redirect ("MemList.asp?Result=Search&StartDate="&StartDate&"&EndDate="&EndDate&"&Keyword="&server.urlencode(Keyword)&"&Page=1")
  case "News"
    response.redirect ("NewsList.asp?Result=Search&StartDate="&StartDate&"&EndDate="&EndDate&"&Keyword="&server.urlencode(Keyword)&"&Page=1")
  case "Download"
    response.redirect ("DownList.asp?Result=Search&StartDate="&StartDate&"&EndDate="&EndDate&"&Keyword="&server.urlencode(Keyword)&"&Page=1")
  case "Products"
    response.redirect ("ProductList.asp?Result=Search&StartDate="&StartDate&"&EndDate="&EndDate&"&Keyword="&server.urlencode(Keyword)&"&Page=1")
  case "ADs"
    response.redirect ("ADsList.asp?Result=Search&StartDate="&StartDate&"&EndDate="&EndDate&"&Keyword="&server.urlencode(Keyword)&"&Page=1")	
  case "Jobs"
    response.redirect ("JobsList.asp?Result=Search&StartDate="&StartDate&"&EndDate="&EndDate&"&Keyword="&server.urlencode(Keyword)&"&Page=1")	
  case "Message"
    response.redirect ("MessageList.asp?Result=Search&StartDate="&StartDate&"&EndDate="&EndDate&"&Keyword="&server.urlencode(Keyword)&"&Page=1")	
  case "Order"
    response.redirect ("OrderList.asp?Result=Search&StartDate="&StartDate&"&EndDate="&EndDate&"&Keyword="&server.urlencode(Keyword)&"&Page=1")	
  case "Talents"
    response.redirect ("TalentsList.asp?Result=Search&StartDate="&StartDate&"&EndDate="&EndDate&"&Keyword="&server.urlencode(Keyword)&"&Page=1")	
  case "Others"
    response.redirect ("OthersList.asp?Result=Search&StartDate="&StartDate&"&EndDate="&EndDate&"&Keyword="&server.urlencode(Keyword)&"&Page=1")	
  case else
	
end select
%>