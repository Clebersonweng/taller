<%@page import="taller.ordenDeServicio.OrdenDeServicio"%>
<%@page import="taller.cliente.Cliente"%>
<%@ page import="taller.facturaMaestro.FacturaMaestro"%>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />

<title>Factura</title>

<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'factura.css')}" type="text/css">

</head>

<body>			
<br><br>
	<div id="page-wrap">
		<div id="identity">
			<div id="address"
				style="width: 255px; height: 92px; border: solid 2px black;">
				<p
					style="color: red; font-size: 20px; font-weight: bold; float: left;">&nbspTaller
					San José</p>
				<p style="font-size: 12px; font-weight: bold; float: left;">
					</br>&nbsp Avda Eusebio Ayala N 2444</br>&nbsp Tel: (555) 555-5555</br>&nbsp
					Encarnacion-Paraguay
				</p>
			</div>
			<div id="meta"
				style="width: 500px; margin-right: 0px; height: 92px; border: solid 2px black;">
				&nbsp Timbrado num:76868754 <br>&nbsp RUC:8984473 <br>&nbsp
				N.Factura:${facturando.numFactura}
			</div>


		</div>

		<div style="clear: both"></div>
		<div id="customer"
			style="width: 795px; height: 120px; border: solid 2px black; margin-top: 20px;">
			<table style="width: 100%">
				<thead>
					<tr>
						<td style="width: 25%">Fecha de emision:</td>
						<td>
							${facturando.fecha}
						</td>
					</tr>
					<tr>
						<td>Ruc o CI:</td>
						<td>
							${facturando?.cliente.getNumDocumento() }
						</td>
					</tr>
					<tr>
						<td>Nombre o Razon Social:</td>
						<td>
							${facturando?.cliente.getNombre()} ${facturando?.cliente.getApellido() }
						</td>
					</tr>
					<tr>
						<td>Dirección:</td>
						<td>
							${facturando?.cliente.getDireccion() }
						</td>
					</tr>
				</thead>

			</table>

		</div>

		<table id="items">
			<thead>
				<tr>
					<th style="width: 10%">Código</th>
					<th style="width: 40%">Descripcion</th>
					<th style="width: 10%">Cantidad</th>
					<th style="width: 10%">Precio</th>
					<th style="width: 10%">Importe</th>
				</tr>
			</thead>
			<tbody>
				<g:render template="detalles"/>
			</tbody>
			<tfoot>
				<tr id="filaSutTotal">
					<td width="200"
						style="font-weight: bold; background-color: rgb(232, 232, 232);">SUBTOTAL</td>
					<td
						style="font-weight: bold; background-color: rgb(232, 232, 232);"></td>
					<td
						style="font-weight: bold; background-color: rgb(232, 232, 232);"></td>
					<td id="subTotal"
						style="font-weight: bold; background-color: rgb(232, 232, 232);"></td>
					<td
						style="font-weight: bold; background-color: rgb(232, 232, 232);">${subtotales}</td>
				</tr>
				
				<tr id="filaTotalPagar">
					<td width="200"
						style="font-weight: bold; background-color: rgb(23, 232, 232);">TOTAL
						A PAGAR</td>
					<td style="font-weight: bold; background-color: rgb(23, 232, 232);"></td>
					<td style="font-weight: bold; background-color: rgb(23, 232, 232);"></td>
					<td id="Total"
						style="font-weight: bold; background-color: rgb(23, 232, 232);"></td>
					<td style="font-weight: bold; background-color: rgb(23, 232, 232);">
					${subtotales}</td>
				</tr>

				<tr id="filaIVA">
					<td width="200"
						style="font-weight: bold; background-color: rgb(232, 232, 232);">Liquidacion
						del IVA (10%)</td>
					<td
						style="font-weight: bold; background-color: rgb(232, 232, 232);"></td>
					<td
						style="font-weight: bold; background-color: rgb(232, 232, 232);"></td>
					<td id="iva"
						style="font-weight: bold; background-color: rgb(232, 232, 232);"></td>
					<td
						style="font-weight: bold; background-color: rgb(232, 232, 232);">${subtotales / 11}</td>
				</tr>

			</tfoot>
		</table>

		<div id="terms">
			<h5></h5>
			<textarea>Taller San Jose</textarea>
		</div>
	</div>

</body>

</html>


