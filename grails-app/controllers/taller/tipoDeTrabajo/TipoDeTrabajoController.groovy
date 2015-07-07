package taller.tipoDeTrabajo

import org.springframework.dao.DataIntegrityViolationException

class TipoDeTrabajoController {

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
	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[tipoDeTrabajoInstanceList: TipoDeTrabajo.list(params), tipoDeTrabajoInstanceTotal: TipoDeTrabajo.count()]
	}

	def create() {
		[tipoDeTrabajoInstance: new TipoDeTrabajo(params)]
	}

	def save() {
		def tipoDeTrabajoInstance = new TipoDeTrabajo(params)
		if (!tipoDeTrabajoInstance.save(flush: true)) {
			render(view: "create", model: [tipoDeTrabajoInstance: tipoDeTrabajoInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'tipoDeTrabajo.label', default: 'TipoDeTrabajo'),
			tipoDeTrabajoInstance.id
		])
		redirect(action: "show", id: tipoDeTrabajoInstance.id)
	}

	def show(Long id) {
		def tipoDeTrabajoInstance = TipoDeTrabajo.get(id)
		if (!tipoDeTrabajoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tipoDeTrabajo.label', default: 'TipoDeTrabajo'),
				id
			])
			redirect(action: "list")
			return
		}

		[tipoDeTrabajoInstance: tipoDeTrabajoInstance]
	}

	def edit(Long id) {
		def tipoDeTrabajoInstance = TipoDeTrabajo.get(id)
		if (!tipoDeTrabajoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tipoDeTrabajo.label', default: 'TipoDeTrabajo'),
				id
			])
			redirect(action: "list")
			return
		}

		[tipoDeTrabajoInstance: tipoDeTrabajoInstance]
	}

	def update(Long id, Long version) {
		def tipoDeTrabajoInstance = TipoDeTrabajo.get(id)
		if (!tipoDeTrabajoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tipoDeTrabajo.label', default: 'TipoDeTrabajo'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (tipoDeTrabajoInstance.version > version) {
				tipoDeTrabajoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'tipoDeTrabajo.label', default: 'TipoDeTrabajo')] as Object[],
						"Another user has updated this TipoDeTrabajo while you were editing")
				render(view: "edit", model: [tipoDeTrabajoInstance: tipoDeTrabajoInstance])
				return
			}
		}

		tipoDeTrabajoInstance.properties = params

		if (!tipoDeTrabajoInstance.save(flush: true)) {
			render(view: "edit", model: [tipoDeTrabajoInstance: tipoDeTrabajoInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'tipoDeTrabajo.label', default: 'TipoDeTrabajo'),
			tipoDeTrabajoInstance.id
		])
		redirect(action: "show", id: tipoDeTrabajoInstance.id)
	}

	def delete(Long id) {
		def tipoDeTrabajoInstance = TipoDeTrabajo.get(id)
		if (!tipoDeTrabajoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tipoDeTrabajo.label', default: 'TipoDeTrabajo'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			tipoDeTrabajoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'tipoDeTrabajo.label', default: 'TipoDeTrabajo'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'tipoDeTrabajo.label', default: 'TipoDeTrabajo'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
