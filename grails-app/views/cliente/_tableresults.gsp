<g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td style="text-align: center">
								${fieldValue(bean: clienteInstance, field: "numDocumento")}
							</td>

						<td style="text-align: center">
							${fieldValue(bean: clienteInstance, field: "nombre")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: clienteInstance, field: "apellido")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: clienteInstance, field: "numContacto")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: clienteInstance, field: "direccion")}
						</td>
						<td style="text-align: center"><g:form name="cliente-form"
								action="delete" method="post">
								<g:hiddenField name="id" value="${clienteInstance?.id}" />

								<g:link action="edit" id="${clienteInstance.id}">
									<i class=" icon-edit"></i>
								</g:link>

							</g:form></td>
					</tr>
				</g:each>