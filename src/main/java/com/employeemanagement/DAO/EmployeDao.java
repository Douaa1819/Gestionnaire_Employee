package com.employeemanagement.DAO;

import com.employeemanagement.entities.Employee;
import java.util.List;

public interface EmployeDao {
    void saveEmploye(Employee employee);
    void updateEmployee(Long id,Employee employee);
    void deleteEmployee(Long id);
    List<Employee> getListEmployes();
    Employee getEmployee(Long id);
    List<Employee> filterEmployees(String position,String department);
    List<Employee> searchEmployees(String keyword);

}
