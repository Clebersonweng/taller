

<%@ page import="taller.marca.Marca"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'marca.label', default: 'Marca')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<div id="list-marca" class="content scaffold-list" role="main">
		<fieldset>
			<legend>
				<g:message code="default.list.label" args="[entityName]" />
			</legend>
		</fieldset>
		
		<div class="pull-right">
			<div class="input-append">
				<g:remoteField action="search" update="searchResult" name="title"
					class="input-xlarge" placeholder="Buscar marca" />
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
						title="${message(code: 'marca.marca.label', default: 'Marca')}" />

					<g:sortableColumn property="descripcion"
						title="${message(code: 'marca.descripcion.label', default: 'Descripcion')}" />
						
						<th style="width: 10%">Accion</th>

				</tr>
			</thead>
			<tbody id="searchResult">
				<g:each in="${marcaInstanceList}" status="i" var="marcaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td style="text-align: center">
								${fieldValue(bean: marcaInstance, field: "marca")}
							</td>

						<td style="text-align: center">
							${fieldValue(bean: marcaInstance, field: "descripcion")}
						</td>
						
						<td style="text-align: center" class=""><g:form name="marca-form"
								action="delete" method="post">
								<g:hiddenField name="id" value="${marcaInstance?.id}" />

								<g:link action="edit" id="${marcaInstance.id}">
									<i class=" icon-edit"></i>
								</g:link>

							</g:form></td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${marcaInstanceTotal}" />
		</div>
	</div>

</body>
</html>
