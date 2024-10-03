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
      <li><a href="/Gestionnaire_Employee">Accueil</a></li>
      <li><a href="employee-add.jsp">Ajouter Employé</a></li>
    </ul>
  </div>
</nav>



<div class="container">

  <c:if test="${not empty sessionScope.successMessage}">
    <div class="alert alert-success">
        ${sessionScope.successMessage}
    </div>
  </c:if>

  <c:if test="${not empty sessionScope.errorMessage}">
    <div class="alert alert-danger">
        ${sessionScope.errorMessage}
    </div>
  </c:if>
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
        <td>${employee.name}</td>
        <td>${employee.email}</td>
        <td>${employee.phone}</td>
        <td>${employee.department}</td>
        <td>${employee.position}</td>
        <td>
          <a href="${pageContext.request.contextPath}/Gestionnaire_Employee?action=modifier&id=${employee.id}" class="btn edit-btn">Modifier</a>
          <form action="${pageContext.request.contextPath}/Gestionnaire_Employee" method="post" style="display:inline;">
            <input type="hidden" name="action" value="supprimer">
            <input type="hidden" name="id" value="${employee.id}">
            <button type="submit" class="btn delete-btn">Supprimer</button>
          </form>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>


<style>

  body {
    background-color: #000000;
    color: #ffffff;
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
  }

  .navbar {
    background-color: #1f1f1f;
    padding: 20px 0;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
  }

  .navbar .logo {
    color: #ffffff;
    font-size: 24px;
  }

  .nav-links {
    list-style: none;
    padding: 0;
    display: inline-flex;
  }

  .nav-links li {
    margin: 0 15px;
  }

  .nav-links a {
    color: #ffffff;
    text-decoration: none;
    font-weight: bold;
    background-color: #333333;
    border-radius: 5px;
    padding: 10px;
  }



  .container {
    width: 90%;
    margin: 50px auto;
    background-color: #1a1a1a;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
  }

  .employee-table {
    width: 100%;
    border-collapse: collapse;
  }

  .employee-table th, .employee-table td {
    padding: 15px;
    text-align: left;
    color: #ffffff;
    border-bottom: 1px solid #333333;
  }

  .employee-table th {
    background-color: #333333;
  }

  .employee-table tr:hover {
    background-color: #252525;
  }

  .btn {
    padding: 10px 15px;
    color: #ffffff;
    border: none;

    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .btn.edit-btn {
    background-color: #28a745;
    text-decoration: none;
  }

  .btn.delete-btn {
    background-color: #dc3545;
  }

  .btn:hover {
    background-color: #0056b3;
  }


  .alert {
    padding: 15px;
    margin-bottom: 20px;
    border: 1px solid transparent;
    border-radius: 4px;
  }

  .alert-success {
    color: #3c763d;
    background-color: #dff0d8;
    border-color: #d6e9c6;
  }

  .alert-danger {
    color: #a94442;
    background-color: #f2dede;
    border-color: #ebccd1;
  }


</style>