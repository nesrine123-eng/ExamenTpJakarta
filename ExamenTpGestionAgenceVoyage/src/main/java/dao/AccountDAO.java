package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Account;

public class AccountDAO {

    private Connection connection;

    public AccountDAO() {
        connection = DATABASECONN.getInstance();
    }

    
    public boolean addAccount(Account account) throws SQLException {
        String sql = "INSERT INTO account (username, password, email, role) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, account.getUsername());
            statement.setString(2, account.getPassword());
            statement.setString(3, account.getEmail());
            statement.setString(4, account.getRole());

            return statement.executeUpdate() > 0;
        }
    }

   
    public boolean updateAccount(Account account) throws SQLException {
        String sql = "UPDATE account SET username = ?, password = ?, email = ?, role = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, account.getUsername());
            statement.setString(2, account.getPassword());
            statement.setString(3, account.getEmail());
            statement.setString(4, account.getRole());
            statement.setInt(5, account.getId());

            return statement.executeUpdate() > 0;
        }
    }

    
    public boolean deleteAccount(int accountId) throws SQLException {
        String sql = "DELETE FROM account WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, accountId);

            return statement.executeUpdate() > 0;
        }
    }
    

    public Account authenticate(String email, String password) throws SQLException {
        String sql = "SELECT id, username, email, role FROM account WHERE email = ? AND password = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            statement.setString(2, password);

            try (ResultSet resultSet = (ResultSet) statement.executeQuery()) {
                if (resultSet.next()) {
                    // Create an Account object from the result
                    int id = resultSet.getInt("id");
                    String username = resultSet.getString("username");
                    String role = resultSet.getString("role");

                    return new Account(id, username, password, email, role);
                }
            }
        }
        return null; // Return null if no match found
    }
    
   
    public List<Account> getAgents() throws SQLException {
        String sql = "SELECT * FROM account WHERE role = 'Agent'";
        List<Account> agents = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = (ResultSet) statement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String username = resultSet.getString("username");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String role = resultSet.getString("role");
                agents.add(new Account(id, username, password, email, role));
            }
        }

        return agents;
    }
}
