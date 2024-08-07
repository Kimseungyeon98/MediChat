<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" type="text/css">
<tiles:insertAttribute name="bootstrap" ignore="true"/>
<tiles:insertAttribute name="css" ignore="true"/>
</head>
<body>
<div id="main">
	<div id="main_header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="main_body" class="custom-container pt-4 border">
		<tiles:insertAttribute name="body"/>
	<div id="main_footer">
		<tiles:insertAttribute name="footer"/>
	</div>
	</div>
</div>
</body>
</html>