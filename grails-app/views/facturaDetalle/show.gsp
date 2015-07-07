
<%@ page import="taller.facturaDetalle.FacturaDetalle" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="estilo">
		<g:set var="entityName" value="${message(code: 'facturaDetalle.label', default: 'FacturaDetalle')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-facturaDetalle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav tabbable tabs-below" role="navigation">
			<ul class="nav nav-tabs">
				<li class="active"><g:link class="show" action="show"><g:message code="default.show.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-facturaDetalle" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list facturaDetalle">
			
				<g:if test="${facturaDetalleInstance?.factura}">
				<li class="fieldcontain">
					<span id="factura-label" class="property-label"><g:message code="facturaDetalle.factura.label" default="Factura" /></span>
					
						<span class="property-value" aria-labelledby="factura-label"><g:link controller="facturaMaestro" action="show" id="${facturaDetalleInstance?.factura?.id}">${facturaDetalleInstance?.factura?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaDetalleInstance?.ordenDetalle}">
				<li class="fieldcontain">
					<span id="ordenDetalle-label" class="property-label"><g:message code="facturaDetalle.ordenDetalle.label" default="Orden Detalle" /></span>
					
						<span class="property-value" aria-labelledby="ordenDetalle-label"><g:link controller="ordenDeServicioDetalle" action="show" id="${facturaDetalleInstance?.ordenDetalle?.id}">${facturaDetalleInstance?.ordenDetalle?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaDetalleInstance?.subtotal}">
				<li class="fieldcontain">
					<span id="subtotal-label" class="property-label"><g:message code="facturaDetalle.subtotal.label" default="Subtotal" /></span>
					
						<span class="property-value" aria-labelledby="subtotal-label"><g:fieldValue bean="${facturaDetalleInstance}" field="subtotal"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${facturaDetalleInstance?.id}" />
					<g:link class="edit btn btn-primary" action="edit" id="${facturaDetalleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Estas Seguro?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
