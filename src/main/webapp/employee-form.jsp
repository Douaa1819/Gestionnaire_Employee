<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Ajouter ou Modifier un Employé</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>${employee == null ? 'Ajouter' : 'Modifier'} un Employé</h2>
    <form action="employees" method="post">
        <input type="hidden" name="id" value="${employee.id}">

        <label for="name">Nom :</label>
        <input type="text" name="name" value="${employee.name}" required><br>

        <label for="email">Email :</label>
        <input type="email" name="email" value="${employee.email}" required><br>

        <label for="phone">Téléphone :</label>
        <input type="text" name="phone" value="${employee.phone}" required><br>

        <label for="department">Département :</label>
        <input type="text" name="department" value="${employee.department}" required><br>

        <label for="position">Poste :</label>
        <input type="text" name="position" value="${employee.position}" required><br>

        <input type="submit" value="Enregistrer">
    </form>
    <a href="employees">Retour à la liste</a>
</body>
</html>
