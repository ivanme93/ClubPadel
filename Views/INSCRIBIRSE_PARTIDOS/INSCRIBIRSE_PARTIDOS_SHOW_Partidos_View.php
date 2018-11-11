<?php

class INSCRIBIRSE_PARTIDOS{
	var $tuplas;

	function __construct($tuplas,$origen){	
		$this->tuplas = $tuplas;
		$this->render();
	}


function render(){

    include '../Views/HEADER_View.php'; 

?>

    <!-- Main -->
	<section id="main" class="container">
	<header>
	   <h2>Partidos Promocionados</h2>
	    <p>Inscribete en los partidos promocionados por el club</p>
	 </header>
				<div class="table-wrapper">
					<table>
						<thead >
							<tr>
								<th>Fecha</th>
								<th>Hora Inicio</th>
								<th>Hora Fin</th>
								<th>Pista</th>
								<th>Numero Inscritos</th>
								<th></th>

							</tr>
						</thead>
						<tbody>
					<?php 
						if($this->tuplas <> NULL){
							while($row = mysqli_fetch_array($this->tuplas)){
									$fecha = explode("-", $row['FECHA']);
									$hora_inicio = explode(":", $row["HORA_INICIO"]);
									$hora_fin = explode(":", $row["HORA_FIN"]);
							?>
									<tr>
										<td>
											<?=$fecha[2]."/".$fecha[1]."/".$fecha[0]?>
										</td>
										<td>
											<?=$hora_inicio[0].":".$hora_inicio[1]?>
										</td>
										<td>
											<?=$hora_fin[0].":".$hora_fin[1]?>
										</td>
										<td>
											<?=$row['PISTA_ID']?>
										</td>
										<td>
											<?=$row['INSCRIPCIONES']?>
										</td>
										<td>
											<a class="button small" href="../Controllers/INSCRIBIRSE_PARTIDOS_Controller.php?action=ADD&partido_ID=<?=$row['ID']?>">INSCRIBIRSE</a>
										</td>
									</tr>

					<?php
							}//fin del while
						}//fin del if
					?>
						</tbody>
					</table>
				</div>
   		</section>
    <?php
        include '../Views/FOOTER_View.php';
        } //fin metodo render
    
    } //fin class
    
    ?>s