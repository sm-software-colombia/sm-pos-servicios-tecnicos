
<form id="guardarDatos9" >
<div class="modal fade " id="dataRegister9" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Ingresar Equipo</h4>
      </div>
      <div class="modal-body">
			<div id="datos_ajax_register"></div>
          <div class="form-group">

            <input type="text" class="form-control"  placeholder="Descripcion*" id="nombre" name="nombre" required >
		  </div>
		  <div class="form-group">
            <input type="text" class="form-control" id="nit" name="nit" placeholder="Sintomas que presenta*" required maxlength="20">
          </div>
		  <div class="form-group">
            <input type="text" class="form-control" id="direccion" name="direccion" required placeholder="Serial*">
          </div>
		  <div class="form-group">
            <input type="text" class="form-control" id="email" name="email" required maxlength="30" placeholder="Describa el estado fisico*" >
          </div>
		  <div class="form-group">
            <input type="text" class="form-control" id="telefono" name="telefono" required maxlength="60" placeholder="Accerios que incluye*" >
          </div>


      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Grabar</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>

      </div>
    </div>
  </div>
</div>
</form>