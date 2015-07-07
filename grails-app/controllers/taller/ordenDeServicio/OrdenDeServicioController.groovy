package taller.ordenDeServicio

import org.apache.commons.lang.StringUtils
import org.springframework.dao.DataIntegrityViolationException

import taller.cliente.Cliente
import taller.facturaMaestro.FacturaMaestro
import taller.ordenDeServicioDetalle.OrdenDeServicioDetalle



class OrdenDeServicioController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def beforeInterceptor = [action:this.&auth, except:[
			"list",
			"index",
			"edit",
			"update",
			"search"
		]]


	def auth() {
		if((session.user == null)){
			redirect(controller: "usuario" , action: "login")
		} else
		if( !(session?.user?.role == "administrador") ){
			flash.message = "Solo tiene autorizacion para acceder a Orden de Servicio!."
			redirect(controller: "index", action: "index")
			return false
		}
	}
	def getVehiculos={
		def clienteInstance = Cliente.get(params.id)
		def vehiculosList = clienteInstance?.vehiculo
		render(template:'selectVehiculos', model:[vehiculosList:vehiculosList])
	}
	def search(){
		def numOrden = params.value
		def vehiculo = params.value
		def cliente = params.value
		def mecanico = params.value
		def tipoTrabajo = params.value
		def estado = params.value
		def facturas
		if(!StringUtils.isBlank(numOrden)||!StringUtils.isBlank(vehiculo)||!StringUtils.isBlank(cliente)||!StringUtils.isBlank(mecanico)||!StringUtils.isBlank(tipoTrabajo)||!StringUtils.isBlank(estado)){
			facturas = OrdenDeServicio.findAll("FROM OrdenDeServicio WHERE num_orden LIKE ? OR vehiculo.matricula LIKE ? OR cliente.nombre LIKE ? OR mecanico.nombre LIKE ? OR tipoTrabajo.tipoDeTrabajo LIKE ? OR estado.estado LIKE ?", [
				"%"+numOrden+"%",
				"%"+vehiculo+"%",
				"%"+cliente+"%",
				"%"+mecanico+"%",
				"%"+tipoTrabajo+"%",
				"%"+estado+"%",
			])
			facturas.toArray()
		}else{
			facturas = OrdenDeServicio.list()
		}

		render(template:'tablaDeResultados', model:[ordenDeServicioInstanceList:facturas])
	}
	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[ordenDeServicioInstanceList: OrdenDeServicio.list(params), ordenDeServicioInstanceTotal: OrdenDeServicio.count()]
	}
	def cambiarEstado(Integer id){
		def nuevoEstado = OrdenDeServicio.get(id).estado.id

		def detalless = OrdenDeServicio.get(id)
				if(detalless.detalles){

		if(nuevoEstado == 1 ){
			def ess = OrdenDeServicio.get(id).estado
			ess.executeUpdate("UPDATE FROM OrdenDeServicio SET estado=2 WHERE id=?", [id.toLong()])
			def estadoID = OrdenDeServicio.get(id)
			def clienteID = OrdenDeServicio.get(id).cliente.id

			def date = new Date()

			def fac = FacturaMaestro.last()
			fac = FacturaMaestro.last(sort:'numFactura')
			if(fac == null){
				fac = '1'
				String string = fac
				fac = Integer.parseInt(string)
			}
			else{
				String string = fac
				fac = Integer.parseInt(string)
				fac = fac + 1
			}

			int total
			def detalles = OrdenDeServicio.get(id)
			for(det in detalles.detalles){
				int precio = det.repuesto.precioVenta
				int can = det.cantidad
				int subtotal = can * precio
				total = total + subtotal
			}
			def idd = OrdenDeServicio.get(id).id
			def facturaSave = ['ordenMaestroId.id':idd,total:total, fecha: date,'cliente.id':clienteID, numFactura:fac]
			def facturaInstance = new FacturaMaestro(facturaSave)
			
			def testeo = OrdenDeServicio.get(detalles)
			println ("es un test"+testeo)

			facturaInstance.save(flush:true)

			redirect(action: "list")
		}else{
			redirect(action: "list")
		}
				}else{
					redirect(action: "list")
					flash.message = "No se puede facturar porque el mecanico aun no agrego los detalles"
				}
	}


	def create() {
		[ordenDeServicioInstance: new OrdenDeServicio(params)]
	}
	
	def numFactura(){
		def numOrden = OrdenDeServicio.last().numOrden()
		//fac = FacturaMaestro.last(sort:'numFactura')
		if(numOrden == null){
			numOrden = '1'
			String string = fac
			numOrden = Integer.parseInt(string)
			println('1:'+numOrden)
		}
		numOrden++;
		
		model :[numOrden:numOrden]
	}
	def save() {		
		//guarda los detalles de forma dinamica devido a los hidden generados via js.
		def ordenDeServicioInstance = new OrdenDeServicio(params)
		

		if (!ordenDeServicioInstance.save(flush: true)) {
			render(view: "create", model: [ordenDeServicioInstance: ordenDeServicioInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio'),
			ordenDeServicioInstance.id
		])
		redirect(action: "list", id: ordenDeServicioInstance.id)
	}

	def show(Long id) {
		def ordenDeServicioInstance = OrdenDeServicio.get(id)
		if (!ordenDeServicioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio'),
				id
			])
			redirect(action: "list")
			return
		}

		[ordenDeServicioInstance: ordenDeServicioInstance]
	}

	def edit(Long id) {
		def ordenDeServicioInstance = OrdenDeServicio.get(id)
		if (!ordenDeServicioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio'),
				id
			])
			redirect(action: "list")
			return
		}

		[ordenDeServicioInstance: ordenDeServicioInstance]
	}

	def update(Long id, Long version) {
		def ordenDeServicioInstance = OrdenDeServicio.get(id)
		
		if (!ordenDeServicioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (ordenDeServicioInstance.version > version) {
				ordenDeServicioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio')] as Object[],
						"Another user has updated this OrdenDeServicio while you were editing")
				render(view: "edit", model: [ordenDeServicioInstance: ordenDeServicioInstance])
				return
			}
		}

		ordenDeServicioInstance.properties = params

		if (!ordenDeServicioInstance.save(flush: true)) {
			render(view: "edit", model: [ordenDeServicioInstance: ordenDeServicioInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio'),
			ordenDeServicioInstance.id
		])
		redirect(action: "list", id: ordenDeServicioInstance.id)
	}

	def delete(Long id) {
		def ordenDeServicioInstance = OrdenDeServicio.get(id)
		if (!ordenDeServicioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			ordenDeServicioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'ordenDeServicio.label', default: 'OrdenDeServicio'),
				id
			])
			redirect(action: "list", id: id)
		}
	}
}

