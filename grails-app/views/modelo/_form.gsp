<%@ page import="taller.modelo.Modelo"%>




<div class="control-group">
	<div
		class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'marca', 'error')} required">
		<label class="control-label" for="marca"> <span
			class="required-indicator">*</span> <g:message
				code="modelo.marca.label" default="Marca:" />
		</label>
		<div class="controls">
			<g:select id="marca" name="marca.id"
				from="${taller.marca.Marca.list()}" optionKey="id" required=""
				value="${modeloInstance?.marca?.id}" class="many-to-one" />
		</div>
	</div>
</div>


<div class="control-group">
	<div
		class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'modelo', 'error')} required">
		<label class="control-label" for="modelo"> <span
			class="required-indicator">*</span>
		<g:message code="modelo.modelo.label" default="Modelo:" />
		</label>
		<div class="controls">
			<g:textField name="modelo" required="" onkeyup = "this.value=this.value.toUpperCase()"
				value="${modeloInstance?.modelo}" />
		</div>
	</div>
</div>


<div class="control-group">
	<div
		class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'descripcion', 'error')} ">
		<label class="control-label" for="descripcion"> <g:message
				code="modelo.descripcion.label" default="Descripcion:" />

		</label>
		<div class="controls">
			<g:textField name="descripcion"
				value="${modeloInstance?.descripcion}" />
		</div>
	</div>
</div>


