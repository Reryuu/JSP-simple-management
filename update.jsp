<%-- 
    Document   : update
    Created on : Nov 29, 2021, 10:43:00 PM
    Author     : Zeroc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
            if (request.getParameter("btn_update") != null) //check button click event not null
            {
                int hide;
                String name_up, place_up, phone_up;
                hide = Integer.parseInt(request.getParameter("txt_hide")); //it is hidden id get f
                name_up = request.getParameter("txt_name"); //txt_name
                place_up = request.getParameter("txt_place"); //txt_owner
                phone_up = request.getParameter("txt_phone");
                PreparedStatement pstmt = null; //create statement
                pstmt = con.prepareStatement("update employee set name=?, work_place=?, phoneNo=? where id=?"); //sq
                pstmt.setString(1, name_up);
                pstmt.setString(2, place_up);
                pstmt.setString(3, phone_up);
                pstmt.setInt(4, hide);
                pstmt.executeUpdate(); //execute query
                con.close(); //connection close
                out.println("Update Successfully...! Click Back link."); //after update record s
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
            <form method="post" name="myform" onsubmit="return validate();">
                <center>
                    <h1></h1>
                    <center>
                        <h1>Update Record</h1>
                    </center>

                    <table>
                        <%
                            try {
                                Class.forName("com.mysql.jdbc.Driver"); //load driver
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
                                if (request.getParameter("edit") != null) {
                                    int id = Integer.parseInt(request.getParameter("edit"));

                                    String name, place, phone;

                                    PreparedStatement pstmt = null; // create statement

                                    pstmt = con.prepareStatement("select * from employee where id=?"); // sql select q
                                    pstmt.setInt(1, id);
                                    ResultSet rs = pstmt.executeQuery(); // execute query store in resultset object

                                    while (rs.next()) {
                                        id = rs.getInt(1);
                                        name = rs.getString(2);
                                        place = rs.getString(3);
                                        phone = rs.getString(4);
                        %>
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="txt_name" value="<%=name%>"></td>
                        </tr>

                        <tr>
                            <td>Work place</td>
                            <td><input type="text" name="txt_place" value="<%=place%>"></td>
                        </tr>

                        <tr>
                            <td>Phone number</td>
                            <td><input type="text" name="txt_phone" value="<%=phone%>"></td>
                        </tr>

                        <tr>
                            <td><input type="submit" name="btn_update" value="Update"></td>
                        </tr>

                        <input type="hidden" name="txt_hide" value="<%=id%>">
                        <%
                                    }
                                }
                            } catch (Exception e) {
                                out.println(e);
                            }
                        %>
                    </table>
                    <center>
                        <h1><a href="Index.jsp">Back</a></h1>
                    </center>
            </form>
    </body>
</html>
