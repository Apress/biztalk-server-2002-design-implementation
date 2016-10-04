<%@ LANGUAGE = VBScript %>
<!--#INCLUDE FILE=”pe_global_edit.asp” -->
<%
call GetInputText(“url”, 0, bufsize_medium)
call GetInputText(“method”, 0, bufsize_medium)
call GetInputText(“userid”, 0, bufsize_medium)
call GetInputPassword(“password”, 0, bufsize_medium)
%>
<!--#INCLUDE FILE=”pe_post_footer.asp” -->