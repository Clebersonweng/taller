

<%@ page import="taller.cliente.Cliente" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />

<g:set var="entityName"
	value="${message(code: 'cliente.label', default: 'Cliente')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	
				<div id="list-cliente"
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
								
						<g:sortableColumn property="numDocumento" title="${message(code: 'cliente.numDocumento.label', default: 'Num Documento')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'cliente.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'cliente.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="numContacto" title="${message(code: 'cliente.numContacto.label', default: 'Num Contacto')}" />
					
						<g:sortableColumn property="direccion" title="${message(code: 'cliente.direccion.label', default: 'Direccion')}" />
					
							</tr>
						</thead>
						<tbody>
							<g:each in="${clienteInstanceList}" status="i"
								var="clienteInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td><g:link action="show" id="${clienteInstance.id}">${fieldValue(bean: clienteInstance, field: "numDocumento")}</g:link></td>
					
						<td>${fieldValue(bean: clienteInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: clienteInstance, field: "apellido")}</td>
					
						<td>${fieldValue(bean: clienteInstance, field: "numContacto")}</td>
					
						<td>${fieldValue(bean: clienteInstance, field: "direccion")}</td>
					
								</tr>
							</g:each>
						</tbody>
					</table>

					
					 
					<div class="pagination">
						<g:paginate total="${clienteInstanceTotal}" />
					</div>
				</div>
		
</body>
</html>
