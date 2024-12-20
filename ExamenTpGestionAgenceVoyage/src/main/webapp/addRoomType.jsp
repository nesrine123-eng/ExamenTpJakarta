<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Hotel" %>
<%@ page import="dao.Hoteldao" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add a RommType</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!-- Ajout de la bibliothèque Font Awesome pour les icônes -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        :root {
            --background-color: #f4f7fc;
            --card-background: #ffffff;
            --primary-color: #00aaff; /* Bleu clair */
            --secondary-color: #34495e;
            --input-border: #dcdde1;
            --button-hover: #0088cc;
            --shadow-color: rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: url('https://www.ticasino.com/uploads/_800xAUTO_crop_center-center_none/Hotel_Double_Queen_1200X800.jpg') no-repeat center center fixed; /* Remplacez par votre URL d'image */
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            animation: fadeIn 1s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .form-container {
            width: 100%;
            max-width: 500px;
            background: var(--card-background);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 20px var(--shadow-color);
            animation: slideIn 0.5s ease-out;
            opacity: 0.9; /* Légère transparence pour voir l'image de fond */
        }

        @keyframes slideIn {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .form-title {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 20px;
            font-weight: 500;
            color: var(--secondary-color);
            font-family: 'Roboto', sans-serif;
            animation: fadeIn 1s ease-in-out;
        }

        .form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-input, .form-select {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            border: 1px solid var(--input-border);
            border-radius: 8px;
            outline: none;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-input:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 10px rgba(0, 170, 255, 0.3);
        }

        .form-button {
            background-color: var(--primary-color);
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 1.2rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-button:hover {
            background-color: var(--button-hover);
            transform: translateY(-2px);
        }

        .form-button i {
            margin-right: 8px; /* Espacement entre l'icône et le texte */
        }

        .form-select option {
            color: #000;
            background-color: #fff;
        }

        .form-input::placeholder {
            color: #7f8c8d;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1 class="form-title">Add a RoomType</h1>
        <form class="form" action="${pageContext.request.contextPath}/AddRoomTypeServlet" method="post">
            <!-- Sélection de l'hôtel avec une icône -->
            <div class="form-group">
                <label for="hotelId">
                    <i class="fas fa-hotel"></i> 
                </label>
                <select class="form-select" id="hotelId" name="hotelId" required>
                    <option value="" disabled selected>Select a Hotel</option>
                    <% 
                        dao.Hoteldao hotelDAO = new dao.Hoteldao();
                        List<model.Hotel> hotels = hotelDAO.getAllHotels();

                        if (hotels != null && !hotels.isEmpty()) {
                            for (model.Hotel hotel : hotels) {
                    %>
                        <option value="<%= hotel.getId() %>"><%= hotel.getName() %></option>
                    <% 
                            }
                        } else {
                    %>
                        <option disabled>No Hotel</option>
                    <% 
                        }
                    %>
                </select>
            </div>

            <!-- Room Type avec une icône -->
            <div class="form-group">
                <label for="label">
                    <i class="fas fa-bed"></i> 
                </label>
                <select class="form-select" id="label" name="label" required>
                    <option value="" disabled ${param.label == null ? 'selected' : ''}>RoomType</option>
                    <option value="standard" ${param.label == 'standard' ? 'selected' : ''}>Room Standard</option>
                    <option value="deluxe" ${param.label == 'deluxe' ? 'selected' : ''}>Room Deluxe</option>
                    <option value="suite" ${param.label == 'suite' ? 'selected' : ''}>Suite</option>
                </select>
            </div>

            <!-- Capacité maximale avec une icône -->
            <div class="form-group">
                <label for="capacity">
                    <i class="fas fa-users"></i> 
                </label>
                <input type="number" class="form-input" id="capacity" name="capacity" min="1" placeholder="Capacity " required>
            </div>

            <!-- Prix avec une icône -->
            <div class="form-group">
                <label for="prix">
                    <i class="fas fa-euro-sign"></i> 
                </label>
                <input type="number" class="form-input" id="prix" name="prix" min="0" placeholder="Price (€)" required>
            </div>

            <!-- Bouton de soumission -->
            <button type="submit" class="form-button">
                <i class="fas fa-plus"></i> Add
            </button>
        </form>
    </div>
</body>
</html>
