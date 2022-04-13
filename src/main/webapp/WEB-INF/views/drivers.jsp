<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All drivers</title>
</head>
<body>
<%@include file="header.jsp"%>
<h1>All drivers</h1>
<table>
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>License Number</td>
        <td>Delete</td>
    </tr>
    <c:forEach items="${drivers}" var="driver">
        <tr>
            <td><c:out value="${driver.id}" /></td>
            <td><c:out value="${driver.name}" /></td>
            <td><c:out value="${driver.licenseNumber}" /></td>
            <td><a href="${pageContext.request.contextPath}/drivers/delete?id=${driver.id}">Delete driver</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>