package employeemanagement.service;
import employeemanagement.DAO.interfaces.EmployeDao;
import employeemanagement.entities.Employee;

import java.util.List;

public class EmployeeService {

    private final EmployeDao employeeDAO;

    public EmployeeService(EmployeDao employeeDAO) {
        this.employeeDAO = employeeDAO;
    }

    public List<Employee> getAllEmployees() {
        return employeeDAO.getListEmployes();
    }


    public void addEmployee(Employee employee) {
        employeeDAO.saveEmploye(employee);
    }


    public void updateEmployee(Employee employee) {
        employeeDAO.updateEmployee(employee);
    }


    public void deleteEmployee(Employee employee) {
        employeeDAO.deleteEmployee(employee);
    }
}