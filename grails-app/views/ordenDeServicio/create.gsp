<%@ page import="taller.ordenDeServicio.OrdenDeServicio"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="style">
<r:require modules="bootstrap" />
<g:javascript src="jquery.min.js" />
<g:set var="entityName"
	value="${message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
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
<g:if test="${session?.user?.role == 'administrador' }">
	<script type="text/javascript">
		$(document).ready(function() {
			$("#table3").hide();
			$("#detalhes-container").hide();
			$( "#fs2" ).hide();
		});
	</script>
</g:if>
<script type="text/javascript">
        $(document).ready(function()
        {
          $("#datepicker").datepicker({dateFormat: 'yy/mm/dd'});
        })
    </script>
</head>
<body>

	<div id="create-ordenDeServicio" class="content scaffold-create"
		role="main">
		<fieldset>
			<legend>
				<g:message code="default.create.label" args="[entityName]" />
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
		<g:form action="save" class="form-horizontal">
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<div class="span4 offset3">
				<fieldset class="buttons">
					<g:submitButton name="create"
						class="save btn btn-primary btn-small"
						value="${message(code: 'default.button.create.label', default: 'Create')}" />
					<button type="reset" class="btn btn-danger btn-small">Cancelar</button>
				</fieldset>
			</div>
		</g:form>
	</div>
</body>
</html>
