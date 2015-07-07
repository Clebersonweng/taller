
<%@ page import="taller.tipoDeTrabajo.TipoDeTrabajo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="estilo">
		<g:set var="entityName" value="${message(code: 'tipoDeTrabajo.label', default: 'TipoDeTrabajo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tipoDeTrabajo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav tabbable tabs-below" role="navigation">
			<ul class="nav nav-tabs">
				<li class="active"><g:link class="show" action="show"><g:message code="default.show.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tipoDeTrabajo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tipoDeTrabajo">
			
				<g:if test="${tipoDeTrabajoInstance?.tipoDeTrabajo}">
				<li class="fieldcontain">
					<span id="tipoDeTrabajo-label" class="property-label"><g:message code="tipoDeTrabajo.tipoDeTrabajo.label" default="Tipo De Trabajo" /></span>
					
						<span class="property-value" aria-labelledby="tipoDeTrabajo-label"><g:fieldValue bean="${tipoDeTrabajoInstance}" field="tipoDeTrabajo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoDeTrabajoInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="tipoDeTrabajo.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${tipoDeTrabajoInstance}" field="precio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoDeTrabajoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="tipoDeTrabajo.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${tipoDeTrabajoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoDeTrabajoInstance?.facturaDetalle}">
				<li class="fieldcontain">
					<span id="facturaDetalle-label" class="property-label"><g:message code="tipoDeTrabajo.facturaDetalle.label" default="Factura Detalle" /></span>
					
						<span class="property-value" aria-labelledby="facturaDetalle-label"><g:link controller="facturaDetalle" action="show" id="${tipoDeTrabajoInstance?.facturaDetalle?.id}">${tipoDeTrabajoInstance?.facturaDetalle?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoDeTrabajoInstance?.orden}">
				<li class="fieldcontain">
					<span id="orden-label" class="property-label"><g:message code="tipoDeTrabajo.orden.label" default="Orden" /></span>
					
						<g:each in="${tipoDeTrabajoInstance.orden}" var="o">
						<span class="property-value" aria-labelledby="orden-label"><g:link controller="ordenDeServicio" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tipoDeTrabajoInstance?.id}" />
					<g:link class="edit btn btn-primary" action="edit" id="${tipoDeTrabajoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Estas Seguro?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
