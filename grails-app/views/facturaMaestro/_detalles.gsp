
<g:each in="${detalles}" status="i" var="detalle">
	<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
		<td>${detalle.repuesto.id * 4567}</td>
		<td>
			${detalle.repuesto.nombre}
		</td>
		<td>
			${fieldValue(bean: detalle, field: "cantidad")}
		</td>
		<td>
			${fieldValue(bean: detalle, field: "repuesto.precioVenta")}
		</td>
		<td>
			${detalle.cantidad * detalle.repuesto.precioVenta}
		</td>
	</tr>
</g:each>