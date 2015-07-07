<g:if test="${session?.user?.role == 'mecanico' }">
		
			<g:select id="vehiculo" name="vehiculo.id" class="input-small"
				from="${taller.vehiculo.Vehiculo.list()}" optionKey="id" required=""
				value="${ordenDeServicioInstance?.vehiculo?.id}" class="many-to-one"
				noSelection="['':'Elige una opcion']" />
		
	</g:if>
	<g:else>
		
			<g:select id="vehiculo" name="vehiculo.id" class="input-small"
				from="${vehiculosList}" optionKey="id" required=""
				value="${ordenDeServicioInstance?.vehiculo?.id}" class="many-to-one" />
		
	</g:else>

