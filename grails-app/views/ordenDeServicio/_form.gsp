<%@page import="org.apache.catalina.Session"%>
<%@ page import="taller.ordenDeServicio.OrdenDeServicio"%>
<%@ page import="taller.ordenDeServicioDetalle.OrdenDeServicioDetalle"%>

<table id="table1">
	<thead>
		<tr>
			<th><div class="control-group">
					<div
						class="fieldcontain ${hasErrors(bean: ordenDeServicioInstance, field: 'numOrden', 'error')} required">
						<label class="control-label" for="numOrden"> <span
							class="required-indicator">*</span> <g:message
								code="ordenDeServicio.numOrden.label" default="Num Orden:" />
						</label>
						<div class="controls">
							<g:field name="numOrden" class="input-small" type="number"
								value="${ordenDeServicioInstance.numOrden}" required="" />
						</div>

					</div>
				</div></th>
			<th>
				<div class="control-group">
					<div
						class="fieldcontain ${hasErrors(bean: ordenDeServicioInstance, field: 'cliente', 'error')} required">
						<label class="control-label" for="cliente"> <span
							class="required-indicator">*</span> <g:message
								code="ordenDeServicio.cliente.label" default="Cliente:" />
						</label>
						<div class="controls">

							<g:select id="cliente" name="cliente.id"
								from="${taller.cliente.Cliente.list()}" optionKey="id"
								required="" value="${ordenDeServicioInstance?.cliente?.id}"
								class="many-to-one" noSelection="['':'Elige una opcion']"
								onchange="${remoteFunction(
									controller:'ordenDeServicio',
									action:'getVehiculos',
									params:'\'id=\' + this.value',
									update:'vehiculo'
									) }"
								value="${ordenDeServicioInstance?.vehiculo?.cliente?.id}" />
						</div>

					</div>
				</div>

			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><div class="control-group">
					<div
						class="fieldcontain ${hasErrors(bean: ordenDeServicioInstance, field: 'fecha', 'error')} required">
						<label class="control-label" for="fecha"> <span
							class="required-indicator">*</span> <g:message
								code="ordenDeServicio.fecha.label" default="Fecha:" />
						</label>
						<div class="controls">
							
							<g:jqDatePicker name="fecha" class="datepicker" value="${ordenDeServicioInstance.fecha}" /> 
						</div>
					</div>
				</div>
				
			</td>
			<td><div class="control-group">
					<div
						class="fieldcontain ${hasErrors(bean: ordenDeServicioInstance, field: 'vehiculo', 'error')} required">
						<label class="control-label" for="vehiculo"> <span
							class="required-indicator">*</span> <g:message
								code="ordenDeServicio.vehiculo.label" default="Vehiculo:" />
						</label>
						
							<g:if test="${session?.user?.role == 'administrador' }">
								<div  class="controls" id="vehiculo">
									<g:select id="vehiculo" name="vehiculo.id" class="span1"
										from="${vehiculosList}" optionKey="id" required=""
										value="${ordenDeServicioInstance?.vehiculo?.id}"
										class="many-to-one" />
								</div>
							</g:if>
							<g:else>
								<div class="controls">
									<g:select id="vehiculo" name="vehiculo.id" class="span1"
										from="${taller.vehiculo.Vehiculo.list()}" optionKey="id"
										required="" value="${ordenDeServicioInstance?.vehiculo?.id}"
										class="many-to-one"   />
								</div>
							</g:else>
							
						</div>
					</div>
				</td>
		</tr>
	</tbody>
</table>
<fieldset id="fs1">
	<legend></legend>
</fieldset>
<table id="table2">
	<thead>
		<tr>
			<th><div class="control-group">
					<div
						class="fieldcontain ${hasErrors(bean: ordenDeServicioInstance, field: 'tipoTrabajo', 'error')} required">
						<label class="control-label" for="tipoTrabajo"> <span
							class="required-indicator">*</span> <g:message
								code="ordenDeServicio.tipoTrabajo.label" default="Tipo Trabajo:" />

						</label>
						<div class="controls">

							<g:select id="tipoTrabajo" name="tipoTrabajo.id"
								from="${taller.tipoDeTrabajo.TipoDeTrabajo.list()}"
								optionKey="id" required=""
								value="${ordenDeServicioInstance?.tipoTrabajo?.id}"
								class="many-to-one" noSelection="['':'Elige una opcion']" />

						</div>
					</div>
				</div></th>
			<th><div class="control-group">
					<div
						class="fieldcontain ${hasErrors(bean: ordenDeServicioInstance, field: 'mecanico', 'error')} required">
						<label class="control-label" for="mecanico"> <span
							class="required-indicator">*</span> <g:message
								code="ordenDeServicio.mecanico.label" default="Mecanico:" />
						</label>
						<div class="controls">
							<g:select id="mecanico" name="mecanico.id"
								from="${taller.mecanico.Mecanico.list()}" optionKey="id"
								required="" value="${ordenDeServicioInstance?.mecanico?.id}"
								class="many-to-one" noSelection="['':'Elige una opcion']" />

						</div>
					</div>
				</div></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><div class="control-group">
					<div
						class="fieldcontain ${hasErrors(bean: ordenDeServicioInstance, field: 'descripcionProblema', 'error')} required">
						<label class="control-label" for="descripcionProblema"> <span
							class="required-indicator">*</span> <g:message
								code="ordenDeServicio.descripcionProblema.label"
								default="Descripcion Problema:" />
						</label>
						<div class="controls">

							<g:textArea name="descripcionProblema" required=""
								value="${ordenDeServicioInstance?.descripcionProblema}" />

						</div>
					</div>
				</div></td>
			<td><div class="control-group">
					<div
						class="fieldcontain ${hasErrors(bean: ordenDeServicioInstance, field: 'descripcionTrabajoRealizar', 'error')} required">
						<label class="control-label" for="descripcionTrabajoRealizar">
							<span class="required-indicator">*</span> <g:message
								code="ordenDeServicio.descripcionTrabajoRealizar.label"
								default="Descripcion Trabajo Realizar:" />
						</label>
						<div class="controls">

							<g:textArea name="descripcionTrabajoRealizar" required=""
								value="${ordenDeServicioInstance?.descripcionTrabajoRealizar}" />

						</div>
					</div>
				</div></td>
		</tr>
	</tbody>
</table>
<fieldset id="fs2">
	<legend></legend>
</fieldset>
<!-- agregando el repuesto y la cantidad al detalle de la orden -->
<table id="table3">
	<thead>
		<tr>
			<th>
				<div class="control-group">
					<div
						class="fieldcontain ${hasErrors(bean: ordenDeServicioDetalleInstance, field: 'repuesto', 'error')} ">
						<label class="control-label" for="repuesto"> <span
							class="required-indicator">*</span> <g:message
								code="ordenDeServicioDetalle.repuesto.label" default="Repuesto:" />

						</label>
						<div class="controls">
							<g:select id="repuesto" name="repuesto.id"
								from="${taller.repuesto.Repuesto.list()}" optionKey="id"
								value="${ordenDeServicioDetalleInstance?.repuesto?.id}"
								class="many-to-one" noSelection="['':'Elige una opcion']" />
						</div>
					</div>
				</div>
			</th>
			<th>
				<div class="control-group">
					<div
						class="fieldcontain ${hasErrors(bean: ordenDeServicioDetalleInstance, field: 'cantidad', 'error')} ">
						<label class="control-label" for="cantidad"> <span
							class="required-indicator">*</span> <g:message
								code="ordenDeServicioDetalle.cantidad.label" default="Cantidad:" />

						</label>
						<div class="controls">
							<g:field name="cantidad" id="cantidad" class="input-small"
								type="number"
								value="${ordenDeServicioDetalleInstance?.cantidad}" />
						</div>
					</div>
				</div>
			</th>
			<th><div class="control-group">
					<label class="control-label" for="cantidad"> <a
						id="agregarProducto" class="btn btn-primary btn-small "><i
							class="icon-plus-sign"></i>ADD</a>
					</label>
				</div></th>
		</tr>
	</thead>

</table>
<fieldset>
	<legend></legend>
</fieldset>
<!-- hidden para detalle-->

<div id="divTxt"> 

 <div id="detalhes-container" class="required">
	<table style="width: 700px; height: 10px"
		class="table table-bordered table-hover required display" id="tabla">

		<thead>
			<tr>
				<th width="60">COD</th>
				<th width="120">Repuesto</th>
				<th width="120">Cantidad</th>
				<th width="40"></th>
			</tr>
		</thead>
		<tbody>
		</tbody>

	</table>
</div>


<!--agregando el estado para la orden que sea pendiente  -->

<div style="display: none" class="control-group">
	<div
		class="fieldcontain ${hasErrors(bean: ordenDeServicioInstance, field: 'estado', 'error')} required">
		<label class="control-label" for="estado"> <span
			class="required-indicator">*</span> <g:message
				code="ordenDeServicio.estado.label" default="Estado:" />
		</label>
		<div class="controls">
			<g:select id="estado" name="estado.id"
				from="${taller.estado.Estado.list()}" optionKey="id" required=""
				value="${ordenDeServicioInstance?.estado?.get(1)}"
				class="many-to-one" />
		</div>
	</div>
</div>



