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
        <td>Country</td>
        <td>Delete</td>
    </tr>
    <c:forEach items="${manufacturers}" var="manufacturer">
        <tr>
            <td><c:out value="${manufacturer.id}" /></td>
            <td><c:out value="${manufacturer.name}" /></td>
            <td><c:out value="${manufacturer.country}" /></td>
            <td><a href="${pageContext.request.contextPath}/manufacturers/delete?id=${manufacturer.id}">Delete manufacturer</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>