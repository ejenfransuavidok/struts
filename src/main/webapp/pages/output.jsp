<%@ page language="java"
contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.struts.action.DynaActionForm"%>

<%
	DynaActionForm obj = (DynaActionForm)request.getSession().getAttribute("myForm");
%>

<%=obj.get("json")%>
