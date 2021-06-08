<div class="float-right">
        	<a href="cadastros/cores" class="btn btn-info">
        		<i class="fas fa-file"></i> Novo
        	</a>
        </div>
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <td width="20%">ID</td>
                    <td width="50%">Marca</td>
                    <td width="30%">action</td>
                </tr>      
            </thead>
            <tbody>
                <?php
                    //selecionat todas as categorias
                    $sql = "select * from marca order by id";
                    //pdo -> prepare
                    $consulta = $pdo->prepare($sql);
                    //executar o comando sql
                    $consulta->execute();

                    while ( $dados = $consulta->fetch(PDO::FETCH_OBJ) ){

                        ?>
                        <tr>
                            <td><?=$dados->id?></td>
                            <td><?=$dados->marca?></td>
                            <td>
                                <a href="cadastros/marcas/<?=$dados->id?>" class="btn btn-success btn-sm">
                                    <i class="fas fa-edit"></i>
                                </a>

                                <a href="javascript:excluir(<?=$dados->id?>)" class="btn btn-danger btn-sm">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                        <?php

                    }

                ?>               
                
            </tbody>
        </table>

<script type="text/javascript">
    function excluir(id) {

        Swal.fire({
          title: 'Deseja realmente excluir este registro?',
          showCancelButton: true,
          confirmButtonText: `Sim`,
          cancelButtonText: `Não`,
        }).then((result) => {
          /* Read more about isConfirmed, isDenied below */
          if (result.isConfirmed) {
            //enviar para excluir
            location.href='excluir/marcas/'+id;
          } 
        })
    }
</script>
<script src="js/dataTable.js"></script>