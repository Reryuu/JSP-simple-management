<%-- 
    Document   : Index
    Created on : Nov 16, 2021, 9:51:13 PM
    Author     : Zeroc
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%
        try {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
            if (request.getParameter("delete") != null) {
                int id = Integer.parseInt(request.getParameter("delete"));

                PreparedStatement pstmt = null; //create statement

                pstmt = con.prepareStatement("delete from employee where id=? "); //sql delete query
                pstmt.setInt(1, id);
                pstmt.executeUpdate(); //execute query

                con.close(); //close connection
            }
        } catch (Exception e) {
            out.println(e);
        }
    %>
   
 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <div class="main">
            <center>
                <h1> <a href="add.jsp">Add Record</a></h1>

                <table>
                    <form action="search.jsp">
                        <input type="text" name="submit_name">
                        <input type="submit">
                    </form>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Place of work</th>
                        <th>Phone number</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver"); //load driver
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "");
                            PreparedStatement pstmt = null; //create statement
                            pstmt = con.prepareStatement("select * from employee"); //sql select query
                            ResultSet rs = pstmt.executeQuery(); //execute query and set in resultset object
                            while (rs.next()) {
                    %>
                    <tr>
                        <td> <%=rs.getString(1)%> </td>
                        <td> <%=rs.getString(2)%> </td>
                        <td> <%=rs.getString(3)%> </td>
                        <td> <%=rs.getString(4)%> </td>
                        <td> <a href="update.jsp?edit=<%=rs.getInt(1)%> ">Edit</a> </td>
                        <td> <a href="?delete=<%=rs.getInt(1)%> ">Delete</a> </td>
                    </tr>

                    <%
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>
                </table>
            </center>
        </div>
    </body>
</html>
