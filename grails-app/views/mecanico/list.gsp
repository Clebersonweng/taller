

<%@ page import="taller.mecanico.Mecanico"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'mecanico.label', default: 'Mecanico')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<div id="list-mecanico" class="content scaffold-list" role="main">
		<fieldset>
			<legend>
				<g:message code="default.list.label" args="[entityName]" />
			</legend>

			<div class="pull-right">
				<div class="input-append">
					<g:remoteField action="search" update="searchResult" name="title"
						class="input-xlarge" placeholder="Buscar mecanico" />
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

						<g:sortableColumn property="nombre"
							title="${message(code: 'mecanico.nombre.label', default: 'Nombre')}"
							style="width: 20%" />

						<g:sortableColumn property="apellido"
							title="${message(code: 'mecanico.apellido.label', default: 'Apellido')}"
							style="width: 20%" />

						<g:sortableColumn property="numDocumento"
							title="${message(code: 'mecanico.numDocumento.label', default: 'Num Documento')}"
							style="width: 20%" />

						<g:sortableColumn property="direccion"
							title="${message(code: 'mecanico.direccion.label', default: 'Direccion')}"
							style="width: 20%" />

						<g:sortableColumn property="numContacto"
							title="${message(code: 'mecanico.numContacto.label', default: 'Num Contacto')}"
							style="width: 20%" />

						<th style="width: 10%">Acción</th>
					</tr>
				</thead>
				<tbody id="searchResult">
					<g:each in="${mecanicoInstanceList}" status="i"
						var="mecanicoInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td style="text-align: center">
								${fieldValue(bean: mecanicoInstance, field: "nombre")}
							</td>

							<td style="text-align: center">
								${fieldValue(bean: mecanicoInstance, field: "apellido")}
							</td>

							<td style="text-align: center">
								${fieldValue(bean: mecanicoInstance, field: "numDocumento")}
							</td>

							<td style="text-align: center">
								${fieldValue(bean: mecanicoInstance, field: "direccion")}
							</td>

							<td style="text-align: center">
								${fieldValue(bean: mecanicoInstance, field: "numContacto")}
							</td>

							<td style="text-align: center"><g:form name="mecanico-form"
									action="delete" method="post">
									<g:hiddenField name="id" value="${mecanicoInstance?.id}" />

									<g:link action="edit" id="${mecanicoInstance.id}">
										<i class=" icon-edit"></i>
									</g:link>

								</g:form></td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mecanicoInstanceTotal}" />
			</div>
		</fieldset>
	</div>

</body>
</html>
