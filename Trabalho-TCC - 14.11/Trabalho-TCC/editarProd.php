<?php
$server = 'localhost';
$bd = 'medweg';
$user = 'root';
$pass = 'senai';

$conexao = mysqli_connect($server, $user, $pass, $bd);

//include_once('cadastroProduto.php');

if(!empty($_GET['cod_prod'])) {

    $cod_prod = $_GET['cod_prod'];

    $sqlSelect = "SELECT * FROM produto WHERE cod_prod=$cod_prod";

    $result = $conexao->query($sqlSelect);
    //print_r($result);

    if($result->num_rows > 0) {
        while($prod_data = mysqli_fetch_assoc($result)) {
            $cod_prod = $prod_data['cod_prod'];
            $estoque_prod = $prod_data["estoque_prod"];
            $preco_prod = $prod_data["preco_prod"];
            $nome_prod = $prod_data["nome_prod"];
            $descricao_prod = $prod_data["descricao_prod"];
            $tipo_prod = $prod_data["tipo_prod"];
        }

        //print_r($nome_prod);
    } else {
        header('Location: homeFarmacia.php');
    }
}

/*
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

$result = $conexao->query($sql);*/
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width, initial-scale=1.0">

    <link rel="stylesheet" href="style.css">
    <script src="javascript/homeFarma.js" defer></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
    <title>Tela Principal</title>

</head>

<header id="header">
    <a id="logo" href="homeFarmacia.php"><img height="64px" src="img/logo_medweg-removebg-preview.png" alt="medweg"></a>
    <nav id="nav">
        <button aria-label="Abrir Menu" id="btn-mobile" aria-haspopup="true" aria-controls="menu" aria-expanded="false">
            <span id="hamburger"></span>
        </button>
        <ul id="menu" role="menu">
            <li> <a href="sobreFarma.html" style="cursor: pointer;">Sobre</a></li>
            <!--Perfil-->
            <a id="button-user" style="cursor: pointer;"><img style="width: 75%;"
                src="img/perfil-de-usuario.png" alt="user"></a>
                <div id="myModal" class="modal">
                <div class="modal-content">

               </div>
            </div>
        </ul>
    </nav>

    <div class="box-prod" id="modal-cadastrar-produto" style="display: block">
        <form action="saveEdit.php" method="POST">
            <legend><b>Atualização de Produto</b></legend>
            <br>
            <br>
            <div class="inputBox">
                <input type="text" name="unit_txt" id="unit" class="inputUser" required readonly>
                <label for="unit" class="labelInput">Unidade</label>
            </div>
            <br><br>
            <div class="inputBox">
                <input type="text" name="cod_prod_txt" id="cod_prod" class="inputUser" value="<?php echo $cod_prod ?>" required readonly>
                <label for="cod_prod" class="labelInput">Código Produto</label>
            </div>
            <br><br>
            <div class="inputBox">
                <input type="text" name="nome_prod_txt" id="nome" class="inputUser" value="<?php echo $nome_prod ?>" required>
                <label for="nome" class="labelInput">Nome</label>
            </div>
            <br><br>
            <label for="tipo_prod" >Tipo do Produto: </label>
            <br>

            <div>
                <input type="radio" id="Alimento" name="tipo_prod" class="edit-btn" value="<?php $tipo_prod == 'Alimento' ? 'checked' : ''?> " required>
                <label for="">Alimento</label>
            </div>
            
            <div>
                <input type="radio" id="Beleza" name="tipo_prod"  class="edit-btn" value="<?php $tipo_prod == 'Beleza' ? 'checked' : ''?> " required>
                <label for="">Beleza</label>
            </div>
            
            <div>
                <input type="radio" id="Medicamento" name="tipo_prod"  class="edit-btn" value="<?php $tipo_prod == 'Medicamento' ? 'checked' : ''?> " required>
                <label for="">Medicamento</label>
            </div>
            
            <div>
                <input type="radio" id="Higiene" style="float='left'" name="tipo_prod"  class="edit-btn" value="<?php $tipo_prod == 'Higiene' ? 'checked' : ''?> " required>
                <label for="">Higiene</label>
            </div>
            
            
            

     

            <br><br>
            <div class="inputBox">
                <input type="text" name="preco_prod_txt" id="preco" class="inputUser" value="<?php echo $preco_prod ?>" required>
                <label for="preco" class="labelInput">Preço</label>
            </div>
            <br><br>
            <div class="inputBox">
                <input type="text" name="estoque_prod_txt" id="estoque" class="inputUser" value="<?php echo $estoque_prod ?>" required>
                <label for="estoque" class="labelInput">Estoque</label>
            </div>
            <br><br>
            <div class="inputBox">
                <input type="text" name="descricao_prod_txt" id="descricao" class="inputUser" value="<?php echo $descricao_prod ?>" required>
                <label for="descricao" class="labelInput">Descrição</label>
            </div>
            <br><br>
            <input type="submit" name="update" id="update" class="butt-enviar">
        </form>
    </div>
</header>

</html>