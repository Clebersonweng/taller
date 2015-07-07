<g:each in="${facturaMaestroInstanceList}" status="i" var="facturaMaestroInstance">

	<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
		<td style="text-align: center">
			${fieldValue(bean: facturaMaestroInstance, field: "numFactura")}
		</td>

		<td style="text-align: center">
			${fieldValue(bean: facturaMaestroInstance, field: "cliente")}
		</td>

		<td style="text-align: center"><g:formatDate
				date="${facturaMaestroInstance.fecha}" /></td>

		<td style="text-align: center">
			${fieldValue(bean: facturaMaestroInstance, field: "total")}
		</td>

		<td style="text-align: center"><g:link action="vistaFactura"
				title="Ver" id="${facturaMaestroInstance.id}">
				<i class=" icon-eye-open"></i>
			</g:link>
	</tr>
</g:each>