<g:each in="${vehiculoInstanceList}" status="i"
					var="vehiculoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td style="text-align: center">
							${fieldValue(bean: vehiculoInstance, field: "cliente")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: vehiculoInstance, field: "matricula")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: vehiculoInstance, field: "marca")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: vehiculoInstance, field: "modelo")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: vehiculoInstance, field: "anho")}
						</td>
						<td style="text-align: center"><g:form name="vehiculo-form"
								action="delete" method="post">
								<g:link action="edit" id="${vehiculoInstance.id}">
									<i class=" icon-edit"></i>
								</g:link>

							</g:form></td>
					</tr>
				</g:each>