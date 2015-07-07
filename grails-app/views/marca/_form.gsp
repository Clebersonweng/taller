<%@ page import="taller.marca.Marca" %>




<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'marca', 'error')} required">
		<label  class="control-label" for="marca">
		<span class="required-indicator">*</span>
			<g:message code="marca.marca.label" default="Marca:" />			
			</label><div class="controls">
			<g:textField name="marca" pattern="${marcaInstance.constraints.marca.matches}" onkeyup = "this.value=this.value.toUpperCase()" required="" value="${marcaInstance?.marca}"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'descripcion', 'error')} ">
		<label  class="control-label" for="descripcion">
			<g:message code="marca.descripcion.label" default="Descripcion:" />
			
			</label><div class="controls">
			<g:textArea name="descripcion" pattern="${marcaInstance.constraints.descripcion.matches}" value="${marcaInstance?.descripcion}"/>
		</div>
	</div>
</div>




