package employeemanagement;


import employeemanagement.DAO.implimentation.EmployeDaoImpl;
import employeemanagement.entities.Employee;
import employeemanagement.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.util.List;


public class Main {

    public static void main(String[] args) {

        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();


        Session currentSession = sessionFactory.getCurrentSession();

        Session newSession = sessionFactory.openSession();


        EmployeDaoImpl employeDao = new EmployeDaoImpl();

        newSession.getTransaction().begin();
        newSession.persist(employeDao);

        newSession.getTransaction().commit();


        Employee employee1 = new Employee("Employee_1", "employee_1@gmail.com", "0611122233", "Maths", "Professeur");
        employeDao.saveEmploye(employee1);

    }
}