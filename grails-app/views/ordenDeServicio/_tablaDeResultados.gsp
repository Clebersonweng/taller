<g:each in="${ordenDeServicioInstanceList}" status="i"
					var="ordenDeServicioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td style="text-align: center">
							${fieldValue(bean: ordenDeServicioInstance, field: "numOrden")}
						</td>
						<td style="text-align: center">
								${fieldValue(bean: ordenDeServicioInstance, field: "vehiculo")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: ordenDeServicioInstance, field: "cliente")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: ordenDeServicioInstance, field: "mecanico")}
						</td>

						<td style="text-align: center">
							${fieldValue(bean: ordenDeServicioInstance, field: "tipoTrabajo")}
						</td>
						<td style="text-align: center">
							${fieldValue(bean: ordenDeServicioInstance, field: "descripcionProblema")}
						</td>
						<td style="text-align: center">
							${fieldValue(bean: ordenDeServicioInstance, field: "descripcionTrabajoRealizar")}
						</td>
						<td style="text-align: center">
							${fieldValue(bean: ordenDeServicioInstance, field: "estado")}
						</td>


						<td style="text-align: center"><g:link action="edit"
								title="EDITAR" controller="ordenDeServicio"
								id="${ordenDeServicioInstance.id}">
								<i class=" icon-edit"></i>
							</g:link> <% if(session?.user?.role == 'mecanico'){ %>
							 <g:link action="cambiarEstado" title="FACTURAR" disabled="true"
								controller="ordenDeServicio" id="${ordenDeServicioInstance.id}">
								<i class=" icon-check"></i>
							</g:link>
							<% } else{ %>
							<g:link action="cambiarEstado" title="FACTURAR" 
								controller="ordenDeServicio" id="${ordenDeServicioInstance.id}">
								<i class=" icon-check"></i>
							</g:link>
							
							<% }  %>
							</td>
					</tr>
				</g:each>



