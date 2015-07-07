<%@ page import="taller.repuesto.Repuesto" %>



<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: repuestoInstance, field: 'nombre', 'error')} required">
		<label  class="control-label" for="nombre">
		<span class="required-indicator">*</span>
			<g:message code="repuesto.nombre.label" default="Nombre:" />
			
			</label><div class="controls">
			<g:textField name="nombre" required="" value="${repuestoInstance?.nombre}"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: repuestoInstance, field: 'marca', 'error')} required">
		<label  class="control-label" for="marca">
		<span class="required-indicator">*</span>
			<g:message code="repuesto.marca.label" default="Marca:" />
			
			</label><div class="controls">
			<g:textField name="marca" required=""  onkeyup = "this.value=this.value.toUpperCase()"value="${repuestoInstance?.marca}"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: repuestoInstance, field: 'precioCompra', 'error')} required">
		<label  class="control-label" for="precioCompra">
			<span class="required-indicator">*</span>
			<g:message code="repuesto.precioCompra.label" default="Precio Compra:" />
		
			</label><div class="controls">
			<g:field name="precioCompra" type="number" min="1" value="${repuestoInstance.precioCompra}" required=""/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: repuestoInstance, field: 'precioVenta', 'error')} required">
		<label  class="control-label" for="precioVenta">
		<span class="required-indicator">*</span>
			<g:message code="repuesto.precioVenta.label" default="Precio Venta:" />
			
			</label><div class="controls">
			<g:field name="precioVenta" type="number" min="1" value="${repuestoInstance.precioVenta}" required=""/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: repuestoInstance, field: 'descripcion', 'error')} ">
		<label  class="control-label" for="descripcion">
			<g:message code="repuesto.descripcion.label" default="Descripcion" />
			
			</label><div class="controls">
			<g:textArea name="descripcion" value="${repuestoInstance?.descripcion}"/>
		</div>
	</div>
</div>



