<%@ page import="java.util.List, com.tap.model.Restaurant" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Kaanavali – Delicious Food, Delivered Fast</title>
  <!-- <link rel="stylesheet" href="style.css" /> -->

  <style>

 * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

:root {
  --bg-dark: #050308;
  --bg-elevated: rgba(23, 18, 28, 0.9);
  --accent: #ff8243;
  --accent-soft: rgba(255, 130, 67, 0.15);
  --accent-strong: #ff4b2b;
  --text-main: #fdf7f2;
  --text-muted: #c1b5aa;
  --card-bg: rgba(18, 12, 20, 0.92);
  --shadow-soft: 0 18px 45px rgba(0, 0, 0, 0.55);
  --radius-xl: 28px;
  --radius-lg: 20px;
  --radius-md: 14px;
  --nav-height: 76px;
  --transition-fast: 0.2s ease-out;
  --transition-med: 0.35s ease-out;
}

html {
  scroll-behavior: smooth;
}

body {
  font-family: system-ui, -apple-system, BlinkMacSystemFont, "SF Pro Text", Roboto,
    "Segoe UI", sans-serif;
  background: radial-gradient(circle at top left, #20101a, #060308 52%, #000 100%);
  color: var(--text-main);
  min-height: 100vh;
}

a {
  text-decoration: none;
  color: inherit;
}

img {
  max-width: 100%;
  display: block;
}

.container {
  width: min(1120px, 100% - 40px);
  margin: 0 auto;
}

/* ================= Navbar ================= */

.navbar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: var(--nav-height);
  z-index: 50;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0 20px;
}

.nav-inner {
  width: min(1120px, 100%);
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px 20px;
  border-radius: 999px;
  background: radial-gradient(circle at top left, rgba(255, 255, 255, 0.14), transparent 45%),
    radial-gradient(circle at bottom right, rgba(255, 130, 67, 0.18), transparent 55%),
    rgba(8, 4, 13, 0.85);
  backdrop-filter: blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.12);
  box-shadow: 0 18px 40px rgba(0, 0, 0, 0.6);
}

.logo {
  font-weight: 800;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  font-size: 1.1rem;
}

.nav-links {
  display: flex;
  align-items: center;
  gap: 24px;
}

.nav-link {
  position: relative;
  font-size: 0.95rem;
  color: var(--text-muted);
  transition: color var(--transition-fast);
}

.nav-link::after {
  content: "";
  position: absolute;
  left: 0;
  bottom: -4px;
  width: 0;
  height: 2px;
  border-radius: 999px;
  background: linear-gradient(90deg, var(--accent), var(--accent-strong));
  transition: width 0.25s ease-out;
}

.nav-link:hover {
  color: var(--text-main);
}

.nav-link:hover::after {
  width: 100%;
}

.nav-toggle {
  display: none;
  flex-direction: column;
  gap: 4px;
  background: none;
  border: none;
  cursor: pointer;
}

.nav-toggle span {
  width: 20px;
  height: 2px;
  border-radius: 999px;
  background: var(--text-main);
}

/* Buttons */

.btn {
  border: none;
  outline: none;
  border-radius: 999px;
  padding: 10px 20px;
  font-size: 0.95rem;
  font-weight: 600;
  letter-spacing: 0.04em;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
  transition: transform var(--transition-fast), box-shadow var(--transition-fast),
    background var(--transition-fast), color var(--transition-fast);
}

.btn-primary {
  background: linear-gradient(120deg, var(--accent-strong), var(--accent));
  color: #1b0702;
  box-shadow: 0 14px 30px rgba(255, 75, 43, 0.5);
}

.btn-primary:hover {
  transform: translateY(-1px) scale(1.02);
  box-shadow: 0 18px 40px rgba(255, 75, 43, 0.7);
}

.btn-secondary {
  background: rgba(255, 255, 255, 0.03);
  color: var(--text-main);
  border: 1px solid rgba(255, 255, 255, 0.14);
  box-shadow: 0 10px 28px rgba(0, 0, 0, 0.5);
}

.btn-secondary:hover {
  background: rgba(255, 255, 255, 0.09);
  transform: translateY(-1px) scale(1.01);
}

.btn-login {
  padding-inline: 18px;
  background: rgba(0, 0, 0, 0.35);
  color: var(--text-main);
  border: 1px solid rgba(255, 255, 255, 0.18);
}

.btn-login:hover {
  background: rgba(255, 255, 255, 0.15);
}

.cta-pulse {
  position: relative;
}

.cta-pulse::after {
  content: "";
  position: absolute;
  inset: 0;
  border-radius: inherit;
  border: 2px solid rgba(255, 130, 67, 0.4);
  transform: scale(1);
  opacity: 0;
  animation: ctaPulse 1.8s infinite;
}

@keyframes ctaPulse {
  0% {
    transform: scale(1);
    opacity: 0.7;
  }
  100% {
    transform: scale(1.35);
    opacity: 0;
  }
}

/* ================= Hero ================= */

.hero {
  position: relative;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: calc(var(--nav-height) + 40px) 20px 60px;
  overflow: hidden;
}

.hero-bg-slider {
  position: absolute;
  inset: 0;
  z-index: -2;
}

.hero-bg-slide {
  position: absolute;
  inset: 0;
  background-size: cover;
  background-position: center;
  opacity: 0;
  transform: scale(1.05);
  filter: brightness(0.6) saturate(0.9);
  transition: opacity 1s ease-in-out, transform 1.8s ease-out,
    filter 1.4s ease-out;
}

.hero-bg-slide.active {
  opacity: 1;
  transform: scale(1);
  filter: brightness(1.25) saturate(1.4);
}

.hero-overlay {
  position: absolute;
  inset: 0;
  background:
    /* soft center highlight */
    radial-gradient(circle at center, rgba(255, 184, 120, 0.18), transparent 55%),
    radial-gradient(circle at top left, rgba(0, 0, 0, 0.45), transparent 55%),
    linear-gradient(135deg, rgba(6, 2, 10, 0.96), rgba(0, 0, 0, 0.9));
  z-index: 1;
}

.hero-content {
  position: relative;
  z-index: 2;
  text-align: left;
}

.hero h1 {
  font-size: clamp(2.6rem, 5vw, 3.8rem);
  line-height: 1.1;
  margin-bottom: 14px;
}

.hero p {
  font-size: 1.05rem;
  max-width: 480px;
  color: var(--text-muted);
  margin-bottom: 22px;
}

.hero-actions {
  display: flex;
  align-items: center;
  gap: 14px;
  flex-wrap: wrap;
}

.hero-subtext {
  font-size: 0.9rem;
  color: var(--text-muted);
}

/* ================= Character Section ================= */

.character-section {
  padding: 40px 0 80px;
}

.character-layout {
  display: grid;
  grid-template-columns: minmax(0, 1.1fr) minmax(0, 1.2fr);
  gap: 40px;
  align-items: center;
}

.character-illustration {
  position: relative;
  justify-self: center;
}

.character-shadow {
  position: absolute;
  bottom: -18px;
  left: 50%;
  transform: translateX(-50%);
  width: 140px;
  height: 32px;
  border-radius: 999px;
  background: radial-gradient(circle, rgba(0, 0, 0, 0.8), transparent 65%);
  filter: blur(2px);
  opacity: 0.6;
}

.character-boy {
  position: relative;
  width: 200px;
  height: 260px;
  border-radius: 80px;
  background: linear-gradient(145deg, #2b1821, #10040a);
  box-shadow: var(--shadow-soft);
  display: flex;
  flex-direction: column;
  align-items: center;
  padding-top: 20px;
  animation: boyFloat 3s ease-in-out infinite;
}

@keyframes boyFloat {
  0%, 100% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-10px);
  }
}

.boy-head {
  position: relative;
  width: 80px;
  height: 80px;
}

.boy-hair {
  position: absolute;
  inset: 0;
  border-radius: 35px 35px 30px 30px;
  background: radial-gradient(circle at top, #1e1010, #0b0505);
}

.boy-face {
  position: absolute;
  inset: 10px 8px 6px;
  border-radius: 30px;
  background: #ffdfc4;
  display: flex;
  align-items: center;
  justify-content: center;
}

.eye {
  position: absolute;
  top: 28px;
  width: 7px;
  height: 7px;
  border-radius: 50%;
  background: #2f1b17;
  box-shadow: 0 0 0 1px rgba(255, 255, 255, 0.3);
}

.eye.left {
  left: 22px;
}

.eye.right {
  right: 22px;
}

.smile {
  position: absolute;
  bottom: 18px;
  left: 50%;
  width: 22px;
  height: 12px;
  border-radius: 0 0 14px 14px;
  border-bottom: 2px solid #d08b6e;
  transform: translateX(-50%);
}

.boy-hat {
  position: absolute;
  top: -6px;
  left: 50%;
  transform: translateX(-50%);
  width: 62px;
  height: 32px;
  border-radius: 16px 16px 10px 10px;
  background: linear-gradient(135deg, var(--accent), var(--accent-strong));
  box-shadow: 0 7px 12px rgba(0, 0, 0, 0.4);
}

.hat-badge {
  position: absolute;
  inset: 8px 16px;
  border-radius: 10px;
  background: rgba(255, 255, 255, 0.85);
}

.boy-body {
  margin-top: 10px;
  width: 120px;
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.boy-torso {
  width: 100%;
  height: 80px;
  border-radius: 26px 26px 18px 18px;
  background: linear-gradient(160deg, #ffffff, #ffe3d3);
  position: relative;
}

.bow-tie {
  position: absolute;
  top: 18px;
  left: 50%;
  transform: translateX(-50%);
  width: 24px;
  height: 14px;
  background: var(--accent-strong);
  border-radius: 6px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.25);
}

.buttons {
  position: absolute;
  top: 40px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.buttons span {
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: #f5a676;
}

.boy-arms {
  width: 100%;
  margin-top: 6px;
  display: flex;
  justify-content: space-between;
}

.arm {
  width: 50px;
  height: 60px;
  position: relative;
}

.left-arm {
  transform-origin: top left;
  animation: trayWave 2.4s ease-in-out infinite;
}

@keyframes trayWave {
  0%, 100% {
    transform: rotate(0deg);
  }
  50% {
    transform: rotate(-8deg);
  }
}

.right-arm {
  transform-origin: top right;
  animation: stir 2.2s ease-in-out infinite;
}

@keyframes stir {
  0%, 100% {
    transform: rotate(0deg);
  }
  50% {
    transform: rotate(10deg);
  }
}

.tray {
  position: absolute;
  bottom: 0;
  left: 6px;
  width: 70px;
  height: 16px;
  border-radius: 14px;
  background: linear-gradient(90deg, #f7f2ea, #dcd4c8);
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.4);
}

.tray-plate {
  position: absolute;
  top: -16px;
  left: 14px;
  width: 40px;
  height: 22px;
  border-radius: 999px 999px 18px 18px;
  background: linear-gradient(145deg, #f9f9f9, #e0d9d0);
}

.tray-steam {
  position: absolute;
  top: -30px;
  left: 26px;
  width: 6px;
  height: 24px;
  border-radius: 999px;
  background: linear-gradient(to top, rgba(255, 255, 255, 0.6), transparent);
  opacity: 0;
  animation: steamRise 2.8s infinite;
}

.tray-steam.s2 {
  left: 34px;
  animation-delay: 0.5s;
}

.tray-steam.s3 {
  left: 18px;
  animation-delay: 1s;
}

@keyframes steamRise {
  0% {
    transform: translateY(10px);
    opacity: 0;
  }
  30% {
    opacity: 0.9;
  }
  100% {
    transform: translateY(-18px);
    opacity: 0;
  }
}

.spoon {
  position: absolute;
  bottom: 5px;
  right: 4px;
  width: 10px;
  height: 40px;
  border-radius: 20px;
  background: linear-gradient(180deg, #f5f2ea, #d7cec1);
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.4);
}

.boy-legs {
  margin-top: 10px;
  width: 60px;
  display: flex;
  justify-content: space-between;
}

.leg {
  width: 20px;
  height: 46px;
  border-radius: 10px;
  background: linear-gradient(180deg, #16131b, #050308);
}

.character-text h2 {
  font-size: 2rem;
  margin-bottom: 10px;
}

.character-text p {
  color: var(--text-muted);
  margin-bottom: 16px;
}

.character-list {
  list-style: none;
  display: grid;
  gap: 6px;
  color: var(--text-muted);
}

/* ================= Restaurants ================= */

.restaurants {
  padding: 40px 0 80px;
}

.section-header {
  text-align: center;
  margin-bottom: 28px;
}

.section-header h2 {
  font-size: 2rem;
  margin-bottom: 6px;
}

.section-header p {
  color: var(--text-muted);
}

.restaurant-grid {
  display: grid;
  grid-template-columns: repeat(4, minmax(0, 1fr));
  gap: 22px;
}

.restaurant-card {
  background: var(--card-bg);
  border-radius: var(--radius-lg);
  overflow: hidden;
  box-shadow: var(--shadow-soft);
  display: flex;
  flex-direction: column;
  transform-origin: center;
  transition: transform var(--transition-med), box-shadow var(--transition-med);
}

.restaurant-card:hover {
  transform: translateY(-8px) scale(1.02);
  box-shadow: 0 24px 55px rgba(0, 0, 0, 0.7);
}

.restaurant-image {
  position: relative;
  height: 170px;
  background-size: cover;
  background-position: center;
  transition: transform 0.7s ease-out;
}

.restaurant-card:hover .restaurant-image {
  transform: scale(1.08);
}

.restaurant-content {
  padding: 14px 14px 16px;
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.restaurant-content h3 {
  font-size: 1.05rem;
}

.cuisine {
  font-size: 0.86rem;
  color: var(--text-muted);
}

.restaurant-meta {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-top: 4px;
  margin-bottom: 8px;
}

.rating {
  padding: 4px 9px;
  border-radius: 999px;
  background: rgba(14, 129, 59, 0.18);
  color: #7ef29d;
  font-size: 0.82rem;
}

.eta {
  font-size: 0.82rem;
  color: var(--text-muted);
}

/* ================= Offers ================= */

.offers {
  padding: 40px 0 80px;
}

.offers-layout {
  display: grid;
  grid-template-columns: minmax(0, 1.1fr) minmax(0, 1.1fr);
  gap: 40px;
  align-items: center;
}

.offers-text h2 {
  font-size: 2rem;
  margin-bottom: 10px;
}

.offers-text p {
  color: var(--text-muted);
  margin-bottom: 14px;
}

.offers-list {
  list-style: none;
  display: grid;
  gap: 6px;
  color: var(--text-muted);
}

.offers-cards {
  display: grid;
  gap: 16px;
}

.offer-card {
  padding: 16px 18px;
  border-radius: var(--radius-md);
  background: radial-gradient(circle at top left, var(--accent-soft), rgba(10, 6, 14, 0.96));
  border: 1px solid rgba(255, 255, 255, 0.12);
  box-shadow: 0 16px 36px rgba(0, 0, 0, 0.7);
}

.offer-card h3 {
  margin-bottom: 6px;
}

.offer-card p {
  color: var(--text-muted);
}

/* ================= Contact & Footer ================= */

.contact {
  padding: 40px 0 80px;
}

.contact-layout {
  display: grid;
  grid-template-columns: minmax(0, 1.1fr) minmax(0, 1.1fr);
  gap: 40px;
}

.contact-info h2 {
  font-size: 2rem;
  margin-bottom: 10px;
}

.contact-info p {
  color: var(--text-muted);
  margin-bottom: 16px;
}

.contact-details p {
  color: var(--text-muted);
}

.contact-form {
  padding: 20px 22px;
  border-radius: var(--radius-lg);
  background: rgba(9, 6, 12, 0.94);
  border: 1px solid rgba(255, 255, 255, 0.12);
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.7);
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 6px;
  margin-bottom: 12px;
}

label {
  font-size: 0.9rem;
  color: var(--text-muted);
}

input,
textarea {
  border-radius: 12px;
  border: 1px solid rgba(255, 255, 255, 0.14);
  background: rgba(4, 2, 6, 0.95);
  color: var(--text-main);
  padding: 9px 11px;
  font-size: 0.9rem;
  outline: none;
  transition: border-color var(--transition-fast), box-shadow var(--transition-fast),
    background var(--transition-fast);
}

input::placeholder,
textarea::placeholder {
  color: rgba(255, 255, 255, 0.36);
}

input:focus,
textarea:focus {
  border-color: var(--accent);
  box-shadow: 0 0 0 1px rgba(255, 130, 67, 0.4);
  background: rgba(8, 4, 12, 0.98);
}

.footer {
  border-top: 1px solid rgba(255, 255, 255, 0.08);
  padding: 16px 20px 22px;
  background: rgba(3, 2, 4, 0.98);
}

.footer-inner {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
  font-size: 0.88rem;
  color: var(--text-muted);
}

.back-to-top {
  color: var(--accent);
  font-weight: 500;
}

/* ================= Scroll Animations ================= */

.animate-on-scroll {
  opacity: 0;
  transform: translateY(18px);
  transition: opacity 0.7s ease-out, transform 0.7s ease-out;
}

.animate-on-scroll[data-animate="fade-right"] {
  transform: translateX(-24px);
}

.animate-on-scroll[data-animate="fade-left"] {
  transform: translateX(24px);
}

.animate-on-scroll[data-animate="zoom-in"] {
  transform: scale(0.94);
}

.animate-on-scroll[data-animate="slide-up"] {
  transform: translateY(24px);
}

.animate-on-scroll.is-visible {
  opacity: 1;
  transform: none;
}

/* ================= Responsive ================= */

@media (max-width: 900px) {
  .nav-inner {
    border-radius: 20px;
  }

  .nav-links {
    position: absolute;
    top: calc(var(--nav-height) - 6px);
    right: 20px;
    padding: 14px 16px;
    border-radius: 18px;
    background: rgba(7, 5, 12, 0.98);
    flex-direction: column;
    align-items: flex-start;
    gap: 14px;
    transform-origin: top right;
    transform: scale(0.9) translateY(-10px);
    opacity: 0;
    pointer-events: none;
    box-shadow: 0 18px 40px rgba(0, 0, 0, 0.9);
  }

  .nav-links.open {
    opacity: 1;
    pointer-events: auto;
    transform: scale(1) translateY(0);
    transition: transform 0.22s ease-out, opacity 0.22s ease-out;
  }

  .nav-toggle {
    display: flex;
  }

  .navbar {
    padding-inline: 10px;
  }

  .character-layout,
  .offers-layout,
  .contact-layout {
    grid-template-columns: minmax(0, 1fr);
  }

  .character-text {
    order: -1;
  }

  .restaurant-grid {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}

@media (max-width: 640px) {
  .hero {
    padding-top: calc(var(--nav-height) + 26px);
  }

  .nav-inner {
    padding-inline: 14px;
  }

  .logo {
    font-size: 1rem;
  }

  .btn-login {
    display: none;
  }

  .hero-actions {
    flex-direction: column;
    align-items: flex-start;
  }

  .restaurant-grid {
    grid-template-columns: minmax(0, 1fr);
  }

  .character-boy {
    transform: scale(0.9);
  }

  .contact-form {
    padding-inline: 16px;
  }

  .footer-inner {
    flex-direction: column;
    align-items: flex-start;
  }
}


  </style>
</head>
<body>
  <!-- ================= Navbar ================= -->
  <header class="navbar" id="top">
    <div class="nav-inner">
      <div class="logo">Kaanavali</div>
      <nav class="nav-links">
        <a href="#hero" class="nav-link">Home</a>
        <a href="#restaurants" class="nav-link">Restaurants</a>
        <a href="#offers" class="nav-link">Offers</a>
        <a href="#contact" class="nav-link">Contact</a>
      </nav>
      <button class="btn btn-login"><a href="login.jsp">Login</a></button>
      <button class="nav-toggle" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
    </div>
  </header>

  <!-- ================= Hero ================= -->
  <section class="hero" id="hero">
    <div class="hero-bg-slider">
      <div class="hero-bg-slide active" style="background-image: url('https://images.pexels.com/photos/4109138/pexels-photo-4109138.jpeg?auto=compress&cs=tinysrgb&w=1600');"></div>
      <div class="hero-bg-slide" style="background-image: url('https://images.pexels.com/photos/1095550/pexels-photo-1095550.jpeg?auto=compress&cs=tinysrgb&w=1600');"></div>
      <div class="hero-bg-slide" style="background-image: url('https://images.pexels.com/photos/1841107/pexels-photo-1841107.jpeg?auto=compress&cs=tinysrgb&w=1600');"></div>
      <div class="hero-bg-slide" style="background-image: url('https://images.pexels.com/photos/3186654/pexels-photo-3186654.jpeg?auto=compress&cs=tinysrgb&w=1600');"></div>
      <div class="hero-overlay"></div>
    </div>
    <div class="hero-content container animate-on-scroll" data-animate="fade-up">
      <h1>Delicious Food, Delivered Fast</h1>
      <p>Order from your favorite restaurants near you with a single tap.</p>
      <div class="hero-actions">
        
        <button class="btn btn-primary cta-pulse,nav-link"><a href="#restaurants">Order Now</a></button>
        <span class="hero-subtext">No minimum order · Lightning-fast delivery</span>
      </div>
    </div>
  </section>

  <!-- ================= Animated Character ================= -->
  <section class="character-section" id="character">
    <div class="container character-layout animate-on-scroll" data-animate="fade-right">
      <div class="character-illustration">
        <div class="character-shadow"></div>
        <div class="character-boy">
          <div class="boy-head">
            <div class="boy-hair"></div>
            <div class="boy-face">
              <span class="eye left"></span>
              <span class="eye right"></span>
              <span class="smile"></span>
            </div>
            <div class="boy-hat">
              <span class="hat-badge"></span>
            </div>
          </div>
          <div class="boy-body">
            <div class="boy-torso">
              <div class="bow-tie"></div>
              <div class="buttons">
                <span></span><span></span>
              </div>
            </div>
            <div class="boy-arms">
              <div class="arm left-arm">
                <div class="tray">
                  <div class="tray-plate"></div>
                  <div class="tray-steam s1"></div>
                  <div class="tray-steam s2"></div>
                  <div class="tray-steam s3"></div>
                </div>
              </div>
              <div class="arm right-arm">
                <div class="spoon"></div>
              </div>
            </div>
            <div class="boy-legs">
              <div class="leg left-leg"></div>
              <div class="leg right-leg"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="character-text">
        <h2>Meet Your Personal Food Buddy</h2>
        <p>
          Our friendly waiter keeps your cravings satisfied – from sizzling biryanis
          to cheesy pizzas, he’s always on the move, serving happiness to your door.
        </p>
        <ul class="character-list">
          <li><strong>Lightning-fast</strong> delivery across your city.</li>
          <li><strong>Carefully packed</strong> so every bite reaches you fresh.</li>
          <li><strong>Curated menus</strong> from top-rated restaurants.</li>
        </ul>
      </div>
    </div>
  </section>
   

    <section class="restaurants" id="restaurants">
        <div class="container">
      <div class="section-header animate-on-scroll" data-animate="fade-up">
        <h2>Handpicked Restaurants Near You</h2>
        <p>Explore premium partners delivering flavor-packed experiences.</p>
      </div>
       <div class="restaurant-grid">
    <%
        List<Restaurant> allRestaurants = 
            (List<Restaurant>) request.getAttribute("allRestaurants");

        if (allRestaurants != null) {
            for (Restaurant restaurant : allRestaurants) {
    %>

       
        
        
       
        
        
        
         
    
        <article class="restaurant-card animate-on-scroll" data-animate="zoom-in">
        <a href="Menu?restaurantId=<%= restaurant.getId()%>">
          <div class="restaurant-image" style="background-image: url(<%= restaurant.getImageUrl() %>)"></div>
        </a>
          <div class="restaurant-content">
            <h3><%= restaurant.getName() %></h3>
            <p class="cuisine"><%= restaurant.getDescription() %></p>
            <div class="restaurant-meta">
              <span class="rating"><%= restaurant.getRating() %>★</span>
              <span class="eta"><%= restaurant.getEta() %> mins</span>
            </div>
            <button class="btn btn-secondary"><a href="Menu?restaurantId=<%= restaurant.getId()%>">Order Now</a></button>
          </div>
        </article>
        
         
        
        
        
        
        

    <%
            }
        }
    %>
    
      </div>
    </div>
  </section>
    <!-- ================= Offers ================= -->
  <section class="offers" id="offers">
    <div class="container offers-layout">
      <div class="offers-text animate-on-scroll" data-animate="fade-left">
        <h2>Hot Offers Cooking Just For You</h2>
        <p>
          Save more on every order with exclusive deals, festival specials, and
          partner offers – updated daily so you never miss a steal.
        </p>
        <ul class="offers-list">
          <li><strong>Flat 50% OFF</strong> on your first Kaanavali order.</li>
          <li><strong>Free dessert</strong> on weekend late-night deliveries.</li>
          <li><strong>Stackable coupons</strong> with selected payment partners.</li>
        </ul>
      </div>
      <div class="offers-cards">
        <div class="offer-card animate-on-scroll" data-animate="slide-up">
          <h3>New User Feast</h3>
          <p>Use code <strong>KAANA50</strong> and enjoy flat 50% off.</p>
        </div>
        <div class="offer-card animate-on-scroll" data-animate="slide-up">
          <h3>Combo Nights</h3>
          <p>Buy 1 Get 1 on selected pizzas after 8 PM.</p>
        </div>
        <div class="offer-card animate-on-scroll" data-animate="slide-up">
          <h3>Dessert on Us</h3>
          <p>Free brownie on orders above ₹699 every Friday.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- ================= Contact / Footer ================= -->
  <section class="contact" id="contact">
    <div class="container contact-layout animate-on-scroll" data-animate="fade-up">
      <div class="contact-info">
        <h2>We’re Here For Your Cravings</h2>
        <p>
          Have feedback, partnership ideas, or questions? Reach out and our team
          will get back faster than your next order!
        </p>
        <div class="contact-details">
          <p><strong>Email:</strong> sachinbhajantri262@gmail.com</p>
          <p><strong>Support:</strong> +91-6363087185</p>
        </div>
      </div>
      <form class="contact-form" onsubmit="return false;">
        <div class="form-group">
          <label for="name">Name</label>
          <input type="text" id="name" placeholder="Your name" />
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="email" placeholder="you@example.com" />
        </div>
        <div class="form-group">
          <label for="message">Message</label>
          <textarea id="message" rows="3" placeholder="Tell us how we can help"></textarea>
        </div>
        <button class="btn btn-primary" type="submit">Send Message</button>
      </form>
    </div>
  </section>

  <footer class="footer">
    <div class="container footer-inner">
      <p>© <span id="year"></span> Kaanavali. All rights reserved.</p>
      <a href="#top" class="back-to-top">Back to top ↑</a>
    </div>
  </footer>

  <script >

    // Year in footer
const yearSpan = document.getElementById("year");
if (yearSpan) {
  yearSpan.textContent = new Date().getFullYear();
}

// Mobile nav toggle
const navToggle = document.querySelector(".nav-toggle");
const navLinks = document.querySelector(".nav-links");

if (navToggle && navLinks) {
  navToggle.addEventListener("click", () => {
    navLinks.classList.toggle("open");
  });

  navLinks.addEventListener("click", (e) => {
    if (e.target.matches("a")) {
      navLinks.classList.remove("open");
    }
  });
}

// Hero background slider
const slides = document.querySelectorAll(".hero-bg-slide");
let currentSlide = 0;

function goToSlide(index) {
  slides.forEach((slide, i) => {
    slide.classList.toggle("active", i === index);
  });
}

if (slides.length > 0) {
  setInterval(() => {
    currentSlide = (currentSlide + 1) % slides.length;
    goToSlide(currentSlide);
  }, 5000);
}

// Scroll-based animations using IntersectionObserver
const animatedEls = document.querySelectorAll(".animate-on-scroll");

if ("IntersectionObserver" in window) {
  const observer = new IntersectionObserver(
    (entries, obs) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible");
          obs.unobserve(entry.target);
        }
      });
    },
    {
      threshold: 0.15,
    }
  );

  animatedEls.forEach((el) => observer.observe(el));
} else {
  // Fallback: show everything
  animatedEls.forEach((el) => el.classList.add("is-visible"));
}

// Smooth scroll for internal anchor links (improve UX)
const internalLinks = document.querySelectorAll('a[href^="#"]');

internalLinks.forEach((link) => {
  link.addEventListener("click", (e) => {
    const targetId = link.getAttribute("href").substring(1);
    const target = document.getElementById(targetId);

    if (target) {
      e.preventDefault();
      const rect = target.getBoundingClientRect();
      const offset = window.pageYOffset + rect.top - 80; // account for navbar
      window.scrollTo({ top: offset, behavior: "smooth" });
    }
  });
});

  </script>
</body>
</html>
