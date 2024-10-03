<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Gestion des Employés</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<nav class="navbar">
    <div class="container">
        <h1 class="logo">Gestion des Employés</h1>
        <ul class="nav-links">
            <li><a href="employees">Accueil</a></li>
            <li><a href="employee-add.jsp">Ajouter Employé</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <h2>Liste des Employés</h2>
    <table class="employee-table">
        <thead>
        <tr>
            <th>Nom</th>
            <th>Email</th>
            <th>Téléphone</th>
            <th>Département</th>
            <th>Poste</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="employee" items="${employees}">
            <tr>
                <td>${employee.id}</td>
                <td>${employee.name}</td>
                <td>${employee.email}</td>
                <td>${employee.phone}</td>
                <td>${employee.department}</td>
                <td>${employee.position}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
