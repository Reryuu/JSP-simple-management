<%-- 
    Document   : add
    Created on : Nov 29, 2021, 10:39:18 PM
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
        <div class="main">
            <form method="post" name="myform" onsubmit="return validate();">
                <center>
                    <h1>
                        Insert
                    </h1>

                    <table>
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="submit_name"></td>
                        </tr>
                        <tr>
                            <td>Place of work</td>
                            <td><input type="text" name="submit_place"></td>
                        </tr>
                        <tr>
                            <td>Phone number</td>
                            <td><input type="text" name="submit_phone"></td>
                        </tr>
                        <tr>
                            <td><input type="submit" name="btn_add" value="Insert"></td>
                        </tr>
                    </table>
                </center>
                <center>
                    <h1>
                        <a href="Index.jsp">Back</a>
                    </h1>
                </center>

            </form>
        </div>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver"); //load driver
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
                if (request.getParameter("btn_add") != null) //check button click event not null
                {
                    String name,work_place,phone;
                    name = request.getParameter("submit_name"); //txt_name
                    work_place = request.getParameter("submit_place"); //txt_owner
                    phone = request.getParameter("submit_phone");
                    PreparedStatement pstmt = null; //create statement
                    pstmt = con.prepareStatement("insert into employee(name,work_place,phoneNo) values(?,?,?)"); //sql
                    pstmt.setString(1, name);
                    pstmt.setString(2, work_place);
                    pstmt.setString(3, phone);
                    pstmt.executeUpdate(); //execute query
                    con.close(); //close connection
                    out.println("Insert Successfully...! Click Back link.");// after insert record s
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
