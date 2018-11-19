<?php
class GESTIONAR_CLASIFICACIONES{
	var $campeonatos;

	function __construct($campeonatos){
		$this->campeonatos = $campeonatos;
		$this->render();
	}

function render(){
    include '../Views/HEADER_View.php';
?>
	<section id="main" class="container">
	<header>
	   <h2>Gestión de Clasificaciones</h2>
	    <p>Consulta las clasificaciones de los distintos campeonatos</p>
	 </header>
				<div class="table-wrapper">
					<table>
						<thead >
							<tr>
								<th>Nombre</th>
							</tr>
						</thead>
						<tbody>
					<?php
						if($this->campeonatos <> NULL){
							foreach ($this->campeonatos as $key => $value) {
							?>
							<tr>
								<td>
									<a href="../Controllers/CLASIFICACION_Controller.php?action=RANKING&campeonato_ID=<?=$key?>"><?=$value[0]?></a>
								</td>
							</tr>
				<?php
						}
					}
				?>
						</tbody>
					</table>
				</div>
   		</section>
    <?php
        include '../Views/FOOTER_View.php';
        }
    }
    ?>
