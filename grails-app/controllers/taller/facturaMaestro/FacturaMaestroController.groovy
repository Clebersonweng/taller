package taller.facturaMaestro

import org.apache.commons.lang.StringUtils
import org.springframework.dao.DataIntegrityViolationException

import taller.ordenDeServicio.OrdenDeServicio
import taller.ordenDeServicioDetalle.OrdenDeServicioDetalle

class FacturaMaestroController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def beforeInterceptor = [action:this.&auth]
	
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
	
	def search(){
		def numFactura = params.value.toString()
		def cliente = params.value.toString()
		def facturas
		if(!StringUtils.isBlank(numFactura)||!StringUtils.isBlank(cliente)){
			facturas = FacturaMaestro.findAll("FROM FacturaMaestro WHERE num_factura LIKE ? OR cliente.nombre LIKE ?", [
				"%"+numFactura+"%",
				"%"+cliente+"%"
			])
			facturas.toArray()
			println(facturas)
		}else{
			facturas = FacturaMaestro.list()
		}

		render(template:'tableresults', model:[facturaMaestroInstanceList:facturas])
	}

	def index() {
		redirect(action: "list", params: params)
	}

	def vistaFactura(Integer id){

		def factura = new FacturaMaestro().get(id)
		def max = Math.min(params.int('max', 15), 100)
		def detallesList = OrdenDeServicioDetalle.findAll("from OrdenDeServicioDetalle as b where b.orden=?", [factura])
		def idOrden = FacturaMaestro.get(id).ordenMaestroId.id
		def detalle = OrdenDeServicio.get(idOrden)
		Integer subTotal=0
		for(det in detalle.detalles){
			Integer cantidad = det.cantidad
			Integer precio = det.repuesto.precioVenta
			Integer sub= cantidad * precio
			String c = cantidad
			cantidad = Integer.parseInt(c)
			String p = precio
			precio = Integer.parseInt(p)
			subTotal = subTotal + sub
		}
		def total =  OrdenDeServicioDetalle.count()
		return [facturando:factura,detalles:detallesList,totalLista:total, subtotales: subTotal]
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[facturaMaestroInstanceList: FacturaMaestro.list(params), facturaMaestroInstanceTotal: FacturaMaestro.count()]
	}

	def create() {
		[facturaMaestroInstance: new FacturaMaestro(params)]
	}

	def save() {
		def facturaMaestroInstance = new FacturaMaestro(params)
		if (!facturaMaestroInstance.save(flush: true)) {
			render(view: "create", model: [facturaMaestroInstance: facturaMaestroInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'facturaMaestro.label', default: 'FacturaMaestro'),
			facturaMaestroInstance.id
		])
		redirect(action: "show", id: facturaMaestroInstance.id)
	}

	def show(Long id) {
		def facturaMaestroInstance = FacturaMaestro.get(id)
		if (!facturaMaestroInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'facturaMaestro.label', default: 'FacturaMaestro'),
				id
			])
			redirect(action: "list")
			return
		}

		[facturaMaestroInstance: facturaMaestroInstance]
	}

	def edit(Long id) {
		def facturaMaestroInstance = FacturaMaestro.get(id)
		if (!facturaMaestroInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'facturaMaestro.label', default: 'FacturaMaestro'),
				id
			])
			redirect(action: "list")
			return
		}

		[facturaMaestroInstance: facturaMaestroInstance]
	}

	def update(Long id, Long version) {
		def facturaMaestroInstance = FacturaMaestro.get(id)
		if (!facturaMaestroInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'facturaMaestro.label', default: 'FacturaMaestro'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (facturaMaestroInstance.version > version) {
				facturaMaestroInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'facturaMaestro.label', default: 'FacturaMaestro')] as Object[],
						"Another user has updated this FacturaMaestro while you were editing")
				render(view: "edit", model: [facturaMaestroInstance: facturaMaestroInstance])
				return
			}
		}

		facturaMaestroInstance.properties = params

		if (!facturaMaestroInstance.save(flush: true)) {
			render(view: "edit", model: [facturaMaestroInstance: facturaMaestroInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'facturaMaestro.label', default: 'FacturaMaestro'),
			facturaMaestroInstance.id
		])
		redirect(action: "show", id: facturaMaestroInstance.id)
	}

	def delete(Long id) {
		def facturaMaestroInstance = FacturaMaestro.get(id)
		if (!facturaMaestroInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'facturaMaestro.label', default: 'FacturaMaestro'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			facturaMaestroInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'facturaMaestro.label', default: 'FacturaMaestro'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'facturaMaestro.label', default: 'FacturaMaestro'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
