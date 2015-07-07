
<%@ page import="taller.modelo.Modelo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="estilo">
		<g:set var="entityName" value="${message(code: 'modelo.label', default: 'Modelo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-modelo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav tabbable tabs-below" role="navigation">
			<ul class="nav nav-tabs">
				<li class="active"><g:link class="show" action="show"><g:message code="default.show.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-modelo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list modelo">
			
				<g:if test="${modeloInstance?.marca}">
				<li class="fieldcontain">
					<span id="marca-label" class="property-label"><g:message code="modelo.marca.label" default="Marca" /></span>
					
						<span class="property-value" aria-labelledby="marca-label"><g:link controller="marca" action="show" id="${modeloInstance?.marca?.id}">${modeloInstance?.marca?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${modeloInstance?.modelo}">
				<li class="fieldcontain">
					<span id="modelo-label" class="property-label"><g:message code="modelo.modelo.label" default="Modelo" /></span>
					
						<span class="property-value" aria-labelledby="modelo-label"><g:fieldValue bean="${modeloInstance}" field="modelo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modeloInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="modelo.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${modeloInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modeloInstance?.vehiculo}">
				<li class="fieldcontain">
					<span id="vehiculo-label" class="property-label"><g:message code="modelo.vehiculo.label" default="Vehiculo" /></span>
					
						<g:each in="${modeloInstance.vehiculo}" var="v">
						<span class="property-value" aria-labelledby="vehiculo-label"><g:link controller="vehiculo" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${modeloInstance?.id}" />
					<g:link class="edit btn btn-primary" action="edit" id="${modeloInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Estas Seguro?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
