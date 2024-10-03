package com.test;

import com.employeemanagement.entities.Employee;
import com.employeemanagement.DAO.EmployeeDaoImpl;
import java.util.List;

public class Test {


    public static void main(String[] args){
       EmployeeDaoImpl employeeDao =new EmployeeDaoImpl();
//
//        Employee employee = new Employee("goufrane","hafsaa@gmail.com","0630000757","safi","prof");
//
//
//        //test pour enregistrer employee en base de donner
//        employeDao.deleteEmployee(302L);
//
//        //test pour get un sul employee
//        employeDao.getEmployee(302L);
//
//        //test pour updater employee en base de donner
//        employeDao.updateEmployee(102L,employee);
//
//        //test getAllEmployee
      List<Employee> employees = employeeDao.getListEmployes();
//
        if (employees.isEmpty()) {
            System.out.println("No employees found.");
        } else {
            System.out.println("List of employees:");
            for (Employee emp : employees) {
                System.out.println(emp.toString());
            }
        }






    }
}
