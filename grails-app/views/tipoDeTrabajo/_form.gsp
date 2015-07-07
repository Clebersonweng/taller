<%@ page import="taller.tipoDeTrabajo.TipoDeTrabajo" %>




<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: tipoDeTrabajoInstance, field: 'tipoDeTrabajo', 'error')} required">
		<label  class="control-label" for="tipoDeTrabajo">
			<g:message code="tipoDeTrabajo.tipoDeTrabajo.label" default="Tipo De Trabajo" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:textField name="tipoDeTrabajo" required="" value="${tipoDeTrabajoInstance?.tipoDeTrabajo}"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: tipoDeTrabajoInstance, field: 'precio', 'error')} required">
		<label  class="control-label" for="precio">
			<g:message code="tipoDeTrabajo.precio.label" default="Precio" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:field name="precio" value="${fieldValue(bean: tipoDeTrabajoInstance, field: 'precio')}" required=""/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: tipoDeTrabajoInstance, field: 'descripcion', 'error')} required">
		<label  class="control-label" for="descripcion">
			<g:message code="tipoDeTrabajo.descripcion.label" default="Descripcion" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:textField name="descripcion" required="" value="${tipoDeTrabajoInstance?.descripcion}"/>
		</div>
	</div>
</div>

<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: tipoDeTrabajoInstance, field: 'facturaDetalle', 'error')} required">
		<label  class="control-label" for="facturaDetalle">
			<g:message code="tipoDeTrabajo.facturaDetalle.label" default="Factura Detalle" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:select id="facturaDetalle" name="facturaDetalle.id" from="${taller.facturaDetalle.FacturaDetalle.list()}" optionKey="id" required="" value="${tipoDeTrabajoInstance?.facturaDetalle?.id}" class="many-to-one"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: tipoDeTrabajoInstance, field: 'orden', 'error')} ">
		<label  class="control-label" for="orden">
			<g:message code="tipoDeTrabajo.orden.label" default="Orden" />
			
			</label><div class="controls">
			
<ul class="one-to-many">
<g:each in="${tipoDeTrabajoInstance?.orden?}" var="o">
    <li><g:link controller="ordenDeServicio" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ordenDeServicio" action="create" params="['tipoDeTrabajo.id': tipoDeTrabajoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio')])}</g:link>
</li>
</ul>

		</div>
	</div>
</div>

