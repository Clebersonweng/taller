

<%@ page import="taller.facturaDetalle.FacturaDetalle" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'facturaDetalle.label', default: 'FacturaDetalle')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	
				<div id="list-facturaDetalle"
					class="content scaffold-list" role="main">
					<fieldset>
						<legend>
							<g:message code="default.list.label" args="[entityName]" />
						</legend>
					</fieldset>


					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<table class="table table-striped">
						<thead>
							<tr>
								
						<th><g:message code="facturaDetalle.factura.label" default="Factura" /></th>
					
						<th><g:message code="facturaDetalle.ordenDetalle.label" default="Orden Detalle" /></th>
					
						<g:sortableColumn property="subtotal" title="${message(code: 'facturaDetalle.subtotal.label', default: 'Subtotal')}" />
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${facturaDetalleInstanceList}" status="i"
								var="facturaDetalleInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${facturaDetalleInstance.id}">${fieldValue(bean: facturaDetalleInstance, field: "factura")}</g:link></td>
					
						<td>${fieldValue(bean: facturaDetalleInstance, field: "ordenDetalle")}</td>
					
						<td>${fieldValue(bean: facturaDetalleInstance, field: "subtotal")}</td>
					
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${facturaDetalleInstanceTotal}" />
					</div>
				</div>
		
</body>
</html>
