<%

	Const TYPE_BINARY = 1
	Const TYPE_TEXT = 2
	Dim account
	Dim stream
	Dim PostedDocument
	Dim EntityBody
	Dim position
	Dim oInterchange



	'code to extract the data from HTTP Post.
	EntityBody=Request.BinaryRead(Request.TotalBytes)
	Set Stream = Server.CreateObject("AdoDB.Stream")
	Stream.Type = TYPE_BINARY				'adTypeBinary
	stream.Open
	Stream.Write EntityBody
	Stream.Position = 0
	Stream.Type = TYPE_TEXT					'adTypeText
	Stream.Charset = "us-ascii"
	PostedDocument = PostedDocument & Stream.ReadText
	


	set oInterchange = Server.CreateObject("Biztalk.Interchange")

	oInterchange.submit 1,PostedDocument

	'oInterchange.submit 1,PostedDocument,,"OrganizationName",,"OrganizationName","Home Organization"

	

	set oInterchange=nothing
	set stream=nothing
	
	Response.Status="200 OK"
%>
