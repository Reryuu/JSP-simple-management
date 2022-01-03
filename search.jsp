<%-- 
    Document   : search
    Created on : Dec 13, 2021, 11:01:33 PM
    Author     : Zeroc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <table>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Place of work</th>
                <th>Phone number</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver"); //load driver
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

                    String search_string;
                    search_string = request.getParameter("submit_name");
                    PreparedStatement pstmt = null;
                    pstmt = con.prepareStatement("select * from employee where name = '" + search_string + "'");
                    ResultSet result = pstmt.executeQuery();
                    while (result.next()) {
            %><tr>
                <td> <%=result.getString(1)%> </td>
                <td> <%=result.getString(2)%> </td>
                <td> <%=result.getString(3)%> </td>
                <td> <%=result.getString(4)%> </td>
            </tr><%

                    }

                } catch (Exception e) {
                    out.println(e);
                }
            %>
        </table>
    </center>
    <center>
        <h1>
            <a href="Index.jsp">Back</a>
        </h1>
    </center>

</body>
</html>
