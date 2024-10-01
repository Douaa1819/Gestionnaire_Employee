package employeemanagement;

import employeemanagement.entities.Employee;
import employeemanagement.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.UUID;

public class Main {
    public static void main(String[] args) {
        // Ouvre une session Hibernate
        Session session = HibernateUtil.getSessionFactory().openSession();

        // Démarre une transaction
        Transaction transaction = session.beginTransaction();

        // Crée un employé pour tester
        Employee emp = new Employee("John Doe", "john.doe@example.com", "IT", "Developer" ,"youcode");

        // Sauvegarde l'employé dans la base de données
        session.save(emp);

        // Commit la transaction
        transaction.commit();

        // Ferme la session
        session.close();

        System.out.println("Employee ajouté avec succès !");

        // Fermer Hibernate
        HibernateUtil.shutdown();
    }
}