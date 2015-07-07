		<g:each in="${repuestoInstanceList}" status="i"
								var="repuestoInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									
						<td style="text-align: center">${fieldValue(bean: repuestoInstance, field: "nombre")}</td>
					
						<td style="text-align: center">${fieldValue(bean: repuestoInstance, field: "marca")}</td>
					
						<td style="text-align: center">${fieldValue(bean: repuestoInstance, field: "precioCompra")}</td>
					
						<td style="text-align: center">${fieldValue(bean: repuestoInstance, field: "precioVenta")}</td>
					
						<td style="text-align: center">${fieldValue(bean: repuestoInstance, field: "descripcion")}</td>
					

							<td style="text-align: center"><g:form name="repuesto-form"
								action="delete" method="post">
								<g:hiddenField name="id" value="${repuestoInstance?.id}" />

								<g:link action="edit" id="${repuestoInstance.id}">
									<i class=" icon-edit"></i>
								</g:link>
							</g:form>
								</tr>
								
							</g:each>