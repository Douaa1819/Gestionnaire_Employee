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
    <a href="/" class="logo"><i class="fas fa-users"></i> Gestion Employes</a>
  </div>
</nav>


    <style>


    .navbar {
      padding: 30px;
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

  </style>