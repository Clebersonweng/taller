<g:each in="${modeloInstanceList}" status="i" var="modeloInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td style="text-align: center">
							${fieldValue(bean: modeloInstance, field: "marca")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: modeloInstance, field: "modelo")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: modeloInstance, field: "descripcion")}
						</td>

						<td style="text-align: center"><g:form name="modelo-form"
								action="delete" method="post">
								<g:hiddenField name="id" value="${modeloInstance?.id}" />

								<g:link action="edit" id="${modeloInstance.id}">
									<i class=" icon-edit"></i>
								</g:link>

							</g:form></td>

					</tr>
				</g:each>