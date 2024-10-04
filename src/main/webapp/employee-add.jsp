

<html>
<head>
    <title>Ajouter  un Employe</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<jsp:include page="navbar.jsp" />

<div class="container">
    <div class="form-container">
        <h2>Ajouter un Employe</h2>
        <form action="${pageContext.request.contextPath}/Gestionnaire_Employee" method="post">
            <input type="hidden" name="action" value="ajouter">
            <label for="name">Nom :</label>
            <input type="text" id="name" name="name" placeholder="Entrez le nom" required>

            <label for="email">Email :</label>
            <input type="email" id="email" name="email" placeholder="Entrez l'email" required>

            <label for="phone">Telephone :</label>
            <input type="text" id="phone" name="phone" placeholder="Entrez le telephone" required>

            <label for="department">Departement :</label>
            <input type="text" id="department" name="department" placeholder="Entrez le departement" required>

            <label for="position">Poste :</label>
            <input type="text" id="position" name="position" placeholder="Entrez le poste" required>

            <input type="submit" value="Enregistrer">
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
