<%-- 
    Document   : manageorders
    Created on : Mar 3, 2023, 4:52:26 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="o" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Styles/adminstyles.css">
    </head>
    <body>
        <o:import url="header_adminpage.jsp"></o:import>
            <nav>
                <ul>
                    <li>
                        <form action="MainController" method="post">
                            <input type="text" name="txtsearch" 
                                   value="<%=(request.getParameter("keyword") != null) ? request.getParameter("keyword") : ""%>"
                            placeholder="Enter user's email">
                        <button type="submit" value="SearchOrder" name="action">Search</button>
                    </form>
                </li>
            </ul>
        </nav>
        <h1></h1>
        <table class="">
            <tr>
                <th>ID</th>
                <th>Order Date</th>
                <th>Shipping Date</th>
                <th>Status</th>
                <th>Account</th>
                <th>Action</th>
            </tr>
            <o:forEach var="order" items="${ requestScope.OrderList }">
                <tr>
                    <td><o:out value="${ order.getOrderID() }"></o:out></td>
                    <td><o:out value="${ order.getOrderDate() }"></o:out></td>
                    <td><o:out value="${ order.getShipDate() }"></o:out></td>
                    <td><o:choose>
                            <o:when test="${ order.getStatus() eq 1}"> Processing </o:when>
                            <o:when test="${ order.getStatus() eq 2}"> Completed </o:when>
                            <o:otherwise> Canceled </o:otherwise>
                        </o:choose></td>
                    <td>
                        <o:forEach var="acc" items="${ requestScope.AccountList }">
                            <o:if test="${ order.getAccID() eq acc.getAccID() }">
                                <o:out value="${ acc.getEmail() }"></o:out>
                            </o:if>
                        </o:forEach>
                    </td>
                    <td>
                        <o:url var="ship" value="MainController">
                            <o:param name="ID" value="${ order.getOrderID() }"></o:param>
                            <o:param name="action" value="ShipDateOrder"></o:param>
                        </o:url>
                        <o:url var="view" value="MainController">
                            <o:param name="ID" value="${ order.getOrderID() }"></o:param>
                            <o:param name="action" value="ViewAdminOrder"></o:param>
                        </o:url>
                        <o:url var="done" value="MainController">
                            <o:param name="ID" value="${ order.getOrderID() }"></o:param>
                            <o:param name="status" value="2"></o:param>
                            <o:param name="action" value="UpdateStatusOrder"></o:param>
                        </o:url>
                        <o:url var="cancel" value="MainController">
                            <o:param name="ID" value="${ order.getOrderID() }"></o:param>
                            <o:param name="status" value="3"></o:param>
                            <o:param name="action" value="UpdateStatusOrder"></o:param>
                        </o:url>
                        <o:if test="${ order.getStatus() eq 1}">
                            <a href="${ ship }">Update shipping date</a> <br>
                            <a href="${ done }">Complete </a><span>|</span> <a href="${ cancel }"> Cancel</a> <br>
                        </o:if>
                        <a href="${ view }">View order's detail</a> 
                    </td>
                </tr>
            </o:forEach>
            <o:forEach var="order" items="${ requestScope.SearchOrderList }">
                <tr>
                    <td><o:out value="${ order.getOrderID() }"></o:out></td>
                    <td><o:out value="${ order.getOrderDate() }"></o:out></td>
                    <td><o:out value="${ order.getShipDate() }"></o:out></td>
                    <td><o:choose>
                            <o:when test="${ order.getStatus() eq 1}"> Processing </o:when>
                            <o:when test="${ order.getStatus() eq 2}"> Completed </o:when>
                            <o:otherwise> Canceled </o:otherwise>
                        </o:choose></td>
                    <td>
                        <o:forEach var="acc" items="${ requestScope.AccountList }">
                            <o:if test="${ order.getAccID() eq acc.getAccID() }">
                                <o:out value="${ acc.getEmail() }"></o:out>
                            </o:if>
                        </o:forEach>
                    </td>
                    <td>
                        <o:url var="ship" value="MainController">
                            <o:param name="ID" value="${ order.getOrderID() }"></o:param>
                            <o:param name="action" value="UpdateShipDateOrder"></o:param>
                        </o:url>
                        <o:url var="view" value="MainController">
                            <o:param name="ID" value="${ order.getOrderID() }"></o:param>
                            <o:param name="action" value="ViewOrder"></o:param>
                        </o:url>
                        <o:url var="done" value="MainController">
                            <o:param name="ID" value="${ order.getOrderID() }"></o:param>
                            <o:param name="status" value="2"></o:param>
                            <o:param name="action" value="UpdateStatusOrder"></o:param>
                        </o:url>
                        <o:url var="cancel" value="MainController">
                            <o:param name="ID" value="${ order.getOrderID() }"></o:param>
                            <o:param name="status" value="3"></o:param>
                            <o:param name="action" value="UpdateStatusOrder"></o:param>
                        </o:url>
                        <o:if test="${ order.getStatus() eq 1}">
                            <a href="${ ship }">Update shipping date</a> <br>
                            <a href="${ done }">Complete </a><span>|</span> <a href="${ cancel }"> Cancel</a> <br>
                        </o:if>
                        <a href="${ view }">View order's detail</a> 
                         
                    </td>
                </tr>
            </o:forEach>
        </table>
    </body>
</html>
