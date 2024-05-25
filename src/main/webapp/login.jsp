<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>


    <!-- iconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<link rel="shortcut icon" href="o/favicon.ico" type="image/x-icon">
	<link rel="icon" href="img/favicon.ico" type="image/x-icon">
	
    <!-- fuente -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">


    <!-- estilos -->
	<link rel="stylesheet" type="text/css" href="css/login.css">
	

</head>
<body>
    
    <!-- header -->
    <header class="header">
        <div class="container">
            <div class="header__inner">

                <div class="header__logo">
                    <a href="#">						
                        <img src="img/logo.png" alt="Logotipo" width="30%">
                    </a>
                </div>
            </div>
        </div>
    </header>
    <!-- fin header -->

    <!-- BLOQUE  LOGIN -->
    <section class="">
        <div class="contenedor">
            <div class="presentacion">
                <div class="contenido-pres">
                    <h2>¡Bienvenido a CIBERBOOK!</h2>
                    <p>Gracias a ti, estamos creciendo explorando más universos. </p>
                      <p>  Compartamos el éxito cada día.</p>
                </div>
            </div>
            <div class="entrar">
                <div class="form-box login">
                    <form action="UsuarioController" method = "post">
                   	<input type="hidden" name="command" value="loginUsuario"> 
                        <h2>Iniciar Sesión</h2>
                        <div class="input-box">
                            <!---------------------- CORREO ------------------- -->
                            <input placeholder="Correo" type="email" id="correo" name="correo" required>
                        </div>
                        <div class="input-box">
                            <!---------------------- CLAVE ------------------- -->
                            <input placeholder="Clave" type="password" id="contrasena" name="contrasena" required>
                        </div>
                        <div class="message">
                        	${msg }
                        </div>
                        <br>	
                            <!---------------------- INGRESAR ------------------- -->
                        <input class="btn" type="submit" value="Ingresar" name="tipo"></input>
                        <div class="crear-cuenta">
                            <p>¿Aún no tienes una cuenta? <a href="#" class="register-link"> 
                                Registrate aquí</a></p>
                        </div>
                    </form>
                </div>
                <div class="form-box register">
                    <form action="UsuarioController" method="post"">
                    <input type="hidden" name="command" value="registerUsuario">
                        <h2>Registrate</h2>
                        <div class="nombres">
                            <div class="input-box-small">
                                <!----------------------NOMBRE ------------------- -->
                                <input placeholder="Nombre" type="text" id="nombre" name="nombre" required>
                            </div>
                            <div class="input-box-small">
                                <!---------------------- APELLIDO ------------------- -->
                                <input placeholder="Apellido" type="text" id="apellido" name="apellido" required>
                            </div>
                        </div>
                        <div class="input-box">
                            <!---------------------- TELEFONO ------------------- -->
                            <input placeholder="Telefono" type="text" id="telefono" name="telefono" required  pattern="[0-9]{9}">
                            
                        </div>
                        <div class="input-box">
                            <!---------------------- DNI ------------------- -->
                            <input placeholder="DNI" type="text" id="dni" name="dni" required  pattern="[0-9]{8}">
                        </div>
                        <div class="input-box">
                            <!---------------------- CORREO ------------------- -->
                            <input placeholder="Correo" type="email" id="correo" name="correo" required>
                        </div>
                        <div class="input-box">
                            <!---------------------- CLAVE ------------------- -->
                            <input placeholder="Clave" type="password" id="contrasena" name="contrasena" required>
                        </div>
                            <!---------------------- REGISTRARSE ------------------- -->
                        <input class="btn" type="submit" value="Registrarse" name="reg" onclick="validar()"></input>
                        <div class="crear-cuenta">
                            <p>¿Ya tienes una cuenta? <a href="#" class="login-link">
                                Iniciar Sesión</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- fin LOGIN -->

	<script src="js/login.js"></script>
</body>
</html>