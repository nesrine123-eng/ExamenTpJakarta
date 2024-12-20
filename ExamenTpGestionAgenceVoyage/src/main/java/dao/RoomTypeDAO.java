package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;

import model.RoomType;


public class RoomTypeDAO {

    private final Connection connection;

    public RoomTypeDAO() {
        connection = DATABASECONN.getInstance();
    }

    // Add a new room type and associate it with a hotel
    public boolean addRoomType(RoomType roomType, int hotelId) throws SQLException {
        String sqlRoomType = "INSERT INTO roomtype (label, capacity, prix) VALUES (?, ?, ?)";
        String sqlHotelRoom = "INSERT INTO hotelroom (hotel_id, roomtype_id) VALUES (?, ?)";

        try (
            PreparedStatement statementRoomType = connection.prepareStatement(sqlRoomType, Statement.RETURN_GENERATED_KEYS);
            PreparedStatement statementHotelRoom = connection.prepareStatement(sqlHotelRoom)
        ) {
            // Insert into roomtype table
            statementRoomType.setString(1, roomType.getLabel());
            statementRoomType.setInt(2, roomType.getCapacity());
            statementRoomType.setInt(3, roomType.getPrix());

            int rowsAffected = statementRoomType.executeUpdate();

            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = statementRoomType.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int roomTypeId = generatedKeys.getInt(1);

                        // Insert into hotelroom table
                        statementHotelRoom.setInt(1, hotelId);
                        statementHotelRoom.setInt(2, roomTypeId);

                        return statementHotelRoom.executeUpdate() > 0;
                    }
                }
            }
        }
        return false;
    }

    public void updateRoomTypeDetails(int roomTypeId, String label, int capacity, double price) throws Exception {
        String query = "UPDATE roomtype SET label = ?, capacity = ?, prix = ? WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, label);
            preparedStatement.setInt(2, capacity);
            preparedStatement.setDouble(3, price);
            preparedStatement.setInt(4, roomTypeId);
            preparedStatement.executeUpdate();
        }
    }


    // Delete a room type by ID
    public boolean deleteRoomType(int roomTypeId) throws SQLException {
        String sql = "DELETE FROM roomtype WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, roomTypeId);
            return statement.executeUpdate() > 0;
        }
    }

    // Retrieve all room types
    public List<RoomType> getAllRoomTypes() throws SQLException {
        String sql = "SELECT * FROM roomtype";
        List<RoomType> roomTypes = new ArrayList<>();

        try (
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {
            while (resultSet.next()) {
            	RoomType roomType = new RoomType(
                    resultSet.getInt("id"),
                    resultSet.getString("label"),
                    resultSet.getInt("capacity"),
                    resultSet.getInt("prix")
                );
                roomTypes.add(roomType);
            }
        }
        return roomTypes;
    }

    // Retrieve a room type by ID
    public RoomType getRoomTypeById(int roomTypeId) throws SQLException {
        String sql = "SELECT * FROM roomtype WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, roomTypeId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return new RoomType(
                        resultSet.getInt("id"),
                        resultSet.getString("label"),
                        resultSet.getInt("capacity"),
                        resultSet.getInt("prix")
                    );
                }
            }
        }
        return null;
    }

    // Retrieve all room types associated with a specific hotel
    public List<RoomType> getRoomTypesByHotelId(int hotelId) throws SQLException {
        String sql = "SELECT rt.* FROM roomtype rt " +
                     "JOIN hotelroom hr ON rt.id = hr.roomtype_id " +
                     "WHERE hr.hotel_id = ?";
        List<RoomType> roomTypes = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, hotelId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                	RoomType roomType = new RoomType(
                        resultSet.getInt("id"),
                        resultSet.getString("label"),
                        resultSet.getInt("capacity"),
                        resultSet.getInt("prix")
                    );
                    roomTypes.add(roomType);
                }
            }
        }
        return roomTypes;
    }
}
