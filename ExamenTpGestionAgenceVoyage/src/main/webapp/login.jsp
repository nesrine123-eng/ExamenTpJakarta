<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In - </title>
    <style>
        :root {
            --primary-color: #1a73e8;
            --secondary-color: #ffffff;
            --text-color: #000000;
            --input-border: #ddd;
            --input-focus: #1a73e8;
            --button-hover: #1558b0;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            background-image: url('https://static.vecteezy.com/system/resources/previews/003/050/891/non_2x/hotel-booking-online-reservation-mobile-application-for-renting-vector.jpg'); /* Ajoutez le chemin de votre image ici */
            background-size: cover; /* L'image couvre tout l'écran */
            background-position: center; /* Centrer l'image */
            background-repeat: no-repeat; /* Éviter la répétition de l'image */
        }

        .wrapper {
            display: flex;
            width: 900px;
            background-color: var(--secondary-color);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .illustration {
            flex: 1;
            background-color: var(--primary-color);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .illustration img {
            max-width: 100%;
            height: auto;
        }

        .illustration h2 {
            color: var(--secondary-color);
            margin-top: 20px;
            font-size: 1.5rem;
        }

        .form-container {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-title {
            font-size: 2rem;
            color: var(--text-color);
            margin-bottom: 20px;
        }

        .login-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .login-input {
            padding: 15px;
            font-size: 1rem;
            border: 1px solid var(--input-border);
            border-radius: 5px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .login-input:focus {
            border-color: var(--input-focus);
            box-shadow: 0 0 5px var(--input-focus);
        }

        .login-button {
            padding: 15px;
            font-size: 1rem;
            background-color: var(--primary-color);
            color: var(--secondary-color);
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-button:hover {
            background-color: var(--button-hover);
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="illustration">
            <img src="images/secureee.jpg" alt="Illustration sécurisée">
            <h2></h2>
        </div>
        <div class="form-container">
            <h1 class="form-title">Welcome</h1>
            <form class="login-form" action="${pageContext.request.contextPath}/LoginServlet" method="post">
                <input 
                    type="email" 
                    class="login-input" 
                    placeholder="mail" 
                    name="email" 
                    required
                >
                <input 
                    type="password" 
                    class="login-input" 
                    placeholder="password" 
                    name="password" 
                    required
                >
                <button type="submit" class="login-button">Connect</button>
            </form>
        </div>
    </div>
</body>
</html>
