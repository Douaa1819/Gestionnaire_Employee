package com.employeemanagement.service;
import com.employeemanagement.DAO.EmployeDao;
import com.employeemanagement.entities.Employee;

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


    public void updateEmployee(Long id,Employee employee) {
        employeeDAO.updateEmployee(id,employee);
    }


    public void deleteEmployee(Long id) {
        employeeDAO.deleteEmployee(id);
    }

    public Employee getEmployee(Long id) {
        return employeeDAO.getEmployee(id);
    }

    public List<Employee> filterEmployees(String position,String department){
      return employeeDAO.filterEmployees(position,department);

    }
    public List<Employee> searchEmployees(String Key){

        return employeeDAO.searchEmployees(Key);
    }
}