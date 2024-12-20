<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update RoomType</title>
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

        .form-input, .form-select {
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

        .form-input:focus, .form-select:focus {
            border-color: var(--primary-color);
        }

        .form-input::placeholder, .form-select {
            color: var(--text-color);
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

        .form-select option {
            color: #000;
            background-color: #fff;
        }

        .form-input option {
            color: #000;
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
        <h1 class="form-title">update RoomType</h1>
        <form class="form" action="${pageContext.request.contextPath}/UpdateRoomTypeServlet" method="post">
            <!-- Hidden ID for identifying the room type -->
            <input type="hidden" name="id" value="${param.id}" />

            <!-- Hotel selection -->
            <div class="form-label">
                <i class="fas fa-hotel"></i>
                <select class="form-select" id="hotelId" name="hotelId" required>
                    <option value="" disabled selected>Select a hotel</option>
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
                        <option disabled>No hotel</option>
                    <% 
                        }
                    %>
                </select>
            </div>

            <!-- Room Type selection -->
            <div class="form-label">
                <i class="fas fa-bed"></i>
                <select class="form-select" id="label" name="label" required>
                    <option value="" disabled ${param.label == null ? 'selected' : ''}>RoomType</option>
                    <option value="standard" ${param.label == 'standard' ? 'selected' : ''}>Chambre Standard</option>
                    <option value="deluxe" ${param.label == 'deluxe' ? 'selected' : ''}>Chambre Deluxe</option>
                    <option value="suite" ${param.label == 'suite' ? 'selected' : ''}>Suite</option>
                </select>
            </div>

            <!-- Capacity input -->
            <div class="form-label">
                <i class="fas fa-users"></i>
                <input type="number" class="form-input" id="capacity" name="capacity" min="1" placeholder="Capacity" value="${param.capacity}" required>
            </div>

            <!-- Price input -->
            <div class="form-label">
                <i class="fas fa-dollar-sign"></i>
                <input type="number" class="form-input" id="price" name="price" min="0" placeholder="Price" value="${param.price}" required>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="form-button">Save</button>
        </form>
    </div>
</body>
</html>
