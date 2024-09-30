package employeemanagement.DAO.interfaces;

import employeemanagement.entities.Employee;

import java.util.List;
import java.util.UUID;

public interface EmployeDao {
    void saveEmploye(Employee employee);
    void updateEmployee(Employee employee);
    void deleteEmployee(UUID id);
    List<Employee> getListEmployes();
    Employee getEmployee(UUID id);

}
