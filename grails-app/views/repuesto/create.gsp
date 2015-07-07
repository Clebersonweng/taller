<%@ page import="taller.repuesto.Repuesto" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'repuesto.label', default: 'Repuesto')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>

	<div id="create-repuesto"
		class="content scaffold-create" role="main">
		<fieldset>
			<legend>
				<g:message code="default.create.label" args="[entityName]" />
			</legend>
		</fieldset>
		<g:if test="${flash.message}">
			<div class="alert alert-error" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${repuestoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${repuestoInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<div class="offset1">
		<g:form action="save" class="form-horizontal"
			>
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<div class="control-group">
					<div class="controls">
						<g:submitButton name="create" class="btn btn-primary btn-small" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						<g:field type="reset" name="reset-form-zona" class="btn btn-danger btn-small" value="Cancelar"/>
					</div>
				</div>
				
			
		</g:form>
	</div>
	</div>
</body>
</html>
