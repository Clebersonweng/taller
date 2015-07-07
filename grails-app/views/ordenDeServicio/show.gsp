
<%@ page import="taller.ordenDeServicio.OrdenDeServicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="estilo">
		<g:set var="entityName" value="${message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ordenDeServicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav tabbable tabs-below" role="navigation">
			<ul class="nav nav-tabs">
				<li class="active"><g:link class="show" action="show"><g:message code="default.show.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ordenDeServicio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ordenDeServicio">
			
				<g:if test="${ordenDeServicioInstance?.vehiculo}">
				<li class="fieldcontain">
					<span id="vehiculo-label" class="property-label"><g:message code="ordenDeServicio.vehiculo.label" default="Vehiculo" /></span>
					
						<span class="property-value" aria-labelledby="vehiculo-label"><g:link controller="vehiculo" action="show" id="${ordenDeServicioInstance?.vehiculo?.id}">${ordenDeServicioInstance?.vehiculo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeServicioInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="ordenDeServicio.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${ordenDeServicioInstance?.cliente?.id}">${ordenDeServicioInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeServicioInstance?.mecanico}">
				<li class="fieldcontain">
					<span id="mecanico-label" class="property-label"><g:message code="ordenDeServicio.mecanico.label" default="Mecanico" /></span>
					
						<span class="property-value" aria-labelledby="mecanico-label"><g:link controller="mecanico" action="show" id="${ordenDeServicioInstance?.mecanico?.id}">${ordenDeServicioInstance?.mecanico?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeServicioInstance?.tipoTrabajo}">
				<li class="fieldcontain">
					<span id="tipoTrabajo-label" class="property-label"><g:message code="ordenDeServicio.tipoTrabajo.label" default="Tipo Trabajo" /></span>
					
						<span class="property-value" aria-labelledby="tipoTrabajo-label"><g:link controller="tipoDeTrabajo" action="show" id="${ordenDeServicioInstance?.tipoTrabajo?.id}">${ordenDeServicioInstance?.tipoTrabajo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeServicioInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="ordenDeServicio.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:link controller="estado" action="show" id="${ordenDeServicioInstance?.estado?.id}">${ordenDeServicioInstance?.estado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeServicioInstance?.numOrden}">
				<li class="fieldcontain">
					<span id="numOrden-label" class="property-label"><g:message code="ordenDeServicio.numOrden.label" default="Num Orden" /></span>
					
						<span class="property-value" aria-labelledby="numOrden-label"><g:fieldValue bean="${ordenDeServicioInstance}" field="numOrden"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeServicioInstance?.descripcionProblema}">
				<li class="fieldcontain">
					<span id="descripcionProblema-label" class="property-label"><g:message code="ordenDeServicio.descripcionProblema.label" default="Descripcion Problema" /></span>
					
						<span class="property-value" aria-labelledby="descripcionProblema-label"><g:fieldValue bean="${ordenDeServicioInstance}" field="descripcionProblema"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeServicioInstance?.descripcionTrabajoRealizar}">
				<li class="fieldcontain">
					<span id="descripcionTrabajoRealizar-label" class="property-label"><g:message code="ordenDeServicio.descripcionTrabajoRealizar.label" default="Descripcion Trabajo Realizar" /></span>
					
						<span class="property-value" aria-labelledby="descripcionTrabajoRealizar-label"><g:fieldValue bean="${ordenDeServicioInstance}" field="descripcionTrabajoRealizar"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeServicioInstance?.detalles}">
				<li class="fieldcontain">
					<span id="detalles-label" class="property-label"><g:message code="ordenDeServicio.detalles.label" default="Detalles" /></span>
					
						<g:each in="${ordenDeServicioInstance.detalles}" var="d">
						<span class="property-value" aria-labelledby="detalles-label"><g:link controller="ordenDeServicioDetalle" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ordenDeServicioInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="ordenDeServicio.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${ordenDeServicioInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ordenDeServicioInstance?.id}" />
					<g:link class="edit btn btn-primary" action="edit" id="${ordenDeServicioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Estas Seguro?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
