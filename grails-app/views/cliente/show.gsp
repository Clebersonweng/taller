
<%@ page import="taller.cliente.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="estilo">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav tabbable tabs-below" role="navigation">
			<ul class="nav nav-tabs">
				<li class="active"><g:link class="show" action="show"><g:message code="default.show.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cliente" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cliente">
			
				<g:if test="${clienteInstance?.numDocumento}">
				<li class="fieldcontain">
					<span id="numDocumento-label" class="property-label"><g:message code="cliente.numDocumento.label" default="Num Documento" /></span>
					
						<span class="property-value" aria-labelledby="numDocumento-label"><g:fieldValue bean="${clienteInstance}" field="numDocumento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="cliente.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${clienteInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="cliente.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${clienteInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.numContacto}">
				<li class="fieldcontain">
					<span id="numContacto-label" class="property-label"><g:message code="cliente.numContacto.label" default="Num Contacto" /></span>
					
						<span class="property-value" aria-labelledby="numContacto-label"><g:fieldValue bean="${clienteInstance}" field="numContacto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="cliente.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${clienteInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.factura}">
				<li class="fieldcontain">
					<span id="factura-label" class="property-label"><g:message code="cliente.factura.label" default="Factura" /></span>
					
						<g:each in="${clienteInstance.factura}" var="f">
						<span class="property-value" aria-labelledby="factura-label"><g:link controller="facturaMaestro" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.ordenServicio}">
				<li class="fieldcontain">
					<span id="ordenServicio-label" class="property-label"><g:message code="cliente.ordenServicio.label" default="Orden Servicio" /></span>
					
						<g:each in="${clienteInstance.ordenServicio}" var="o">
						<span class="property-value" aria-labelledby="ordenServicio-label"><g:link controller="ordenDeServicio" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.vehiculo}">
				<li class="fieldcontain">
					<span id="vehiculo-label" class="property-label"><g:message code="cliente.vehiculo.label" default="Vehiculo" /></span>
					
						<g:each in="${clienteInstance.vehiculo}" var="v">
						<span class="property-value" aria-labelledby="vehiculo-label"><g:link controller="vehiculo" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${clienteInstance?.id}" />
					<g:link class="edit btn btn-primary" action="edit" id="${clienteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Estas Seguro?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
