package com.employeemanagement.controller;

import com.employeemanagement.DAO.EmployeeDaoImpl;
import com.employeemanagement.entities.Employee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class EmployeeServlet extends HttpServlet {

    private EmployeeDaoImpl employeeDao;

    @Override
    public void init() throws ServletException {
        employeeDao = new EmployeeDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employees = employeeDao.getListEmployes();
        request.setAttribute("employees", employees);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String nom = request.getParameter("nom");
      String phone = request.getParameter("phone");
      String departement = request.getParameter("departement");
      String email = request.getParameter("email");
      String position = request.getParameter("position");
      Employee employee = new Employee(nom, phone, departement, email, position);
      employeeDao.saveEmploye(employee);
      response.sendRedirect("employees");



    }


}