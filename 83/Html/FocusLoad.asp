<%
dim rs,ADsName,ADsWidth,ADsHeight
set rs=server.CreateObject("adodb.recordset")
rs.open "select top 1 * from NwebCn_Ads where ViewFlag order by id desc",conn,1,1
if rs.bof and rs.eof then response.end
ADsName=rs("ADsName")
ADsWidth=rs("ADsWidth")
ADsHeight=Rs("ADsHeight")
rs.close
set rs=nothing  
%> 
<script> 
function OpenWin(){
  window.open("FocusView.asp","<%=ADsName%>","width=<%=ADsWidth%>,height=<%=ADsHeight%>")
} 
function getCookie(Name){
  var search = Name + "=" 
  var returnvalue = ""; 
  if (document.cookie.length > 0){ 
    offset = document.cookie.indexOf(search) 
    if (offset != -1) { 
      offset += search.length 
      end = document.cookie.indexOf(";", offset); 
      if (end == -1) {
        end = document.cookie.length; 
        returnvalue=unescape(document.cookie.substring(offset,end)) 
      } 
    } 
    return returnvalue; 
  } 
}
/*
function LoadPopup(){ 
  if (get_Cookie('popped')==''){ 
    OpenWin() 
    document.cookie="popped=yes" 
  } 
} 
*/
function LoadPopup(){ 
  OpenWin() 
} 
window.onload=LoadPopup()
</script> 

