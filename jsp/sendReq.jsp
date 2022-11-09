<%--
	This page will handle only AJAX requests
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page errorPage="ajaxerror.jsp"%>
<%@ page import="DoctorU.*" %>
<%

String pusername = request.getParameter("pusername");
String isaccepted = request.getParameter("isaccepted");
String dusername = request.getParameter("dusername");
Request req = new Request();
	req.insertRequest(pusername,dusername);
out.println( "teleia ola" );

	%>