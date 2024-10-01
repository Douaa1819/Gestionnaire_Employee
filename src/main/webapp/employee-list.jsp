<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Employés</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Liste des Employés</h2>
    <table>
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
            <c:forEach var="employee" items="${employeeList}">
                <tr>
                    <td>${employee.name}</td>
                    <td>${employee.email}</td>
                    <td>${employee.phone}</td>
                    <td>${employee.department}</td>
                    <td>${employee.position}</td>
                    <td>
                        <a href="employees?action=edit&id=${employee.id}">Modifier</a> |
                        <a href="employees?action=delete&id=${employee.id}" onclick="return confirm('Confirmer la suppression ?');">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="employees?action=new">Ajouter un nouvel employé</a>
</body>
</html>
