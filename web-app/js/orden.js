$(document)
		.ready(
				function() {
					// validar cualquier campo por letra o nombre
					$.fn.validaCleber = function(cadena) {
						$(this)
								.on(
										{
											keypress : function(e) {
												var key = e.which, keye = e.keyCode, tecla = String
														.fromCharCode(key)
														.toLowerCase(), letras = cadena;
												if (letras.indexOf(tecla) == -1
														&& keye != 9
														&& (key == 37 || keye != 37)
														&& (keye != 39 || key == 39)
														&& keye != 8
														&& (keye != 46 || key == 46)
														|| key == 161) {
													e.preventDefault();
												}
											}
										});
					};

					// validacion de los campos orden y cantidad
					$('#numOrden,#cantidad').validaCleber('0123456789');

					var contador = 0;

					// creo las filas tomando los valores de cada input
					var agregarProducto = function(idProd, nombreProd, cant) {
						return "<tr>" + "<td>" + idProd + "</td>" + "<td>"
								+ nombreProd + "</td>" + "<td>" + cant
								+ "</td>"+ "<td style='text-align: center'>"
								+ "<a href='#'" + "id='quitar'>"
								+ "<i class='icon-minus'></i>" + "</td>"
								+ "</tr>";
					};
				
				//genero campos input hidden para guardar los detalles de forma mas limpia
				function addFormField(idRep, cantRep) {
					
					$("#divTxt").append("<input type='hidden' size='20' name='detalles["+contador+"].repuesto.id' id='txt' value="+idRep+">&nbsp;<input   type='hidden' size='20' name='detalles["+contador+"].cantidad' id='txt1' value="+cantRep+">");

				}
					$("#agregarProducto")
							.on(
									"click",
									function(event) {
										event.preventDefault();
										var producto = $("#repuesto option:selected");
										var cantidad = $("#cantidad");
										if ($("#repuesto").val() == "" ) {											
											return false;
										}else if(){
									            alert('Si existe');
									    }else{
									            alert('No existe');
									    }else if (cantidad.val() == "") {								
											return false;
										} else {
											
											var nuevaFila = agregarProducto(producto.val(), producto.text(),
													cantidad.val());
											//);

											// carga los trs en la tabla
											$("#detalhes-container tbody:first").append(nuevaFila);
													addFormField(producto.val(),cantidad.val());
											// resetea los campos despues de
											// cada add
											$("#repuesto").val("");
											$("#precio").val("");
											$("#cantidad").val("");
										}
										//realiza la suma  para cada fila para guardar
										contador++;
					});
					
					
					$("#quitar").live("click", function(event) {
						event.preventDefault();
						$(this).parent().parent().remove();
					});

					// Evento que selecciona la fila y la elimina 
					//$(document).on("click",".eliminar",function(){
					//	var parent = $(this).parents().get(0);
					//	$(parent).remove();
					//});	

					// aqui voy aguegando los detalles para despues recorrer
					// todo
					$("#agregarProducto").on("click", function() {
						var filas = new Array();
						var hdnDetalles = $("#Coquito");
						$("#tabla tbody tr").each(function(index) {
							var producto, cantidad;
							$(this).children("td").each(function(index2) {

								switch (index2) {
								case 0:
									producto = $(this).text();

									break;
								case 2:
									cantidad = $(this).text();
									break;

								}
							});
							filas.push('repuesto.id:'+producto +'cantidad:'+ cantidad);

						});
						var detalles = filas.join('#');
						//+ "<input type='text' name=detalles["+contador+"].repuesto.id'+ value="idProd"/>"
						hdnDetalles.val(detalles);
					});
					// cierre de metodo
					
					
	});
