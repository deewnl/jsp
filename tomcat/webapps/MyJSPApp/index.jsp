<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personalized Welcome Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
        }
        .form-container {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .welcome-message {
            margin-top: 20px;
            padding: 10px;
            background-color: #e0ffe0;
            border: 1px solid #b2ffb2;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Welcome to Our JSP Page!</h1>
        
        <form action="welcome.jsp" method="post">
            <label for="name">Enter your name:</label>
            <input type="text" id="name" name="name" required>
            <input type="submit" value="Submit">
        </form>
    </div>

    <%
        String userName = request.getParameter("name");
        if (userName != null && !userName.trim().isEmpty()) {
            session.setAttribute("userName", userName);
            out.println("<div class='welcome-message'>");
            out.println("<h2>Hello, " + userName + "! Welcome to our website.</h2>");
            out.println("</div>");
        }
    %>
</body>
</html>
