
<%@ page import="taller.vehiculo.Vehiculo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="estilo">
		<g:set var="entityName" value="${message(code: 'vehiculo.label', default: 'Vehiculo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vehiculo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav tabbable tabs-below" role="navigation">
			<ul class="nav nav-tabs">
				<li class="active"><g:link class="show" action="show"><g:message code="default.show.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vehiculo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vehiculo">
			
				<g:if test="${vehiculoInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="vehiculo.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${vehiculoInstance?.cliente?.id}">${vehiculoInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehiculoInstance?.matricula}">
				<li class="fieldcontain">
					<span id="matricula-label" class="property-label"><g:message code="vehiculo.matricula.label" default="Matricula" /></span>
					
						<span class="property-value" aria-labelledby="matricula-label"><g:fieldValue bean="${vehiculoInstance}" field="matricula"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehiculoInstance?.marca}">
				<li class="fieldcontain">
					<span id="marca-label" class="property-label"><g:message code="vehiculo.marca.label" default="Marca" /></span>
					
						<span class="property-value" aria-labelledby="marca-label"><g:link controller="marca" action="show" id="${vehiculoInstance?.marca?.id}">${vehiculoInstance?.marca?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehiculoInstance?.modelo}">
				<li class="fieldcontain">
					<span id="modelo-label" class="property-label"><g:message code="vehiculo.modelo.label" default="Modelo" /></span>
					
						<span class="property-value" aria-labelledby="modelo-label"><g:link controller="modelo" action="show" id="${vehiculoInstance?.modelo?.id}">${vehiculoInstance?.modelo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehiculoInstance?.anho}">
				<li class="fieldcontain">
					<span id="anho-label" class="property-label"><g:message code="vehiculo.anho.label" default="Anho" /></span>
					
						<span class="property-value" aria-labelledby="anho-label"><g:fieldValue bean="${vehiculoInstance}" field="anho"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vehiculoInstance?.orden}">
				<li class="fieldcontain">
					<span id="orden-label" class="property-label"><g:message code="vehiculo.orden.label" default="Orden" /></span>
					
						<g:each in="${vehiculoInstance.orden}" var="o">
						<span class="property-value" aria-labelledby="orden-label"><g:link controller="ordenDeServicio" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${vehiculoInstance?.id}" />
					<g:link class="edit btn btn-primary" action="edit" id="${vehiculoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Estas Seguro?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
