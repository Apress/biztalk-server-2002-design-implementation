<%
	Const TYPE_BINARY = 1
	Const TYPE_TEXT = 2
	Const MQ_SEND_ACCESS = 2
	Const MQ_DENY_NONE = 0
	Const MQ_SINGLE_MESSAGE = 3
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
	
	
	'Send the document to a message queue in a transactional send
	Dim queue 
	Dim queueinfo
	Dim queuemsg

	set queueinfo = Server.CreateObject("MSMQ.MSMQQueueInfo")
	set queuemsg = Server.CreateObject("MSMQ.MSMQMessage")
	
	'set the formatname for the queue
	queueinfo.FormatName="Direct=OS:.\private$\IncomingDataStore"
	
	set queue=queueinfo.open (MQ_SEND_ACCESS,MQ_DENY_NONE)

	'set up a queue message
	queuemsg.Label = "Incoming Document for Bob"
	queuemsg.Body = PostedDocument
	
	'send a message in a single message transaction.
	queuemsg.Send queue, MQ_SINGLE_MESSAGE

	set stream = nothing
	set queue = nothing
	set queueinfo = nothing
	set queuemsg = nothing
	
	Response.Status="200 OK"
%>
