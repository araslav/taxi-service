package mate.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import mate.exception.DataProcessingException;
import mate.lib.Dao;
import mate.model.Driver;
import mate.util.ConnectionUtil;

@Dao
public class DriverDaoImpl implements DriverDao {
    @Override
    public Driver create(Driver driver) {
        String query = "INSERT INTO drivers (name, license_number) "
                + "VALUES (?, ?)";
        try (Connection connection = ConnectionUtil.getConnection();
                PreparedStatement createDriverStatement = connection.prepareStatement(query,
                        Statement.RETURN_GENERATED_KEYS)) {
            createDriverStatement.setString(1, driver.getName());
            createDriverStatement.setString(2, driver.getLicenseNumber());
            createDriverStatement.executeUpdate();
            ResultSet resultSet = createDriverStatement.getGeneratedKeys();
            if (resultSet.next()) {
                driver.setId(resultSet.getObject(1, Long.class));
            }
            return driver;
        } catch (SQLException e) {
            throw new DataProcessingException("Couldn't create "
                    + driver + ". ", e);
        }
    }

    @Override
    public Optional<Driver> get(Long id) {
        String query = "SELECT * FROM drivers WHERE id = ? AND is_deleted = FALSE";
        try (Connection connection = ConnectionUtil.getConnection();
                PreparedStatement getDriverStatement = connection.prepareStatement(query)) {
            getDriverStatement.setLong(1, id);
            ResultSet resultSet = getDriverStatement.executeQuery();
            Driver driver = null;
            if (resultSet.next()) {
                driver = parseDriverFromResultSet(resultSet);
            }
            return Optional.ofNullable(driver);
        } catch (SQLException e) {
            throw new DataProcessingException("Couldn't get driver by id " + id, e);
        }
    }

    @Override
    public List<Driver> getAll() {
        String query = "SELECT * FROM drivers WHERE is_deleted = FALSE";
        List<Driver> drivers = new ArrayList<>();
        try (Connection connection = ConnectionUtil.getConnection();
                PreparedStatement getAllDriversStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = getAllDriversStatement.executeQuery();
            while (resultSet.next()) {
                drivers.add(parseDriverFromResultSet(resultSet));
            }
            return drivers;
        } catch (SQLException e) {
            throw new DataProcessingException("Couldn't get a list of drivers from driversDB.",
                    e);
        }
    }

    @Override
    public Driver update(Driver driver) {
        String query = "UPDATE drivers "
                + "SET name = ?, license_number = ? "
                + "WHERE id = ? AND is_deleted = FALSE";
        try (Connection connection = ConnectionUtil.getConnection();
                PreparedStatement updateDriverStatement
                        = connection.prepareStatement(query)) {
            updateDriverStatement.setString(1, driver.getName());
            updateDriverStatement.setString(2, driver.getLicenseNumber());
            updateDriverStatement.setLong(3, driver.getId());
            updateDriverStatement.executeUpdate();
            return driver;
        } catch (SQLException e) {
            throw new DataProcessingException("Couldn't update "
                    + driver + " in driversDB.", e);
        }
    }

    @Override
    public boolean delete(Long id) {
        String query = "UPDATE drivers SET is_deleted = TRUE WHERE id = ?";
        try (Connection connection = ConnectionUtil.getConnection();
                PreparedStatement deleteDriverStatement = connection.prepareStatement(query)) {
            deleteDriverStatement.setLong(1, id);
            return deleteDriverStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new DataProcessingException("Couldn't delete driver with id " + id, e);
        }
    }

    private Driver parseDriverFromResultSet(ResultSet resultSet) throws SQLException {
        Long id = resultSet.getObject("id", Long.class);
        String name = resultSet.getString("name");
        String licenseNumber = resultSet.getString("license_number");
        Driver driver = new Driver();
        driver.setId(id);
        driver.setName(name);
        driver.setLicenseNumber(licenseNumber);
        return driver;
    }
}
