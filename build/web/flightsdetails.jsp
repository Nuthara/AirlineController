<%-- 
    Document   : flightsdetails
    Created on : Oct 2, 2022, 4:59:48 PM
    Author     : DELL
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br>
        <br>
        <br>
        <h3>
            <center>
                <table border="0">
                    <th>
                        Results for Flight Id :
                        <%=request.getParameter("txtflId")%>
                    </th>
                <%
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        String url="jdbc:mysql://localhost:3306/testair";
                        Connection con=DriverManager.getConnection(url, "root","");
                        
                        Statement st= con.createStatement();
                        
                        int fliId= Integer.parseInt(request.getParameter("txtflId"));
                        String query="Select * from flights where flightId='"+fliId+"'";
                        ResultSet rs=st.executeQuery(query);
                        while(rs.next())
                        {
                %>
                        <tr>
                            <td>Flight ID</td>
                            <td><%=rs.getInt("flightId")%></td>
                        </tr>
                        <tr>
                            <td>Captain Name</td>
                            <td><%=rs.getString("pilot1")%></td>
                        </tr>
                        <tr>
                            <td>Second Officer Name</td>
                            <td><%=rs.getString("pilot2")%></td>
                        </tr>
                        <tr>
                            <td>Arrival Time</td>
                            <td><%=rs.getString("arriTime")%></td>
                        </tr>
                        <tr>
                            <td>Departure Time</td>
                            <td><%=rs.getString("depTime")%></td>
                        </tr>
                        <tr>
                            <td>Arrival Date</td>
                            <td><%=rs.getString("arriDate")%></td>
                        </tr>
                        <tr>
                            <td>Departure Date</td>
                            <td><%=rs.getString("depDate")%></td>
                        </tr>
                        <tr>
                            <td>Arrival Airport</td>
                            <td><%=rs.getString("arriAirport")%></td>
                        </tr>
                        <tr>
                            <td>Departure Airport</td>
                            <td><%=rs.getString("depAir")%></td>
                        </tr>
                        <tr>
                            <td>Number of Seats</td>
                            <td><%=rs.getInt("SeatCount")%></td>
                        </tr>
                        <tr>
                            <td>Number of Available Seats</td>
                            <td><%=rs.getInt("avaiSeat")%></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Edit"/></td>
                            <td><input type="reset" value="Back"</td>
                        </tr>
                           <% }
                    }
                      catch(Exception e)
                    {
                        System.out.println(e.getMessage());
                    }
                      %>
                </table>
            </center>
        </h3>
    </body>
</html>