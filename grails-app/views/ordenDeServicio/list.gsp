

<%@ page import="taller.ordenDeServicio.OrdenDeServicio"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:javascript src="jquery.min.js" />
<g:set var="entityName"
	value="${message(code: 'ordenDeServicio.label', default: 'Orden De Servicio')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<g:if test="${session?.user?.role == 'mecanico' }">
	<script type="text/javascript">
		$(document).ready(function() {
			$("#submenu_create").hide();			
		});
	</script>
</g:if>
	</head>
<body>

	<div id="list-ordenDeServicio" class="content scaffold-list"
		role="main">
		<fieldset>
			<legend>
				<g:message code="default.list.label" args="[entityName]" />
			</legend>
		</fieldset>

		<div class="pull-right">
			<div class="input-append">
				<g:remoteField action="search" update="resultados" name="title"
					class="input-xlarge" placeholder="Buscar " />
				<span class="add-on"> <i class=" icon-search"></i>
				</span>
			</div>
		</div>
		<br> <br>
		<g:if test="${flash.message}">
			<div class="alert alert-success" role="status">
				${flash.message}
			</div>
		</g:if>
		<table id="tabela" class="table table-hover" style="width: 100%">
			<thead>
				<tr>
					<g:sortableColumn property="numOrden"
						title="${message(code: 'ordenDeServicio.numOrden.label', default: 'Num Orden')}"
						style="width: 20% " />
					<th><g:message code="ordenDeServicio.vehiculo.label"
							default="Vehiculo" style="width: 20% " /></th>

					<th><g:message code="ordenDeServicio.cliente.label"
							default="Cliente" style="width: 20% " /></th>

					<g:sortableColumn property="mecanico"
						title="${message(code: 'ordenDeServicio.mecanico.label', default: 'Mecanico')}"
						style="width: 20% " />

					<g:sortableColumn property="tipoTrabajo"
						title="${message(code: 'ordenDeServicio.tipoTrabajo.label', default: 'Tipo Trabajo')}"
						style="width: 20% " />
					<th><g:message
							code="ordenDeServicio.descripcionProblema.label"
							default="Descripcion Del Problema" style="width: 20% " /></th>
					<th><g:message
							code="ordenDeServicio.descripcionTrabajoRealizar.label"
							default="Trabajo A Realizar" style="width: 20% " /></th>

					<g:sortableColumn property="estado"
						title="${message(code: 'ordenDeServicio.estado.label', default: 'Estado')}"
						style="width: 20% " />


					<th style="width: 10%">Acción</th>
				</tr>
			</thead>
			<tbody id="resultados">
				<g:each in="${ordenDeServicioInstanceList}" status="i"
					var="ordenDeServicioInstance">
					<tr class="${ordenDeServicioInstance.estado.id == 2? 'error' : 'success'} ">
						<td style="text-align: center">
							${fieldValue(bean: ordenDeServicioInstance, field: "numOrden")}
						</td>
						<td style="text-align: center">
								${fieldValue(bean: ordenDeServicioInstance, field: "vehiculo")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: ordenDeServicioInstance, field: "cliente")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: ordenDeServicioInstance, field: "mecanico")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: ordenDeServicioInstance, field: "tipoTrabajo")}
						</td>
						<td style="text-align: center">
							${fieldValue(bean: ordenDeServicioInstance, field: "descripcionProblema")}
						</td>
						<td style="text-align: center">
							${fieldValue(bean: ordenDeServicioInstance, field: "descripcionTrabajoRealizar")}
						</td>
						<td style="text-align: center">
							${fieldValue(bean: ordenDeServicioInstance, field: "estado")}
						</td>


						<td style="text-align: center"><g:link action="edit"
								title="EDITAR" controller="ordenDeServicio"
								id="${ordenDeServicioInstance.id}">
								<i class=" icon-edit"></i>
							</g:link> <g:link action="cambiarEstado" title="FACTURAR" class="mec"
								controller="ordenDeServicio" id="${ordenDeServicioInstance.id}">
								<i class=" icon-check"></i>
							</g:link></td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${ordenDeServicioInstanceTotal}" />
		</div>
	</div>

</body>
</html>

