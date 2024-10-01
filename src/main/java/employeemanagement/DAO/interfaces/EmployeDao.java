package employeemanagement.DAO.interfaces;

import employeemanagement.entities.Employee;
import java.util.List;

public interface EmployeDao {
    void saveEmploye(Employee employee);
    void updateEmployee(Employee employee);
    void deleteEmployee(Employee employee);
    List<Employee> getListEmployes();

}
