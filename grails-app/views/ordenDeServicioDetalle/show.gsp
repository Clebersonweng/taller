
<%@ page import="taller.ordenDeServicioDetalle.OrdenDeServicioDetalle" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="estilo">
		<g:set var="entityName" value="${message(code: 'ordenDeServicioDetalle.label', default: 'OrdenDeServicioDetalle')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ordenDeServicioDetalle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav tabbable tabs-below" role="navigation">
			<ul class="nav nav-tabs">
				<li class="active"><g:link class="show" action="show"><g:message code="default.show.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ordenDeServicioDetalle" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ordenDeServicioDetalle">
			
				<g:if test="${ordenDeServicioDetalleInstance?.repuesto}">
				<li class="fieldcontain">
					<span id="repuesto-label" class="property-label"><g:message code="ordenDeServicioDetalle.repuesto.label" default="Repuesto" /></span>
					
						<span class="property-value" aria-labelledby="repuesto-label"><g:link controller="repuesto" action="show" id="${ordenDeServicioDetalleInstance?.repuesto?.id}">${ordenDeServicioDetalleInstance?.repuesto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeServicioDetalleInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="ordenDeServicioDetalle.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${ordenDeServicioDetalleInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeServicioDetalleInstance?.orden}">
				<li class="fieldcontain">
					<span id="orden-label" class="property-label"><g:message code="ordenDeServicioDetalle.orden.label" default="Orden" /></span>
					
						<span class="property-value" aria-labelledby="orden-label"><g:link controller="ordenDeServicio" action="show" id="${ordenDeServicioDetalleInstance?.orden?.id}">${ordenDeServicioDetalleInstance?.orden?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ordenDeServicioDetalleInstance?.id}" />
					<g:link class="edit btn btn-primary" action="edit" id="${ordenDeServicioDetalleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Estas Seguro?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
