<%-- 
    Document   : profile
    Created on : Feb 17, 2023, 3:01:36 PM
    Author     : Admin
--%>

<%@page import="object.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //code Java
            Account user = (Account) session.getAttribute("LoginUser");
            if (user == null) {
                //Khi nguoi dung vao thang trang nay
        %>
        <p style="color: red">You have not login yet!</p>
        <a href="index.jsp">Go back</a>
        <%
        } else {
        %>
        <%@include file="header_userpage.jsp" %>
        
        <form action="MainController" method="post" class="">
            <h1>Your Profile</h1>
            <table>
                <tr>
                    <td>Email: </td>
                    <td><input type="email" name="txtemail" readonly="" value="<%= user.getEmail() %>"></td>
                </tr>
                <tr>
                    <td>Full Name: </td>
                    <td><input type="text" name="txtfullname" value="<%= user.getFullname() %>"></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="password" name="txtpassword" value="<%= user.getPassword() %>" readonly=""></td>
                </tr>
                <tr>
                    <td>Phone: </td>
                    <td><input type="text" name="txtphone" value="<%= user.getPhone() %>" pattern="[0-9]{10}"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Update" name="action" ></td>
                </tr>
            </table>
        </form>
        <%=(request.getAttribute("SuccessUpdate") != null) ? request.getAttribute("SuccessUpdate") : ""%>
        <%=(request.getAttribute("FailUpdate") != null) ? request.getAttribute("FailUpdate") : ""%>
        <%@include file="footer.jsp" %>
        <%
            }
        %>

    </body>
</html>
