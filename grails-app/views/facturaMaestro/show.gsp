
<%@ page import="taller.facturaMaestro.FacturaMaestro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="estilo">
		<g:set var="entityName" value="${message(code: 'facturaMaestro.label', default: 'FacturaMaestro')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-facturaMaestro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav tabbable tabs-below" role="navigation">
			<ul class="nav nav-tabs">
				<li class="active"><g:link class="show" action="show"><g:message code="default.show.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-facturaMaestro" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list facturaMaestro">
			
				<g:if test="${facturaMaestroInstance?.numFactura}">
				<li class="fieldcontain">
					<span id="numFactura-label" class="property-label"><g:message code="facturaMaestro.numFactura.label" default="Num Factura" /></span>
					
						<span class="property-value" aria-labelledby="numFactura-label"><g:fieldValue bean="${facturaMaestroInstance}" field="numFactura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaMaestroInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="facturaMaestro.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${facturaMaestroInstance?.cliente?.id}">${facturaMaestroInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaMaestroInstance?.facturaDet}">
				<li class="fieldcontain">
					<span id="facturaDet-label" class="property-label"><g:message code="facturaMaestro.facturaDet.label" default="Factura Det" /></span>
					
						<g:each in="${facturaMaestroInstance.facturaDet}" var="f">
						<span class="property-value" aria-labelledby="facturaDet-label"><g:link controller="facturaDetalle" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${facturaMaestroInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="facturaMaestro.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${facturaMaestroInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaMaestroInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="facturaMaestro.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${facturaMaestroInstance}" field="total"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${facturaMaestroInstance?.id}" />
					<g:link class="edit btn btn-primary" action="edit" id="${facturaMaestroInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Estas Seguro?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
