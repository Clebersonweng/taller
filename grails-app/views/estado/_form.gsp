<%@ page import="taller.estado.Estado" %>




<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'estado', 'error')} required">
		<label  class="control-label" for="estado">
			<g:message code="estado.estado.label" default="Estado" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:textField name="estado" required="" value="${estadoInstance?.estado}"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'descripcion', 'error')} required">
		<label  class="control-label" for="descripcion">
			<g:message code="estado.descripcion.label" default="Descripcion" />
			<span class="required-indicator">*</span>
			</label><div class="controls">
			<g:textField name="descripcion" required="" value="${estadoInstance?.descripcion}"/>
		</div>
	</div>
</div>


<div class="control-group">
	<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'orden', 'error')} ">
		<label  class="control-label" for="orden">
			<g:message code="estado.orden.label" default="Orden" />
			
			</label><div class="controls">
			
<ul class="one-to-many">
<g:each in="${estadoInstance?.orden?}" var="o">
    <li><g:link controller="ordenDeServicio" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ordenDeServicio" action="create" params="['estado.id': estadoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio')])}</g:link>
</li>
</ul>

		</div>
	</div>
</div>

