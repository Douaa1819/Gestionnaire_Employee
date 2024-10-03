
<html>
<head>
    <title>Ajouter ou Modifier un Employe</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<nav class="navbar">
    <div class="container">
        <h1 class="logo">Gestion des Employes</h1>
        <ul class="nav-links">
            <li><a href="/Gestionnaire_Employee">Accueil</a></li>
            <li><a href="employee-add.jsp">Ajouter Employe</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="form-container">
        <h2>Modifier un Employe</h2>
        <form action="${pageContext.request.contextPath}/Gestionnaire_Employee" method="post">
            <input type="hidden" name="action" value="mettreÀJour">
            <input type="hidden" name="id" value="${employee.id}">
            <label >Nom:</label>
            <input type="text" name="name" value="${employee.name}" required>
            <label>Email:</label>
            <input type="email" name="email" value="${employee.email}" required>
            <label >Telephone:</label>
            <input type="text" name="phone" value="${employee.phone}" required>
            <label >Departement:</label>
            <input type="text" name="department" value="${employee.department}" required>
            <label >Poste:</label>
            <input type="text" name="position" value="${employee.position}" required>
            <button type="submit" class="edit-btn">Mettre a jour</button>
        </form>
        <div class="back-btn">
            <a href="/Gestionnaire_Employee">Retour a la liste des employes</a>
        </div>
    </div>
</div>

</body>

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
        padding: 20px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
    }

    .navbar .logo {
        color: #ffffff;
        font-size: 24px;
        font-weight: bold;
    }

    .nav-links {
        list-style: none;
        display: flex;
        margin: 0;
    }

    .nav-links li {
        margin-left: 20px;
    }

    .nav-links a {
        color: #ffffff;
        text-decoration: none;
        font-weight: bold;
        padding: 10px 20px;
        background-color: #333333;
        border-radius: 25px;
        transition: background-color 0.3s ease;
    }

    .nav-links a:hover {
        background-color: #007bff;
    }

    /* Formulaire */
    .form-container {
        background-color: #1a1a1a;
        width: 100%;
        max-width: 600px;
        margin: 50px auto;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
    }

    .form-container h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #ffffff;
        font-size: 28px;
        font-weight: bold;
    }

    .form-container label {
        font-size: 16px;
        color: #bbbbbb;
        display: block;
        margin-bottom: 8px;
    }

    .form-container input[type="text"],
    .form-container input[type="email"] {
        width: 100%;
        padding: 12px;
        background-color: #333333;
        border: none;
        border-radius: 8px;
        margin-bottom: 20px;
        color: #ffffff;
        font-size: 14px;
    }

    .form-container input[type="submit"] {
        width: 100%;
        padding: 15px;
        background-color: #007bff;
        color: #fff;
        font-size: 18px;
        font-weight: bold;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .form-container input[type="submit"]:hover {
        background-color: #0056b3;
    }

    /* Bouton Retour */
    .back-btn {
        text-align: center;
        margin-top: 20px;
    }

    .back-btn a {
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
        font-size: 16px;
    }

    .back-btn a:hover {
        text-decoration: underline;
    }


    @media (max-width: 768px) {
        .form-container {
            padding: 20px;
        }
    }
</style>
</html>
