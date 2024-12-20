<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lux Hotel - Discover Cozy Rooms</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        header {
            background-color: #33acff;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h1 {
            font-size: 24px;
            margin: 0;
        }
        nav a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            font-size: 14px;
        }
        nav a:hover {
            text-decoration: underline;
        }
        .hero {
            position: relative;
            text-align: center;
            color: white;
            background: url('https://www.cvent.com/sites/default/files/image/2021-10/hotel%20room%20with%20beachfront%20view.jpg') no-repeat center center/cover;
            height: 400px;
        }
        .hero h2 {
            font-size: 48px;
            margin: 0;
            padding-top: 150px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
        }
        .hero .search-button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            animation: pulse 1.5s infinite;
        }
        .hero .search-button:hover {
            background-color: #33acff;
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        .content {
            padding: 20px;
            text-align: center;
        }
        .content h3 {
            font-size: 24px;
            margin: 20px 0;
        }
        .promotions {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
        .promotion {
            width: 30%;
            text-align: center;
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .promotion:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .promotion img {
            max-width: 100%;
            border-radius: 10px;
            margin-bottom: 10px;
            transition: transform 0.3s;
        }
        .promotion img:hover {
            transform: scale(1.1);
        }
        .promotion h4 {
            margin: 10px 0;
            font-size: 18px;
            color: #333;
        }
        .promotion p {
            font-size: 14px;
            color: #555;
            margin: 5px 0;
        }
        .promotion strong {
            color: #33acff;
        }
        footer {
            background-color: #33acff;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Lux Hotel</h1>
        <nav>
            <a href="login.jsp">LogIn</a>
            <a href="contact.jsp">Contact</a>
        </nav>
    </header>
    <section class="hero">
        <h2>Discover Cozy Rooms</h2>
        <p>Perfect for any trip</p>
        <a href="index.jsp">
            <button class="search-button">Search</button>
        </a>
    </section>
    <section class="content">
        <h3>Relax at Our Hotel</h3>
        <p>Experience luxury and comfort with our modern amenities and exceptional services.</p>
        <div class="promotions">
            <div class="promotion">
                <img src="https://booking.cte.tn/cr.fwk/images/hotels/Hotel-350-20200508-040031.jpg" alt="Luxury Suite">
                <h4>Luxury Suite</h4>
                <p>Enjoy a luxurious stay with sea views and premium amenities.</p>
                <p><strong>From $299/night</strong></p>
            </div>
            <div class="promotion">
                <img src="https://cf.bstatic.com/static/img/theme-index/bg_luxury/869918c9da63b2c5685fce05965700da5b0e6617.jpg" alt="Family Package">
                <h4>Family Package</h4>
                <p>Special rates for families, including complimentary breakfast.</p>
                <p><strong>From $249/night</strong></p>
            </div>
            <div class="promotion">
                <img src="https://www.resabo.com/cr.fwk/images/hotels/Hotel-1876-20230831-014021.jpg" alt="Romantic Getaway">
                <h4>Romantic Getaway</h4>
                <p>Perfect for couples, with a complimentary dinner for two.</p>
                <p><strong>From $199/night</strong></p>
            </div>
            <div class="promotion">
                <img src="https://www.resabo.com/cr.fwk/images/hotels/Hotel-8996-20230803-023803.jpg" alt="Business Stay">
                <h4>Business Stay</h4>
                <p>Ideal for business travelers with high-speed internet and workspace.</p>
                <p><strong>From $189/night</strong></p>
            </div>
            <div class="promotion">
                <img src="https://www.hotels-au-naturel.com/wp-content/files/hotel-au-naturel-Les-4-Saisons-14.jpg" alt="Budget Room">
                <h4>Budget Room</h4>
                <p>A cozy stay at an affordable price for budget-conscious travelers.</p>
                <p><strong>From $99/night</strong></p>
            </div>
            <div class="promotion">
                <img src="https://voyage-tunisie.info/wp-content/uploads/2018/02/La-Badira.jpg" alt="Eco-friendly Stay">
                <h4>Eco-friendly Stay</h4>
                <p>Experience sustainable luxury with eco-friendly facilities.</p>
                <p><strong>From $199/night</strong></p>
            </div>
        </div>
    </section>
    <footer>
        <p>&copy; 2024 Lux Hotel. All Rights Reserved.</p>
    </footer>
</body>
</html>

