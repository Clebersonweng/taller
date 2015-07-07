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


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'factura', 'error')} ">
		<label  class="control-label" for="factura">
			<g:message code="cliente.factura.label" default="Factura" />
			
			</label><div class="controls">
			
<ul class="one-to-many">
<g:each in="${clienteInstance?.factura?}" var="f">
    <li><g:link controller="facturaMaestro" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="facturaMaestro" action="create" params="['cliente.id': clienteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'facturaMaestro.label', default: 'FacturaMaestro')])}</g:link>
</li>
</ul>

		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'ordenServicio', 'error')} ">
		<label  class="control-label" for="ordenServicio">
			<g:message code="cliente.ordenServicio.label" default="Orden Servicio" />
			
			</label><div class="controls">
			
<ul class="one-to-many">
<g:each in="${clienteInstance?.ordenServicio?}" var="o">
    <li><g:link controller="ordenDeServicio" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ordenDeServicio" action="create" params="['cliente.id': clienteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio')])}</g:link>
</li>
</ul>

		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'vehiculo', 'error')} ">
		<label  class="control-label" for="vehiculo">
			<g:message code="cliente.vehiculo.label" default="Vehiculo" />
			
			</label><div class="controls">
			
<ul class="one-to-many">
<g:each in="${clienteInstance?.vehiculo?}" var="v">
    <li><g:link controller="vehiculo" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vehiculo" action="create" params="['cliente.id': clienteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vehiculo.label', default: 'Vehiculo')])}</g:link>
</li>
</ul>

		</div>
	</div>
</div>

