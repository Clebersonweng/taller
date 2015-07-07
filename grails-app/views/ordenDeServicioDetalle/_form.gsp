<%@ page import="taller.ordenDeServicioDetalle.OrdenDeServicioDetalle" %>




<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: ordenDeServicioDetalleInstance, field: 'repuesto', 'error')} required">
		<label  class="control-label" for="repuesto">
			<g:message code="ordenDeServicioDetalle.repuesto.label" default="Repuesto" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:select id="repuesto" name="repuesto.id" from="${taller.repuesto.Repuesto.list()}" optionKey="id" required="" value="${ordenDeServicioDetalleInstance?.repuesto?.id}" class="many-to-one"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: ordenDeServicioDetalleInstance, field: 'cantidad', 'error')} required">
		<label  class="control-label" for="cantidad">
			<g:message code="ordenDeServicioDetalle.cantidad.label" default="Cantidad" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:field name="cantidad" type="number" value="${ordenDeServicioDetalleInstance.cantidad}" required=""/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: ordenDeServicioDetalleInstance, field: 'orden', 'error')} required">
		<label  class="control-label" for="orden">
			<g:message code="ordenDeServicioDetalle.orden.label" default="Orden" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:select id="orden" name="orden.id" from="${taller.ordenDeServicio.OrdenDeServicio.list()}" optionKey="id" required="" value="${ordenDeServicioDetalleInstance?.orden?.id}" class="many-to-one"/>
		</div>
	</div>
</div>

