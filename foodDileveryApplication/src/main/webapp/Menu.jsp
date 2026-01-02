<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List,com.tap.model.Menu" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Kaanavali | Menu</title>

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Segoe UI", sans-serif;
    }

    body {
      background: #f8f8f8;
    }

    /* Navbar */
    .navbar {
      height: 70px;
      background: rgba(255,255,255,0.9);
      backdrop-filter: blur(10px);
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0 40px;
      position: sticky;
      top: 0;
      z-index: 10;
      box-shadow: 0 8px 20px rgba(0,0,0,0.05);
    }

    .logo {
      font-size: 28px;
      font-weight: bold;
      color: #ff5a1f;
    }

    .login-btn {
      padding: 10px 22px;
      border: none;
      border-radius: 25px;
      background: #ff5a1f;
      color: #fff;
      cursor: pointer;
      transition: 0.3s;
    }

    .login-btn:hover {
      transform: scale(1.05);
      background: #e84c13;
    }

    /* Menu Section */
    .menu-section {
      padding: 60px 8%;
    }

    .menu-title {
      font-size: 36px;
      margin-bottom: 40px;
      color: #333;
    }

    /* Grid */
    .menu-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
      gap: 30px;
    }

    /* Food Card */
    .food-card {
      background: #fff;
      border-radius: 20px;
      overflow: hidden;
      box-shadow: 0 10px 25px rgba(0,0,0,0.08);
      transition: 0.4s;
    }

    .food-card:hover {
      transform: translateY(-8px);
    }

    .food-card img {
      width: 100%;
      height: 190px;
      object-fit: cover;
      transition: 0.4s;
    }

    .food-card:hover img {
      transform: scale(1.08);
    }

    .food-info {
      padding: 20px;
    }

    .food-info h3 {
      font-size: 20px;
      margin-bottom: 6px;
    }

    .food-info p {
      font-size: 14px;
      color: #666;
      margin-bottom: 14px;
    }

    .food-meta {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 15px;
    }

    .price {
      font-size: 18px;
      font-weight: bold;
      color: #ff5a1f;
    }

    .rating {
      font-size: 14px;
      background: #e6f7ec;
      color: #1a7f37;
      padding: 4px 8px;
      border-radius: 10px;
    }

    .food-info button {
      width: 100%;
      padding: 12px;
      border-radius: 30px;
      border: none;
      background: linear-gradient(135deg, #ff7a18, #ff3d00);
      color: #fff;
      font-size: 15px;
      cursor: pointer;
      transition: 0.3s;
    }

    .food-info button:hover {
      transform: scale(1.05);
    }

    /* Scroll animation */
    .reveal {
      opacity: 0;
      transform: translateY(50px);
      transition: 0.8s ease;
    }

    .reveal.active {
      opacity: 1;
      transform: translateY(0);
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <nav class="navbar">
    <div class="logo">Kaanavali</div>
    <button class="login-btn">Login</button>
  </nav>

  <!-- Menu Section -->
  <section class="menu-section">
    <h1 class="menu-title">Today’s Special</h1>

    <div class="menu-grid">

 <% List<Menu> allMenu = (List<Menu>)request.getAttribute("allMenu"); 
 
	 for(Menu menu : allMenu) {
		 %>
		 
	        
	      <div class="food-card reveal">
        <img src="<%=menu.getImageUrl() %>" class="menu-img" >
        <div class="food-info">
          <h3><%=menu.getItemName() %></h3>
          <p><%=menu.getDescription() %></p>
          <div class="food-meta">
            <span class="price">₹<%=menu.getPrice() %></span>
            <span class="rating">⭐ 4.6</span>
          </div>
      
	        
	       
	 <form action="cart" method="post">
    <input type="hidden" name="action" value="add">

    <input type="hidden" name="itemId" value="<%= menu.getMenuId() %>">
    <input type="hidden" name="restaurantId" value="<%= menu.getRestaurantId() %>">
    <input type="hidden" name="name" value="<%= menu.getItemName() %>">
    <input type="hidden" name="price" value="<%= menu.getPrice() %>">
    <input type="hidden" name="quantity" value="1">

    <button class="add-btn" type="submit">Add to Cart</button>
</form>
      
    </div>
      </div>
	        
	        
	        
	        
	        
	        
	        
	      
		<%}
 
 
 %>









    <!-- Item Template (Repeat 10 Times) -->
    

    
</div>
  </section>

  <script>
    const reveals = document.querySelectorAll(".reveal");

    const observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add("active");
        }
      });
    }, { threshold: 0.2 });

    reveals.forEach(el => observer.observe(el));
  </script>

</body>
</html>
