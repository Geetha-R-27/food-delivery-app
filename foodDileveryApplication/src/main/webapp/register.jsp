<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Kaanavali | Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
*{
  margin:0;
  padding:0;
  box-sizing:border-box;
  font-family:"Segoe UI",sans-serif;
}

body{
  height:100vh;
  display:flex;
  align-items:center;
  justify-content:center;
}

.bg{
  position:fixed;
  inset:0;
  background:url("https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg")
  center/cover no-repeat;
  filter:blur(3px);
  transform:scale(1.05);
}

.overlay{
  position:fixed;
  inset:0;
  background:rgba(0,0,0,0.55);
}

.container{
  position:relative;
  width:380px;
  background:rgba(255,255,255,0.92);
  padding:40px;
  border-radius:22px;
  box-shadow:0 25px 60px rgba(0,0,0,.4);
  animation:fadeUp .8s ease;
  z-index:2;
}

@keyframes fadeUp{
  from{opacity:0;transform:translateY(50px)}
  to{opacity:1;transform:translateY(0)}
}

.logo{
  text-align:center;
  font-size:32px;
  font-weight:bold;
  color:#ff5a1f;
  margin-bottom:25px;
}

h2{
  text-align:center;
  margin-bottom:25px;
}

input{
  width:100%;
  padding:14px 18px;
  margin-bottom:18px;
  border-radius:30px;
  border:1px solid #ddd;
}

button{
  width:100%;
  padding:14px;
  border:none;
  border-radius:30px;
  background:linear-gradient(135deg,#ff7a18,#ff3d00);
  color:#fff;
  font-size:16px;
  font-weight:bold;
  cursor:pointer;
  transition:.3s;
}

button:hover{
  transform:scale(1.04);
}

.switch{
  text-align:center;
  margin-top:18px;
}
.switch a{
  color:#ff5a1f;
  font-weight:bold;
  text-decoration:none;
}
</style>
</head>
<body>

<div class="bg"></div>
<div class="overlay"></div>

<div class="container">
  <div class="logo">Kaanavali</div>
  <h2>Create Account</h2>

    <% if (request.getParameter("error") != null) { %>
        <div class="error">Registration failed. Try again.</div>
    <% } %>

    <form action="register" method="post">
        <input type="text" name="name" placeholder="Full Name" required />
        <input type="email" name="email" placeholder="Email" required />
        <input type="text" name="phone" placeholder="Phone Number" required />
        <input type="password" name="password" placeholder="Password" required />
        <button type="submit">Register</button>
    </form>

    <div class="switch">
    Already have an account? <a href="login.jsp">Login</a>
  </div>
</div>

<script>
function register(){
  alert("Registration successful!");
  window.location.href="login.jsp";
}
</script>

</body>
</html>