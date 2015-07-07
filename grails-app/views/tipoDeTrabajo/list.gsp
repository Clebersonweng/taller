

<%@ page import="taller.tipoDeTrabajo.TipoDeTrabajo" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'tipoDeTrabajo.label', default: 'TipoDeTrabajo')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	
				<div id="list-tipoDeTrabajo"
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
								
						<g:sortableColumn property="tipoDeTrabajo" title="${message(code: 'tipoDeTrabajo.tipoDeTrabajo.label', default: 'Tipo De Trabajo')}" />
					
						<g:sortableColumn property="precio" title="${message(code: 'tipoDeTrabajo.precio.label', default: 'Precio')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'tipoDeTrabajo.descripcion.label', default: 'Descripcion')}" />
					
						<th><g:message code="tipoDeTrabajo.facturaDetalle.label" default="Factura Detalle" /></th>
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${tipoDeTrabajoInstanceList}" status="i"
								var="tipoDeTrabajoInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${tipoDeTrabajoInstance.id}">${fieldValue(bean: tipoDeTrabajoInstance, field: "tipoDeTrabajo")}</g:link></td>
					
						<td>${fieldValue(bean: tipoDeTrabajoInstance, field: "precio")}</td>
					
						<td>${fieldValue(bean: tipoDeTrabajoInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: tipoDeTrabajoInstance, field: "facturaDetalle")}</td>
					
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${tipoDeTrabajoInstanceTotal}" />
					</div>
				</div>
		
</body>
</html>
