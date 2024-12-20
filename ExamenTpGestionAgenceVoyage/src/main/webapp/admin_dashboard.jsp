<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Account" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --background-gradient: linear-gradient(135deg, #3498db 0%, #66c2ff 100%); /* Dégradé */
            --card-background: rgba(255, 255, 255, 0.9);
            --text-primary: #333333;
            --text-secondary: rgba(255, 255, 255, 0.8);
            --input-background: rgba(255, 255, 255, 0.8);
            --border-color: rgba(255, 255, 255, 0.3);
            --table-header-gradient: linear-gradient(to right, #3498db, #66c2ff);
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
            color: var(--text-primary);
            line-height: 1.6;
        }

        .image-container {
            position: relative;
            width: 100%;
            height: 300px; /* Adjust height as needed */
            background-image: url('https://www.welcome-hotels.com/site/assets/files/35059/welcome_hotel_marburg_lobby_2k.2560x988.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
        }

        .image-container h1 {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #ffffff;
            font-size: 2.5rem;
            font-weight: 600;
            letter-spacing: -1px;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 50px auto;
            padding: 30px;
            background: var(--card-background);
            border-radius: 20px;
            backdrop-filter: blur(15px); /* Effet de flou */
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.1);
            border: 1px solid var(--border-color);
        }

        .actions {
            display: flex;
            justify-content: flex-start;
            margin-bottom: 30px;
        }

        .actions button {
            background: var(--table-header-gradient);
            color: var(--text-primary);
            border: none;
            padding: 12px 20px;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .actions button:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            overflow: hidden;
        }

        thead {
            background: var(--table-header-gradient);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
            color: var(--text-primary);
        }

        th {
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
        }

        tbody tr {
            transition: background-color 0.3s ease;
        }

        tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        tbody tr:last-child td {
            border-bottom: none;
        }
    </style>
</head>
<body>
    <!-- Image avec texte superposé -->
    <div class="image-container">
        <h1>Welcome Admin</h1>
    </div>

    <div class="container">
        <div class="actions">
            <a href="addAgent.jsp">
                <button>Add an agent</button>
            </a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>mail</th>
                </tr>
            </thead>
            <tbody>
                <%
                // Récupérer la liste des agents depuis la requête
                List<Account> agents = (List<Account>) request.getAttribute("agents");

                if (agents != null && !agents.isEmpty()) {
                    for (Account agent : agents) {
                %>
                <tr>
                    <td><%= agent.getId() %></td>
                    <td><%= agent.getUsername() %></td>
                    <td><%= agent.getEmail() %></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="3">No agent</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
