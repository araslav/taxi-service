<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add driver</title>
</head>
<body>
<%@include file="header.jsp"%>
<h1>Add driver</h1>
<form method="post" action="${pageContext.request.contextPath}/drivers/add">
    <label for="name">Name</label><br>
    <input id="name" type="text" name="name">
    <br>
    <label for="licenseNumber">License Number</label><br>
    <input id="licenseNumber" type="text" name="licenseNumber"><br>
    <button type="submit">Create driver</button>
</form>
</body>
</html>
