<?php
$server = 'localhost';
$bd = 'medweg';
$user = 'root';
$pass = 'senai';

$conexao = mysqli_connect($server, $user, $pass, $bd);

if(!empty($_GET['search'])) {
    //echo "contem algo, pesquisar";
    $data = $_GET['search'];
    //echo $data;
    $sql = "SELECT * FROM produto WHERE nome_prod LIKE '%$data%' or tipo_prod LIKE '%$data%' ORDER BY cod_prod DESC;";
}
else {
    //echo "nao tem nada";
    $sql = "SELECT * FROM produto ORDER BY cod_prod DESC;";
}

$result = $conexao->query($sql);
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width, initial-scale=1.0">

    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="card.css">
    <script src="javascript/homeCli.js" defer></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
    <title>Tela Principal</title>

</head>

<header id="header">
    <a id="logo" href="homeCliente.html"><img height="64px" src="img/logo_medweg-removebg-preview.png" alt="medweg"></a>
    <nav id="nav">
        <button aria-label="Abrir Menu" id="btn-mobile" aria-haspopup="true" aria-controls="menu" aria-expanded="false">
            <span id="hamburger"></span>
        </button>
        <ul id="menu" role="menu">
            <li> <a href="sobreCliente.html" style="cursor: pointer;">Sobre</a></li>
            <li> <a href="selecaoFarmacia.php" style="cursor: pointer;">Farmácia</a></li>
            <!--Perfil-->
            <a id="button-user" style="cursor: pointer;"><img style="width: 75%;"
                src="img/perfil-de-usuario.png" alt="user"></a>
            
            
            <!--Carrinho-->
            <a id="myBtn" style="cursor: pointer;"><img style="width: 75%;"
                    src="img/carrinho-de-compras-de-design-xadrez (1).png" alt="carrinho"></a>
            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <br>
                    <br>
                    <a class="modal-border-a" href="index.html">Sacola</a>
                    <br>
                    <span class="close"></span>
                    <a class="modal-border-a" href="homeFarmacia.html">Histórico</a>
                    <br>
                    <span class="close"></span>
                    <a class="modal-border-a" href="Sobre.html">Reserva</a>
                </div>
            </div>
        </ul>
    </nav>
</header>


<div id="divBusca">
  <input type="text" id="txtBusca" placeholder="Buscar..."/>
  
</div>

<div class="crd_list">



<?php
                while($prod_data = mysqli_fetch_assoc($result)) {
                   echo "<div class='card'>";
                   echo "<div class='imgBx'>";
                   echo "<img src='img/dipirona.png' alt=''>";
                   echo "</div>";

                   echo "<div class='contentBx' >";
                   echo "<h3>".$prod_data['nome_prod']."</h3>";
                   echo  "<h2 class='price'>R$".$prod_data['preco_prod']."</h2>";
                   echo   "<a href='pagar.html' class='buy'>Compre Agora</a>";
                   echo  "</div>";
                   echo "</div>";

                    /*echo "<tr>";
                        echo "<td class='tr_lista'>".$prod_data['cod_prod']."</td>";
                        echo "<td class='tr_lista'>".$prod_data['nome_prod']."</td>";  
                        echo "<td class='tr_lista'>".$prod_data['tipo_prod']."</td>";                 
                        echo "<td class='tr_lista'>R$".$prod_data['preco_prod']."</td>";       
                        echo "<td class='tr_lista'>".$prod_data['estoque_prod']."</td>";
                        echo "<td class='tr_lista'>".$prod_data['descricao_prod']."</td>";
                        echo "<td class='tr_editar'> <a class='btn-alterar' style='cursor: pointer;' href='editarProd.php?cod_prod=$prod_data[cod_prod]'>
                    </td>";

                        echo "</tr>";
                       
                 */
                    
                }
            ?>

</div>
</html>