
<%@ page import="taller.vehiculo.Vehiculo"%>




<div class="control-group">
	<div
		class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'cliente', 'error')} required">
		<label class="control-label" for="cliente">* <g:message
				code="vehiculo.cliente.label" default="Cliente" /> <span
			class="required-indicator"></span>
		</label>
		<div class="controls">
			<g:select id="cliente" name="cliente.id"
				from="${taller.cliente.Cliente.list()}" optionKey="id" required=""
				value="${vehiculoInstance?.cliente?.id}" class="many-to-one" />
		</div>
	</div>
</div>


<div class="control-group">
	<div
		class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'matricula', 'error')} required">
		<label class="control-label" for="matricula">* <g:message
				code="vehiculo.matricula.label" default="Matricula" /> <span
			class="required-indicator"></span>
		</label>
		<div class="controls">
			<g:textField name="matricula"  pattern="[A-Z]{3}[ ][0-9]{3}"  onkeyup = "this.value=this.value.toUpperCase()"
				 required=""
				value="${vehiculoInstance?.matricula}" />
		</div>
	</div>
</div>


<div class="control-group">
	<div
		class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'marca', 'error')} required">
		<label class="control-label" for="marca">* <g:message
				code="vehiculo.marca.label" default="Marca" /> <span
			class="required-indicator"></span>
		</label>
		<div class="controls">
			<g:select id="marca" name="marca.id"
				from="${taller.marca.Marca.list()}" optionKey="id" required=""
				value="${vehiculoInstance?.marca?.id}" class="many-to-one"
				noSelection="['':'Elige una opcion']"
				onchange="${remoteFunction(
									controller:'vehiculo',
									action:'getModelos',
									params:'\'id=\' + this.value',
									update:'ajax'
									) }"
				value="${vehiculoInstance?.modelo?.marca?.id}" />
		</div>
	</div>
</div>


<div id="ajax" class="control-group">
	<div
		class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'modelo', 'error')} required">
		<label class="control-label" for="modelo">* <g:message
				code="vehiculo.modelo.label" default="Modelo" /> <span
			class="required-indicator"></span>
		</label>
		<div class="controls">
			<g:select id="modelo" name="modelo.id"
				from="${modeloList}" optionKey="id" required=""
				value="${vehiculoInstance?.modelo?.id}" class="many-to-one" noSelection="['':'Elige una opcion']" />
		</div>
	</div>
</div>


<div class="control-group">
	<div
		class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'anho', 'error')} required">
		<label class="control-label" for="anho">* <g:message
				code="vehiculo.anho.label" default="Anho" /> <span
			class="required-indicator"></span>
		</label>
		<div class="controls">
			<g:field name="anho" type="number" pattern="[0-9]+" min="1920"
				value="${vehiculoInstance.anho}" required="" />
		</div>
	</div>
</div>




