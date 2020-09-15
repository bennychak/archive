<%
dim thisPage,thisPath,linkPath
thisPath=Request.ServerVariables("URL")
thisPage=split(thisPath,"/")(ubound(split(thisPath,"/")))

linkPath="<a href=/html/>HOME</a>"
Select Case (thisPage) 
	Case "message.asp"
		linkPath=linkPath&" &gt; MESSAGE"
	Case "news.asp"
		linkPath=linkPath&" &gt; AMAY NEWS"
	Case "news_view.asp"
		linkPath=linkPath&" &gt; <a href=news.asp>AMAY NEWS</a> &gt; NEWS DETAIL"
	Case "why_choose.asp"
		linkPath=linkPath&" &gt; WHY CHOOSE"
	Case "products.asp"
		linkPath=linkPath&" &gt; PRODUCTS SHOW"
	Case "about_us.asp"
		linkPath=linkPath&" &gt; ABOUT US"
	Case "product_order.asp"
		linkPath=linkPath&" &gt; PRODUCT ORDER"
	Case "contact_us.asp"
		linkPath=linkPath&" &gt; CONTACT US"
	Case "register.asp"
		linkPath=linkPath&" &gt; REGISTER"
	Case "edit_profile.asp"
		linkPath=linkPath&" &gt; EDIT PROFILE"
	Case "mycart.asp"
		linkPath=linkPath&" &gt; VIEW CART"
	Case "myorders.asp"
		linkPath=linkPath&" &gt; MY ORDERS"
	Case "login.asp"
		linkPath=linkPath&" &gt; MEMBER LOGIN"
	Case "myorders_view.asp"
		linkPath=linkPath&" &gt; <a href=myorders.asp>MY ORDERS</a> &gt; ORDER DETAIL"
	Case "product_view.asp"
		linkPath=linkPath&" &gt; <a href=products.asp>PRODUCTS SHOW</a> &gt; PRODUCTS DETAIL"
	Case "quotation.asp"
		linkPath=linkPath&" &gt; QUOTATION"
	Case "myquotation.asp"
		linkPath=linkPath&" &gt; FACTORY VISIT"	
	Case "factoryvisit.asp"
		linkPath=linkPath&" &gt; MY QUOTATION"		
	Case Else
End Select

%>
<%=linkPath%>

