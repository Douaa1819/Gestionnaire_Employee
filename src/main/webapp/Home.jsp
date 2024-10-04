<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>Gestion des Employés</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>


<jsp:include page="navbar.jsp" />

<div class="container">
  <ul class="nav-links">
    <li>
      <a href="employee-add.jsp" class="add-employee-btn">
        <i class="fas fa-plus"></i> Ajouter Employé
      </a>
    </li>
  </ul>
  <div class="search-filter">
    <form method="get" action="/Gestionnaire_Employee" class="filter-form">
      <input type="text" class="search-box" name="search" placeholder="Rechercher un employé..." value="${param.search}">

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
    display: flex;
    justify-content: center;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
  }

  .navbar .container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;

    max-width: 1200px;
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

    justify-content: flex-end;
    margin-top: 10px;
  }

  .nav-links li {
    margin-bottom: 15px;
  }

  .add-employee-btn {
    color: #ffffff;
    text-decoration: none;
    font-weight: bold;
    padding: 10px 15px;
    background-color: #28a745;
    border-radius: 5px;
  }

  .add-employee-btn:hover {
    background-color: #000000;
  }

  .container {
    width: 90%;
    margin: 10px  15px auto auto;
    background-color: #1a1a1a;

    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
  }

  .search-filter {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
    gap: 20px;
  }

  .filter-form {
    display: flex;
    width: 100%;
    flex-wrap: wrap;
  }

  .search-box, .filter-select {
    padding: 10px;
    border: 1px solid #333333;
    border-radius: 5px;
    background-color: #333333;
    color: #ffffff;
    flex-grow: 1;
  }

  .search-box {
    margin-right: 20px;
  }

  .filter-select {
    margin-right: 20px;
    width: 200px;
  }

  .btn.search-btn {
    padding: 10px 15px;
    background-color: #0066cc;
    color: #ffffff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-left: 5px;
  }

  .employee-table {
    width: 100%;
    border-radius: 10px;
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
    box-shadow: 0px 5px 18px rgba(0, 0, 0, 0.5);
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

  .edit-btn {
    background-color: #28a745;
  }
  .edit-btn:hover {
    background-color: #000000;
  }

  .delete-btn {
    background-color: #dc3545;
  }

  .delete-btn:hover {
    background-color: #000000;
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
