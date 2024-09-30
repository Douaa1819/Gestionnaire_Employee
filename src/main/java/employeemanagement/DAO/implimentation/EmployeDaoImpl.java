package employeemanagement.DAO.implimentation;

import employeemanagement.DAO.interfaces.EmployeDao;
import employeemanagement.entities.Employee;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class EmployeDaoImpl implements EmployeDao {

    private static final List <Employee> employes = new ArrayList<Employee>();

    @Override
    public void saveEmploye(Employee employee) {

    }

    @Override
    public void updateEmployee(Employee employee) {

    }

    @Override
    public void deleteEmployee(UUID id) {

    }

    @Override
    public List<Employee> getListEmployes() {
        return List.of();
    }

    @Override
    public Employee getEmployee(UUID id) {
        return null;
    }
}
