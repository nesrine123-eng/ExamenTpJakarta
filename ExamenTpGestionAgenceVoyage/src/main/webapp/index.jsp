<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.HotelRoom" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Let's search </title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        :root {
            --primary-color: #4db8ff;
            --secondary-color: #ffffff;
            --background-gradient: linear-gradient(135deg, #e6f7ff 0%, #4db8ff 100%);
            --button-hover: #33a6ff;
            --card-background: #ffffff;
            --text-color: #333333;
            --border-radius: 15px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: var(--background-gradient);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-color);
        }

        .container {
            width: 100%;
            max-width: 900px;
            background: var(--card-background);
            border-radius: var(--border-radius);
            padding: 40px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 20px;
            font-weight: 700;
        }

        form {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        label {
            font-size: 1rem;
            margin-bottom: 5px;
            color: var(--text-color);
        }

        input, select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: var(--border-radius);
            font-size: 1rem;
            outline: none;
            transition: all 0.3s ease;
        }

        input:hover, select:hover, input:focus, select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 8px rgba(77, 184, 255, 0.5);
        }

        button {
            grid-column: span 2;
            background: var(--primary-color);
            color: var(--secondary-color);
            border: none;
            padding: 15px;
            border-radius: var(--border-radius);
            font-size: 1.2rem;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        button:hover {
            background: var(--button-hover);
        }

        .results {
            margin-top: 30px;
        }

        .result-item {
            display: flex;
            align-items: flex-start;
            gap: 20px;
            margin-bottom: 20px;
            background: var(--card-background);
            border-radius: var(--border-radius);
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .result-item:hover {
            transform: scale(1.05);
        }

        .image-container {
            width: 400px;
            height: 400px;
            border-radius: var(--border-radius);
            overflow: hidden;
            flex-shrink: 0;
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .hotel-details {
            flex-grow: 1;
        }

        .hotel-details h3 {
            margin: 0 0 10px;
            font-size: 1.5rem;
            color: var(--primary-color);
        }

        .hotel-details p {
            margin: 5px 0;
            color: var(--text-color);
        }

        .services {
            margin-top: 40px;
        }

        .services h2 {
            text-align: center;
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 20px;
            font-weight: 700;
        }

        .service-cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
        }

        .service-card {
            background: var(--card-background);
            border-radius: var(--border-radius);
            padding: 20px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .service-card:hover {
            transform: translateY(-10px);
        }

        .service-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: var(--border-radius);
            margin-bottom: 15px;
        }

        .service-card h4 {
            margin-bottom: 10px;
            font-size: 1.2rem;
            color: var(--primary-color);
        }

        .service-card p {
            font-size: 0.9rem;
            color: var(--text-color);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Let's Search </h1>
        <form action="${pageContext.request.contextPath}/SearchServlet" method="post">
            <form action="${pageContext.request.contextPath}/SearchServlet" method="post">
            <div class="form-group">
                <label>City :</label>
                <select name="city" required>
                    <option value="TUNIS">TUNIS</option>
                    <option value="BIZERTE">BIZERTE</option>
                    <option value="DJERBA">DJERBA</option>
                    <option value="ZARZIS">ZARZIS</option>
                </select>
            </div>

            <div class="form-group">
                <label>Number of Stars :</label>
                <select name="stars" required>
                    <option value="1">a Star</option>
                    <option value="2">two Stars</option>
                    <option value="3">three Stars</option>
                    <option value="4">four Stars</option>
                    <option value="5">five Stars</option>
                </select>
            </div>

            <div class="form-group">
                <label>RoomType :</label>
                <select name="roomType" required>
                    <option value="standard">Room Standard</option>
                    <option value="deluxe">Room Deluxe</option>
                    <option value="suite">Suite</option>
                </select>
            </div>

            <div class="form-group">
                <label>Capacity :</label>
                <select name="capacity" required>
                    <option value="1">1 Person</option>
                    <option value="2">2 Person</option>
                    <option value="3">3 Person</option>
                    <option value="4">4 Person</option>
                </select>
            </div>

            <div class="form-group">
                <label>Prix Minimum :</label>
                <input type="number" name="minPrice" min="0" required>
            </div>

            <div class="form-group">
                <label>Prix Maximum :</label>
                <input type="number" name="maxPrice" min="0" required>
            </div>

            <button type="submit">Search</button>
        </form>

        <div class="results">
            <h2>Résultats :</h2>
            <%
            List<HotelRoom> hotelResults = (List<HotelRoom>) request.getAttribute("hotelResults");
            if (hotelResults != null && !hotelResults.isEmpty()) {
                for (HotelRoom hotel : hotelResults) {
            %>
            <div class="result-item">
                <div class="image-container">
                    <img src="images/<%= hotel.getImageUrl() %>" alt="Image Hôtel">
                </div>
                <div class="hotel-details">
                    <h3><%= hotel.getHotelName() %></h3>
                    <p>Ville : <%= hotel.getCity() %></p>
                    <p>
                        Étoiles :
                        <% for (int i = 0; i < hotel.getNumberOfStars(); i++) { %>
                            <i class="fas fa-star" style="color: gold;"></i>
                        <% } %>
                    </p>
                    <p>Type de Chambre : <%= hotel.getRoomType() %></p>
                    <p>Prix : <%= hotel.getPrice() %> TND</p>
                    <p>Capacité : <%= hotel.getCapacity() %> Personne(s)</p>
                </div>
            </div>
            <% } } else { %>
            <p>No Result.</p>
            <% } %>
        </div>



        <div class="services">
            <h2>Nos Services</h2>
            <div class="service-cards">
                <div class="service-card">
                    <img src="https://offloadmedia.feverup.com/parissecret.com/wp-content/uploads/2023/06/16120826/4-4.jpg" alt="Piscine">
                    <h4>Piscine</h4>
                    <p>Relaxez-vous dans nos piscines cristallines.</p>
                </div>
                <div class="service-card">
                    <img src="https://www.spa-luxury-paris.fr/images/slider2/massage-paris.jpg" alt="Spa">
                    <h4>Spa</h4>
                    <p>Offrez-vous des moments de détente inégalés.</p>
                </div>
                <div class="service-card">
                    <img src="https://www.lakegenevahotel.ch/fileadmin/_processed_/c/2/csm_Lake-Geneva-Hotel-restaurant-ofive_d8e5c0b207.jpg" alt="Restaurant">
                    <h4>Restaurant</h4>
                    <p>Dégustez des plats raffinés préparés par nos chefs.</p>
                </div>
                <div class="service-card">
                    <img src="https://www.powergym.fr/img/cms/ATX%202/salle-sport-centre-remise-forme-musculation-fitness.jpeg" alt="Salle de Fitness">
                    <h4>Salle de Fitness</h4>
                    <p>Restez en forme avec nos équipements de qualité.</p>
                </div>
                <div class="service-card">
                    <img src="https://www.hotel-de-berny.com/wp-content/uploads/2023/01/107A8834-1-1024x683.jpg" alt="Petit Déjeuner">
                    <h4>Petit Déjeuner</h4>
                    <p>Commencez votre journée avec un délicieux petit déjeuner.</p>
                </div>
                <div class="service-card">
                    <img src="https://dexauc1l0pcnj.cloudfront.net/Content/images/blog/what-hotels-can-learn-from-luxury-concierge-services-in-france.jpg" alt="Concierge">
                    <h4>Concierge</h4>
                    <p>Nos concierges sont à votre disposition pour répondre à vos besoins.</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
