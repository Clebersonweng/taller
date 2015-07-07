<%@ page import="taller.estado.Estado" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'estado.label', default: 'Estado')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div id="edit-estado"
		class="content scaffold-edit" role="main">
		<fieldset>
			<legend>
				<g:message code="default.edit.label" args="[entityName]" />
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
		<g:form method="post" class="form-horizontal"
			>
			<g:hiddenField name="id" value="${estadoInstance?.id}" />
			<g:hiddenField name="version" value="${estadoInstance?.version}" />
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>

			<fieldset class="buttons">
				<g:actionSubmit class="save btn btn-primary btn-small"
					action="update"
					value="${message(code: 'default.button.update.label', default: 'Update')}" />
				<g:actionSubmit class="delete btn btn-primary btn-small"
					action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					formnovalidate=""
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>

		</g:form>
	</div>

</body>
</html>
