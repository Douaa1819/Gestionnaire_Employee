package employeemanagement.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    private static SessionFactory sessionFactory;

    // Méthode pour obtenir l'instance unique de SessionFactory
    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                // Crée une instance unique de SessionFactory à partir de la configuration
                sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return sessionFactory;
    }

    // Méthode pour fermer la session factory lors de la fermeture de l'application
    public static void shutdown() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
}
