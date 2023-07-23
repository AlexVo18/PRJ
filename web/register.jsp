<%-- 
    Document   : register
    Created on : Feb 10, 2023, 10:29:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRJ Project</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <section>
            <form action="MainController" method="post" class="form ">
                <h1>Register</h1>
                <table>
                    <tr>
                        <td>Email: </td>
                        <td><input type="email" name="txtemail" required="" placeholder="Email"></td>
                    </tr>
                    <tr>
                        <td>Full Name: </td>
                        <td><input type="text" name="txtfullname" required="" placeholder="Full name"></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="txtpassword" required="" placeholder="Password"></td>
                    </tr>
                    <tr>
                        <td>Phone: </td>
                        <td>
                            <input type="tel" name="txtphone" required="" pattern="[0-9]{10}" placeholder="Phone number"> <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Create" name="action"></td>
                    </tr>
                </table>
            </form>
            <%=(request.getAttribute("Exist") != null) ? request.getAttribute("Exist") : ""%>
        </section>
    </body>
</html>
