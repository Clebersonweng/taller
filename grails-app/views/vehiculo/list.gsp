

<%@ page import="taller.vehiculo.Vehiculo"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'vehiculo.label', default: 'Vehiculo')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<div id="list-vehiculo" class="content scaffold-list" role="main">
		<fieldset>
			<legend>
				<g:message code="default.list.label" args="[entityName]" />
			</legend>
		</fieldset>
		<div class="pull-right">
			<div class="input-append">
				<g:remoteField action="search" update="resultados" name="title"
					class="input-xlarge" placeholder="Buscar vehiculo" />
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
		<table class="table-condensed table-striped table-hover"
			style="width: 100%">
			<thead>
				<tr>

					<g:sortableColumn property="cliente"
						title="${message(code: 'vehiculo.cliente.label', default: 'Cliente')}"
						style="width: 20%" />
					
					<g:sortableColumn property="matricula"
						title="${message(code: 'vehiculo.matricula.label', default: 'Matricula')}"
						style="width: 20%" />
						
					<g:sortableColumn property="marca"
						title="${message(code: 'vehiculo.marca.label', default: 'Marca')}"
						style="width: 20%" />
						
					<g:sortableColumn property="modelo"
						title="${message(code: 'vehiculo.modelo.label', default: 'Modelo')}"
						style="width: 20%" />				

					<g:sortableColumn property="anho"
						title="${message(code: 'vehiculo.anho.label', default: 'Anho')}"
						style="width: 20%" />
					<th style="width: 20%">Accion</th>
				</tr>
			</thead>
			<tbody id="resultados">
				<g:each in="${vehiculoInstanceList}" status="i"
					var="vehiculoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td style="text-align: center">
							${fieldValue(bean: vehiculoInstance, field: "cliente")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: vehiculoInstance, field: "matricula")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: vehiculoInstance, field: "marca")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: vehiculoInstance, field: "modelo")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: vehiculoInstance, field: "anho")}
						</td>
						<td style="text-align: center"><g:form name="vehiculo-form"
								action="delete" method="post">
								<g:link action="edit" id="${vehiculoInstance.id}">
									<i class=" icon-edit"></i>
								</g:link>

							</g:form></td>
					</tr>
				</g:each>
			</tbody>
		</table>
		
	</div>

</body>
</html>
