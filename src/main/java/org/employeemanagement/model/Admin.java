package org.employeemanagement.model;

import jakarta.persistence.Entity;

import java.util.Date;

@Entity
public class Admin extends User {



    public Admin() {
        super();
    }

    public Admin(String name, String email, String password ,Date birthDate) {
        super(name, email,password,birthDate);
    }

}
