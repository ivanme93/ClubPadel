<?php

class Register{


	function __construct(){	
		$this->render();
	}


function render(){

    include '../Views/HEADER_View.php'; 
?>


    <!-- Main -->
    <section id="main" class="container medium">
        <header>
            <h2>Registrarse</h2>
        </header>
        <div class="box">
            <form method="post" action="../Controllers/REGISTER_Controller.php">
                <div class="row gtr-50 gtr-uniform">
                    <!--<div class="col-6 col-12-mobilep">
									<input type="text" name="name" id="name" value="" placeholder="Name" />
								</div>
								<div class="col-6 col-12-mobilep">
									<input type="email" name="email" id="email" value="" placeholder="Email" />
								</div>-->
                    <div class="col-12">
                        <input type="text"  id="subject" value="" placeholder="Nombre" name="name" />
                    </div>
                    <div class="col-12">
                        <input type="text"  id="subject" value="" placeholder="Email" name="email" />
                    </div>
                    <div class="col-12">
                        <input type="text"  id="subject" value="" placeholder="Usuario" name="dni" />
                    </div>
                    <div class="col-12">
                        <input type="password" id="message" placeholder="Contraseña" name="password"></input>
                    </div>
                    <div class="col-12">
                        <ul class="actions special">
                            <li><a href="../Controllers/REGISTER_Controller.php"><input type="submit" value="Continuar" /></a></li>
                        </ul>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <?php
        include '../Views/FOOTER_View.php';
        } //fin metodo render
    
    } //fin Login
    
    ?>