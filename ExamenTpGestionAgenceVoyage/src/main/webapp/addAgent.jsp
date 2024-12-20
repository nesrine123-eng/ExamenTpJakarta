<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add an Agent</title>
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
            --background-image-url: url('https://dexauc1l0pcnj.cloudfront.net/Content/images/blog/what-hotels-can-learn-from-luxury-concierge-services-in-france.jpg'); /* Remplacez par votre propre URL d'image */
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-image: var(--background-image-url); /* Image en arrière-plan */
            background-size: cover; /* L'image couvre toute la zone */
            background-position: center; /* Centrer l'image */
            background-attachment: fixed; /* L'image reste fixe lors du défilement */
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

        .form-input {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            border: 1px solid var(--input-border);
            border-radius: 8px;
            outline: none;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .form-input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 10px rgba(0, 170, 255, 0.3);
        }

        .form-input::placeholder {
            color: #7f8c8d;
            position: absolute;
            left: 40px; /* Décalage de l'icône */
        }

        .form-input i {
            position: absolute;
            top: 12px;
            left: 10px;
            font-size: 1.2rem;
            color: #7f8c8d;
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

        .form-input::placeholder {
            color: #7f8c8d;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1 class="form-title">Add an Agent</h1>
        <form class="form" action="${pageContext.request.contextPath}/AddAgentServlet" method="post">
            <!-- Nom d'utilisateur -->
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input 
                    type="text" 
                    class="form-input" 
                    placeholder="username" 
                    name="username" 
                    required
                >
            </div>

            <!-- Mot de passe -->
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input 
                    type="password" 
                    class="form-input" 
                    placeholder="password" 
                    name="password" 
                    required
                >
            </div>

            <!-- Email -->
            <div class="input-group">
                <i class="fas fa-envelope"></i>
                <input 
                    type="email" 
                    class="form-input" 
                    placeholder="mail" 
                    name="email" 
                    required
                >
            </div>

            <!-- Bouton -->
            <button type="submit" class="form-button">
                <i class="fas fa-user-plus"></i> Add
            </button>
        </form>
    </div>
</body>
</html>
