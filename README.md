🍔 Food Delivery Application – Java Web Project

A modern Food Delivery Web Application built using Java, JSP, Servlets, MySQL, and HTML/CSS/JavaScript, inspired by popular food delivery platforms.

🚀 Features

🔐 User Registration & Login

🍕 Food Menu with Images, Price & Ratings

🛒 Add to Cart & Cart Page

📦 Order Management (Basic)

🎨 Modern UI with Animations

📱 Responsive Design

🗄️ MySQL Database Integration

🛠️ Tech Stack
Backend

Java (JDK 8+)

JSP & Servlets

JDBC

Apache Tomcat (v9 / v10)

Frontend

HTML5

CSS3 (Modern UI + Animations)

JavaScript (DOM Manipulation)

Database

MySQL

Tools

Eclipse IDE

Git & GitHub


🗄️ Database Schema (Menu Table)
CREATE TABLE menu (
  menu_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  description VARCHAR(255),
  category VARCHAR(50),
  price DECIMAL(10,2),
  rating DECIMAL(2,1),
  image VARCHAR(500)
);

▶️ How to Run the Project

Clone the repository:

git clone https://github.com/Geetha-R-27/food-delivery-app


Open project in Eclipse IDE

Configure Apache Tomcat Server

Update MySQL DB credentials in your DAO file

Run the project:

Right Click Project → Run on Server

Open in browser:

http://localhost:8080/foodDileveryApplication

🌟 Screens Included

Login & Register Page

Menu Card Page with Food Images

Cart Page with Animations

Logout Functionality

📌 Future Enhancements

Payment Gateway Integration

Order History

Admin Panel

JWT Authentication

REST APIs with Spring Boot


⭐ Support

If you like this project:

⭐ Star the repository

🍴 Fork it

🐛 Report issues
