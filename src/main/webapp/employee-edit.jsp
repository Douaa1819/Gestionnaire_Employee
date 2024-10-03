
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
        <h2>Modifier Employe</h2>
        <form action="employees/update" method="post">
            <input type="hidden" name="id" value="">

            <label for="name">Nom :</label>
            <input type="text" id="name" name="name" value="John Doe" required>

            <label for="email">Email :</label>
            <input type="email" id="email" name="email" value="john.doe@example.com" required>

            <label for="phone">Telephone :</label>
            <input type="text" id="phone" name="phone" value="+33 1 23 45 67 89" required>

            <label for="department">Departement :</label>
            <input type="text" id="department" name="department" value="Informatique" required>

            <label for="position">Poste :</label>
            <input type="text" id="position" name="position" value="Developpeur" required>

            <input type="submit" value="Mettre à jour">
        </form>
    </div>
</div>

</body>
</html>