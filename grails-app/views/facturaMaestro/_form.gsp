<%@ page import="taller.facturaMaestro.FacturaMaestro" %>




<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: facturaMaestroInstance, field: 'numFactura', 'error')} ">
		<label  class="control-label" for="numFactura">
			<g:message code="facturaMaestro.numFactura.label" default="Num Factura" />
			
			</label><div class="controls">
			<g:textField name="numFactura" value="${facturaMaestroInstance?.numFactura}"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: facturaMaestroInstance, field: 'cliente', 'error')} required">
		<label  class="control-label" for="cliente">
			<g:message code="facturaMaestro.cliente.label" default="Cliente" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:select id="cliente" name="cliente.id" from="${taller.cliente.Cliente.list()}" optionKey="id" required="" value="${facturaMaestroInstance?.cliente?.id}" class="many-to-one"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: facturaMaestroInstance, field: 'facturaDet', 'error')} ">
		<label  class="control-label" for="facturaDet">
			<g:message code="facturaMaestro.facturaDet.label" default="Factura Det" />
			
			</label><div class="controls">
			
<ul class="one-to-many">
<g:each in="${facturaMaestroInstance?.facturaDet?}" var="f">
    <li><g:link controller="facturaDetalle" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="facturaDetalle" action="create" params="['facturaMaestro.id': facturaMaestroInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'facturaDetalle.label', default: 'FacturaDetalle')])}</g:link>
</li>
</ul>

		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: facturaMaestroInstance, field: 'fecha', 'error')} required">
		<label  class="control-label" for="fecha">
			<g:message code="facturaMaestro.fecha.label" default="Fecha" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:datePicker name="fecha" precision="day"  value="${facturaMaestroInstance?.fecha}"  />
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: facturaMaestroInstance, field: 'total', 'error')} required">
		<label  class="control-label" for="total">
			<g:message code="facturaMaestro.total.label" default="Total" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:field name="total" value="${fieldValue(bean: facturaMaestroInstance, field: 'total')}" required=""/>
		</div>
	</div>
</div>

