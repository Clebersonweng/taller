<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td style="text-align: center">
							${fieldValue(bean: usuarioInstance, field: "login")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: usuarioInstance, field: "role")}
						</td>

						<td style="text-align: center"><g:form name="usuario-form"
								action="delete" method="post">
								<g:hiddenField name="id" value="${usuarioInstance?.id}" />

								<g:link action="edit" id="${usuarioInstance.id}">
									<i class=" icon-edit"></i>
								</g:link>

							</g:form></td>

					</tr>
				</g:each>