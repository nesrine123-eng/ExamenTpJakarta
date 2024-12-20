package controllerr;

import dao.HotelRoomDAO;
import dao.RoomTypeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/UpdateRoomTypeServlet")

public class ModifierRoomTypeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Récupérer les paramètres du formulaire
            int roomTypeId = Integer.parseInt(request.getParameter("id"));
            int hotelId = Integer.parseInt(request.getParameter("hotelId"));
            String label = request.getParameter("label");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            double price = Double.parseDouble(request.getParameter("price"));

            // Appeler les DAO pour mettre à jour les données
            HotelRoomDAO hotelRoomDAO = new HotelRoomDAO();
            RoomTypeDAO roomTypeDAO = new RoomTypeDAO();

            // Mise à jour dans la table hotelroom
            hotelRoomDAO.updateHotelIdByRoomTypeId(roomTypeId, hotelId);

            // Mise à jour dans la table roomtype
            roomTypeDAO.updateRoomTypeDetails(roomTypeId, label, capacity, price);

            // Rediriger avec succès
            response.sendRedirect("editRoom.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
