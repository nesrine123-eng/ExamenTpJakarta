package controllerr;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import dao.AccountDAO;

import java.io.IOException;

@WebServlet("/AddAgentServlet")
public class AjouterAgentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private AccountDAO accountDAO;

    public AjouterAgentServlet() {
        super();
    }

    @Override
    public void init() throws ServletException {
        accountDAO = new AccountDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = "Agent"; // Assuming default role for agents

        try {
          
            Account account = new Account(0, username, password, email, role);

            boolean success = accountDAO.addAccount(account);

            if (success) {

            	request.setAttribute("message", "Agent added successfully!");
                request.setAttribute("messageType", "success");
            } else {

            	request.setAttribute("message", "Failed to add agent.");
                request.setAttribute("messageType", "error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.setAttribute("messageType", "error");
        }

    
        request.getRequestDispatcher("addAgent.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
