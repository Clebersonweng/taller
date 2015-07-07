package taller.repuesto

import org.apache.commons.lang.StringUtils
import org.springframework.dao.DataIntegrityViolationException

class RepuestoController {

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


	def index() {
		redirect(action: "list", params: params)
	}
	def search(){
		def nombre = params.value.toString()
		def marca = params.value.toString()
		def descripcion = params.value.toString()
		def repuestos
		if(!StringUtils.isBlank(nombre) || !StringUtils.isBlank(marca)|| !StringUtils.isBlank(descripcion)){
			repuestos = Repuesto.findAll("FROM Repuesto WHERE nombre LIKE ? OR marca LIKE ? OR descripcion LIKE ?", ["%"+nombre+"%", "%"+marca+"%", "%"+descripcion+"%"])
			repuestos.toArray()
			println(repuestos)
		}else{
			repuestos = Repuesto.list()
		}
		render(template:'tableresults', model:[repuestoInstanceList:repuestos])
	}



	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[repuestoInstanceList: Repuesto.list(params), repuestoInstanceTotal: Repuesto.count()]
	}

	def create() {
		[repuestoInstance: new Repuesto(params)]
	}

	//controller
def save() {
		def repuestoInstance = new Repuesto(params)
		def preCompra = request.getParameter("precioCompra")
		def preVenta  = request.getParameter("precioVenta")
		String pCompra = preCompra
		preCompra = Integer.parseInt(preCompra)
		String pVenta = preVenta
		preVenta = Integer.parseInt(preVenta)
		if(preCompra<=preVenta){
			if (!repuestoInstance.save(flush: true)) {
				render(view: "list", model: [repuestoInstance: repuestoInstance])
				return
			}
			flash.message = message(code: 'default.created.message', args: [
				message(code: 'repuesto.label', default: 'Repuesto'),
				repuestoInstance.id
			])
			redirect(action: "list", id: repuestoInstance.id)
		}else{
			flash.message = "El precio de venta debe ser igual o mayor al precio de compra!"
			redirect(action: "create")
		}
	}

	def show(Long id) {
		def repuestoInstance = Repuesto.get(id)
		if (!repuestoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'repuesto.label', default: 'Repuesto'),
				id
			])
			redirect(action: "list")
			return
		}

		[repuestoInstance: repuestoInstance]
	}

	def edit(Long id) {
		def repuestoInstance = Repuesto.get(id)
		if (!repuestoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'repuesto.label', default: 'Repuesto'),
				id
			])
			redirect(action: "list")
			return
		}

		[repuestoInstance: repuestoInstance]
	}

	def update(Long id, Long version) {
		def repuestoInstance = Repuesto.get(id)
		if (!repuestoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'repuesto.label', default: 'Repuesto'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (repuestoInstance.version > version) {
				repuestoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'repuesto.label', default: 'Repuesto')] as Object[],
						"Another user has updated this Repuesto while you were editing")
				render(view: "list", model: [repuestoInstance: repuestoInstance])
				return
			}
		}

		repuestoInstance.properties = params

		if (!repuestoInstance.save(flush: true)) {
			render(view: "list", model: [repuestoInstance: repuestoInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'repuesto.label', default: 'Repuesto'),
			repuestoInstance.id
		])
		redirect(action: "list", id: repuestoInstance.id)
	}

	def delete(Long id) {
		def repuestoInstance = Repuesto.get(id)
		if (!repuestoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'repuesto.label', default: 'Repuesto'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			repuestoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'repuesto.label', default: 'Repuesto'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'repuesto.label', default: 'Repuesto'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
