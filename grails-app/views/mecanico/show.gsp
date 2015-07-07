
<%@ page import="taller.mecanico.Mecanico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="estilo">
		<g:set var="entityName" value="${message(code: 'mecanico.label', default: 'Mecanico')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-mecanico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav tabbable tabs-below" role="navigation">
			<ul class="nav nav-tabs">
				<li class="active"><g:link class="show" action="show"><g:message code="default.show.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-mecanico" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mecanico">
			
				<g:if test="${mecanicoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="mecanico.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${mecanicoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mecanicoInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="mecanico.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${mecanicoInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mecanicoInstance?.numDocumento}">
				<li class="fieldcontain">
					<span id="numDocumento-label" class="property-label"><g:message code="mecanico.numDocumento.label" default="Num Documento" /></span>
					
						<span class="property-value" aria-labelledby="numDocumento-label"><g:fieldValue bean="${mecanicoInstance}" field="numDocumento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mecanicoInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="mecanico.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${mecanicoInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mecanicoInstance?.numContacto}">
				<li class="fieldcontain">
					<span id="numContacto-label" class="property-label"><g:message code="mecanico.numContacto.label" default="Num Contacto" /></span>
					
						<span class="property-value" aria-labelledby="numContacto-label"><g:fieldValue bean="${mecanicoInstance}" field="numContacto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mecanicoInstance?.ordenesDeServicios}">
				<li class="fieldcontain">
					<span id="ordenesDeServicios-label" class="property-label"><g:message code="mecanico.ordenesDeServicios.label" default="Ordenes De Servicios" /></span>
					
						<g:each in="${mecanicoInstance.ordenesDeServicios}" var="o">
						<span class="property-value" aria-labelledby="ordenesDeServicios-label"><g:link controller="ordenDeServicio" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${mecanicoInstance?.id}" />
					<g:link class="edit btn btn-primary" action="edit" id="${mecanicoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Estas Seguro?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
