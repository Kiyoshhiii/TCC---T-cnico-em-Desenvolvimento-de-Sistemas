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
    $sql = "SELECT * FROM cadastro_farmacia WHERE empresa_far LIKE '%$data%' or rua_far LIKE '%$data%' ORDER BY unidade_far DESC;";
}
else {
    //echo "nao tem nada";
    $sql = "SELECT * FROM cadastro_farmacia ORDER BY unidade_far DESC;";
}

$result = $conexao->query($sql);
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width, initial-scale=1.0">

    <link rel="stylesheet" href="style.css">
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
            <li> <a style="cursor: pointer;">Farmácia</a></li>
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

<body class="lista_prod">

<center>
    <div class="container_prod">
       <div class="header_prod">
          <b>Lista de Farmácias</b>
          <input type="text" class="input-buscar-farma" id="input_buscar_farma" name="input_buscar" placeholder="Buscar nome ou tipo dos produtos">
          
          <button class="button_busca_prod" name="btn-busca-prod"><img src="img/lupa.png" alt="Buscar" onclick="searchData()"></button>
        </div>

    
        <div>
          <table style="width: 100%; ">
          <thead class="thead_lista_far">
            <div>
                <tr>
                    <th>Unidade</th>
                    <th>Empresa</th>
                    <th>Rua</th>
                    <th>Número</th>
                    <th>Bairro</th>
                    <th>Cidade</th>
                    <th>Estado</th>
                    <th>Telefone</th>
                    <th>Acessar Farmácia</th>
                </tr>
            </div>
            </thead>
            <tbody>
            <?php
                while($farma_data = mysqli_fetch_assoc($result)) {
                    echo "<tr>";
                        echo "<td class='tr_lista_farma'>".$farma_data['unidade_far']."</td>";
                        echo "<td class='tr_lista_farma'>".$farma_data['empresa_far']."</td>";  
                        echo "<td class='tr_lista_farma'>".$farma_data['rua_far']."</td>";                 
                        echo "<td class='tr_lista_farma'>".$farma_data['numero_far']."</td>";       
                        echo "<td class='tr_lista_farma'>".$farma_data['bairro_far']."</td>";
                        echo "<td class='tr_lista_farma'>".$farma_data['cidade_far']."</td>";
                        echo "<td class='tr_lista_farma'>".$farma_data['estado_far']."</td>";
                        echo "<td class='tr_lista_farma'>".$farma_data['telefone_far']."</td>";
                        echo "<td class='tr_acessar'> <a class='btn-alterar-acesso' style='cursor: pointer;'>
                        <svg xmlns='http://www.w3.org/2000/svg' width='16' height='14' fill='currentColor' class='bi bi-arrow-right-circle' viewBox='0 0 16 16'>
                        <path fill-rule='evenodd' d='M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z'/>
                        </svg></a></td>";
                    echo "</tr>";
                }
            ?>
            </tbody>
          </table>
        </div>
      </div>
    </center>

</body>

<footer>

    <div class="container-footer">
        <div class="row-footer">
            <div class="footer-col">
                <h4>Empresa</h4>
                <ul>
                    <li><a href=""> Quem somos</a></li>
                    <li><a href=""> Nossos serviços</a></li>
                    <li><a href=""> Política de Privacidade</a></li>
                    <li><a href=""> Programa de Afiliados</a></li>

                </ul>

            </div>


            <div class="footer-col">
                <h4>Obter ajuda</h4>
                <ul>
                    <li><a href=""> Faq</a></li>
                    <li><a href=""> Transporte</a></li>
                    <li><a href=""> Devolução</a></li>
                    <li><a href=""> Status do pedido</a></li>

                </ul>

            </div>


            <div class="footer-col">
                <h4> Loja online</h4>
                <ul>
                    <li><a href=""> Remédios</a></li>
                    <li><a href=""> Hegiene pessoal</a></li>
                    <li><a href=""> Beleza</a></li>
                    <li><a href=""> Alimentação</a></li>

                </ul>

            </div>

            <div class="footer-col">
                <h4>Empresa</h4>
                <div class="form-sub">

                    <form>
                        <input type="email" placeholder="Digite o seu email" required>
                        <button>Enviar</button>
                    </form>
                </div>

                <div class="medidas-socias">
                    <a href=""><i class="fa facebook"></i></a>
                    <a href=""><i class="fa instagram"></i></a>
                    <a href=""><i class="fa twiter"></i></a>
                    <a href=""><i class="fa linkdin"></i></a>

                </div>

            </div>
        </div>
    </div>

</footer>

</html>