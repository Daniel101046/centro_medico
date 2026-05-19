<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de sesión</title>
</head>
<body>

    <h2>Iniciar sesión</h2>

    <!--Formulario para el inicio de sesión-->
    <form action="./modelo/usuario modelo.php" method="POST">

        <label for="">Login:</label>
        <input type="text" name="login" id="" required autofocus/>
        <br><br>

        <label for="">Password:</label>
        <input type="password" name="password" id="" required/>
        <br><br>

        <button type="submit">Ingresar</button>

    </form>

</body>
</html>