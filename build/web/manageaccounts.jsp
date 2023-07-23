<%-- 
    Document   : manageaccounts
    Created on : Mar 3, 2023, 1:51:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Styles/adminstyles.css">
    </head>
    <body>
        <a:import url="header_adminpage.jsp"></a:import>
            <nav>
                <ul>
                    <li>
                        <form action="MainController" method="post">
                            <input type="text" name="txtsearch" 
                                   value="<%=(request.getParameter("keyword") != null) ? request.getParameter("keyword") : ""%>"
                            placeholder="Enter here">
                        <select name="searchby">
                            <option value="byname">by name</option>
                            <option value="byemail">by email</option>
                        </select>
                        <button type="submit" value="SearchAccount" name="action">Search</button>
                    </form>
                        
                </li>
            </ul>
        </nav>

        <h1></h1>
        <table class="">
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Full Name</th>
                <th>Status</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
            <a:forEach var="acc" items="${ requestScope.AccountList }">
                <tr>
                    <td><a:out value="${ acc.getAccID() }"></a:out> </td>
                    <td><a:out value="${ acc.getEmail() }"></a:out> </td>
                    <td><a:out value="${ acc.getFullname() }"></a:out> </td>
                    <td><a:choose>
                            <a:when test="${ acc.getStatus() eq 1 }"> active </a:when>
                            <a:otherwise> inactive </a:otherwise>
                        </a:choose></td>
                    <td><a:out value="${ acc.getPhone() }"></a:out> </td>
                    <td><a:choose>
                            <a:when test="${ acc.getRole() eq 1 }"> admin </a:when>
                            <a:otherwise> user </a:otherwise>
                        </a:choose></td>
                    <td><a:if test="${ acc.getRole() eq 0 }">    
                            <!--Get only user to block/unblock-->
                            <a:url var="block" value="MainController">
                                <a:param name="email" value="${ acc.getEmail() }"></a:param>
                                <a:param name="status" value="${ acc.getStatus() }"></a:param>
                                <a:param name="action" value="UpdateStatusAccount"></a:param>
                            </a:url>
                            <a href="${ block }">Block/Unblock</a>
                        </a:if></td>
                </tr>
                
            </a:forEach>
                <a:forEach var="acc" items="${ requestScope.SearchAccountList }">
                <tr>
                    <td><a:out value="${ acc.getAccID() }"></a:out> </td>
                    <td><a:out value="${ acc.getEmail() }"></a:out> </td>
                    <td><a:out value="${ acc.getFullname() }"></a:out> </td>
                    <td><a:choose>
                            <a:when test="${ acc.getStatus() eq 1 }"> active </a:when>
                            <a:otherwise> inactive </a:otherwise>
                        </a:choose></td>
                    <td><a:out value="${ acc.getPhone() }"></a:out> </td>
                    <td><a:choose>
                            <a:when test="${ acc.getRole() eq 1 }"> admin </a:when>
                            <a:otherwise> user </a:otherwise>
                        </a:choose></td>
                    <td><a:if test="${ acc.getRole() eq 0 }">    
                            <!--Get only user to block/unblock-->
                            <a:url var="block" value="MainController">
                                <a:param name="email" value="${ acc.getEmail() }"></a:param>
                                <a:param name="status" value="${ acc.getStatus() }"></a:param>
                                <a:param name="action" value="UpdateStatusAccount"></a:param>
                            </a:url>
                            <a href="${ block }">Block/Unblock</a>
                        </a:if></td>
                </tr>
            </a:forEach>
        </table>
    </body>
</html>
