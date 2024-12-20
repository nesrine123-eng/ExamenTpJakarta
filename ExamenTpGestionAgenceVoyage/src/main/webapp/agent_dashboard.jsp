<%@ page import="java.util.List" %>
<%@ page import="model.Hotel" %>
<%@ page import="model.RoomType" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Agent Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #044aa9; 
            --secondary-color: #00fbd5; 
            --hover-color: #2980b9; 
            --accent-color: #f39c12; 
            --background-gradient: linear-gradient(135deg, #3498db 0%, #66c2ff 100%);
            --card-background: rgba(255, 255, 255, 0.15);
            --text-primary: #ffffff;
            --text-secondary: rgba(255, 255, 255, 0.8);
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
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 50px 0;
        }

        .header {
            position: relative;
            width: 100%;
            height: 300px;
            background-image: url('https://careers.ihg.com/media/g35joctc/foh-hero_2482x804.jpg'); /* Remplacer par votre propre image */
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .header h1 {
            position: absolute;
            color: var(--text-primary);
            font-size: 3rem;
            font-weight: 700;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.7);
        }

        .container {
            position: relative;
            z-index: 2;
            width: 90%;
            max-width: 1200px;
            background: var(--card-background);
            border-radius: 20px;
            padding: 30px;
            backdrop-filter: blur(10px);
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.1);
            border: 1px solid var(--border-color);
            margin-top: -50px;
        }

        .actions {
            display: flex;
            justify-content: flex-start;
            margin-bottom: 20px;
        }

        .actions button {
            background: var(--primary-color);
            color: var(--text-primary);
            border: none;
            padding: 10px 20px;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s ease, background-color 0.3s;
        }

        .actions button:hover {
            background-color: var(--hover-color);
            transform: translateY(-3px);
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            overflow: hidden;
            position: relative;
            z-index: 1;
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
        }

        tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.15);
        }

        img.hotel-image {
            max-width: 80px;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.2s;
        }

        img.hotel-image:hover {
            transform: scale(1.1);
        }

        .btn-edit, .btn-delete {
            padding: 8px 12px;
            margin: 2px;
            border: none;
            border-radius: 5px;
            color: white;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-edit {
            background-color: #2ecc71;
        }

        .btn-edit:hover {
            background-color: #27ae60;
        }

        .btn-delete {
            background-color: #e74c3c;
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }

        /* Modal styling */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-content {
            position: relative;
            max-width: 80%;
            max-height: 80%;
        }

        .modal-content img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .modal-close {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #e74c3c;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 18px;
        }

        .modal-close:hover {
            background: #ffffff;
        }
    </style>
</head>
<body>

    <!-- Header with image and text overlay -->
    <div class="header">
        <h1>Welcome Agent</h1>
    </div>

    <div class="container">
        <!-- Section for managing hotels -->
        <div class="section">
            <h2><i class="fas fa-hotel"></i> Hotels Service</h2>
            <div class="actions">
                <button class="btn btn-add" onclick="window.location.href='addHotel.jsp'">
                    <i class="fas fa-plus-circle"></i> Add a Hotel
                </button>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>City</th>
                        <th>Stars</th>
                        <th>Description</th>
                        <th>Image</th>
                        <th>Statut</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Hotel> hotels = (List<Hotel>) request.getAttribute("hotels");
                        if (hotels != null && !hotels.isEmpty()) {
                            for (Hotel hotel : hotels) {
                    %>
                    <tr>
                        <td><%= hotel.getId() %></td>
                        <td><%= hotel.getName() %></td>
                        <td><%= hotel.getCity() %></td>
                        <td><%= hotel.getStars() %></td>
                        <td><%= hotel.getDescription() %></td>
                        <td>
                            <img class="hotel-image" src="images/<%=hotel.getImage()%>" alt="Hotel" onclick="openModal('uploads/<%=hotel.getImage()%>')">
                        </td>
                        <td>
                            <button class="btn btn-edit" onclick="window.location.href='editHotel.jsp?id=<%= hotel.getId() %>'">
                                <i class="fas fa-edit"></i> Update
                            </button>
                            <button class="btn btn-delete" onclick="deleteHotel(<%= hotel.getId() %>)">
                                <i class="fas fa-trash-alt"></i> Delete
                            </button>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="7" style="text-align: center;">No hotel.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Section for Room Types -->
        <div class="section">
            <h2><i class="fas fa-bed"></i> RoomType Service</h2>
            <div class="actions">
                <button class="btn btn-add" onclick="window.location.href='addRoomType.jsp'">
                    <i class="fas fa-plus-circle"></i> Add a RoomType
                </button>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Capacity</th>
                        <th>Statut</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                // Récupérer la liste des Room Types à partir de l'attribut de la requête
                     List<RoomType> rooms = (List<RoomType>) request.getAttribute("rooms");
                    if (rooms != null && !rooms.isEmpty()) {
                        for (RoomType room : rooms) {
            %>
            <tr>
                <td><%= room.getId() %></td>
                <td><%= room.getLabel() %></td>
                <td><%= room.getCapacity() %></td>
                <td><%= room.getPrix() %> TND</td>
                <td>
                    <button class="btn btn-edit" onclick="window.location.href='editRoom.jsp?id=<%= room.getId() %>'">Update</button>
                    <button class="btn btn-delete" onclick="deleteRoomType(<%= room.getId() %>)">Delete </button>
                </td>
            </tr>
            <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="6" style="text-align: center;">No RoomType.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal for displaying images -->
    <div class="modal" id="imageModal">
        <div class="modal-content">
            <img id="modalImage" src="" alt="Hotel Image">
            <button class="modal-close" onclick="closeModal()">X</button>
        </div>
    </div>

    <script>
        // Modal functionality
        function openModal(imageSrc) {
            document.getElementById('modalImage').src = imageSrc;
            document.getElementById('imageModal').style.display = 'flex';
        }

        function closeModal() {
            document.getElementById('imageModal').style.display = 'none';
        }

        // Delete hotel function
        function deleteHotel(id) {
            if (confirm("Êtes-vous sûr de vouloir supprimer cet hôtel ?")) {
                window.location.href = 'deleteHotel?id=' + id;
            }
        }

        // Delete room type function
        function deleteRoomType(id) {
            if (confirm("Êtes-vous sûr de vouloir supprimer ce type de chambre ?")) {
                window.location.href = 'DeleteRoomTypeServlet?id=' + id;
            }
        }
    </script>
</body>
</html>
