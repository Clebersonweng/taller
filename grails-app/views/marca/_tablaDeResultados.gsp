<g:each in="${marcaInstanceList}" status="i" var="marcaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td style="text-align: center">
								${fieldValue(bean: marcaInstance, field: "marca")}
							</td>

						<td style="text-align: center">
							${fieldValue(bean: marcaInstance, field: "descripcion")}
						</td>
						
						<td style="text-align: center" class=""><g:form name="marca-form"
								action="delete" method="post">
								<g:hiddenField name="id" value="${marcaInstance?.id}" />

								<g:link action="edit" id="${marcaInstance.id}">
									<i class=" icon-edit"></i>
								</g:link>

							</g:form></td>

					</tr>
				</g:each>