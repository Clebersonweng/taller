<%@ page import="taller.ordenDeServicio.OrdenDeServicio"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
<g:javascript src="jquery.min.js" />
<g:javascript src="orden.js" />
<g:if test="${session?.user?.role == 'mecanico' }">
	<script type="text/javascript">
	$(document).ready(function() {
		$( "#table1" ).hide();
		$( "#table2" ).hide();
		$( "#fs1" ).hide();
		$( "#fs2" ).hide();
		$("#submenu_create").hide();
		$(".delete").hide();
		
	});
</script>
</g:if>
<g:if test="${session?.user?.role == 'administrador' }">
	<script type="text/javascript">
	$(document).ready(function() {
		$( "#table3" ).hide();
		$( "#fs2" ).hide();
		$("#detalhes-container").hide();
		//$(".delete").hide();
		
	});
</script>
</g:if>
	<style>
#fecha_day {
	width: 60px
}

#fecha_month {
	width: 110px
}

#fecha_year {
	width: 70px
}
</style>
</head>
<body>
	<div id="edit-ordenDeServicio" class="content scaffold-edit"
		role="main">
		<fieldset>
			<legend>
				<g:message code="default.edit.label" args="[entityName]" />
			</legend>
		</fieldset>


		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${ordenDeServicioInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${ordenDeServicioInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form method="post" class="form-horizontal">
			<g:hiddenField name="id" value="${ordenDeServicioInstance?.id}" />
			<g:hiddenField name="version"
				value="${ordenDeServicioInstance?.version}" />
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<div class="span4 offset3">
				<fieldset class="buttons">
					<g:actionSubmit class="save btn btn-primary btn-small"
						action="update"
						value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete btn btn-danger btn-small"
						action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						formnovalidate=""
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</div>
		</g:form>
	</div>

</body>
</html>
