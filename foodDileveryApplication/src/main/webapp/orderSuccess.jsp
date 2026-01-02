<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List,com.tap.model.Menu" %>
<html>
<head>
<title>Order Placed</title>
<style>
.success-box{
    max-width:400px;
    margin:80px auto;
    text-align:center;
    padding:30px;
    border-radius:10px;
    background:#f7fff7;
}
</style>
</head>
<body>

<div class="success-box">
    <h2>✅ Order Placed Successfully</h2>
    <p>Your Order ID: <b><%= request.getAttribute("orderId") %></b></p>

   <a href="HomePage">Back to Restaurants</a>
</div>

</body>
</html>
