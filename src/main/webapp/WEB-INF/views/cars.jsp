<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Cars</title>
</head>
<body>
<%@include file="header.jsp"%>
<h1>All Cars</h1>
<table>
    <tr>
        <td>ID</td>
        <td>Model</td>
        <td>Manufacturer</td>
        <td>Manufacturer country</td>
        <td>Drivers</td>
        <td>Delete</td>
    </tr>
    <c:forEach items="${cars}" var="car">
        <tr>
            <td><c:out value="${car.id}" /></td>
            <td><c:out value="${car.model}" /></td>
            <td><c:out value="${car.manufacturer.name}" /></td>
            <td><c:out value="${car.manufacturer.country}" /></td>
            <td>
                <ul>
                <c:forEach items="${car.drivers}" var="driver">
                    <li>
                        <c:out value="${driver.name}" />
                    </li>
                </c:forEach>
                </ul>
            </td>
            <td><a href="${pageContext.request.contextPath}/cars/drivers/delete?id=${car.id}">Delete car</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>