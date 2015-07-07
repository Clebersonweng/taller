package taller.vehiculo

import groovy.text.Template;

import org.apache.commons.lang.StringUtils
import org.springframework.dao.DataIntegrityViolationException

import taller.marca.Marca


class VehiculoController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def beforeInterceptor = [action:this.&auth]
	
		def auth() {
			if((session.user == null)){
				redirect(controller: "usuario" , action: "login")
			} else if( !(session?.user?.role == "administrador") ){
				flash.message = "Solo tiene autorizacion para acceder a Orden de Servicio!."
				redirect(controller: "index", action: "index")
				return false
			}
		}
	def index() {
		redirect(action: "list", params: params)
	}

	def getModelos={
		def marcaInstance = Marca.get(params.id)		
		def modelosList = marcaInstance?.modelo
		println modelosList
		render(template:'selectModelos', model:[modelosList:modelosList])
	}


	def search(){
		def cliente = params.value.toString()
		def matricula= params.value.toString()
		def marca = params.value.toString()
		def modelo = params.value.toString()
		
		def vehiculos
		if(!StringUtils.isBlank(cliente)||!StringUtils.isBlank(matricula)||!StringUtils.isBlank(marca)||!StringUtils.isBlank(modelo)){
			vehiculos = Vehiculo.findAll("FROM Vehiculo WHERE cliente.nombre LIKE ? OR matricula LIKE ? OR marca.marca LIKE ? OR modelo.modelo LIKE ?", [
				"%"+cliente+"%",
				"%"+matricula+"%",
				"%"+marca+"%",
				"%"+modelo+"%"
				
			])
			vehiculos.toArray()
			println(vehiculos)
		}else{
			vehiculos = Vehiculo.list()
		}
		render(template:'tablaDeResultados', model:[vehiculoInstanceList: vehiculos])
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[vehiculoInstanceList: Vehiculo.list(params), vehiculoInstanceTotal: Vehiculo.count()]
	}

	def create() {
		[vehiculoInstance: new Vehiculo(params)]
	}

	def save() {
		def vehiculoInstance = new Vehiculo(params)
		if (!vehiculoInstance.save(flush: true)) {
			render(view: "create", model: [vehiculoInstance: vehiculoInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'vehiculo.label', default: 'Vehiculo'),
			vehiculoInstance.id
		])
		redirect(action: "list", id: vehiculoInstance.id)
	}

	def show(Long id) {
		def vehiculoInstance = Vehiculo.get(id)
		if (!vehiculoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'vehiculo.label', default: 'Vehiculo'),
				id
			])
			redirect(action: "list")
			return
		}

		[vehiculoInstance: vehiculoInstance]
	}

	def edit(Long id) {
		def vehiculoInstance = Vehiculo.get(id)
		if (!vehiculoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'vehiculo.label', default: 'Vehiculo'),
				id
			])
			redirect(action: "list")
			return
		}

		[vehiculoInstance: vehiculoInstance]
	}

	def update(Long id, Long version) {
		def vehiculoInstance = Vehiculo.get(id)
		if (!vehiculoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'vehiculo.label', default: 'Vehiculo'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (vehiculoInstance.version > version) {
				vehiculoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'vehiculo.label', default: 'Vehiculo')] as Object[],
						"Another user has updated this Vehiculo while you were editing")
				render(view: "edit", model: [vehiculoInstance: vehiculoInstance])
				return
			}
		}

		vehiculoInstance.properties = params

		if (!vehiculoInstance.save(flush: true)) {
			render(view: "edit", model: [vehiculoInstance: vehiculoInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'vehiculo.label', default: 'Vehiculo'),
			vehiculoInstance.id
		])
		redirect(action: "list", id: vehiculoInstance.id)
	}

	def delete(Long id) {
		def vehiculoInstance = Vehiculo.get(id)
		if (!vehiculoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'vehiculo.label', default: 'Vehiculo'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			vehiculoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'vehiculo.label', default: 'Vehiculo'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'vehiculo.label', default: 'Vehiculo'),
				id
			])
			redirect(action: "list", id: id)
		}
	}
}
