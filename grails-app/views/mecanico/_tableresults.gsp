<g:each in="${mecanicoInstanceList}" status="i" var="mecanicoInstance">
	<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

		<td style="text-align: center">
			${fieldValue(bean: mecanicoInstance, field: "nombre")}
		</td>

		<td style="text-align: center">
			${fieldValue(bean: mecanicoInstance, field: "apellido")}
		</td>

		<td style="text-align: center">
			${fieldValue(bean: mecanicoInstance, field: "numDocumento")}
		</td>

		<td style="text-align: center">
			${fieldValue(bean: mecanicoInstance, field: "direccion")}
		</td>

		<td style="text-align: center">
			${fieldValue(bean: mecanicoInstance, field: "numContacto")}
		</td>

		<td style="text-align: center"><g:form name="mecanico-form"
				action="delete" method="post">
				<g:hiddenField name="id" value="${mecanicoInstance?.id}" />

				<g:link action="edit" id="${mecanicoInstance.id}">
					<i class=" icon-edit"></i>
				</g:link>

			</g:form></td>
	</tr>
</g:each>


