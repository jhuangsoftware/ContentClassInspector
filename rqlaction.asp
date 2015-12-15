<?xml version="1.0" encoding="utf-8" ?>
<%
	Response.ContentType = "text/xml"

	Dim objIO	'Declare the objects
	Dim xmlData, sError, retXml
	set objIO = Server.CreateObject("RDCMSASP.RdPageData")
	objIO.XmlServerClassName = "RDCMSServer.XmlServer"

	xmlData = Request.Form("rqlxml")
	
	xmlData = objIO.ServerExecuteXml (xmlData, sError) 

	Set objIO = Nothing
	
	If sError <> "" Then
        retXml = "<ERROR>" & sError & "</ERROR>"
	Else
        retXml = xmlData
	End If
	
	Response.Write(retXml)
%>
