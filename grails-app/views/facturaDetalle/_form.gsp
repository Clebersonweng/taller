<%@ page import="taller.facturaDetalle.FacturaDetalle" %>




<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: facturaDetalleInstance, field: 'factura', 'error')} required">
		<label  class="control-label" for="factura">
			<g:message code="facturaDetalle.factura.label" default="Factura" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:select id="factura" name="factura.id" from="${taller.facturaMaestro.FacturaMaestro.list()}" optionKey="id" required="" value="${facturaDetalleInstance?.factura?.id}" class="many-to-one"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: facturaDetalleInstance, field: 'ordenDetalle', 'error')} required">
		<label  class="control-label" for="ordenDetalle">
			<g:message code="facturaDetalle.ordenDetalle.label" default="Orden Detalle" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:select id="ordenDetalle" name="ordenDetalle.id" from="${taller.ordenDeServicioDetalle.OrdenDeServicioDetalle.list()}" optionKey="id" required="" value="${facturaDetalleInstance?.ordenDetalle?.id}" class="many-to-one"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: facturaDetalleInstance, field: 'subtotal', 'error')} required">
		<label  class="control-label" for="subtotal">
			<g:message code="facturaDetalle.subtotal.label" default="Subtotal" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:field name="subtotal" value="${fieldValue(bean: facturaDetalleInstance, field: 'subtotal')}" required=""/>
		</div>
	</div>
</div>

