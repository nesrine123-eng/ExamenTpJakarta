<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un Hôtel</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #00bcd4;
            --secondary-color: #ffffff;
            --background-gradient: linear-gradient(135deg, #00bcd4 0%, #00796b 100%);
            --input-background: rgba(255, 255, 255, 0.9);
            --button-background: #00bcd4;
            --button-hover: #00796b;
            --text-color: #333333;
            --border-radius: 10px;
            --card-background: rgba(255, 255, 255, 0.8);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--background-gradient);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-color);
        }

        .form-container {
            width: 100%;
            max-width: 600px;
            background: var(--card-background);
            border-radius: var(--border-radius);
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 30px;
            font-weight: 600;
            color: var(--primary-color);
        }

        .form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-input, .form-textarea, .form-file, .form-select {
            width: 100%;
            padding: 15px;
            background: var(--input-background);
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: var(--border-radius);
            color: var(--text-color);
            font-size: 1rem;
            outline: none;
            transition: border 0.3s ease;
        }

        .form-input:focus, .form-select:focus, .form-textarea:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 8px rgba(37, 117, 252, 0.5);
        }

        .form-input::placeholder, .form-textarea::placeholder {
            color: var(--text-color);
        }

        .form-textarea {
            resize: none;
            height: 100px;
        }

        .form-button {
            background: var(--button-background);
            color: var(--secondary-color);
            border: none;
            padding: 15px;
            border-radius: var(--border-radius);
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .form-button:hover {
            background: var(--button-hover);
            transform: scale(1.05);
        }

        select {
            padding: 15px;
            width: 100%; /* S'adapte au conteneur */
            background: var(--input-background);
            border: 1px solid var(--border-color);
            border-radius: 10px;
            color: var(--text-color);
            font-size: 1rem;
            outline: none;
            appearance: none;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        select:hover {
            border-color: #6a11cb;
        }

        select:focus {
            border-color: #2575fc;
            box-shadow: 0 0 8px rgba(37, 117, 252, 0.5);
        }

        select option {
            color: #333;
            background-color: #fff;
        }

        .form-label {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-label i {
            color: var(--primary-color);
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1 class="form-title">Update a hotel</h1>
        <form class="form" action="${pageContext.request.contextPath}/UpdateHotelServlet" method="post" enctype="multipart/form-data">
            <!-- Hidden ID for identifying the hotel -->
            <input type="hidden" name="id" value="${param.id}" />

            <!-- Hotel Name -->
            <div class="form-label">
                <i class="fas fa-hotel"></i>
                <input type="text" class="form-input" placeholder="Name" name="name" value="${param.name}" required>
            </div>

            <!-- City Selection -->
            <div class="form-label">
                <i class="fas fa-city"></i>
                <select class="form-select" id="city" name="city" required>
                    <option value="" disabled ${param.city == null ? 'selected' : ''}>City</option>
                    <option value="TUNIS" ${param.city == 'TUNIS' ? 'selected' : ''}>TUNIS</option>
                    <option value="BIZERTE" ${param.city == 'BIZERTE' ? 'selected' : ''}>BIZERTE</option>
                    <option value="DJERBA" ${param.city == 'DJERBA' ? 'selected' : ''}>DJERBA</option>
                    <option value="ZARZIS" ${param.city == 'ZARZIS' ? 'selected' : ''}>ZARZIS</option>
                </select>
            </div>

            <!-- Star Rating -->
            <div class="form-label">
                <i class="fas fa-star"></i>
                <input type="number" class="form-input" placeholder="Number of Stars (1-5)" name="stars" min="1" max="5" value="${param.stars}" required>
            </div>

            <!-- Description -->
            <div class="form-label">
                <i class="fas fa-info-circle"></i>
                <textarea class="form-textarea" placeholder="Description " name="description" required>${param.description}</textarea>
            </div>

            <!-- Hotel Image -->
            <div class="form-label">
                <i class="fas fa-image"></i>
                <input type="file" class="form-file" name="image" accept="image/*">
            </div>

            <!-- Submit Button -->
            <button type="submit" class="form-button">Save</button>
        </form>
    </div>
</body>
</html>
