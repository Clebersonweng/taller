
<%@ page import="taller.repuesto.Repuesto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="estilo">
		<g:set var="entityName" value="${message(code: 'repuesto.label', default: 'Repuesto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-repuesto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav tabbable tabs-below" role="navigation">
			<ul class="nav nav-tabs">
				<li class="active"><g:link class="show" action="show"><g:message code="default.show.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-repuesto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list repuesto">
			
				<g:if test="${repuestoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="repuesto.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${repuestoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${repuestoInstance?.marca}">
				<li class="fieldcontain">
					<span id="marca-label" class="property-label"><g:message code="repuesto.marca.label" default="Marca" /></span>
					
						<span class="property-value" aria-labelledby="marca-label"><g:fieldValue bean="${repuestoInstance}" field="marca"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${repuestoInstance?.precioCompra}">
				<li class="fieldcontain">
					<span id="precioCompra-label" class="property-label"><g:message code="repuesto.precioCompra.label" default="Precio Compra" /></span>
					
						<span class="property-value" aria-labelledby="precioCompra-label"><g:fieldValue bean="${repuestoInstance}" field="precioCompra"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${repuestoInstance?.precioVenta}">
				<li class="fieldcontain">
					<span id="precioVenta-label" class="property-label"><g:message code="repuesto.precioVenta.label" default="Precio Venta" /></span>
					
						<span class="property-value" aria-labelledby="precioVenta-label"><g:fieldValue bean="${repuestoInstance}" field="precioVenta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${repuestoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="repuesto.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${repuestoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${repuestoInstance?.ordenDetalle}">
				<li class="fieldcontain">
					<span id="ordenDetalle-label" class="property-label"><g:message code="repuesto.ordenDetalle.label" default="Orden Detalle" /></span>
					
						<g:each in="${repuestoInstance.ordenDetalle}" var="o">
						<span class="property-value" aria-labelledby="ordenDetalle-label"><g:link controller="ordenDeServicioDetalle" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${repuestoInstance?.id}" />
					<g:link class="edit btn btn-primary" action="edit" id="${repuestoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Estas Seguro?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
