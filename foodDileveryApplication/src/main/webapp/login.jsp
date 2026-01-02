<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Kaanavali | Login</title>
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
  background:#000;
  display:flex;
  align-items:center;
  justify-content:center;
}

/* Background image */
.bg{
  position:fixed;
  inset:0;
  background:url("https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg")
  center/cover no-repeat;
  filter:blur(3px);
  transform:scale(1.05);
}

/* Overlay */
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
  outline:none;
  transition:.3s;
}

input:focus{
  border-color:#ff5a1f;
  box-shadow:0 0 0 3px rgba(255,90,31,.25);
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
  font-size:14px;
}

.switch a{
  color:#ff5a1f;
  font-weight:bold;
  text-decoration:none;
}

.logout{
  display:none;
  text-align:center;
}
</style>
</head>
<body>

<div class="bg"></div>
<div class="overlay"></div>

<div class="container">

  <div id="loginBox">
    <div class="logo">Kaanavali</div>
    <h2>Login</h2>

    <% if (request.getParameter("error") != null) { %>
        <div class="error">Invalid Email or Password</div>
    <% } %>

    <form action="login" method="post">
        <input type="email" name="email" placeholder="Email" required />
        <input type="password" name="password" placeholder="Password" required />
        <button type="submit">Login</button>
        
       
    </form>

     <div class="switch">
      New user? <a href="register.jsp">Register</a>
    </div>
  </div>

  <div id="logoutBox" class="logout">
    <h2>Welcome 🎉</h2>
    <button onclick="logout()">Logout</button>
  </div>

</div>

<script>
	function login(){
	  loginBox.style.display="none";
	  logoutBox.style.display="block";
	}
	function logout(){
	  logoutBox.style.display="none";
	  loginBox.style.display="block";
	}
</script>

</body>
</html>