<div class="control-group">
	<div
		class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'modelo', 'error')} required">
		<label class="control-label" for="modelo">* <g:message
				code="vehiculo.modelo.label" default="Modelo" /> <span
			class="required-indicator"></span>
		</label>
		<g:if test="${modelosList}">
			<div class="controls">
				<g:select id="modelo" name="modelo.id" 
					from="${modelosList}"
					optionKey="id" required="" 
					value="${vehiculoInstance?.modelo?.id}"
					class="many-to-one" />
			</div>
		</g:if>
		<g:else>
		no hay modelo
		</g:else>
	</div>
</div>