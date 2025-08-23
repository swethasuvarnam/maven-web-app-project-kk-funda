<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KK FUNDA Home Page</title>
<link href="images/kkfunda.jpg" rel="icon">

<!-- Simple Modern Styling -->
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #f8f9fa, #e3f2fd);
        margin: 0;
        padding: 0;
        color: #333;
    }
    header {
        background: #007bff;
        color: white;
        padding: 20px;
        text-align: center;
        box-shadow: 0px 3px 6px rgba(0,0,0,0.2);
    }
    header h1 {
        margin: 5px;
        font-size: 2rem;
    }
    section {
        padding: 30px;
        text-align: center;
    }
    section h2 {
        color: #007bff;
    }
    .info-box {
        background: white;
        padding: 20px;
        margin: 20px auto;
        width: 60%;
        border-radius: 12px;
        box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
        text-align: left;
    }
    .info-box p {
        font-size: 1.1rem;
        margin: 10px 0;
    }
    .contact {
        text-align: center;
        margin: 30px 0;
    }
    .contact img {
        width: 100px;
        border-radius: 10px;
    }
    footer {
        background: #343a40;
        color: #ddd;
        text-align: center;
        padding: 15px;
        margin-top: 40px;
    }
    footer a {
        color: #17a2b8;
        text-decoration: none;
    }
</style>
</head>
<body>

<header>
    <h1>🚀 Welcome to KK FUNDAA🚀</h1>
    <h3>DevOps Online Class - Join at 7:45 PM</h3>
</header>

<section>
    <h2>🌍 Server & Client Details</h2>

    <div class="info-box">
        <h3>🔹 Server Side Information</h3>
        <p>
            <% 
                InetAddress inetAddress = InetAddress.getLocalHost();
                String ip = inetAddress.getHostAddress();
                out.println("Server Host Name: <b>"+inetAddress.getHostName()+"</b><br>");
                out.println("Server IP Address: <b>"+ip+"</b>");
            %>
        </p>

        <h3>🔹 Client Side Information</h3>
        <p>
            Client IP Address: <b><%= request.getRemoteAddr() %></b><br>
            Client Host Name: <b><%= request.getRemoteHost() %></b>
        </p>
    </div>
</section>

<section class="contact">
    <img src="images/kkfunda.jpg" alt="KK FUNDA Logo">
    <p style="font-weight:bold; font-size:1.1rem; margin-top:10px;">
        📍 Martha Halli, Bangalore<br>
        📞 +91-9676831734<br>
        ✉️ <a href="mailto:kkeducationblr@gmail.com">kkeducationblr@gmail.com</a>
    </p>
    <a href="mailto:kkeducation@gmail.com">📩 Mail to KK FUNDA</a>
</section>

<section style="text-align:center;">
    <h2>💼 Our Service</h2>
    <p>
        👉 <a href="services/employee/getEmployeeDetails">Get Employee Details</a>
    </p>
</section>

<footer>
    <p>© 2024 KK FUNDA Training & Development Center</p>
    <p>Powered by <a href="https://google.com/">KK FUNDA</a></p>
</footer>

</body>
</html>
