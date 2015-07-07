<%@ page import="taller.repuesto.Repuesto" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'repuesto.label', default: 'Repuesto')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	
				<div id="list-repuesto"
					class="content scaffold-list" role="main">
					<fieldset>
						<legend>
							<g:message code="default.list.label" args="[entityName]" />
						</legend>
					</fieldset>
					
					
					<div class="pull-right">
						<div class="input-append">
							<g:remoteField action="search" update="resultados" name="title"
							class="input-xlarge" placeholder="Buscar repuesto" />
						<span class="add-on"> <i class=" icon-search"></i>
					</span>
					</div>
				</div>
					<br>
					<br>

					<g:if test="${flash.message}">
					<div class="alert alert-success" role="status">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
						${flash.message}
					</div>
					</g:if>
					<table class="table-condensed table-striped table-hover" style="width: 100% " >
						<thead>
							<tr>
								
						<g:sortableColumn property="nombre" title="${message(code: 'repuesto.nombre.label', default: 'Nombre')}"  style="width: 20% "/>
					
						<g:sortableColumn property="marca" title="${message(code: 'repuesto.marca.label', default: 'Marca')}" style="width: 20% " />
					
						<g:sortableColumn property="precioCompra" title="${message(code: 'repuesto.precioCompra.label', default: 'Precio Compra')}"  style="width: 20% " />
					
						<g:sortableColumn property="precioVenta" title="${message(code: 'repuesto.precioVenta.label', default: 'Precio Venta')}"  style="width: 20% "/>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'repuesto.descripcion.label', default: 'Descripcion')}" style="width: 20% " />
						<th>Accion</th>
							</tr>
						</thead>
						<tbody  id="resultados">
							<g:each in="${repuestoInstanceList}" status="i"
								var="repuestoInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td style="text-align: center">${fieldValue(bean: repuestoInstance, field: "nombre")}</td>
					
						<td style="text-align: center">${fieldValue(bean: repuestoInstance, field: "marca")}</td>
					
						<td style="text-align: center">${fieldValue(bean: repuestoInstance, field: "precioCompra")}</td>
					
						<td style="text-align: center">${fieldValue(bean: repuestoInstance, field: "precioVenta")}</td>
					
						<td style="text-align: center">${fieldValue(bean: repuestoInstance, field: "descripcion")}</td>
					

							<td style="text-align: center"><g:form name="repuesto-form"
								action="delete" method="post">
								<g:hiddenField name="id" value="${repuestoInstance?.id}" />

								<g:link action="edit" id="${repuestoInstance.id}">
									<i class=" icon-edit"></i>
								</g:link>
							</g:form>
								</tr>
								
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${repuestoInstanceTotal}" />
					</div>
				</div>
		
</body>
</html>
