<?php
    if ( ! isset ( $_SESSION['admin']['id'] ) ) exit;

    //verificar se esta sendo enviado um ID
    if ( empty ( $id ) ) {

    	?>
	    <script>
	        //mostrar a telinha animada - alert
	        Swal.fire(
	          'Erro',
	          'Requisição Inválida - ID inválido',
	          'error'
	        ).then((result) => {
	            //retornar para a tela anterior
	            history.back();
	        })
	    </script>
	    <?php

    	exit;
    }

    //verificar se existe algum produto relacionado
    $sql = "select marca_id from veiculo 
        where marca_id = :id limit 1";
    $consulta = $pdo->prepare($sql);
    $consulta->bindParam(':id', $id);
    //executar
    $consulta->execute();
    //recuperar os dados
    $dados = $consulta->fetch(PDO::FETCH_OBJ);

    //verificar se existe um id cadastro
    if ( !empty ( $dados->marca_id ) ) {
        ?>
        <script>
            //mostrar a telinha animada - alert
            Swal.fire(
              'Erro',
              'O registro não pode ser excluído pois existe um usuário vinculado a ele',
              'error'
            ).then((result) => {
                //retornar para a tela anterior
                history.back();
            })
        </script>
        <?php
        exit;
    }


    //excluir a categoria
    $sql = "delete from marca where id = :id limit 1";
    $consulta = $pdo->prepare($sql);
    $consulta->bindParam(':id', $id);

    //verificar se conseguiu excluir
    if ( $consulta->execute() ) {
    	?>
	    <script>
	        //mostrar a telinha animada - alert
	        Swal.fire(
	          'Sucesso',
	          'Registro excluído com sucesso',
	          'success'
	        ).then((result) => {
	            //retornar para a tela anterior
	            history.back();
	        })
	    </script>
	    <?php
    	exit;
    }

    ?>
    <script>
        //mostrar a telinha animada - alert
        Swal.fire(
          'Erro',
          'Erro ao excluir registro',
          'error'
        ).then((result) => {
            //retornar para a tela anterior
            history.back();
        })
    </script>
    <?php