<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add manufacturer</title>
</head>
<body>
<%@include file="header.jsp"%>
<h1>Add manufacturer</h1>
<form method="post" action="${pageContext.request.contextPath}/manufacturers/add">
    <label for="name">Name</label><br>
    <input id="name" type="text" name="name">
    <br>
    <label for="country">Country</label><br>
    <input id="country" type="text" name="country"><br>
    <button type="submit">Create manufacturer</button>
</form>
</body>
</html>
