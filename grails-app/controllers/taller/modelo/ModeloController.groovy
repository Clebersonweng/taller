package taller.modelo

import org.apache.commons.lang.StringUtils
import org.springframework.dao.DataIntegrityViolationException

class ModeloController {

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
		def modelo = params.value.toString()
		def marca = params.value.toString()
		def descripcion = params.value.toString()
		
		def modelos
		if(!StringUtils.isBlank(modelo)||!StringUtils.isBlank(marca)){
			modelos = Modelo.findAll("FROM Modelo WHERE modelo LIKE ? OR marca.marca LIKE ? OR descripcion LIKE ?", [
				"%"+modelo+"%",
				"%"+marca+"%",
				"%"+descripcion+"%"
				])
			modelos.toArray()
		}else{
			modelos = Modelo.list()
		}

		render(template:'tableresults', model:[modeloInstanceList: modelos])
	}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [modeloInstanceList: Modelo.list(params), modeloInstanceTotal: Modelo.count()]
    }

    def create() {
        [modeloInstance: new Modelo(params)]
    }

    def save() {
        def modeloInstance = new Modelo(params)
        if (!modeloInstance.save(flush: true)) {
            render(view: "create", model: [modeloInstance: modeloInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'modelo.label', default: 'Modelo'), modeloInstance.id])
        redirect(action: "list", id: modeloInstance.id)
    }

    def show(Long id) {
        def modeloInstance = Modelo.get(id)
        if (!modeloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modelo.label', default: 'Modelo'), id])
            redirect(action: "list")
            return
        }

        [modeloInstance: modeloInstance]
    }

    def edit(Long id) {
        def modeloInstance = Modelo.get(id)
        if (!modeloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modelo.label', default: 'Modelo'), id])
            redirect(action: "list")
            return
        }

        [modeloInstance: modeloInstance]
    }

    def update(Long id, Long version) {
        def modeloInstance = Modelo.get(id)
        if (!modeloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modelo.label', default: 'Modelo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (modeloInstance.version > version) {
                modeloInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'modelo.label', default: 'Modelo')] as Object[],
                          "Another user has updated this Modelo while you were editing")
                render(view: "edit", model: [modeloInstance: modeloInstance])
                return
            }
        }

        modeloInstance.properties = params

        if (!modeloInstance.save(flush: true)) {
            render(view: "edit", model: [modeloInstance: modeloInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'modelo.label', default: 'Modelo'), modeloInstance.id])
        redirect(action: "list", id: modeloInstance.id)
    }

    def delete(Long id) {
        def modeloInstance = Modelo.get(id)
        if (!modeloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modelo.label', default: 'Modelo'), id])
            redirect(action: "list")
            return
        }

        try {
            modeloInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'modelo.label', default: 'Modelo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'modelo.label', default: 'Modelo'), id])
            redirect(action: "show", id: id)
        }
    }
}
