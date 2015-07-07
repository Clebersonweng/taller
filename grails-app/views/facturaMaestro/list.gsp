

<%@ page import="taller.facturaMaestro.FacturaMaestro"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:javascript src="jquery.min.js" />
<g:set var="entityName"
	value="${message(code: 'facturaMaestro.label', default: 'FacturaMaestro')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#submenu_create").hide();
	});
</script>
</head>
<body>

	<div id="list-facturaMaestro" class="content scaffold-list" role="main">
		<fieldset>
			<legend>
				<g:message code="default.list.label" args="[entityName]" />
			</legend>

			<div class="pull-right">
				<div class="input-append">
					<g:remoteField action="search" update="searchResult" name="title"
						class="input-xlarge" placeholder="Buscar factura" />
					<span class="add-on"> <i class=" icon-search"></i>
					</span>
				</div>
			</div>
			<br> <br>

			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<table class="table-condensed table-striped table-hover"
				style="width: 100%">
				<thead>
					<tr>
						<g:sortableColumn property="numFactura"
							title="${message(code: 'facturaMaestro.numFactura.label', default: 'Num Factura')}"
							style="width: 20% " />
						<g:sortableColumn property="cliente"
							title="${message(code: 'facturaMaestro.cliente.label', default: 'Cliente')}"
							style="width: 20% " />
						<g:sortableColumn property="fecha"
							title="${message(code: 'facturaMaestro.fecha.label', default: 'Fecha')}"
							style="width: 20% " />
						<g:sortableColumn property="total"
							title="${message(code: 'facturaMaestro.total.label', default: 'Total')}"
							style="width: 20% " />
						<th style="width: 10%">Acción</th>
					</tr>
				</thead>
				<tbody id="searchResult">
					<g:each in="${facturaMaestroInstanceList}" status="i"
						var="facturaMaestroInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td style="text-align: center">
								${fieldValue(bean: facturaMaestroInstance, field: "numFactura")}
							</td>

							<td style="text-align: center">
								${fieldValue(bean: facturaMaestroInstance, field: "cliente")}
							</td>

							<td style="text-align: center"><g:formatDate
									date="${facturaMaestroInstance.fecha}" /></td>

							<td style="text-align: center">
								${fieldValue(bean: facturaMaestroInstance, field: "total")}
							</td>

							<td style="text-align: center"><g:link action="vistaFactura"
									title="Ver" id="${facturaMaestroInstance.id}">
									<i class=" icon-eye-open"></i>
								</g:link>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${facturaMaestroInstanceTotal}" />
			</div>
		</fieldset>
	</div>

</body>
</html>
