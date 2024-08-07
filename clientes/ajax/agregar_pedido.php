
<?php

////LISTA DE PRODUCTOS AGREGADOS A LA FACTURA

/*-------------------------
Autor: Adrian Monsalve
---------------------------*/
session_start();
$session_id                               = session_id();
if (isset($_POST['id'])) {$id             = $_POST['id'];}
if (isset($_POST['cantidad'])) {$cantidad = $_POST['cantidad'];}
if (isset($_POST['codigo'])) {$codigo     = $_POST['codigo'];}
if (isset($_POST['prec'])) {$prec         = $_POST['prec'];}
if (isset($_POST['articulo'])) {$articulo = $_POST['articulo'];}

/// testing recogida POST
//echo $_POST['id'];

/* Connect To Database*/
require_once ("../config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once ("../config/conexion.php");//Contiene funcion que conecta a la base de datos

//GURDANDO DATOS POST EN LA DB

if (!empty($id) and !empty($cantidad) and !empty($prec)) {
	$insert_tmp = mysqli_query($con, "INSERT INTO ostemporal (id,titulo,come,celu,num,estado) VALUES ('$id','$articulo','$cantidad','$session_id','$prec','$codigo')");
}
if (isset($_GET['id']))//codigo elimina un elemento del array
{
	$id     = intval($_GET['id']);
	$delete = mysqli_query($con, "DELETE FROM ostemporal WHERE id='".$id."'");
}

///TESTING pasar id correctamente
//echo $_POST['cantidad'];

?>
<table class="table">
<tr>
	<th class="visible-md visible-lg" >Código</th>
	<th>Cantidad</th>
	<th>Descripción</th>
	<th><span class="pull-right">PRECIO UNIT.</span></th>
	<th class="visible-md visible-lg" ><span class="pull-right">TOTAL</span></th>
	<th></th>
</tr>
<?php
$sumador_total = 0;

///testing/////echo $session_id;
///CONSULTA UTILIZANDO LA SESSION

$sql = mysqli_query($con, "select * from ostemporal where celu ='".$session_id."'");
while ($row = mysqli_fetch_array($sql))

/*
$sql=mysqli_query($con, "select * from lista7 where id ='".$_POST['id']."'");
while ($row=mysqli_fetch_array($sql))
 */

{
	$id_tmp          = $row["id"];
	$codigo_producto = $row['estado'];
	$cantidad        = $row['come'];
	$nombre_producto = $row['titulo'];
	$precio          = $row['num'];
	if (!empty($id_marca_producto)) {
		$sql_marca              = mysqli_query($con, "select nombre_marca from marcas where id_marca='$id_marca_producto'");
		$rw_marca               = mysqli_fetch_array($sql_marca);
		$nombre_marca           = $rw_marca['nombre_marca'];
		$marca_producto         = " ".strtoupper($nombre_marca);
	} else { $marca_producto = '';}
	$precio_venta            = $row['precio_tmp'];
	$precio_venta_f          = number_format($precio_venta, 2);//Formateo variables
	$precio_venta_r          = str_replace(",", "", $precio_venta_f);//Reemplazo las comas
	$precio_total            = $precio_venta_r*$cantidad;
	$precio_total_f          = number_format($precio_total, 2);//Precio total formateado
	$precio_total_r          = str_replace(",", "", $precio_total_f);//Reemplazo las comas
	$sumador_total += $precio_total_r;//Sumador

	$subto = $precio*$cantidad;

	$suma = $suma+$subto;

	?>
											<tr>
												<td class="visible-md visible-lg" ><?php echo $codigo_producto;?></td>
												<td><?php echo $cantidad;?></td>
												<td><?php echo $nombre_producto.$marca_producto;?></td>
												<td><span class="pull-right"><?php

	echo "$";

	echo number_format($precio);?></span></td>
												<td class="visible-md visible-lg" ><span class="pull-right"><?echo "$"?><?php echo number_format($subto);?></span></td>
												<td ><span class="pull-right"><a href="#" onclick="eliminar('<?php echo $id_tmp?>')"><i class="glyphicon glyphicon-trash"></i></a></span></td>
											</tr>
	<?php
}

?>
<tr>
	<td colspan=4><span class="pull-right">SUB TOTAL: <?php echo " $";
echo number_format($suma);
?></span></td>
	
	<td></td>
</tr>
</table>
