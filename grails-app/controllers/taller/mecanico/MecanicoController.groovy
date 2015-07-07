package taller.mecanico

import org.apache.commons.lang.StringUtils
import org.springframework.dao.DataIntegrityViolationException

class MecanicoController {

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

	def search(){
		def nombre = params.value.toString()
		def apellido = params.value.toString()
		def num_documento = params.value.toString()
		def direccion = params.value.toString()
		def num_contacto = params.value.toString()
		
		def mecanicos
		if(!StringUtils.isBlank(nombre) || !StringUtils.isBlank(apellido)|| !StringUtils.isBlank(num_documento)|| !StringUtils.isBlank(direccion)|| !StringUtils.isBlank(num_contacto)){
			mecanicos = Mecanico.findAll("FROM Mecanico WHERE nombre LIKE ? OR apellido LIKE ? OR num_documento LIKE ? OR direccion LIKE ? OR numContacto LIKE ?", [
				"%"+nombre+"%",
				"%"+apellido+"%",
				"%"+num_documento+"%",
				"%"+direccion+"%",
				"%"+num_contacto+"%"
			])
			mecanicos.toArray()
			println(mecanicos)
		}else{
			mecanicos = Mecanico.list()
		}

		render(template:'tableresults', model:[mecanicoInstanceList:mecanicos])
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[mecanicoInstanceList: Mecanico.list(params), mecanicoInstanceTotal: Mecanico.count()]
	}

	def create() {
		[mecanicoInstance: new Mecanico(params)]
	}

	def save() {
		def mecanicoInstance = new Mecanico(params)
		if (!mecanicoInstance.save(flush: true)) {
			render(view: "create", model: [mecanicoInstance: mecanicoInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'mecanico.label', default: 'Mecanico'),
			mecanicoInstance.id
		])
		redirect(action: "list", id: mecanicoInstance.id)
	}

	def show(Long id) {
		def mecanicoInstance = Mecanico.get(id)
		if (!mecanicoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'mecanico.label', default: 'Mecanico'),
				id
			])
			redirect(action: "list")
			return
		}

		[mecanicoInstance: mecanicoInstance]
	}

	def edit(Long id) {
		def mecanicoInstance = Mecanico.get(id)
		if (!mecanicoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'mecanico.label', default: 'Mecanico'),
				id
			])
			redirect(action: "list")
			return
		}

		[mecanicoInstance: mecanicoInstance]
	}

	def update(Long id, Long version) {
		def mecanicoInstance = Mecanico.get(id)
		if (!mecanicoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'mecanico.label', default: 'Mecanico'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (mecanicoInstance.version > version) {
				mecanicoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'mecanico.label', default: 'Mecanico')] as Object[],
						"Another user has updated this Mecanico while you were editing")
				render(view: "list", model: [mecanicoInstance: mecanicoInstance])
				return
			}
		}

		mecanicoInstance.properties = params

		if (!mecanicoInstance.save(flush: true)) {
			render(view: "list", model: [mecanicoInstance: mecanicoInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'mecanico.label', default: 'Mecanico'),
			mecanicoInstance.id
		])
		redirect(action: "list", id: mecanicoInstance.id)
	}

	def delete(Long id) {
		def mecanicoInstance = Mecanico.get(id)
		if (!mecanicoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'mecanico.label', default: 'Mecanico'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			mecanicoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'mecanico.label', default: 'Mecanico'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'mecanico.label', default: 'Mecanico'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
