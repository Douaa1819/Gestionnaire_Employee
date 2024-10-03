
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
            <li><a href="#">Accueil</a></li>
            <li><a href="#">Ajouter Employe</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="form-container">
        <h2>Ajouter un Employe</h2>
        <form action="employees" method="post">
            <label for="name">Nom :</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email :</label>
            <input type="email" id="email" name="email" required>

            <label for="phone">Telephone :</label>
            <input type="text" id="phone" name="phone" required>

            <label for="department">Departement :</label>
            <input type="text" id="department" name="department" required>

            <label for="position">Poste :</label>
            <input type="text" id="position" name="position" required>

            <input type="submit" value="Enregistrer">
        </form>
    </div>
</div>

</body>