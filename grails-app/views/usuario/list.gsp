

<%@ page import="taller.login.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<r:use module="jquery" />
<g:set var="entityName"
	value="${message(code: 'usuario.label', default: 'Usuario')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<div id="list-usuario" class="content scaffold-list" role="main">
		<fieldset>
			<legend>
				<g:message code="default.list.label" args="[entityName]" />
			</legend>
		</fieldset>

		<div class="pull-right">
			<div class="input-append">
				<g:remoteField action="search" update="resultados" name="title"
					class="input-xlarge" placeholder="Buscar ${entityName}" />
				<span class="add-on"> <i class=" icon-search"></i>
				</span>
			</div>
		</div>
		<br> <br>
		
		<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					${flash.message}
				</div>
			</g:if>	
	
		<table class="table-condensed table-striped table-hover"
			style="width: 100%">
			<thead>
				<tr>

					<g:sortableColumn property="login"
						title="${message(code: 'usuario.login.label', default: 'Login')}" style="width: 35%"/>

					<g:sortableColumn property="role"
						title="${message(code: 'usuario.role.label', default: 'Role')}" style="width: 35%"/>

					<th>Accion</th>

				</tr>
			</thead>
			<tbody id="resultados">
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td style="text-align: center">
							${fieldValue(bean: usuarioInstance, field: "login")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: usuarioInstance, field: "role")}
						</td>

						<td style="text-align: center"><g:form name="usuario-form"
								action="delete" method="post">
								<g:hiddenField name="id" value="${usuarioInstance?.id}" />

								<g:link action="edit" id="${usuarioInstance.id}">
									<i class=" icon-edit"></i>
								</g:link>

							</g:form></td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${usuarioInstanceTotal}" />
		</div>
	</div>

</body>
</html>
