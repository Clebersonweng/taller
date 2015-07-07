<%@ page import="taller.estado.Estado" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'estado.label', default: 'Estado')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>

	<div id="create-estado"
		class="content scaffold-create" role="main">
		<fieldset>
			<legend>
				<g:message code="default.create.label" args="[entityName]" />
			</legend>
		</fieldset>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${estadoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${estadoInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form action="save" class="form-horizontal"
			>
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<div class="span4 offset2">
				<fieldset class="buttons">
					<g:submitButton name="create" class="save btn btn-primary btn-small"
						value="${message(code: 'default.button.create.label', default: 'Create')}" />
					<button type="reset" class="btn btn-primary btn-small">Cancelar</button>
				</fieldset>
			</div>
		</g:form>
	</div>
</body>
</html>
