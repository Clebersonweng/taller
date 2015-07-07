<%@ page import="taller.mecanico.Mecanico" %>

<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: mecanicoInstance, field: 'nombre', 'error')} required">
		<label  class="control-label" for="nombre">
		<span class="required-indicator">*</span>
			<g:message code="mecanico.nombre.label" default="Nombre:" />			
			</label><div class="controls">
			<g:textField name="nombre" required="" value="${mecanicoInstance?.nombre}"/>
		</div>
	</div>
</div>

<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: mecanicoInstance, field: 'apellido', 'error')} required">
		<label  class="control-label" for="apellido">
		<span class="required-indicator">*</span>
			<g:message code="mecanico.apellido.label" default="Apellido:" />			
			</label><div class="controls">
			<g:textField name="apellido" required="" value="${mecanicoInstance?.apellido}"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: mecanicoInstance, field: 'numDocumento', 'error')} required">
		<label  class="control-label" for="numDocumento">
		<span class="required-indicator">*</span>
			<g:message code="mecanico.numDocumento.label" default="Num Documento:" />			
			</label><div class="controls">
			<g:field name="numDocumento" type="number" min="1"pattern="[0-9]+" value="${mecanicoInstance.numDocumento}" required=""/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: mecanicoInstance, field: 'direccion', 'error')} ">
		<label  class="control-label" for="direccion">
			<g:message code="mecanico.direccion.label" default="Direccion:" />
			
			</label><div class="controls">
			<g:textArea name="direccion" value="${mecanicoInstance?.direccion}" rows="5" cols="40"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: mecanicoInstance, field: 'numContacto', 'error')} required">
		<label  class="control-label" for="numContacto">
		<span class="required-indicator">*</span>
			<g:message code="mecanico.numContacto.label" default="Num Contacto:" />			
			</label><div class="controls">
			<g:textField name="numContacto" pattern="${mecanicoInstance.constraints.numContacto.matches}" required="" value="${mecanicoInstance?.numContacto}"/>
		</div>
	</div>
</div>


<!-- div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: mecanicoInstance, field: 'ordenesDeServicios', 'error')} ">
		<label  class="control-label" for="ordenesDeServicios">
			<g:message code="mecanico.ordenesDeServicios.label" default="Ordenes De Servicios" />
			
			</label><div class="controls">
			
<ul class="one-to-many">
<g:each in="${mecanicoInstance?.ordenesDeServicios?}" var="o">
    <li><g:link controller="ordenDeServicio" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ordenDeServicio" action="create" params="['mecanico.id': mecanicoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio')])}</g:link>
</li>
</ul>

		</div>
	</div>
</div-->

