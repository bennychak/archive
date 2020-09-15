<%
Dim forbiddenip
Dim forbiddenip_numRows

Set forbiddenip = Server.CreateObject("ADODB.Recordset")
forbiddenip.ActiveConnection = MM_bien_STRING
forbiddenip.Source = "SELECT forbidden_ip FROM forbiddenip"
forbiddenip.CursorType = 0
forbiddenip.CursorLocation = 2
forbiddenip.LockType = 1
forbiddenip.Open()

forbiddenip_numRows = 0
%>
<% 
Dim BadIp 
BadIp=Request.ServerVariables("REMOTE_HOST") 
if BadIp="0.0.0.0" or BadIp="0.0.0.1" or BadIp="221.11.66.82" or BadIp="221.11.66.83"  or BadIp="69.114.71.116"  or BadIp="201.44.213.144"  or BadIp="71.196.235.149"  or BadIp="89.136.20.151" or BadIp="206.51.237.152" or BadIp="202.115.130.23" or BadIp="68.41.105.83" or BadIp="24.186.23.156" or BadIp="74.193.105.162" or BadIp="218.18.138.113" or BadIp="67.184.114.209" or BadIp="61.141.239.48" or BadIp="219.133.129.202"  or BadIp="66.169.47.191" then 
response.end 
end if 
%>