<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="org.json.JSONObject" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User IP Info</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
        }
        .info {
            margin-top: 20px;
            padding: 10px;
            background-color: #e0ffe0;
            border: 1px solid #b2ffb2;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h1>User IP Information</h1>
    <%
        String apiKey = "YOUR_API_KEY"; // Replace with your actual IPinfo API key
        String ipAddress = request.getRemoteAddr(); // Get user's IP address
        String urlString = "https://ipinfo.io/" + ipAddress + "?token=" + apiKey;

        try {
            // Create a URL object
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // Read the response
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // Parse JSON response
            JSONObject jsonResponse = new JSONObject(response.toString());

            // Display IP information
            out.println("<div class='info'>");
            out.println("<h2>IP Address: " + jsonResponse.getString("ip") + "</h2>");
            out.println("<p><strong>Hostname:</strong> " + jsonResponse.optString("hostname", "N/A") + "</p>");
            out.println("<p><strong>City:</strong> " + jsonResponse.optString("city", "N/A") + "</p>");
            out.println("<p><strong>Region:</strong> " + jsonResponse.optString("region", "N/A") + "</p>");
            out.println("<p><strong>Country:</strong> " + jsonResponse.optString("country", "N/A") + "</p>");
            out.println("<p><strong>Location:</strong> " + jsonResponse.optString("loc", "N/A") + "</p>");
            out.println("<p><strong>Organization:</strong> " + jsonResponse.optString("org", "N/A") + "</p>");
            out.println("</div>");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error retrieving IP information.</p>");
        }
    %>
</body>
</html>
