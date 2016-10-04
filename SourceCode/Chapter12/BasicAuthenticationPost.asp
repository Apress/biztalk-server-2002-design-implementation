<%
	Dim account
	Dim stream
	Dim PostedDocument
	Dim EntityBody
	Dim position
	Dim oInterchange

	'extract the account information from ASP Request object
	account=Request.ServerVariables("AUTH_USER")

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
	
	'Identity the type of the document and add the account information
	'inside a predefined position.(In our simple, we will add it right after 
	'the Root element
	
	'find out the position of the end of the first element(Root)
	position = instr(1,PostedDocument,">")
	PostedDocument=mid(PostedDocument,1,position) & _
				 "<identity>" & account & "</identity>" & _
				  mid(PostedDocument,position + 1)

	set oInterchange = Server.CreateObject("Biztalk.Interchange")
	'Depend on your situation, you may need to provide more optional parameters
	oInterchange.submit 1,PostedDocument
	
	set oInterchange=nothing
	set stream=nothing
	
	Response.Status="200 OK"
%>
