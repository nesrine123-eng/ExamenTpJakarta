package controllerr;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.Hoteldao;
import dao.RoomTypeDAO;

import java.io.IOException;

@WebServlet("/DeleteRoomTypeServlet")

public class SupprimerRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private RoomTypeDAO roomdao;

    public SupprimerRoom() {
        super();
    }

    @Override
    public void init() throws ServletException {
    	roomdao = new RoomTypeDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String idParam = request.getParameter("id");

        // Ajouter un log pour voir l'ID envoyé
        System.out.println("Room ID received: " + idParam);

        try {
            if (idParam == null || idParam.trim().isEmpty()) {
                throw new IllegalArgumentException("Room ID is missing or invalid.");
            }

            int id = Integer.parseInt(idParam); // Conversion sécurisée
            boolean success = roomdao.deleteRoomType(id); // Appel DAO pour supprimer room

            if (success) {
                request.setAttribute("message", "Room deleted successfully!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Room not found or could not be deleted.");
                request.setAttribute("messageType", "error");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid Room ID format: " + idParam);
            request.setAttribute("messageType", "error");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Unexpected error occurred: " + e.getMessage());
            request.setAttribute("messageType", "error");
        }

        // Rediriger vers le tableau de bord de l'agent
        request.getRequestDispatcher("agent_dashboard.jsp").forward(request, response);
    }
    /**
     * Handles POST requests
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
