<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Gestion des Employés</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<nav class="navbar">
  <div class="container">
    <a href="/" class="logo"><i class="fas fa-users"></i> Gestion Employés</a>
    <ul class="nav-links">
      <li><a href="/Gestionnaire_Employee">Accueil</a></li>
      <li><a href="employee-add.jsp">Ajouter Employé</a></li>
    </ul>
  </div>
</nav>

<div class="container">
  <div class="search-filter">
    <form method="get" action="/Gestionnaire_Employee">
      <input type="text" class="search-box" name="search" placeholder="Rechercher un employé..." value="${param.search}">
      <button type="submit" class="search-box fa fa-search"></button>

      <select class="filter-select" name="department">
        <option value="">Filtrer par Département</option>
        <c:forEach items="${departments}" var="dept">
          <option value="${dept}" ${param.department == dept ? 'selected' : ''}>${dept}</option>
        </c:forEach>
      </select>

      <select class="filter-select" name="position">
        <option value="">Filtrer par Poste</option>
        <c:forEach items="${positions}" var="pos">
          <option value="${pos}" ${param.position == pos ? 'selected' : ''}>${pos}</option>
        </c:forEach>
      </select>


      <button type="submit" class="btn search-btn">Filtrer</button>
    </form>
  </div>

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

  <c:if test="${not empty message}">
    <div class="alert alert-warning">
        ${message}
    </div>
  </c:if>

  <h2>Liste des Employés</h2>
  <c:if test="${not empty message}">
    <div>${message}</div>
  </c:if>

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
          <a href="${pageContext.request.contextPath}/Gestionnaire_Employee?action=modifier&id=${employee.id}" class="btn edit-btn"><i class="fas fa-edit"></i></a>
          <form action="${pageContext.request.contextPath}/Gestionnaire_Employee" method="post" style="display:inline;">
            <input type="hidden" name="action" value="supprimer">
            <input type="hidden" name="id" value="${employee.id}">
            <button type="submit" class="btn delete-btn"><i class="fas fa-trash"></i></button>
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
    background-color: #121212;
    color: #ffffff;
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
  }

  .navbar {
    background-color: #1f1f1f;
    padding: 15px 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
  }

  .navbar .container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 90%;
    margin: 0 auto;
  }

  .navbar .logo {
    color: #ffffff;
    font-size: 24px;
    font-weight: bold;
    text-decoration: none;
    display: flex;
    align-items: center;
  }

  .navbar .logo i {
    margin-right: 10px;
  }

  .nav-links {
    list-style: none;
    display: flex;
  }

  .nav-links li {
    margin-left: 20px;
  }

  .nav-links a {
    color: #ffffff;
    text-decoration: none;
    font-weight: bold;
    padding: 10px 15px;
    background-color: #333333;
    border-radius: 5px;
    transition: background-color 0.3s ease;
  }

  .nav-links a:hover {
    background-color: #444444;
  }

  .container {
    width: 90%;
    margin: 50px auto;
    background-color: #1a1a1a;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
  }

  .search-filter {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
  }

  .search-box, .filter-select {
    padding: 10px;
    width: 30%;
    border: 1px solid #333333;
    border-radius: 5px;
    background-color: #333333;
    color: #ffffff;
  }

  .btn.search-btn {
    padding: 10px 15px;
    background-color: #0066cc;
    color: #ffffff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  .employee-table {
    width: 100%;
    border-collapse: collapse;
  }

  .employee-table th, .employee-table td {
    padding: 15px;
    text-align: left;
    border-bottom: 1px solid #333333;
  }

  .employee-table th {
    background-color: #333333;
  }

  .employee-table tr:hover {
    background-color: #252525;
  }

  .btn {
    padding: 10px;
    color: #ffffff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .edit-btn {
    background-color: #28a745;
  }

  .delete-btn {
    background-color: #dc3545;
  }

  .btn i {
    margin-right: 5px;
  }

  .btn:hover {
    background-color: #0056b3;
  }

  .alert {
    padding: 15px;
    margin-bottom: 20px;
    border-radius: 4px;
  }

  .alert-success {
    background-color: #dff0d8;
    color: #3c763d;
  }

  .alert-danger {
    background-color: #f2dede;
    color: #a94442;
  }
</style>
