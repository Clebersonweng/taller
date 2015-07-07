

<%@ page import="taller.estado.Estado" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'estado.label', default: 'Estado')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	
				<div id="list-estado"
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
								
						<g:sortableColumn property="estado" title="${message(code: 'estado.estado.label', default: 'Estado')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'estado.descripcion.label', default: 'Descripcion')}" />
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${estadoInstanceList}" status="i"
								var="estadoInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${estadoInstance.id}">${fieldValue(bean: estadoInstance, field: "estado")}</g:link></td>
					
						<td>${fieldValue(bean: estadoInstance, field: "descripcion")}</td>
					
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${estadoInstanceTotal}" />
					</div>
				</div>
		
</body>
</html>
