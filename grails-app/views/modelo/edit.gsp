<%@ page import="taller.modelo.Modelo" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'modelo.label', default: 'Modelo')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div id="edit-modelo"
		class="content scaffold-edit" role="main">
		<fieldset>
			<legend>
				<g:message code="default.edit.label" args="[entityName]" />
			</legend>
		</fieldset>


		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${modeloInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${modeloInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<div class="offset1">
		<g:form method="post" class="form-horizontal"
			>
			<g:hiddenField name="id" value="${modeloInstance?.id}" />
			<g:hiddenField name="version" value="${modeloInstance?.version}" />
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>

			<div class="control-group">
					<div class="controls">
						<g:actionSubmit class="btn btn-primary btn-small" action="update"
							value="${message(code: 'default.button.update.label', default: 'Update')}" />
						<g:actionSubmit class="btn btn-danger btn-small" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							formnovalidate=""
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
				</div>

		</g:form>
	</div>
</div>
</body>
</html>
