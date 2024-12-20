<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Hôtel</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --background-color: #f4f7fc; /* Fond clair */
            --card-background: #ffffff; /* Fond des cartes */
            --primary-color: #00aaff; /* Bleu clair */
            --secondary-color: #34495e; /* Gris foncé */
            --input-border: #dcdde1; /* Bordure des champs */
            --button-hover: #0088cc; /* Bleu foncé */
            --shadow-color: rgba(0, 0, 0, 0.1); /* Ombre légère */
            --background-image-url: url('https://www.welcome-hotels.com/site/assets/files/35059/welcome_hotel_marburg_lobby_2k.2560x988.jpg');
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--background-color);
            background-image: var(--background-image-url);
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .form-container {
            width: 100%;
            max-width: 500px;
            background: rgba(255, 255, 255, 0.9); /* Fond semi-transparent */
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 20px var(--shadow-color);
        }

        .form-title {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 20px;
            font-weight: 500;
            color: var(--secondary-color);
        }

        .form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-input, .form-select, .form-textarea, .form-file {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            border: 1px solid var(--input-border);
            border-radius: 8px;
            outline: none;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            background: url("https://img.icons8.com/ios/50/000000/checked.png") no-repeat scroll 10px 50%;
            background-size: 20px;
            padding-left: 40px; /* espace pour l'icône */
        }

        .form-input:focus, .form-select:focus, .form-textarea:focus, .form-file:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 10px rgba(0, 170, 255, 0.3);
        }

        .form-textarea {
            resize: none;
            height: 100px;
        }

        .form-select {
            appearance: none;
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 16px;
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

        .form-button:active {
            transform: translateY(0);
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

        .form-button i {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1 class="form-title">Add a Hotel</h1>
        <form class="form" action="${pageContext.request.contextPath}/AddHotelServlet" method="post" enctype="multipart/form-data">
            <!-- Nom de l'Hôtel -->
            <input 
                type="text" 
                class="form-input" 
                placeholder="Name of Hotel" 
                name="name" 
                required
            >

            <!-- Ville -->
            <select class="form-select" name="city" required>
                <option value="" disabled selected>Choose the city</option>
                <option value="TUNIS">Tunis</option>
                <option value="BIZERT">BIZERT</option>
                <option value="DJERBA">DJERBA</option>
                <option value="ZARZIS">Zarzis</option>
                
            </select>

            <!-- Nombre d'Étoiles -->
            <input 
                type="number" 
                class="form-input" 
                placeholder="Number of Stars (1-5)" 
                name="stars" 
                min="1" 
                max="5" 
                required
            >

            <!-- Description -->
            <textarea 
                class="form-textarea" 
                placeholder="Description" 
                name="description" 
                required
            ></textarea>

            <!-- Image -->
            <input 
                type="file" 
                class="form-file" 
                name="image" 
                accept="image/*" 
                required
            >

            <!-- Bouton -->
            <button type="submit" class="form-button">
                <i class="fas fa-plus"></i> Add
            </button>
        </form>
    </div>
</body>
</html>
