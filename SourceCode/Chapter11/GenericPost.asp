<%
	Dim account
	Dim stream
	Dim PostedDocument
	Dim EntityBody
	Dim position
	Dim oInterchange
	Dim handle
	Dim responsedoc



	'code to extract the data from HTTP Post.
	EntityBody=Request.BinaryRead(Request.TotalBytes)
	Set Stream = Server.CreateObject("AdoDB.Stream")
	Stream.Type = 1						'adTypeBinary
	stream.Open
	Stream.Write EntityBody
	Stream.Position = 0
	Stream.Type = 2						'adTypeText
	Stream.Charset = "us-ascii"
	PostedDocument = PostedDocument & Stream.ReadText
	


	set oInterchange = Server.CreateObject("Biztalk.Interchange")
	oInterchange.submitsync 1,PostedDocument,,,,,,"C_SoapClient_PipelineAIC",,,,handle,responsedoc
	Response.write "   Handle is: " & handle 
	Response.write	"   Response document is:  " & responsedoc

	set oInterchange=nothing
	set stream=nothing
	
	Response.Status="200 OK"
%>
