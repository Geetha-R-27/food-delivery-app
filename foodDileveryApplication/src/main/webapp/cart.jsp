<%@ page import="java.util.Map" %>
<%@ page import="com.tap.model.Cart" %>
<%@ page import="com.tap.model.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Kaanavali | Cart</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Segoe UI", sans-serif;
    }

    body {
      background: #f6f6f6;
      color: #333;
    }

    /* Navbar */
    .navbar {
      height: 70px;
      background: #fff;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 40px;
      box-shadow: 0 6px 18px rgba(0,0,0,0.06);
      position: sticky;
      top: 0;
      z-index: 10;
    }

    .logo {
      font-size: 26px;
      font-weight: bold;
      color: #ff5a1f;
    }

    /* Cart Layout */
    .cart-container {
      display: grid;
      grid-template-columns: 2fr 1fr;
      gap: 30px;
      padding: 50px 8%;
    }

    /* Cart Items */
    .cart-items {
      background: #fff;
      border-radius: 18px;
      padding: 30px;
      box-shadow: 0 12px 30px rgba(0,0,0,0.08);
    }

    .cart-title {
      font-size: 24px;
      margin-bottom: 25px;
    }

    .cart-item {
      display: flex;
      align-items: center;
      margin-bottom: 22px;
      padding-bottom: 20px;
      border-bottom: 1px solid #eee;
      animation: fadeIn 0.6s ease;
    }

    .cart-item img {
      width: 90px;
      height: 90px;
      border-radius: 12px;
      object-fit: cover;
      margin-right: 20px;
    }

    .item-info {
      flex: 1;
    }

    .item-info h4 {
      font-size: 18px;
      margin-bottom: 6px;
    }

    .item-info p {
      font-size: 14px;
      color: #777;
    }

    .price {
      font-weight: bold;
      color: #ff5a1f;
      margin-top: 6px;
    }

    .qty-control {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .qty-control button {
      width: 32px;
      height: 32px;
      border-radius: 50%;
      border: none;
      background: #ff5a1f;
      color: #fff;
      font-size: 18px;
      cursor: pointer;
    }

    .qty-control span {
      font-weight: bold;
      min-width: 20px;
      text-align: center;
    }

    .remove-btn {
      margin-left: 15px;
      cursor: pointer;
      color: #ff3d00;
      font-size: 14px;
    }

    /* Summary */
    .summary {
      background: #fff;
      border-radius: 18px;
      padding: 30px;
      box-shadow: 0 12px 30px rgba(0,0,0,0.08);
      height: fit-content;
    }

    .summary h3 {
      margin-bottom: 20px;
      font-size: 22px;
    }

    .summary-row {
      display: flex;
      justify-content: space-between;
      margin-bottom: 15px;
      font-size: 16px;
    }

    .summary-row.total {
      font-size: 20px;
      font-weight: bold;
    }

    .checkout-btn {
      width: 100%;
      margin-top: 25px;
      padding: 14px;
      border: none;
      border-radius: 30px;
      background: linear-gradient(135deg, #ff7a18, #ff3d00);
      color: #fff;
      font-size: 16px;
      cursor: pointer;
      transition: 0.3s;
    }
    
    .back-btn {
	  display: inline-flex;
	  align-items: center;
	  gap: 8px;
	  padding: 10px 20px;
	  border-radius: 30px;
	  background: linear-gradient(135deg, #ff7a18, #ff3d00);
	  color: #fff;
	  font-size: 14px;
	  font-weight: 600;
	  text-decoration: none;
	  box-shadow: 0 8px 20px rgba(255, 90, 31, 0.35);
	  transition: all 0.3s ease;
	}
	
	.back-btn:hover {
	  transform: translateY(-2px) scale(1.03);
	  box-shadow: 0 12px 30px rgba(255, 90, 31, 0.45);
	}
	    

    .checkout-btn:hover {
      transform: scale(1.05);
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @media (max-width: 900px) {
      .cart-container {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <nav class="navbar">
    <div class="logo">Kaanavali</div>
  </nav>

  <!-- Cart -->
  <section class="cart-container">

<body>





<%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
        session.setAttribute("cart", cart);
    }
    Map<Integer, CartItem> items = cart.getAllItems();
%>

 <div class="cart-items">
      <h2 class="cart-title">Your Cart</h2>

    <% if (items.isEmpty()) { %>

        <h3 style="text-align:center; color:gray;">Your cart is empty 😔</h3>
         

    <% } else { %>

        <% for (CartItem item : items.values()) { %>

           
           
           
            <!-- Item 1 -->
      <div class="cart-item" data-price="299">
       
        <div class="item-info">
          <h4><%= item.getName() %></h4>
          <div class="price">₹<%= item.getPrice() %></div>
        </div>
        <div class="qty-control">
          <button onclick="updateQty(this,-1)">−</button>
          <span>1</span>
          <button onclick="updateQty(this,1)">+</button>
        </div>
        <div class="remove-btn" onclick="removeItem(this)">Remove</div>
      </div>
           
           
           
           
           
           

        <% } %>

     
		
		
		  <!-- Summary -->
    <div class="summary">
      <h3>Bill Summary</h3>

      <div class="summary-row">
        <span>Item Total</span>
        <span id="subtotal">₹<%= cart.getTotalPrice() %></span>
      </div>

      <div class="summary-row">
        <span>Delivery Fee</span>
        <span>₹40</span>
      </div>

      <div class="summary-row total">
        <span>Total</span>
        <span id="total">₹<%= cart.getTotalPrice() %></span>
      </div>

      
       <form action="order" method="post">
		<button class="checkout-btn">Proceed to Checkout</button>
		</form>
    </div>
        
         <button onclick="history.back()"  class="back-btn">⬅ Back to Menu</button>
         
    <% } %>
    </section>
 <script>
    const deliveryFee = 40;

    function updateQty(btn, change) {
      const qtySpan = btn.parentElement.querySelector("span");
      let qty = parseInt(qtySpan.innerText);
      qty += change;
      if (qty < 1) qty = 1;
      qtySpan.innerText = qty;
      calculateTotal();
    }

    function removeItem(btn) {
      btn.parentElement.remove();
      calculateTotal();
    }

    function calculateTotal() {
      let subtotal = 0;
      document.querySelectorAll(".cart-item").forEach(item => {
        const price = parseInt(item.dataset.price);
        const qty = parseInt(item.querySelector("span").innerText);
        subtotal += price * qty;
      });
      document.getElementById("subtotal").innerText = "₹" + subtotal;
      document.getElementById("total").innerText = "₹" + (subtotal + deliveryFee);
    }

    calculateTotal();
  </script>

</body>
</html>