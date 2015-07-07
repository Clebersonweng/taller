

<%@ page import="taller.modelo.Modelo"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'modelo.label', default: 'Modelo')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<div id="list-modelo" class="content scaffold-list" role="main">
		<fieldset>
			<legend>
				<g:message code="default.list.label" args="[entityName]" />
			</legend>
		</fieldset>

		<div class="pull-right">
			<div class="input-append">
				<g:remoteField action="search" update="searchResults" name="title"
					class="input-xlarge" placeholder="Buscar modelo" />
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
					<g:sortableColumn property="marca"
						title="${message(code: 'modelo.marca.label', default: 'Marca')}"
						style="width: 35%" />

					<g:sortableColumn property="modelo"
						title="${message(code: 'modelo.modelo.label', default: 'Modelo')}"
						style="width: 35%" />

					<g:sortableColumn property="descripcion"
						title="${message(code: 'modelo.descripcion.label', default: 'Descripcion')}"
						style="width: 35%" />

					<th>Accion</th>
				</tr>
			</thead>
			<tbody id="searchResults">
				<g:each in="${modeloInstanceList}" status="i" var="modeloInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td style="text-align: center">
							${fieldValue(bean: modeloInstance, field: "marca")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: modeloInstance, field: "modelo")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: modeloInstance, field: "descripcion")}
						</td>

						<td style="text-align: center"><g:form name="modelo-form"
								action="delete" method="post">
								<g:hiddenField name="id" value="${modeloInstance?.id}" />

								<g:link action="edit" id="${modeloInstance.id}">
										<i class="btn-icon-only icon-edit"></i>
								</g:link>

							</g:form></td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${modeloInstanceTotal}" />
		</div>
	</div>

</body>
</html>
