
<html>
<head>
    <title>Ajouter ou Modifier un Employé</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <form action="employees" method="post">
        <input type="hidden" name="id">

        <label >Nom :</label>
        <input type="text" name="name" value="" required><br>

        <label >Email :</label>
        <input type="email" name="email" value="" required><br>

        <label >Téléphone :</label>
        <input type="text" name="phone" value="" required><br>

        <label >Département :</label>
        <input type="text" name="department" value="" required><br>

        <label >Poste :</label>
        <input type="text" name="position" value="" required><br>

        <input type="submit" value="Enregistrer">
    </form>
    <a href="employees">Retour à la liste</a>
</body>
</html>
