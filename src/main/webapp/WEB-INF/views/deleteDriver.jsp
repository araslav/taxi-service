<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete driver</title>
</head>
<body>
    <%@include file="header.jsp"%>
    <h1>Delete driver</h1>
    <p>
        Driver: ${driver.name}, License Number: ${driver.licenseNumber}, Id: ${driver.id}
        was deleted!
    </p>
</body>
</html>
