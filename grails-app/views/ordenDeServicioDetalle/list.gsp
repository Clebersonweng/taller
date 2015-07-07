

<%@ page import="taller.ordenDeServicioDetalle.OrdenDeServicioDetalle"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'ordenDeServicioDetalle.label', default: 'OrdenDeServicioDetalle')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<div id="list-ordenDeServicioDetalle" class="content scaffold-list"
		role="main">
		<fieldset>
			<legend>
				<g:message code="default.list.label" args="[entityName]" />
			</legend>
		</fieldset>


		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table class="table table-striped">
			<thead>
				<tr>

					<th><g:message code="ordenDeServicioDetalle.repuesto.label"
							default="Repuesto" /></th>

					<g:sortableColumn property="cantidad"
						title="${message(code: 'ordenDeServicioDetalle.cantidad.label', default: 'Cantidad')}" />

					<th><g:message code="ordenDeServicioDetalle.orden.label"
							default="Orden" /></th>

				</tr>
			</thead>
			<tbody>
				<g:each in="${ordenDeServicioDetalleInstanceList}" status="i"
					var="ordenDeServicioDetalleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show"
								id="${ordenDeServicioDetalleInstance.id}">
								${fieldValue(bean: ordenDeServicioDetalleInstance, field: "repuesto")}
							</g:link></td>

						<td>
							${fieldValue(bean: ordenDeServicioDetalleInstance, field: "cantidad")}
						</td>

						<td>
							${fieldValue(bean: ordenDeServicioDetalleInstance, field: "orden")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${ordenDeServicioDetalleInstanceTotal}" />
		</div>
	</div>

</body>
</html>
