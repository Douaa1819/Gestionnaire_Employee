package com.employeemanagement.controller;

import com.employeemanagement.DAO.EmployeeDaoImpl;
import com.employeemanagement.entities.Employee;
import com.employeemanagement.service.EmployeeService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class EmployeeServlet extends HttpServlet {

    private EmployeeService employeeService;

    @Override
    public void init() throws ServletException {
        EmployeeDaoImpl employeeDao = new EmployeeDaoImpl();
        employeeService = new EmployeeService(employeeDao);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("modifier".equals(action)) {
            Long id = Long.valueOf(request.getParameter("id"));
            Employee employee = employeeService.getEmployee(id);
            request.setAttribute("employee", employee);

            RequestDispatcher dispatcher = request.getRequestDispatcher("employee-edit.jsp");
            dispatcher.forward(request, response);
        } else {
            List<Employee> employees = employeeService.getAllEmployees();
            request.setAttribute("employees", employees);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
            dispatcher.forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("supprimer".equals(action)) {
            Long id = Long.valueOf(request.getParameter("id"));
            employeeService.deleteEmployee(id);
            request.getSession().setAttribute("successMessage", "L'employé a été supprimé avec succès !");
            response.sendRedirect("/Gestionnaire_Employee");
        }else if ("edit".equals(action)) {
            try {
                Long id = Long.valueOf(request.getParameter("id"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String department = request.getParameter("department");
                String position = request.getParameter("position");

                Employee employee = new Employee(name, email, phone, department, position);
                employeeService.updateEmployee(id, employee);

                request.getSession().setAttribute("successMessage", "L'employé a été mis à jour avec succès !");
                response.sendRedirect(request.getContextPath() + "/edit");
            } catch (Exception e) {
                e.printStackTrace();
                request.getSession().setAttribute("errorMessage", "Erreur lors de la mise à jour de l'employé. Veuillez réessayer.");
                response.sendRedirect(request.getContextPath() + "/Gestionnaire_Employee");
            }
        }

        else if ("ajouter".equals(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String department = request.getParameter("department");
            String position = request.getParameter("position");

            Employee employee = new Employee(name, email, phone, department, position);
            try {
                employeeService.addEmployee(employee);
                request.getSession().setAttribute("successMessage", "L'employé a été ajouté avec succès !");
            } catch (Exception e) {
                request.getSession().setAttribute("errorMessage", "Erreur lors de l'ajout de l'employé. Veuillez réessayer.");
            }
            response.sendRedirect("/Gestionnaire_Employee");
        }
    }




}


