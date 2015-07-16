<%@ page import="taller.cliente.Cliente" %>




<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'numDocumento', 'error')} required">
		<label  class="control-label" for="numDocumento">
			<g:message code="cliente.numDocumento.label" default="Num Documento" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:field name="numDocumento" type="number" value="${clienteInstance.numDocumento}" required=""/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nombre', 'error')} required">
		<label  class="control-label" for="nombre">
			<g:message code="cliente.nombre.label" default="Nombre" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:textField name="nombre" required="" value="${clienteInstance?.nombre}"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'apellido', 'error')} ">
		<label  class="control-label" for="apellido">
			<g:message code="cliente.apellido.label" default="Apellido" />
			
			</label><div class="controls">
			<g:textField name="apellido" value="${clienteInstance?.apellido}"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'numContacto', 'error')} required">
		<label  class="control-label" for="numContacto">
			<g:message code="cliente.numContacto.label" default="Num Contacto" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:textField name="numContacto" pattern="${clienteInstance.constraints.numContacto.matches}" required="" value="${clienteInstance?.numContacto}"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'direccion', 'error')} required">
		<label  class="control-label" for="direccion">
			<g:message code="cliente.direccion.label" default="Direccion" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:textField name="direccion" required="" value="${clienteInstance?.direccion}"/>
		</div>
	</div>
</div>

