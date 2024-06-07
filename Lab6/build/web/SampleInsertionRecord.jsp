<%-- 
    Document   : SampleInsertionRecord
    Created on : 7 Jun 2024, 12:53:58 pm
    Author     : Saiful
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lab 6 - Task 1 - Sample Insertion records into MySQL through JSP's page</h1>
        
        <%
        
            int result;
            
            Class.forName("com.mysql.jdbc.Driver");
            out.println("Step 1: MySQL driver loaded...!");
        %>
        <br>
        <%
            String myURL = "jdbc:mysql://localhost/csm3023";
            Connection conn = DriverManager.getConnection(myURL, "root", "admin");
            out.println("Step 2: Database is connected...!");
        %>
        <br>
        <%
            out.println("Step 3: Prepared Statements created...!");
            String sInsertQry = "INSERT INTO FirstTable VALUE(?)";
            
            PreparedStatement myPS = conn.prepareStatement((sInsertQry));
        %>
        <br>
        <%
            out.println("Step 4: Perform insertion of record...!");
            String name = "Welcome to access MySQL database with JSP!";
            myPS.setString(1, name);
            
            result = myPS.executeUpdate();
            if (result > 0) {
            
        %>
        <%
                out.println("Step5: Close database connection");
                out.println(" ");
                out.println("Database connection is closed...!");
                
                out.println("<p>" + "The record : (" + name 
                        + ") is succesfully create...!" + "</p>");
            }
            conn.close();
        %>
        <br>
    </body>
</html>
