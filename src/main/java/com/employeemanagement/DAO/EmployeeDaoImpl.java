package com.employeemanagement.DAO;


import com.employeemanagement.entities.Employee;
import com.employeemanagement.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;
import java.util.ArrayList;

public class EmployeeDaoImpl implements EmployeDao {
    private static final List<Employee> employes = new ArrayList<Employee>();

    @Override
    public void saveEmploye(Employee employee) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(employee);
            transaction.commit();
            System.out.println("Employé enregistré : " + employee.getName());
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            System.err.println("Erreur lors de l'enregistrement de l'employé : " + e.getMessage());
            e.printStackTrace();
        }
    }


    @Override
    public void updateEmployee(Long id, Employee employee) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Employee existingEmployee = session.get(Employee.class, id);

            if (existingEmployee != null) {
                existingEmployee.setName(employee.getName());
                existingEmployee.setEmail(employee.getEmail());
                existingEmployee.setPhone(employee.getPhone());
                existingEmployee.setDepartment(employee.getDepartment());
                existingEmployee.setPosition(employee.getPosition());

                session.update(existingEmployee);
                transaction.commit();
                System.out.println("Employé mis à jour : " + existingEmployee.getName());
            } else {
                System.out.println("Employé non trouvé avec l'ID : " + id);
            }
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            System.err.println("Erreur lors de la mise à jour de l'employé : " + e.getMessage());
            e.printStackTrace();
        }
    }


    @Override
    public void deleteEmployee(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Employee employee = session.get(Employee.class, id);
            if (employee != null) {
                session.delete(employee);
                transaction.commit();
            } else {
                System.out.println("Employee not found.");
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }


    public List<Employee> getListEmployes() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            List<Employee> employes = session.createQuery("FROM Employee", Employee.class).list();
            return employes;
        } catch (Exception e) {
            System.err.println("Erreur lors de la récupération des employés : " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    @Override
    public Employee getEmployee(Long id) {

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Employee employee = session.get(Employee.class, id);
            return employee;
        } catch (Exception e) {
            System.err.println("Erreur lors de la récupération des employés");
        }
        return null;
    }


    @Override
    public List<Employee> filterEmployees(String department, String position) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();

            String hql = "FROM Employee WHERE 1=1";

            if (department != null && !department.isEmpty()) {
                hql += " AND department = :department";
            }
            if (position != null && !position.isEmpty()) {
                hql += " AND position = :position";
            }

            Query<Employee> query = session.createQuery(hql, Employee.class);

            if (department != null && !department.isEmpty()) {
                query.setParameter("department", department);
            }
            if (position != null && !position.isEmpty()) {
                query.setParameter("position", position);
            }

            List<Employee> employees = query.list();
            session.getTransaction().commit();

            return employees;
        } catch (Exception e) {
            session.getTransaction().rollback();
            throw e;
        }
    }

    @Override
    public List<String> getDistinctDepartments() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();

            String hql = "SELECT DISTINCT department FROM Employee";
            List<String> departments = session.createQuery(hql, String.class).getResultList();

            session.getTransaction().commit();
            return departments;
        } catch (Exception e) {
            session.getTransaction().rollback();
            throw e;
        }
    }

    @Override
    public List<String> getDistinctPositions() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();

            String hql = "SELECT DISTINCT position FROM Employee";
            List<String> positions = session.createQuery(hql, String.class).getResultList();

            session.getTransaction().commit();
            return positions;
        } catch (Exception e) {
            session.getTransaction().rollback();
            throw e;
        }
    }


    @Override
    public List<Employee> searchEmployees(String keyword) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();

            String hql = "FROM Employee WHERE name LIKE :value OR email LIKE :value OR phone LIKE :value OR department LIKE :value OR position LIKE :value";
            Query<Employee> query = session.createQuery(hql, Employee.class);
            System.out.println("Recherche d'employés avec le mot-clé : " + keyword);

            query.setParameter("value", "%" + keyword + "%");

            List<Employee> employees = query.list();
            session.getTransaction().commit();

            return employees;
        } catch (Exception e) {
            session.getTransaction().rollback();
            System.err.println("Erreur lors de la recherche des employés : " + e.getMessage());
            throw e;
        }
    }


}
