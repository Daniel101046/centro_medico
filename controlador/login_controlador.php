<?php

    require_once '../modelo/usuario modelo.php';

    // mostrar formulario
    function mostrar_login()
    {
        require_once '../vista/login_vista.php';
    }

    // Procesar credenciales
    function autenticar()
    {

        if($_SERVER['REQUEST_METHOD'] == 'POST')
        {

            $login = $_POST['login'];
            $pass = $_POST['password'];

            $usuario = validar_usuario($login, $pass);

            if($usuario)
            {

                header("Location: index.php");

            }
            else
            {

                echo "Credenciales incorrectas";

            }

        }

    }

?>